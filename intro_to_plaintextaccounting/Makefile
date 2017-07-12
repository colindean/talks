COLOR = --color --force-color
AHA = aha --stylesheet

%.html: %.ledger
	ledger $(COLOR) -f $< balance | $(AHA) --title "ledger -f $< balance" > bal-$@
	ledger $(COLOR) -f $< register | $(AHA) --title "ledger -f $< register" > reg-$@
	ledger $(COLOR) -f $< accounts | $(AHA) --title "ledger -f $< accounts" > acct-$@
	ledger $(COLOR) -f $< payees | $(AHA) --title "ledger -f $< payees" > payees-$@
	ledger $(COLOR) -f $< balance ^Assets ^Liabilities | $(AHA) --title "ledger -f $< balance ^Assets ^Liabilities #networth" > networth-$@
	ledger $(COLOR) -f $< balance ^Income ^Expenses | $(AHA) --title "ledger -f $< balance ^Income ^Expenses #cashflow" > cashflow-$@
	bash build_html.sh $< $@

all: exercise1.html examples.html

clean:
		rm *.html

.PHONY: clean
