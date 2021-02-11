---
####
## NOTA BENE:
## :::Notes are not shown on slides, only on presenter view.
####
title: >
  An open source documentation workflow loved
  by both Data Scientists and Engineers
author: '@colindean'
date: FOSDEM, February 2020
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
totalTime: 1500
# setup https://github.com/reveal/notes-server?
include-after: |
  <script>
    window.addEventListener('load', (event) => {
      // add each word as a lowercase class
      var words = document.getElementsByClassName('wordcloud')[0].firstElementChild.children
      Array.from(words).forEach((el) => {
        el.className += el.innerText.toLowerCase()
      });
    });
  </script>
---

# I am Colin Dean.

![I wear a hat and a scarf at conferences.](colindean_devopsdays_hatscarf.webp)

:::notes

I'm this guy. I'm generally wearing a top hat and scarf at conferences.
<!-- In that spirit, I'm wearing this now! -->
I've let my hair grow out during the pandemic and now my hat doesn't fit my
head!

:::

---

> The views expressed herein are my own and
> do not necessarily represent the views of
> my employers or associated organization,
> past, present, or future.

::: notes

Lawyers say it's a good idea to display and say this.

(read slide)

:::

---

<svg xmlns="http://www.w3.org/2000/svg" height="300" width="300">
<path d="M149 25a125 125 0 102 0zm2 100a25 25 0 11-2 0z" stroke-width="50" stroke="#C00" different-red='stroke="#E50024"' fill="#FFF"/>
</svg>

Lead AI Engineer at Target Corporation

::: notes

I work for Target, an American retailer.
I'm based out of our tiny Pittsburgh office. <!--on Robotics Row in the Strip District. -->

Like most other tech workers, I'm working from home during the pandemic, so
I'm recording this from my home office in beautiful borough of Wilkinsburg
in the Commonwealth of Pennsylvania.

:::

