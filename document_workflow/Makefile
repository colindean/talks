all: document_workflow.html

serve: document_workflow.html
	open http://localhost:8080/document_workflow.html
	miniserve .

deps:
	brew bundle
	peru sync

%.html: %.md
	pandoc -t revealjs -s $< -o $@ \
		-M revealjs-url=reveal.js/reveal.js-3.9.2

