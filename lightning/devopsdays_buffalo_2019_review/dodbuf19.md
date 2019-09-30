---
marp: true
title: devopsdays Buffalo 2019 Notes
description: Colin Dean's notes from #devopsdaysbuf 2019
theme: uncover
paginate: true
_paginate: false
---

# devopsdays Buffalo 2019

Distillation of notes by Colin Dean

![devopsdays buffalo logo](devopsdays_buffalo_logo.jpg)

---

# Modern Continuous Delivery

Ken Mugrage - @kmugrage - ThoughtWorks

* If two services are interlocked, e.g. `1.2` of X and `1.4` of Y, it's **not a microservice**.
* Value *products* over *projects* – this is DevOps.
* If you have a DevOps team, you're doing it wrong, but you know this already.

---

# Modern Continuous Delivery

Canary deployments should not fail on technical problems only.

They should fail on business metrics failures, too.

This means that you need to know and collect these measurements!

---

# How to Run Smarter in Production: Getting Started with SRE

Jennifer Petoff - @jennski - Google (co-author of SRE book)

`class SRE implements DevOps` – SRE is a set of practices

1. SRE needs Service Level Objectives (SLO) with consequences
2. SRE must have time to make tomorrow better than today
3. SRE must share responsibility & regulate their own workload.
4. SRE must embrace blamelessness & recognize failure is opportunity to improve.

---

# How to Run Smarter in Production: Getting Started with SRE

## Error budget

Gap between 100% uptime and SLO

When under SLO, policy kicks in:

1. New new features
2. Post-mortems only
3. SD + SRE daily meetings

---

# How to Run Smarter in Production: Getting Started with SRE

SRE isn't "responsible for production"

1. Scarce resource by design.
2. Cannot be overloaded.
3. Must be able to push backpressure

---

# How to Run Smarter in Production: Getting Started with SRE

If you can write it in a playbook, it can be `scripted`.

Firing someone as a result of an outage is an anti-pattern.

That's a blamefulness culture. No one wants to work in that.

---

# Tech Lives Matter; Hands Up, Don't Reboot

Stacey Jenkins

Worst thing for someone with psychological issues, temporary or permanent, is isolation: solitary confinement = worsening the problem.

---

# Walking a Mile in your Users' Shoes

Jamey Hampton - @jameybash

* When we build apps, we _think_ we know what's intuitive.
* Empathy flows both ways - that's the basis of `#hugops`

---

# Walking a Mile in your Users' Shoes

Wildly different set of planned challenges when developing app for sexual abuse reporting for an African country.

Conceived: No Wifi, problems with chain of custody of evidence and info
Real: Lack of resources like electricity, inexperienced userbase unfamiliar with interface basics, language barriers, no tech support, trust issues with tech and people

---

# Walking a Mile in your Users' Shoes

**Accessibility isn't an edge case!**

Devs are the edge case! We need to learn peoples' needs.

Predicting pain points is hard but necessary. Do research!

---

# Continuous Improvement: DevOps and Mental Illness

Aaron Aldritch - @crazyzeigh

https://osmihelp.org

How to deal with Wall of Awful

1. Build a door
2. Climb the wall every time
3. Build handholds on the way up one time

---

# Continuous Improvement: DevOps and Mental Illness

Sorry, your API is open and you can't control how and when others access the buggy parts.

Root Cause Analysis isn't worthwhile. Understand the contributing factors.

---

# Continuous Improvement: DevOps and Mental Illness

**Your performance is not your value.**

Be blame-aware but not blameless: accept failure, forgive yourself, and move on.

---

# Argue Better with Active Listening

Waldo Grunenwald - @gwaldo

Use a token, like a talking stick.

1. A: State problem, pass the token.
2. B: Restate for confirmation, pass the token.
3. A: Confirm understanding or clarify, pass the token.
4. B: (goto #2 until understanding confirmed)
5. B: Respond, pass the token.
6. A: (go to #2, reversing roles)
7. Continue until you're on the same page.

---

# Argue Better with Active Listening

This is slow but that's a feature. Focus on listening.

* Avoid "always" and "never".
* Avoid generalizations:
    * [N] You are a slob
    * [Y] You don't clean up

---

… skip a few short talks or talks light on notes …

---

# DevOps in Politics

Nell Shamrell-Harrington - @nellshamrell

**My favorite talk of the conference**

* Every company is a software company ERGO
* Every political campaign is a software company

---

# DevOps in Politics

Tech changes and moves on between elections.

What works 2-4 years ago is out of fashion or might not even build.

Principles remain the same regardless of evolution: tools aren't DevOps.

---

# DevOps in Politics

Success of campaign is measures in _votes_, just as business success is measured in money.

Candidates build **on** or **in spite of** current direction.

Vote = heart + mind + motivation

---

# DevOps in Politics

Speed is critical - first mover advantage

Choose the _right_ automation to enable speed and accuracy - automation really helps volunteers

The right automation should **enable human connection**, not replace it.

Robocalls do not make personal connections. Personal connections turn into votes.

---

# DevOps in Politics

Being _right_ is irrelevant when you don't have the votes.

Let go of being _right_ and meet people where they are.

Call. Listen first. Then pitch.

Carrying forward what you've learned is harder but more effective.

---

# Scaling Kubernetes

Ralph Bankston - @ralphbankston

You can't drop a monolith into Kubernetes and expect it to work.

* Lack of resources
* No monitoring
* No observability

These are things that must be build in to accomodate environment.

---

# To Comment or Not to Comment? Data-driven look at conflicting attitudes towards commenting

Veronica Hanus - @veronica_hanus

Comments are learner's documentation. You are the learner, even when you wrote the documentation.

> Refactoring shouldn't be this self-care activity that feels akin to a bubble bath.

--- 

# To Comment or Not to Comment?

> Repos don't contain just software, they contain the understanding and modeling of problems.

~ Jono Bacon

Support learners where they are and _gently_ point them into the future.

---

# Production as an Experiment Lab

Ramin Keene - @rmn

Testing in Production means extending the SDLC beyond release

* "Works on my machine!" - dev env
* "Works on our machine" - staging

Retrofitting prod monitoring to staging is wasted effort

---

# Production as an Experiment Lab

**Progressive Delivery** - CD w/ control of blast radius

* Feature flags
* A/B testing
* Canary requests

---

# Production as an Experiment Lab

## Shift from _correctness_ to _safety_

---

# Disaster Recovery is just a Surprise Migration

James Hunt - @iamjameshunt

> Data backups are indistinguishable from time travel

> If I had a time machine, I would not need backups.

---

… a few others snipped for few notes

---

![devopsdays buffalo logo](devopsdays_buffalo_logo.jpg)