---

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 447 421.125" width="300" height="282.634228188"><path fill="none" stroke="#b22d00" stroke-width="15" d="M7.5 385.563V35.562l216-28 216 28v350.001l-216 28z"/><path fill="#b22d00" d="M126.094 100.422v21.562c-10.521-8.801-21.406-13.203-32.656-13.203-12.396 0-22.84 4.453-31.328 13.359-8.543 8.855-12.812 19.688-12.812 32.5 0 12.656 4.27 23.334 12.812 32.031 8.541 8.699 19.01 13.047 31.406 13.047 6.406 0 11.848-1.041 16.328-3.125 2.5-1.041 5.09-2.447 7.773-4.219 2.682-1.77 5.508-3.906 8.477-6.406v21.953c-10.418 5.887-21.355 8.829-32.812 8.829-17.24 0-31.953-6.016-44.141-18.047-12.136-12.135-18.203-26.77-18.203-43.906 0-15.364 5.078-29.062 15.234-41.094 12.5-14.739 28.672-22.109 48.516-22.109 10.832 0 21.3 2.943 31.406 8.828zM247.996 201.789l54.297 65.625 1.758-1.953a662.226 662.226 0 0016.602-18.75 495.367 495.367 0 0015.039-18.555l29.688 30.469c-3.646 5.209-8.432 11.264-14.355 18.164-5.927 6.902-12.988 14.844-21.191 23.828l55.859 68.945h-56.641l-30.078-36.914c-27.606 28.516-56.317 42.773-86.133 42.773-26.693 0-49.35-8.527-67.969-25.586-18.231-17.188-27.344-38.41-27.344-63.672 0-30.078 14.453-55.078 43.359-75l19.727-13.477c.26-.128.714-.455 1.367-.977a293.46 293.46 0 012.734-2.148c-19.922-21.222-29.883-42.12-29.883-62.695 0-20.312 6.641-36.847 19.922-49.609 13.541-12.759 30.987-19.141 52.344-19.141 20.703 0 37.823 6.186 51.367 18.555 13.541 12.372 20.312 27.997 20.312 46.875 0 13.022-3.711 24.805-11.133 35.352-7.293 10.547-20.507 23.179-39.648 37.891zm-36.133 25.586l-2.539 1.758c-18.622 12.891-31.317 23.242-38.086 31.055-6.641 7.812-9.961 16.082-9.961 24.805 0 12.5 5.011 23.959 15.039 34.375 10.416 10.027 21.875 15.039 34.375 15.039 17.578 0 37.823-11.523 60.742-34.57l-59.57-72.462zm9.766-57.617l3.711-2.734c6.378-4.815 11.651-9.015 15.82-12.598 4.166-3.58 7.159-6.607 8.984-9.082 3.906-4.815 5.859-10.742 5.859-17.773 0-7.94-2.67-14.386-8.008-19.336-5.341-4.947-12.5-7.422-21.484-7.422-8.203 0-15.106 2.539-20.703 7.617-5.6 4.819-8.398 11.005-8.398 18.555 0 8.856 3.516 17.578 10.547 26.172l11.328 13.672c.391.652 1.172 1.629 2.344 2.929zM412.875 111.906l-14.766 8.75c-2.762-4.791-5.391-7.916-7.891-9.375-2.605-1.666-5.965-2.5-10.078-2.5-5.053 0-9.246 1.433-12.578 4.297-3.334 2.812-5 6.355-5 10.625 0 5.886 4.375 10.625 13.125 14.219l12.031 4.922c9.791 3.959 16.953 8.789 21.484 14.492S416 170.031 416 178.312c0 11.094-3.699 20.262-11.094 27.5-7.449 7.293-16.693 10.938-27.734 10.938-10.469 0-19.115-3.098-25.938-9.297-6.719-6.197-10.912-14.922-12.578-26.172l18.438-4.062c.832 7.084 2.291 11.98 4.375 14.688 3.75 5.209 9.219 7.812 16.406 7.812 5.676 0 10.391-1.9 14.141-5.703 3.75-3.801 5.625-8.619 5.625-14.453 0-2.344-.326-4.492-.977-6.445-.652-1.953-1.668-3.75-3.047-5.391-1.381-1.641-3.164-3.176-5.352-4.609-2.188-1.432-4.793-2.799-7.812-4.102l-11.641-4.844c-16.512-6.979-24.766-17.188-24.766-30.625 0-9.062 3.463-16.641 10.391-22.734 6.926-6.145 15.547-9.219 25.859-9.219 13.907 0 24.766 6.771 32.579 20.312z"/></svg>

Managing Director

Code & Supply Co.

_(Abstractions, Heartifacts conferences)_

Secretreasurer

Code & Supply Scholarship Fund

::: notes
I run Code and Supply, a Pittsburgh-based organization of
thousands of software professionals.
We run some conferences those of you outside of the United States
may have heard of, like Abstractions and Heartifacts.
:::

---

<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1338.806 1180" height="266.165413564" width="300" version="1.0"><g fill="#111110"><path d="M322.39 1160c-28-26-29-73-2-100 42-42 113-11 113 50s-67 91-111 50zM922.39 1160c-44-41-15-120 43-120 31 0 75 41 75 70 0 28-43 70-73 70-13 0-33-9-45-20zM20.39 640c-28-28-27-84 2-104 51-36 111-6 111 56 0 59-72 89-113 48zM620.39 640c-11-11-20-33-20-50 0-65 79-94 119-44 27 35 26 59-4 89-29 30-68 32-95 5zM1226.39 639c-50-39-22-119 43-119 20 0 36 9 50 26 27 35 26 59-4 89s-54 31-89 4zM322.39 120c-28-26-29-73-2-100 42-42 113-11 113 50s-67 91-111 50zM922.39 120c-44-41-15-120 43-120 31 0 75 41 75 70 0 28-43 70-73 70-13 0-33-9-45-20z"/></g><g fill="#d1b32f"><path d="M457.39 1057l-18-33 97-168 97-167 35 3c35 3 38 7 132 168l96 165-19 33-19 32h-383zM235.39 840l-96-167 18-31 18-32h385l16 34 16 33-94 163c-93 161-94 162-130 165l-37 2zM835.39 838l-95-166 17-31 18-31h195l195 1 16 34c9 19 13 37 10 40-3 4-46 76-96 162l-90 156-38 1-37 1zM157.39 537l-18-33 97-168 97-167 36 3c35 3 38 6 126 160 49 86 93 160 97 163 3 4-3 22-14 41l-20 34h-383zM757.39 539l-18-32 97-168 96-169h37c34 0 39 4 58 43 12 23 55 98 95 166l74 125-16 33-15 32-195 1h-195zM535.39 320l-96-167 18-31 18-32h385l17 34 16 34-95 162c-93 161-94 162-131 165l-37 2z"/></g></svg>

