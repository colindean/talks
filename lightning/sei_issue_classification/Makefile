PRESENTATION = sei_issue_classification
MARKDOWN = $(PRESENTATION).md
HTML = $(PRESENTATION).html
PDF = $(PRESENTATION).pdf

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
	rm -f $(HTML) $(PDF)

%.html: %.md
	pandoc -t revealjs -s $< -o $@ \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-4.2.0 \
	--lua-filter .filters/embedded_graphviz.lua

.PHONY: pdf
pdf: $(PDF)

HOST_INSIDE_DOCKER=host.docker.internal
FONTS=$(HOME)/Library/Fonts
PDF_SERVER_PIDFILE=.miniserve.pdf.pid

$(PDF_SERVER_PIDFILE):
	miniserve -p 20871 . & echo $$! > .miniserve.pdf.pid

$(PDF): $(HTML) $(PDF_SERVER_PIDFILE)
	docker run --rm -t --net=host \
		-v "$(shell pwd):/slides" \
		-v "$(FONTS):/home/node/.local/share/fonts" \
	  astefanutti/decktape --size 1920x1080 http://$(HOST_INSIDE_DOCKER):20871/$(HTML) $@

	kill `cat $(PDF_SERVER_PIDFILE)` && rm -rf $(PDF_SERVER_PIDFILE)
