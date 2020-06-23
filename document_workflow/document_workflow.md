---
title: >
  A documentation workflow loved
  by both Data Scientists and Engineers
author: '@colindean'
date: August 11, 2020
theme: white
css: custom.css
# slideNumber: c/t
hash: true
history: true
transitionSpeed: "fast"
---

# Task

Write a white paper about our product for

* executive review
* senior director briefing
* director deep-dive

---

Multiple audiences meant:

1. Deep content coverage
2. Summaries
3. Navigability

---

## A big change

<i class="fas fa-pause"></i>

Our product development was _paused_,
so we needed to document _everything_.

It may not be our team that continues
development.

# Dramatis Personae

A team of seven colocateed data scientists and engineers

---

Lots of **engineering** detail: architecture, implementation

Lots of **mathematical** detail: equations, proofs

---

# Real need

A content-focused, scientific document authoring workflow
for Data Scientists and Engineers alike

---

# Thinking architecturally

---

# Primary Values

* Reviewable prose and diagrams
* Content-focused
* Minimize structural exceptions with standardized styling and typesetting

---

# Secondary Values

* Accomodate some preferences for LaTeX over simpler formats (Markdown)
* Easy to use: one command to generate output
* Automatable artifact built from versioned, single master copy

---

# Solution

---

# `pandoc`

---

## Biggest benefit?

LaTeX typesetting without ~~suffering~~ writing LaTeX

---

or, LaTeX when you _need it_

---

# `pandoc`, briefly

* 1.0 in 2008, 2.0 in 2017, 2.9.x in 2019
* Open source, GPL-2.0-or-later
* Written in Haskell with a Lua scripting engine
* 33 input formats, dozens of output formats

---

# Pain Points

---

## Pain getting started

* Dependency installation
* Learning Pandoc's flavor of Markdown
* "Why can't I just use LaTeX?"
* Converting from Word or LaTeX loses cross-references˚

<small><em>˚as of Pandoc 2.9.x</em></small>

---

## Productivity Pain points

* Incomplete WYSIWYG
* Bugs in workflow, sole developer stakeholder
* Equation writing workflow disjointed
  * Editor with TeX equations support
  * Separate renderer (LaTeXiT, MathJax.com)
  * Just render it

---

## Accomodating objections

* I want to use X
  * "But I want to use LaTeX"
    * only if you'll own that file!
  * "But I want to write my section in X and export it to Pandoc Markdown"
    * only if you can effect changes suggested in the PR

---

## Greatest risk of additional transformation tools?

---

### Overwriting.

Changes made to a file in the repo being overwritten by the output of an external tool's cost us _a lot_ of time.
