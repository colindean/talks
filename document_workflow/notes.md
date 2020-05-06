# Talking points

## Values

* Content-focused
* Minimize structural exceptions
* Standardized styling and typesetting
* Reviewable prose and diagrams
* Accomodate some preferences for LaTeX over simpler formats (Markdown)
* One command to generate output
* Automatable with versioned, single master copy

## Pain points

* WYSIWYG
* Install with package manager or install docker and pull container
* Converting from Word, etc. loses cross-references
* Markdown is well-known but so many orgs have their own flavors, Pandoc is just another one
* New software has bugs, including gaps in the workflow
    * E.g. Build hang when steps aren't followed
* Equation writing workflow may be cumbersome
    * Use an editor supporting preview with math rendering (Macdown and Mou both do) OR
    * Use a separate renderer to test your equations
        * Latexit
        * MathJax website
        * just render the document with pandoc via `make pdf` or `make open`.

## Accomodating objections

* I want to use X
   * "But I want to use LaTeX" - only if you'll own that file!
   * "But I want to write my section in X and export it to Pandoc Markdown" - only if you can effect changes suggested in the PR
   * Overwriting is a real concern with exporting: changes made to a file in the repo getting overwritten by an external tool's export cost us a lot of time
  

# See Also

* [Using knitr and pandoc to create reproducible scientific reports](http://galahad.well.ox.ac.uk/repro/)
