---
title: "Migration Patterns for pandas and Polars"
subtitle: "Move your data wrangling from the bamboo forest to the north pole"
author:
  - Colin Dean
theme: white
#css: custom.css
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

# DEMO

(but not really right now)
<!--
Demo: show naive Pandas impl, then Py Polars impl, then Rust, then pyo3/maturin Rust-Py example
-->


---

# Comparisons

---

### Reduce multiple values

```python
# pandas
df['z'].mean()
# polars
df['z'].mean()
```

---

### Another method

```python
# pandas
df[['z']].agg(['mean'])
#polars
df.select(pl.col("z").mean())
```

---

### Add new column

```python
# pandas
df.assign(z1 = df['z'] + 1)
#polars
df.with_column((pl.col("z") + 1).alias("z1"))`
```

---

### Rename columns

```python
# pandas
df.rename(columns = {'x': 'x_new'})
# polars
df.rename({"x": "x_new"})
```

---

### Drop columns

```python
# pandas
df.drop(columns = ['x','y'])
#polars
df.drop(['x','y'])
```

---

### Sort rows

```python
# pandas
df.sort_values(by = 'x')
# polars
df.sort("x")
```

---

### Drop missing rows

```python
# pandas
df.dropna()
#polars
df.drop_nulls()
```
---

### Select unique rows

```python
# pandas
df.drop_duplicates()
# polars
df.unique()
```

---

### Add a new column

```python
# pandas
df["z1"] = df["z"] + 1
# polars
df = df.with_column((pl.col("z") + 1).alias("z1"))
df = df.with_columns(
    [
        (pl.col("x") + 1).alias("x1"),
        (pl.col("z") + 1).alias("z1"),
    ]
)
```

---

# Real world examples

---

```python
#pandas
df = pd.read_csv(voter_data_path, sep="\t", header=0)
df = df[df.MuniCode == WILKINSBURG_MUNICODE]
df = df[pandas.to_datetime(df["Last_Date_Voted"]) >
     pandas.to_datetime(start_of_active)]
wilkinsburg_active_party_voters = df[df["Political_Party"]
     == party_shortcode.value]
```

---

```python
# polars
all_voters = pl.scan_csv(
    voter_data_path, has_header=True, sep="\t", parse_dates=False)
wilkinsburg_active_party_voters = all_voters
  .filter(pl.col("MuniCode") == WILKINSBURG_MUNICODE)
  .filter(pl.col("Last_Date_Voted") > start_of_active)
  .filter(pl.col("Political_Party") == party_shortcode.value)
  .select(["Name","StreetAddress"])
  .collect()
```

---

# See also

* [Cheatsheet for Pandas to Polars](https://www.rhosignal.com/posts/polars-pandas-cheatsheet/)
* [Polars Crash Course: Python's Library of Big Data Analytics](https://www.youtube.com/watch?v=aiHSMYvoqYE)
