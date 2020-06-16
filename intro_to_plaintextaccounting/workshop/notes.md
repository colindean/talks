# Workshop Notes

# Dependencies

Here is a Brewfile for use with [Homebrew](https://brew.sh):

```ruby
# Brewfile for macOS and Linux
brew 'ledger'
brew 'entr'
brew 'ledger-autosync'
brew 'xsv'

```
And some Python packages to install:

```
ledger-autosync
```

## `ledger-autosync` patterns

### Updating a transaction record with new data

`ledger-autosync` uses a _transaction id_ to uniquely identify transactions. When importing from QFX files, this transaction ID is provided by the exporting bank and _should_ always be trustworthy. When importing from CSV files, this transaction ID must be derived. It's generally simply a hash of all of the data in the row concatentated together, e.g.

```python
from functools import reduce
import hashlib

smushed_row = reduce(lambda a,b: a + b, row).encode('utf-8')
csv_id = hashlib.sha256(smushed_row).hexdigest()
```

Run once on your exported CSV to visually check the output:

```shell
ledger-autosync \
  -a "Assets:Cash:Banks:Dollar:Checking" \
  -l 2020.ledger \
  --unknown-account "Equity:Unknown" \
  export_20200615.csv
```

then run it again and _append_ to your existing transaction record using output redirection `>>`:

```shell
ledger-autosync \
  -a "Assets:Cash:Banks:Dollar:Checking" \
  -l 2020.ledger \
  --unknown-account "Equity:Unknown" \
  export_20200615.csv >> 2020.ledger
```

### Cleaning data

Sometimes, CSV isn't cleanly parseable. If you don't already know this, you will learn in the process of maintaining your finances that CSV is the worst format ever and that you should avoid it at all costs, both as a consumer and a producer.

For example, Simple, one of my banks, emits CSV that Python's CSV library cannot reliably automatically determine its delimiter. So I use a convenient tool called `xsv` to sort it (because it comes in reverse order) and then add quotation marks explicitly in `clean_simple.sh`:

```shell
#!/usr/bin/env bash
INPUT="$1"
xsv sort --select Date "${INPUT}" | xsv fmt --quote-always > "$(basename -s .csv "${INPUT}")-sorted.csv"
```

## The tedium: categorizing transactions using accounts in your account tree

Now that you've got some data, you're onto the tedious task of categorizing transactions by replacing the `Equity:Unknown` account with something meaningful.

Don't worry too much about formatting. We'll use `ledger` itself to reformat and sort the transactions you're modifying.

It might be helpful to have a little program showing you what transactions remain to be categorized. [`entr`](http://eradman.com/entrproject/) is a great little tool for watching files for changes and running a command when they change:

```shell
echo 2020.ledger | entr -a -c -p -r ledger -w -f /_ reg Equity:Unknown
```

Once you're done with this, commit!

### Protips for categorizing quickly and efficiently

This is the most laborious part of tracking your finances in _any_ accounting system, so you really want to find ways to optimize your workflow to _incentivize_ you to do it. Manual entry is the most rewarding yet tedious way to do this, so automating typing – especially when it comes transaction _amounts_ – is imporant to reduce the error-prone parts so you can focus your manual time on the categorization that is sometimes difficult to automate.

When trying to figure out how to categorize transactions from the same vendor, try to **remember patterns in your spending**. For example, when a transaction is from a gas station and it's under $10.00, it's probably coffeee, so I categorize it as `Expenses:Coffee` because I track that separate from my `Expenses:Restaurants` when my primary reason for the purchase is, uh, go-go bean juice. If the gas station charge is between $20 and $40, it's 95% likely refueling my car with a 10 gallon tank. If the charge is over that, it's probably for my big SUV with its 25 gallon tank.

**Make progress** when categorizing. If you can't figure out what a transaction is from the cryptic information your bank gives you, mark it with something and move on, e.g. `Equity:Unknown` for bank transaction records or `Expenses:Stuff` for credit card records. These two things help me mark transactions for which I need to look at receipts or go back to the bank's  activity records or statement to see if I can get more context about the purchase.

**Use indicators in the cents of tipped charges** to help you remember what it was at a restaurant. For example, if you want to categorize a transaction as a restaurant charge, tip such that the total is something like $31.03, where 3¢ means it's `Expenses:Restaurant`. If you want to remind yourself that it's alcohol-only, make the total something like $31.04, where 4¢ means that it should be `Expenses:Alcohol`. You can even program an autoclassification tool to handle this for you at some step in your categorization workflow.

## Reformatting with a sort

`ledger` contains a simple `print` command that writes transactions out in the most storage-efficient format possible. It can also use queries to limit what's printed or it can sort the output. Since our appended transactions may be out of order, let's use the opportunity to sort them by date, which is indicated by `d` in `ledger`'s format specifier syntax.

It's a good idea to ensure that you've committed before doing this in case the sort messes up.

```shell
ledger -f 2020.ledger --sort d > 2020-s.ledger
mv 2020-s.ledger 2020.ledger
ledger -f 2020.ledger bal
```

If the sort worked and didn't alter your output, then commit again!

We have to do file rename dance because `ledger` reads in a stream and outputs immediately, so we'd risk overwriting our log file!