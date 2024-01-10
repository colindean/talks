# Code & Supply Comp Survey Data Engineering talk

## Contributing

Should work fine in WSL — tested — but built on macOS.

### Setup

Prereqs:

* Homebrew
* `brew install git-lfs` to be able to clone the repo correctly.

To install stuff:

    make deps

### Adding

Watch the build with

    make watch

And connect on <http://localhost:8080/presentation.html>.
The presentation will rebuild on save.

It's a [reveal.js](https://revealjs.com) presentation under the hood, compiled with Pandoc (who but).

Always make sure that it builds before committing!

:warning: **Always prefix commits with `[codeandsupply_comp_survey_2022_engine]`**
so that I know what commits touch what presentation when looking at the logs.