President of the Board

Meta Mesh Wireless Communities

::: notes

I am also president of a non-profit network builder that is
pivoting into the Wireless ISP space in 2021.

:::

---

# Task

Write a high-level overview about our product for

* executive review
* senior director briefing
* director deep-dive

::: notes

Our manager came to us one day and told us about an
upcoming off-site meeting at which we'd be asked to
present about the work we'd been doing. A part of
that necessitated a write-up detailing how our product
worked at a high-level.

Multiple people would be consuming it.

:::

---

Multiple audiences meant:

1. Deep content coverage
2. Summaries
3. Navigability

::: notes

We knew that we needed a well-designed document that
could be easily read when printed but also take
advantage of the aspects of the hypermedia used to
distribute it digitally. We'd most likely deliver a
PDF but a long web page <!--wasn't off the table. --> was possibile, too.

We knew we needed to provide good content but it needed
to be well-summarized and be navigable.

:::

---

## A big change

::: notes

Then there was a big change.

:::

---

<i style="font-size: 5em" class="fas fa-pause"></i>

::: notes

A development pause.

(drink water)

:::

---

Our product development was _paused_,
so we needed to document _everything_.

It may not be our team that continues
development.

::: notes

(read slide)


:::

---

## Audience and depth expansion

Detailed white paper for

* executive review
* senior director briefing
* director deep-dive
* **data scientists and engineers**

::: notes

With that development, our scope grew
and we had to go a lot more in-depth
to capture the knowledge of our team
for posterity's sake.

For example, what we'd intended to be a
an work the depth of a quick tour of a
house turned into being an owner's manual
documenting every quirk and hidden compartment.

:::

---

# Dramatis Personae

A team of seven colocated data scientists and engineers

::: notes

There were seven of us, normally colocated.

:::

---

**Engineering** detail

_(architecture, implementation)_

**Mathematical** detail

_(equations, proofs)_

**Both** have a lot of terminology

::: notes

We each had different concerns and interests to be
recorded in the document. The engineers needed to show
how the product works and how it is deployed as production software.

The data scientists needed to show the business logic behind
that software, including equations and citations, with
<!--a veritable cornucopia of--> many acronyms, initialisms, and other terms
likely requiring need for a glossary.

:::

---

# Real need

A content-focused, scientific document authoring workflow
for Data Scientists and Engineers alike

::: notes

We needed something we could all easily use and
to which we could contribute simultaneously. After all,
we had just a handful of days to complete this document.

We needed a workflow that would get out of the way and let
us focus on the content while still looking professional.

:::

---

# Thinking architecturally

::: notes

It's a good practice to figure out the things
that you value about a system before you start
building it. When I'm building software, after
the initial idea comes but before I start
engineering a system from it, I think about
quality attributes.

:::

---

## Primary Values

* Reviewable content: prose, diagrams, equations
* Content-focused with minimal markup
* Minimize structural exceptions with standardized styling and typesetting

::: notes

We assumed that our content would be lots of text, diagrams, and equations.
We wanted a markup format that was easy to read and preferably didn't require
a special program to read. That is, we wanted it to be reviewable on our code
review tool.

And, we wanted _not_ to be able to control styling within the document, except
perhaps for semantic markers calling out special sections.

:::

---

## Secondary Values

* Accomodate some preferences for LaTeX over simpler formats (Markdown)
* Easy to use: one command to generate output
* Automation: artifact built from versioned "code"

