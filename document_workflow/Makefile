PRESENTATION = document_workflow
MARKDOWN = $(PRESENTATION).md
HTML = $(PRESENTATION).html

DEPS_DIR = deps

all: $(HTML)

open-and-serve: $(HTML)
	open http://localhost:8080/$(HTML)
	miniserve .

automatic-regen:
	echo $(MARKDOWN) | entr -acpr make $(HTML)

watch: Procfile
	hivemind Procfile

.PHONY: deps
deps: peru.yaml Brewfile
	brew bundle
	peru sync

clean:
	rm -f $(HTML)

%.html: %.md
	pandoc -t revealjs -s $< -o $@ \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-3.9.2

