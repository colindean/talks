# Methods and patterns for migrating from Pandas to Polars

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
