---
title: "Data engineering the Code & Supply Compensation Survey Report"
subtitle: "Python, Polars, Plotly, Jupyter notebooks, GitLab, and more"
author:
  - Colin Dean
  # - Alex Zharichenko # Alex: uncomment yourself if you contribute!
theme: red
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

# Who are we?

---

![<https://codeandsupply.co>](https://raw.githubusercontent.com/codeandsupply/assets/master/logos/imprint/bruteforce/build/autogen%20imprint/cs_imprint_basic_red-bg_red-border_white-lettering.svg)

---

* Meetups
* Conferences
* Co-working space
* Online communities
* Knowledge sharing projects

::: notes

We do a lot of stuff, mostly Meetups and our Online Communities on Slack and YouTube these days.
Maybe we'll do another 1,500 person conference in a few years.

:::

---

# Compensation Survey

::: notes

Our compensation survey is a multi-iteration effort to capture a snapshot of
tech worker compensation, work-life balance, job satisfaction, commutes, and more.

:::

---

![C&S Comp Survey ad](codeandsupply_survey_600x500.svg)

::: notes

The goal is to help C&S members and friends share information so they can make better decisions about their careers.
To date, dozens of people have told us how our report has helped them get pay bumps or negotiate better pay when changing jobs.
I myself have cited it in negotiation twice.

:::


---

# History

* 2016: started at a C&S Build Night
* 2017: first survey + report
* 2020: do it again (pandemic style)
* 2022: third survey
* 2023: 2022 report after a year of engineering

::: notes

It came out of a Build Night idea in 2016 and I launched the first iteration in 2017 with 256 respondents and about 500 lines of Ruby to produce a series of tables that helped me and Justin Reese, Code & Supply's founder and owner, write two blog posts. The table generation was repeateable, but I made all of the graphics in Apple Numbers.

In 2020, we kicked off a "Compensation Survey Working Group," recruited almost a dozen volunteers to help... and then the pandemic hit and volunteers were in the wind. We still managed to get it out, though. We had around 750 responses.
Our process wasn't repeatable: one person did the graphs in their own Tableau account and became a bottleneck.
We asked a lot of questions and our abandonment rate was higher than we'd like.
However, we automated builds of the report, which we wrote in Markdown and compiled to a PDF with Pandoc.

In 2022, we started again, slimming down the question set from 72 to 48 and engaged in real software development to build a framework for analysis.
It took a lot longer than we planned -- more than a year when we'd planned about four months -- but life got in the way for all of the volunteers, so we did the best we could for that all volunteer team.

:::

---

_not full time engineering, lol_

---

[`codeandsupply.co/survey`](https://codeandsupply.co/survey)

::: notes

Go download the report now!
It's more than 100 pages but it's a lot of graphs.

We're proud of the work we did with the scant resources we had -- $1,200 from sponsors and countless nights and weekends together and apart.

If you're interested in funding a serious sponsorship to make this happen in 2024, please talk to me as soon as possible.
One of our core team members is currently looking for work and I'd love to hire them full-time to work on the survey but
Code & Supply can barely keep the lights on at our co-working space let alone fund a data science team.

:::

---

[`codeandsupply.co/join`](https://codeandsupply.co/join)

[`codeandsupply.co/coworking`](https://codeandsupply.co/coworking)

::: notes

You can help us afford more things by supporting us financially directly or coworking with us.

But now onto the meat of the talk: data engineering!

:::

---

# Agenda

1. Data collection
1. One-time data cleaning
1. Base analysis workflow
1. Tooling for writers
1. CI/CD
1. Future work

::: notes

The rest of this talk is going to be about the data engineering aspects of producing the report.
I'll talk about how we collected and cleaned the data,
how we built software to analyze the data and produce tables and graphics for inclusion in the report,
how we helped ourselves write the report with tools,
how we automated not only generating the report but testing our software,
and where we want to go with it in the future.

:::

---

# Data collection

---

![Typeform logo](https://upload.wikimedia.org/wikipedia/commons/6/67/Typeform_Logo.svg)


::: notes

We asked around 48 questions via Typeform, our survey tool of choice for longer surveys.
Typeform also captures all response data, enabling keeping data if a user abandons.
We saw very little abandonment in the 2022 survey, something around 1% whereas it was around 5% in 2020 if my memory serves me right.
2020 had 72 questions, 2022 was 48.

:::

---

### Questions

* **"What is your base salary?"**
* "What is your expected total compensation?"
* "How satisfied are you with your compensation?"
* "In what postal code do you live?"

::: notes

The only question that required an answer was the first one after the consent form, What is your base salary?

Many other questions dealt with compensation, where people live, their titles, roles, and so on.

:::

---

CSV

::: notes

Typeform gave us a huge CSV dump that was one column per question for most questions but questions that allowed multiple answers were effectively one-hot encoded.
This felt complicated but eventually we understood it and worked it into our data cleaning and preparation steps.
We continue to hate CSV like everyone else and dreadfully wish Typeform et al. would offer something else.

:::


---

# One-time data cleaning

::: notes

We engaged in very little one-time cleaning, where we modified the stored version of our data.
We chose instead to have a data preparation step that filtered out invalid records,
handled pivoting one-hot encoded columns to lists,
and spat out a parquet file for the data analysis code to consume.
This data preparation step started out in pandas but eventually moved to Polars -- more on that later.

:::

---

# Base analysis workflow

---

![Jupyter logo](https://upload.wikimedia.org/wikipedia/commons/3/38/Jupyter_logo.svg)

::: notes

We chose Jupyter notebooks as our development and runtime tool of choice.
It was my first time "using notebooks in production" ever and I think I recall Alex saying he's allowing it out of expedition only.
I found developing directly in Jupyter to be cumbersome.
It wasn't until I used VS Code's notebook mode that I became far more productive, even as a daily IntelliJ user.

:::

---

* Programming with Python
* Dataframes with pandas
* Graphs with Plotly

---

## DataFrame programming

---

![pandas logo](https://pandas.pydata.org/static/img/pandas.svg)

::: notes

We started on pandas, because we had to start somewhere so we started with something familiar.
Alex stubbed out much of the first pass.
I found myself fighting the pandas API in my lack of experience with it despite plenty of familiarity with Spark.

:::

---

### Switch

::: notes

That Spark familiarity had me briefly considering moving to Spark,
but then Alex heard of Polars about the same time that I did and he decided to switch with my full support.

:::

---

### Why switch?

---

* Eager evaluation by default
* Slow evaulation in general
* Pythonic syntax obtuse for non-Pythonistas

::: notes

I don't have any stats saved, but I recall that our pandas implementation with only about 20 graphics was taking on the order of minutes to run the graph generation code.
This was rougher on my laptop, which is not the high-end gaming rig I have at home or that Alex carried with him as a laptop.
Given Alex's desire to learn something new and mine to use a friendlier API, we switched.

:::

---

![Polars logo](https://raw.githubusercontent.com/pola-rs/polars-static/master/logos/polars-logo-dark.svg)

::: notes

It wasn't a wholesale switch.
Alex rejiggered some new base methods in our analysis framework to return Polars Dataframes
and we set about building all new graphics on top of that module. 

:::

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
* Completely different API from Pandas
* New to us

---

## So let's learn

---

## Polars vs `X`

TL;DR Best tool for single-machine data

https://pola-rs.github.io/polars-book/user-guide/misc/alternatives/

---

# Real world examples

---

```python
#pandas
def wilkinsburg_active_party_voters() -> pd.DataFrame:
  df = pd.read_csv(voter_data_path, sep="\t", header=0)
  df = df[df["MuniCode"] == WILKINSBURG_MUNICODE]
  df = df[pandas.to_datetime(df["Last_Date_Voted"]) >
    pandas.to_datetime(start_of_active)]
  return df[df["Political_Party"]
      == party_shortcode.value]
```

---

```python
# polars
def wilkinsburg_active_party_voters() -> pl.DataFrame
  all_voters = pl.scan_csv(
    voter_data_path, has_header=True, sep="\t", parse_dates=False)
  return all_voters
    .filter(pl.col("MuniCode") == WILKINSBURG_MUNICODE)
    .filter(pl.col("Last_Date_Voted") > start_of_active)
    .filter(pl.col("Political_Party") == party_shortcode.value)
    .select(["Name","StreetAddress"])
    .collect()
```

---

```graphviz
digraph G {

  start -> df0;
  start -> df1;
  df0 -> df0a;
  df0 -> df0b;
  df0 -> df0c;
  df1 -> df1a;
  df1 -> df1b;

  start [shape=Mdiamond, label="read_data()"];
}
```

::: notes

The structure of our notebooks' cells enabled us to call Polars methods and then call `to_pandas()` when needed,
which was generally when we handed a dataframe to Plotly -- it didn't yet understand Polars objects.

:::

---

## CODE TOUR

---

# Tooling for writers

* TODO finder
* Graphic locator
* Graphic use checker

---

# CI/CD

* Gitlab CI
* papermill for running notebooks
* parallel execution
* pandoc for building PDF

---

# Future work

* Refactor pipeline
  * Build more standard library functions
  * Standardize more appearance functions
* Completely eliminate pandas
* More graphs
   * Library of graphs given data inputs

---

[`codeandsupply.co/survey`](https://codeandsupply.co/survey)

We need your data and your financial support!

::: notes

Go download the report now!

If you're interested in funding a serious sponsorship to make this happen in 2024, please talk to me as soon as possible.
One of our core team members is currently looking for work and I'd love to hire them full-time to work on the survey but
Code & Supply can barely keep the lights on at our co-working space let alone fund a data science team.

:::

---

FIN

---

# See also

* [Cheatsheet for Pandas to Polars](https://www.rhosignal.com/posts/polars-pandas-cheatsheet/)
* [Polars Crash Course: Python's Library of Big Data Analytics](https://www.youtube.com/watch?v=aiHSMYvoqYE)
* [Allegheny County Voter Registration Analysis](https://github.com/colindean/allegheny_voter_reg_analysis)
