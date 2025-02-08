PRESENTATION = presentation
ARTICLE = article
MARKDOWN = $(PRESENTATION).md $(ARTICLE).md
PRESENTATION_HTML = $(PRESENTATION).html
HTML = $(MARKDOWN:md=html)
PDF = $(MARKDOWN:md=pdf)
DOCX = $(MARKDOWN:md=docx)

DOTS = $(wildcard *.dot)
SVGS = $(DOTS:.dot=.svg)

DEPS_DIR = deps
BUILD_DIR = build

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

##@ Presenting

.PHONY: all
all: $(HTML) $(PDF) ## Build all artifacts

.PHONY: docx
docx: $(DOCX)

.PHONY: html
html: $(HTML) ## Make the presentation reveal.js HTML

open-and-serve: $(HTML) ## Start a server and open the presentation in a browser
	open http://localhost:8080/$(HTML)
	miniserve .

##@ Development

automatic-regen: ## Use entr to automatically remake the file
	echo $(MARKDOWN) | entr -acpr make $(HTML)

watch: Procfile ## Use hivemind for constant building, run open first
	hivemind Procfile

##@ Cleanup

.PHONY: clean
clean: ## Clean build artifacts
	rm -f $(HTML) $(PDF) $(PDF_SERVER_PIDFILE) $(DOCX) article_media

%.html: %.md Makefile
	pandoc -t revealjs -s $< -o $@ \
	--section-divs \
	-L .filters/embedded_graphviz.lua \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-$(REVEALJS_VERSION)

%.docx: %.md Makefile
	pandoc -s $< -o $@ \
	-L .filters/embedded_graphviz.lua \
	-L deps/pandoc/lua-filters/include-code-files/include-code-files.lua \
	--filter pandoc-crossref \
	--extract-media=article_media \
	--reference-doc=reference.docx

.PHONY: $(BUILD_DIR)
$(BUILD_DIR):
	mkdir -p $@

%.svg: %.dot $(BUILD_DIR)
	dot -Tsvg -o$(BUILD_DIR)/$(<:.dot=.svg) $<
	svgo $(BUILD_DIR)/$(<:.dot=.svg)

.PHONY: svgs
svgs: $(SVGS) ## Build all SVGs

.PHONY: pdf
pdf: $(PDF) ## Build a PDF

HOST_INSIDE_DOCKER=host.docker.internal
FONTS=$(HOME)/Library/Fonts
PDF_SERVER_PIDFILE=.miniserve.pdf.pid

$(PDF_SERVER_PIDFILE):
	miniserve -p 20871 . & echo $$! > .miniserve.pdf.pid


DECKTAPE_CMD = docker run --platform=linux/amd64 --rm -t --net=host \
		-v "$(shell pwd):/slides" \
		-v "$(FONTS):/home/node/.local/share/fonts" \
	  astefanutti/decktape

DECKTAPE_CMD = npm exec -- decktape
DECKTAPE_HOST = 127.0.0.1

%.pdf: $(PRESENTATION_HTML) $(PDF_SERVER_PIDFILE)
	$(DECKTAPE_CMD) --size 1920x1080 http://$(DECKTAPE_HOST):20871/$(@:.pdf=.html) $@

	kill `cat $(PDF_SERVER_PIDFILE)` && rm -rf $(PDF_SERVER_PIDFILE)

.PHONY: test
test:

package-article:
	zip -r -9 make_python_devex.zip article.docx article_media example/{Makefile,Brewfile,pyproject.toml,README.md} example/tests/unit/test_main.py example/example/__init__.py
