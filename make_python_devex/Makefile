PRESENTATION = presentation
ARTICLE = article
MARKDOWN = $(PRESENTATION).md $(ARTICLE).md
PRESENTATION_HTML = $(PRESENTATION).html
HTML = $(MARKDOWN:md=html)
PDF = $(MARKDOWN:md=pdf)

DEPS_DIR = deps

REVEALJS_VERSION = $(shell basename -s .zip $(shell yq -r '.["curl module revealjs"].url' peru.yaml))

WS_WATCHED_FILE = .$(PRESENTATION_HTML).ws

##@ Utility

.PHONY: help
help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Setup

.PHONY: deps
deps: peru.yaml Brewfile ## Install dependencies
	brew bundle --verbose
	peru sync

##@ Presenting

all: $(HTML) $(PDF) ## Build all artifacts

html: $(HTML) ## Make the presentation reveal.js HTML

open-and-serve: $(HTML) ## Start a server and open the presentation in a browser
	open http://localhost:8080/$(PRESENTATION_HTML)
	miniserve .

##@ Development

# this madness gets us a space and newline character for subst
null :=
space := ${null} ${null}
${space} := ${space}# ${ } is a space. Neat huh?

define \n
\n
endef

automatic-regen: $(WS_WATCHED_FILE) ## Use entr to automatically remake the file
	echo $(PRESENTATION).md | entr -acpr $(SHELL) -c "make $(PRESENTATION_HTML) && echo reload >> $(WS_WATCHED_FILE)"

$(WS_WATCHED_FILE):
	touch $(WS_WATCHED_FILE)

watch: Procfile ## Use hivemind for constant building, run open first
	hivemind Procfile

livereload-ws: ## Run a websocket server listening for reloads
	tail -f $(WS_WATCHED_FILE) | websocat -s 56789

##@ Cleanup
.PHONY: clean
clean: ## Clean build artifacts
	rm -f $(HTML) $(PDF) $(PDF_SERVER_PIDFILE) $(DOCX) article_media $(WS_WATCHED_FILE)

%.html: %.md Makefile
	pandoc -t revealjs -s $< -o $@ \
	--section-divs \
	-L .filters/embedded_graphviz.lua \
	-M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-$(REVEALJS_VERSION)

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
