---
####
## NOTA BENE:
## :::Notes are not shown on slides, only on presenter view.
####
title: >
  Meaningful ticket labeling
  with SEI classification
author: '@colindean'
date: November 30, 2021
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
totalTime: 1800
---

# I am Colin Dean

Software Engineer & Community Builder

---

# Classification

Label your tickets

_(in JIRA, GitHub Issues, etc.)_

---

# SEI

Software Engineering Institute

at

Carnegie Mellon University

---

![Software Architecture in Practice 3rd Edition cover](software_architecture_in_practice_cover_3rdEd.jpg)
<!-- swap after May 2022 -->
<!--![Software Architecture in Practice 4th Edition cover](software_architecture_in_practice_cover_4thEd.jpg)-->

by Bass, Clements, Kazman

ISBN-13: 978-0321815736

---

# Quadrants

![SEI Classification Quadrants diagram](SEI_Issue_Classifcation_Quadrants.svg)

---

## User Story

Positive value & User visible

---

### User Story examples

* Modify user interface
* Modify model algorithm
* Conduct user research

---

## Architectural Story

Positive value & User invisible

---

### Arch. Story examples

* Build backend service or pipeline
* Implement new algorithm
*

_(best practices as of implementation)_

---

## Defect

Negative value & User visible

---

### Defect examples

* Current behavior produces result developer didn't expect
* Fix environment outage
* Fix security problems

---

## Technical Debt

Negative value & User invisible

---

### Tech. Debt examples

* Improve performance
* Update dependencies
* Automate a manual process

_(moving toward best practices)_

---

![A notebook with no corners](https://2.bp.blogspot.com/-4DXMlnobQsw/UcBhu1LO7yI/AAAAAAAAA1w/yZoNcgR0ggc/s1600/DSC_0301.JPG){height=30%}\

> Collecting the corners cut in a jar to reattach them later

---

# Tracking

Create colored labels:

`user-story`, `arch-story`, `defect`, `techdebt`

Require at least one of them.

---

# Optional additional classification

::: notes

I've got back and forth on these, and usually end up enacting at least one of these for
when something doesn't quite fit well within these four quadrants.

:::

---

## Documentation

* Documenting team procedures
*

Beware: product documentation falls into the four quadrants categories!

---

## Discussion or Question

* Decision meetings
* Keeping debates in ticketing
* Separating work product from the process used to determine what work to do

---

### Architecture Decision Records

* Context
* Decision
* Status
* Consequences

<https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions>

<https://github.com/npryce/adr-tools>

---

ADRs are a product, too…

…and probably techdebt or archstory

---

# Consuming the classification

---

## Use reports or saved searches

* Lots of red = work on defects first
* Lots of black = pay down debt or prune backlog for outdated ideas
* Lots of yellow = measure value of backend improvements
* Lots of green = users may need to experience changes

---

# TL;DR

Label your tickets/issues

`user-story`, `arch-story`, `defect`, `techdebt`

Colorize to make them standout

Documentation is a part of the product

Decisions should produce documentation, too
