---
title: "Migration Patterns for pandas and Polars"
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

---

## Dramatis Personae

[pandas](https://pandas.pydata.org/)

[Polars](https://www.pola.rs/)

---

![pandas logo](https://pandas.pydata.org/static/img/pandas.svg)

---

* 2008: Development of pandas started at AQR Capital Management by Wes McKinney [^pandas_history]
* 2009: pandas becomes open source
* 2012: First edition of _Python for Data Analysis_ is published
* 2015: pandas becomes a NumFOCUS-sponsored project

[^pandas_history]: https://pandas.pydata.org/about/

---

## pandas Pros

* Widely used and experience harded
* Inside of many dependency trees
* Widely taught in (under)graduate programs

---

## pandas Cons

* Eager evaluation by default
* Slow evaulation in general
* Pythonic syntax obtuse for non-Pythonistas

---

![Polars logo](https://raw.githubusercontent.com/pola-rs/polars-static/master/logos/polars-logo-dark.svg)

---

|Rust|Python|
|----|------|
|![Polars Rust logo](https://raw.githubusercontent.com/pola-rs/polars-static/master/web/polars-logo-rust.svg)|![Polars Python logo](https://raw.githubusercontent.com/pola-rs/polars-static/master/web/polars-logo-python.svg)|

---

* 2020: Development started by Ritchie Vink
* 2021: ["I wrote one of the fastest DataFrame libraries"](https://www.ritchievink.com/blog/2021/02/28/i-wrote-one-of-the-fastest-dataframe-libraries/)

---

## Polars Pros

* Lazy evaluation by default
* Optimized for embarassingly parallel selection and manipulation
* Few dependencies
* Easy migration path to Rust reimplementation
* Type hints and docs for all methods

---

## Polars Cons

* Less battle-tested
* Not taught in schools
* Completely different API from Pandas

---

## Polars vs `X`

TL;DR Best tool for single-machine data

https://pola-rs.github.io/polars-book/user-guide/misc/alternatives/

---