::: notes

We wanted to be able to use LaTeX if we _needed_ it, because
we knew that we might want to draw a diagram using TikZ, the
one of the diagram packages for LaTeX.

Lastly, it needed to be easy to use for humans and computers:
one command should build the document and we should treat that
document as a build artifact that is versioned and archived.

:::

---

**Treat documentation as source code.**

::: notes

The key idea is this. This concept of treating
documentation as source code is probably not
novel to most seasoned documentarians, but for
those for whom documentation is all-to-often an
afterthought, like many engineers and data scientists,
this concept is lifechanging.

:::

---

## Avoid at all costs

* Binary files or XML
* Passing around a file via email/Slack
* Manual copy-paste to merge changes
* Difficult exports from wiki format
* Forcing everyone to (re)learn LaTeX

::: notes

This basically eliminated Word, Pages,
straight-up LaTeX, our Confluence wiki,
and virtually every less well-known
text format.

We considered some of the newfangled
tools like mdBook but found that they
did not have the quality of PDF output
and integration with the niceties of
the pandoc ecosystem.

:::

---

<i class="far fa-file-word"></i>
HighLevelOverview.docx

<i class="far fa-file-word"></i>
HighLevelOverview-COLIN.docx

<i class="far fa-file-word"></i>
HighLevelOverview-COLIN_20200626.docx

<i class="far fa-file-word"></i>
HighLevelOverview-COLIN-JAY.docx

<i class="far fa-file-word"></i>
HighLevelOverview-COLIN_20200626-FAN.docx

<i class="far fa-file-word"></i>
HighLevelOverview-FINALFINAL.docx

::: notes
That's right. We wanted to avoid this.

The team also really despised working in Word
and strongly wanted to avoid authoring it in
our wiki system, which we treat as ephemeral
and quickly out of date.
:::

---

# Solution

---

# `pandoc` + `git` + GitHub + Drone CI

::: notes

We built a solution based on this in about two weeks,
while also writing prose.

:::

---

## What this gets us

* Write in a simple text format
* Distribute changes and settle conflicts
* Review and suggest changes
* Push button to receive PDF, archived forever

::: notes

This got us simple text, easily read, reviewed,
agreed upon through our establish systems of consensus,
and produced the same way every time.

It even could automatically notify stakeholders when we
released a major new version.

:::

---

## Biggest benefit?

LaTeX typesetting without ~~suffering~~ writing LaTeX


---

or, LaTeX when you _need it_

::: notes

Our final document actually had little raw LaTeX in it
outside of equations and a couple of diagrams that were simple
enough to be quickly redone in TikZ instead of leaving them
as PNG or SVG images.

:::

---

# `pandoc`, briefly

"A universal document converter"

::: notes

Let's talk about pandoc, a universal document converter.

:::

---

## `pandoc`, less briefly

* 1.0 in 2008, 2.0 in 2017, 2.9.x in 2019
* Open source, GPL-2.0-or-later
* Written in Haskell with a Lua scripting engine
* 33 input formats, dozens of output formats

::: notes

pandoc was started a while ago and hit 1.0 in 2008
with the 2.9.x release we used coming out just as
we started building our work upon it.

It's written in Haskell but supports Lua for writing
plugins that process the <!-- abstract syntax tree --> internal format that
pandoc uses to represent dozens of
document formats it can read and write.

:::

---

# `pandoc` basics

---

## Install

```shell
apt   install pandoc  # Debian/Ubuntu/Pop_OS
brew  install pandoc  # macOS/Linux with Homebrew
crew  install pandoc  # Chrome OS with chromebrew
scoop install pandoc  # Windows with Scoop
```

::: notes

pandoc is available in virtually every package manager
and there are downloadable installers available on pandoc.org

:::

---

## Invocation

```shell
pandoc document.md -o document.pdf
```

::: notes

pandoc attempts to figure out the input and output
formats based on the filenames, but oftentimes it's
better to be explicit.

:::

---

![Running on this presentation](example_pdf.png)

::: notes

