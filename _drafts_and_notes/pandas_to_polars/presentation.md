---
title: "Migration Patterns for Pandas and Polars"
subtitle: "Move your data wrangling from the bamboo forest to the north pole"
author:
  - Colin Dean
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
# totalTime: 900
# include-after: |
#     <link href="deps/asciinema-player/asciinema-player.css" type="text/css" rel="stylesheet"/>
#     <script src="deps/asciinema-player/asciinema-player.js" type="application/javascript"></script>
# title-slide-attributes:
#     data-background-image: "bg.png"
#     data-background-size: "10%"
#     data-background-position: "50% 100%"

---

## Central idea

Faster data wrangling with a friendlier API

## Dramatis Personae

[Pandas](https://pandas.pydata.org/)

[Polars](https://www.pola.rs/)

## Pandas Pros

* Widely used and experience harded
* Inside of many dependency trees
* Widely taught in (under)graduate programs

## Pandas Cons

* Eager evaluation by default
* Slow evaulation in general
* Pythonic syntax obtuse for non-Pythonistas

## Polars Pros

* Lazy evaluation by default
* Optimized for embarassingly parallel selection and manipulation
* Few dependencies
* Easy migration path to Rust reimplementation
* Type hints and docs for all methods

## Polars Cons

* Less battle-tested
* Not taught in schools
* Completely different API from Pandas
