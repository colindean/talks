COLOR = --color --force-color
AHA = aha --stylesheet

%.html: %.ledger
	ledger $(COLOR) -f $< balance | $(AHA) --title "ledger -f $< balance" > bal-$@
	ledger $(COLOR) -f $< register | $(AHA) --title "ledger -f $< register" > reg-$@
	ledger $(COLOR) -f $< accounts | $(AHA) --title "ledger -f $< accounts" > acct-$@
	ledger $(COLOR) -f $< payees | $(AHA) --title "ledger -f $< payees" > payees-$@
	bash build_html.sh $< $@

all: exercise1.html

clean:
		rm *.html

.PHONY: clean