This is an example output of running pandoc
on an early version of these slides,
which is written in Markdown and uses pandoc
to produce the code which comprises this presentation!

::::

---

## Real Invocation

```shell
pandoc \
  01_intro.md 02_problem.md 03_diagnosis.md \
  04_remedy.md 05_summary.md \
  --output documentation.pdf \
  --filter pandoc-crossref \
  --filter pandoc-citeproc \
  --lua-filter .filters/glossary/pandoc-gls.lua \
  --pdf-engine xelatex \
  --top-level-division=chapter \
  --number-sections \
  --toc --toc-depth=3 \
  -M lof -M lot \
  --bibliography=bibliography.bib \
  …
```

::: notes
Break down chapters and sections into separate files. Pandoc concatenates input.

Note the use of filters, the choice of PDF engine
that enables XeLaTeX in order to use Unicode and some other implementation-specific features.

Note the choices about table of contents, section numbering, lists of figures and tables, and bibliography.

:::

---

CLI metadata options can be put into the YAML front-matter of the document

---

```yaml
---
title: >
  A documentation workflow loved
  by both Data Scientists and Engineers
author: '@colindean'
date: August 11, 2020
theme: white
css: custom.css
---

# Task

Write a white paper about our product for

* executive review
* senior director briefing
* director deep-dive
```

:::notes

Metadata and some other options can easily go into a
YAML section at the beginning of a document. Pandoc
also supports a configuration file containing defaults.
I use this in newer projects to shorten the Makefile.

:::

---

## This presentation is written in Markdown

and converted to a Reveal.js presentation:

```makefile
PRESENTATION = document_workflow
MARKDOWN = $(PRESENTATION).md
HTML = $(PRESENTATION).html
DEPS_DIR = deps
all: $(HTML)

%.html: %.md
  pandoc \
    --to=revealjs --standalone \
    $< --output=$@ \
    -M revealjs-url=$(DEPS_DIR)/reveal.js/reveal.js-4.1.0
```
::: notes
Reveal and Powerpoint are supported first-class for output.
This slide deck is written in Markdown and transformed to a
Reveal presentation via Pandoc.
:::
---

## Build system vs. a script

* Make
* Gradle

::: notes
Any sufficiently advanced build script eventually reimplements Make.
:::

---

## Common plugins

|Plugin|Purpose|
|------|-------|
|`pandoc-citeproc`    | Processes citations, enables BibTeX use |
|`pandoc-crossref`    | Cross-referencing for figures, equations, sections, etc. |

::: notes
We've used citeproc and crossref extensively.
:::

---

## Other great plugins

|Plugin|Purpose|
|------|-------|
|`pandoc-include-code`| Includes code from files instead of embedding |
|`pandoc-placetable`  | Nicely render CSV data into a table |
|`panpipe`     | Execute code blocks during document rendering |

::: notes

include-code is pulls in files, great for pulling in snippets from an
external file that might change over time.

I'm making extensive of panpipe in a workshop I built.
I can put code examples directly in the document, write those examples to a
file during document build, and subsequent code blocks would execute
on the files written to disk.

These two together are fantastic for ever-changing data and source code!

:::

---

## More plugins

Plugins written in Haskell, Lua, Python, and more

Loads more: https://github.com/jgm/pandoc/wiki/Pandoc-Filters

::: notes
Strongly recommend using Lua, which doesn't require
installing or compiling anything additional.
:::

---

## Diagrams

External or embedded

```markdown
![Figure caption](diagram.svg)
```

```tex
\begin{figure}
  \centering
    \tikz{
      \draw[->, thick]{
        (0,0) -- (10,0)
      };
      \node[circle,radius=2pt,fill=blue] at (0,0){};
      \node[circle,radius=2pt,fill=blue] at (1,0){};
      \node[circle,radius=2pt,fill=blue] at (2,0){};
      \node[circle,radius=2pt,fill=blue, color=blue, align=center, label={[text=blue]Training Data}] at (3,0){};
      \node[circle,radius=2pt,fill=blue] at (4,0){};
      \node[circle,radius=2pt,fill=blue] at (5,0){};
      \node[circle,radius=2pt,fill=blue] at (6,0){};
      \node[circle,radius=2pt,fill=blue] at (7,0){};
      \node[circle,radius=2pt,fill=red, color=red, align=center, label={[text=red]Test Data}] at (8,0){};
      \node[circle,radius=2pt,fill=red] at (9,0){};
      \node at (11,0) {time};
    }
  \caption{Splitting time series data into training and test sets. Based on a graphic by Hyndman and Athansopouslos.}
  \label{fig:timeseries}
\end{figure}
```

