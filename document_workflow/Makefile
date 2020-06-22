PRESENTATION = document_workflow
HTML = $(PRESENTATION).html

DEPS_DIR = deps

all: $(HTML)

serve: $(HTML)
	open http://localhost:8080/$(HTML)
	miniserve .

deps:
	brew bundle
	peru sync

clean:
	rm -f $(HTML)

%.html: %.md
	pandoc -t revealjs -s $< -o $@ \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-3.9.2
