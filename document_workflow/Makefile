PRESENTATION = document_workflow
MARKDOWN = $(PRESENTATION).md
HTML = $(MARKDOWN:md=html)
PDF = $(MARKDOWN:md=pdf)

DEPS_DIR = deps

REVEALJS_VERSION = $(shell basename -s .zip $(shell yaml2json peru.yaml | jq -r '.["curl module revealjs"].url'))

##@ Utility

.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Setup

.PHONY: deps
deps: peru.yaml Brewfile ## Install dependencies
	brew bundle --verbose --no-lock
	peru sync
	npm install nicollet-tokens

##@ Presenting

all: $(HTML) $(PDF) ## Build all artifacts

html: $(HTML) ## Make the presentation reveal.js HTML

open-and-serve: $(HTML) ## Start a server and open the presentation in a browser
	open http://localhost:8080/$(HTML)
	miniserve .

automatic-regen: ## Automatically regenerate on changes
	echo $(MARKDOWN) | entr -acpr make $(HTML)

watch: Procfile ## Serve and regenerate on changes
	hivemind Procfile

clean:
	rm -f $(HTML) $(PDF) $(PDF_SERVER_PIDFILE)

%.html: %.md Makefile
	pandoc -t revealjs -s $< -o $@ \
	-L .filters/embedded_graphviz.lua \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-$(REVEALJS_VERSION)

.PHONY: pdf
pdf: $(PDF) ## Build a PDF

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