::: notes

Images can be in a variety of formats. I tend to convert
everything to PDF and include the PDF version in the Markdown
because I know that PDF will look right versus SVG, because
SVG output rarely converts fonts to paths.

Here, I redrew a diagram using TikZ, and it looked a whole lot
better than the PNG derived from a screenshot of a PDF.

:::

---

## Citations

```markdown
As described in @hendry1995dynamic, we conclude that…
```
`--filter pandoc-citeproc`

`--bibliography bib.bib`
```bibtex
@book{hendry1995dynamic,
  title={Dynamic Econometrics},
  author={Hendry, D.F. and F, H.D. and Hendry, P.E.O.U.F.D.F. and Oxford University Press},
  isbn={9780198283164},
  lccn={gb95034438},
  series={Advanced texts in econometrics},
  url={https://books.google.com/books?id=XcWVN2-2ZqIC},
  year={1995},
  publisher={Oxford University Press}
}
```

::: notes

Using the pandoc-citeproc filter, we can easily enable
bibliographical references.

:::

---

# <i class="fab fa-git"></i>

* Distributed version control system
* Predominant/preeminent/prevailing use for software and more
* Great for text, not for binaries

::: notes

git was originally written to manage the Linux kernel
source code. Linus Torvalds himself wrote it!

but it was popularized in the late 2000s and early 2010s by…
:::

---

<i style="font-size: 8em" class="fab fa-github"></i>

GitHub

::: notes

GitHub is a widely used public website with
an on-premises version called GitHub Enterprise.

It's increasingly used internally by large companies.

You could also use GitLab, Gitea, or a host of other systems.
We use GitLab for Code & Supply and Gitea for Meta Mesh.
:::

---

# Our workflow

::: notes
Next, I'll tell you about how my team used this powerful tool to create a workflow that enabled us to collaborate without having to pass around a file.
:::
---

## Four primary tools

|Tool|Utility|
|----|-------|
|`pandoc`|Write in a simple text format, Markdown|
|`git`   |Distribute changes and settle conflicts|
|GitHub  |Review and suggest changes, treat docs as code|
|Drone CI|Push button to receive PDF, archived forever|

---

### Flow of data

```{.graphviz caption="Git+GitHub workflow"}
digraph document_workflow {
  rankdir=LR;
  size="9,9"

  graph [fontname = "helvetica"];
  node [fontname = "helvetica"];
  edge [fontname = "helvetica"];

  node [label="Working Copy"]; edit
  node [label="pandoc"]; local_render
  node [label="Commited Work"]; commit
  node [label="GitHub"]; github
  node [label="CI"]; ci
  node [label="pandoc in Docker"]; remote_render

  github -> edit [ label = "Clone" ]
  edit -> edit [ label = "Write" ]
  edit -> local_render [label="Compile"]
  local_render -> edit [label="Fix"]
  edit -> commit [label="Commit"]
  commit -> edit [label="Refactor"]
  commit -> github [label="Push"]
  github -> ci [label="Check"]
  ci -> github [label="Validate"]
  ci -> remote_render [label="Compile"]
  remote_render -> github [label="Save Build Artifacts"]
  remote_render -> github [label="Notify of Build Errors"]

}
```

::: notes

Those of you who are familiar with GitHub will recognize this workflow.
Note how changes move around the system.

:::

---

### Authoring

* Use a Markdown-specific text editor with preview
  * [PanWriter](https://github.com/mb21/panwriter), [MacDown](https://github.com/MacDownApp/macdown)
  * `vim` + `entr` + PDF viewer
* Writing one sentence per line makes review suggestions easier.


::: notes

There are some Markdown-specific text editors out there.
I'm a fan of MacDown but all too often come back to Vim
with a few plugins for easily editing Markdown.


One sentence per line makes it easier to suggest small changes to documents
during the review process.

:::

---

### Managing content

* One chapter per file - enables extraction
* Transforms necessitate a build directory

::: notes

When you limit relevant content to a single file,
you can deftly extract a single chapter or a few
into a single PDF. This is great for a summary PDF
or for testing only one file in a large document.

Our final paper, which was approximately forty five
pages, takes around 12 seconds to compile on my 2019
MacBook Pro. Compiling with only one section takes about
two seconds.

:::

---

### Committing

Use `git` commits to tell a story about the changes.

::: notes

(read slide)

:::

---

### Reviewing

::: notes

Next, we'll talk about reviewing.

:::

---

#### Pull Requests

* Assign reviewers automatically with `CODEOWNERS`
* Choose submitter-merge or reviewer-merge

::: notes

I do a whole talk about code review and pull requests,
so I suggest some further reading or watching after searching for
"Colin Dean Code Review" on your favorite search engine.

Use automation, like CODEOWNERS in GitHub or some other automatic assigning
system.

:::

---

#### Continuous Integration

Block PR merging with CI system automation.

* Ensure valid markup and view changes compiled
* Run `proselint` or a grammar/spelling tool

::: notes

Every time I've not set up CI on a repo using this template,
someone has managed to merge to master something that breaks
the PDF build and it's been difficult to track down. I know
what to look for now – XeLaTeX doesn't like greek letters
inside formatting inside equations, apparently a no longer
necessary practice.

:::

---

#### GitHub's PR suggestions

* Push a button to accept changes
* Discuss suggestions, provide alternative suggestions
* Establish consensus on controversial suggestions

::: notes

Use GitHub's review system as it was intended to be used
and you'll be in good shape.

:::

---

# Pain Points

::: notes

This was not without some pain. Some things were easy to fix, others hard,
and some are yet unresolved.

:::

---

## Pain getting started

* Dependency installation
* Learning Pandoc's flavor of Markdown
* "Why can't I just use LaTeX?"
* Converting from Word or LaTeX loses cross-references˚

<small><em>˚as of Pandoc 2.9.x</em></small>

::: notes

Some users had problems installing the large dependencies on our corporate
network. Some users found the minute differences between Pandoc Markdown and
CommonMark to be frustrating. Someone wanted to "just use LaTeX or Microsoft Word".

:::

---

## Productivity Pain points

* Incomplete WYSIWYG
* Bugs in workflow, sole developer stakeholder
* Equation writing workflow disjointed
  * Editor with TeX equations support
  * Separate renderer (LaTeXiT, MathJax.com)
  * Just render it

::: notes

We never really established a reliable way to make changes and see them
automatically.
I've since found that Evince is probably the best PDF reader for this workflow,
as it reloads PDFs when they've been changed.

Also, I was a single point of failure too often early on.

Lastly, authors less comfortable with TeX equations were frustrated by the
tooling to preview their equations quickly.

:::

---

## Accomodating objections

* I want to use X
  * "But I want to use LaTeX"
    * only if you'll own that file!
  * "But I want to write my section in X and export it to Pandoc Markdown"
    * only if you can effect changes suggested in the PR

::: notes

Authors who wanted to deviate had to own their sections entirely.

:::

---

## Greatest risk of additional transformation tools?


::: notes

but what's the greatest risking of additional transformation tools?

:::

---

### Overwriting.

Changes made to a versioned file overwritten by the output of an external tool cost us _a lot_ of time.

```{.graphviz caption="Conversion"}
digraph conversion {
  rankdir=LR;
  size="9,9"

  node [shape="rectangle"];

  node [label="0200_widgets.Rmd"]; Rmd
  node [label="0200_widgets.md"]; Md
  node [label="0200_widgets.md"]; GitHub
  node [label="document.pdf"]; PDF

  Rmd -> Md [label="Rmd manual conversion"];
  GitHub -> Md [label="Review suggestions"];
  Md -> PDF [label="Pandoc"];
}
```


::: notes

Transformation output overwriting other versioned files bit us hard.
In a subsequent use of this system,
one person strongly preferred to use LaTeX and another preferred to
use R Markdown and convert both to Markdown to be versioned. This
went _okay_ but had some caveats.

:::

---

#### Recommendation

Convert in the build system.

```{.graphviz caption="Conversion"}
digraph conversion {
  rankdir=LR;
  size="9,9"

  node [shape="rectangle"];

  node [label="0200_widgets.Rmd"]; Rmd
  node [label="0200_widgets.md"]; Md
  node [label="0200_widgets.Rmd"]; GitHub
  node [label="document.pdf"]; PDF

  Rmd -> Md [label="Rmd conversion by build system"];
  GitHub -> Rmd [label="Review suggestions"];
  Md -> PDF [label="Pandoc"];
}
```

::: notes

I recommend avoiding this entirely: store the
original document in the repository and the
build system must handle the conversion from the original
format to something that works with Pandoc.

:::

---

# Feedback

_You don't have to take my word for it!_

---

## Positive

> "Leveled the playing field for contributions, great for collaborating and building documents with all of the features of LaTeX"

<small><em>\- PhD who loves LaTeX</em></small>

---

## Negative

> "I miss having fine-level control of figures, subfigures, positioning, etc."

<small><em>\- PhD who loves LaTeX</em></small>

---

# Current use

---

## Growing adoption

* Two large papers (~50 pgs and 176 pgs)
* Several smaller papers
* Nearly two dozen authors
* A workshop and two papers outside work

::: notes

Our leadership was quite impressed not only with the
document we produced, but also the system.

We've since expanded its use to other teams, including
one using a fork of my original repo as a basis for
documentation spanning several teams. Content is brought
in via git submodules, where each repository is also its
own document.

An executive decided to use Pandoc to write a book after
seeing what we'd done. That's awesome, because the basis of my system
was what was used to write the first edition of
A Friendly Introduction to Software Testing by Bill Laboon.

:::

---

## Many tools

::: wordcloud

* `MacTeX`
* `pandoc`
* `pandoc-crossref`
* `pandoc-citeproc`
* `XeTeX`
* `Tectonic`
* `make`
* `Homebrew`
* `librsvg`
* `proselint`
* `docker`
* `pandocker`
* `git`

:::

---

# Future growth

* Output HTML, too, with CI workflow for GitHub Pages
* Output ePub for easier consumption on mobiles
* Well-styled LaTeX to make our documents _ours_

::: notes

My long term vision for this is to have a single source
for this document system that gets turned into a bunch
of easily consumable formats, creating a searchable
library of sorts, an internal Arxiv.org for our
internal scientific documents.

And then style. Our documents use mostly out of the box
pandoc and LaTeX styles with a few customizations. I'll
probably leave Computer Modern as the font because it
just conveys a certain aire of... respectability.
:::

---

# `pandoc.org`

::: notes

So, go check out pandoc at pandoc.org!

:::

---

# References and Attributions

* [Icons by Font Awesome](https://github.com/FortAwesome/Font-Awesome). CC-BY-4.0 / SIL OFL 1.1.
* [A Friendly Introduction to Software Testing](https://www.amazon.com/Friendly-Introduction-Software-Testing-ebook/dp/B01BCPXLHU) by Bill Laboon ([repo](https://github.com/laboon/ebook))

---

# These slides

* Raw code including use of pandoc:
  * https://github.com/colindean/talks
  * `document_workflow`
* Rendered version
  * https://speakerdeck.com/colindean

::: notes

You can find the raw source for these slides
including my build system built around pandoc
on my GitHub repository.

A rendered version is available on my SpeakerDeck
profile.

:::

---

# FIN

![\@colindean](colindean_devopsdays_hatscarf.webp)

::: notes

That's all folks! Thank you for watching!

:::
