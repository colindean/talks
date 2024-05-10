# `make python devex` Submissions

## GitHub Universe 2024

### Title

make python devex: Towards Red-Green-Refactor in 1 Command with an Old Tool

### Abstract

Getting productive with a Python codebase, especially when unfamiliar with the ecosystem or setting up a new workstation for the first time, can be daunting. Building a cohesive strategy with widely available tooling shortens the time-to-productivity for new contributors to projects internal and open-source, demonstrating that the maintainers care about onboarding and the developer experience. I'll introduce how my team solved this problem using a nearly 50-year-old program and push the audience toward better developer experiences, starting at the greatest common denominator of tooling.

### Detailed outline

At a high level, I'll discuss the pains I've experienced and observed in the last approximately three years as an experienced developer working in Python for the first time since 2005. I'll also discuss barriers to productivity in a Python codebase and how I've overcome them using a venerable tool: Make.

When I moved onto an AI/ML team using Python, I found dramatic inconsistencies in how our developers approached the codebases and configured their working environment. The developer experience was Wild West, and the codebase quality reflected misaligned values and siloed thoughts of How It Should Be Done.

This presentation will have code snippets on slides, and a full working example is already available at https://github.com/target/make-python-devex with a companion article at https://tech.target.com/blog/make-python-devex. The slides are available at https://github.com/colindean/talks/tree/master/make_python_devex (or, really, the source for them – if accepted, there will be a major revision).

This pattern is growing in popularity inside our company as more teams realize how streamlined the Python developer experience can be with some opinionated, automated developer experience tooling. I don't have case studies of these experiences, only anecdotes and multiple requests per week for how a new team can use the pattern.

Ultimately, the audience will walk away with a newfound appreciation for Make, a solid understanding of why a Makefile with at least five common tasks ought to be in every code repo, why installing Python is not straightforward, why choosing particular tooling eliminates work and entropy, and even if the user still (illogically) hates Make, they'll come away with a new framework for thinking about how to expedite onboarding so contributors can be productive quickly with as little environment setup as possible while maximizing the utility of their workstation hardware.


**Key Takeaway 1:**
Grok why all codebases should have a Makefile with at least five tasks: deps, check, test, build, and help.

**Key Takeaway 2:**
Understand why installing Python can be so difficult and why choosing a uniform way accelerates development.

**Key Takeaway 3:**
Come away with immediately actionable ways to dramatically improve onboarding for internal and open-source projects

## PyCon US 2024 :no_entry:

_Same text as [PyOhio 2022](#pyohio-2022)_

## Codemash 2024 :no_entry:

_Same text as [PyOhio 2022](#pyohio-2022)_

## PyOhio 2022 :medal_sports:

[Presented]([https://www.pyohio.org/2022/program/talks/make-python-deps-check-test-build-towards-clone-to-red-green-refactor-in-one-command](https://web.archive.org/web/20220729205659/https://www.pyohio.org/2022/program/talks/make-python-devex-towards-clone-to-red-green-refactor-in-one-command-with-a-45-year-old-tool)) [:movie_camera:](https://www.youtube.com/watch?v=WTsiO3brQwE)

### Title

`make python devex`: Towards Clone to Red-Green-Refactor in One Command with a 45+-Year-Old Tool

(Submitted as "`make python deps check test build`: Towards Clone to Red-Green-Refactor in One Command" but changed in production)

### Description

Getting productive with a Python codebase, especially when you're unfamiliar with the ecosystem, can be daunting. Building a cohesive strategy with widely-available tooling shortens the time-to-productivity for new contributors to projects internal and open-source, demonstrating that the maintainers care about onboarding and the developer experience. I'll give an introduction to how my team solved this problem using a 46-year-old program and push the audience in a direction toward better developer experiences starting at the greatest common denominator of tooling.

### Notes

This talk will be a condensation of a ~25 minute talk I gave internally that covers how we set up Make and Homebrew to configure a Python development environment with pyenv and poetry. I'll omit much of the in-depth coverage of Make and probably focus on the intent and outcomes more than the actual tech used.

### Talk Objective

By the end of the 10 minutes, the most important takeaway will be the idea that all projects should have a Makefile with five tasks: deps, check, test, build, and help.

## Techbash 2022 - Not Accepted

### Title

make python deps check test build: Towards clone to red-green-refactor in one command

### Description

Getting productive with a Python codebase, especially when you're unfamiliar with the ecosystem, can be daunting. Building a cohesive strategy with widely-available tooling shortens the time-to-productivity for new contributors to projects internal and open-source, demonstrating that the maintains care about onboarding and the developer experience. Learn how my team goes from zero to test-driven development of our Python codebases in (nearly) one command.

### Notes

In this talk, I'll review the basics of the venerable make ecosystem and some supporting cast members useful for automating development environment setup on a per-project basis. We'll install some tools that install Python and set up tooling that makes IDEs and CLIs happy, too. Some concepts are modeled after niceties found in other modern language ecosystems and build tools. We've deployed this system on more than a half-dozen codebases at the time of talk submission and will likely exceed two dozen before April 2022.

This presentation is aimed at folks who want to make it easier to onboard new contributors to their Python codebases by exploring environment setup automation approaching the much-sought "one command" gold standard by embracing the idea that every project should have a Makefile that has deps, check, test, and build commands regardless of the underlying ecosystem and should "just work" after installing dependencies with make deps.

Some familiarity with Make would accelerate learning, but I'm anticipating covering enough of it that folks who haven't seen it before should be OK. This will be most valuable for folks who have experienced the pain of not really knowing the Python ecosystem and how to set up the common tools, esp. when coming from an ecosystem where there is "the one tool" that does everything.

TSWBAT construct a basic Makefile, add customization to install Python(s), run checks and tests, and build an artifact.

**Outline**

* 5 min - intro(self)
* 10 min - intro(make)
* 10 min - setting up make for Python
* 10 min - setting up common tasks
* 10 min - setting up uncommon tasks
* 5 min - issuing challenges
* 10 min - wiggle room + Q&A

## PyCon US 2022 - Not Accepted

### Title

Make deps check test build: Towards clone to red-green-refactor in one command

### Abstract

Getting productive with a Python codebase, especially when you're unfamiliar with the ecosystem, can be daunting. Building a cohesive strategy with widely-available tooling shortens the time-to-productivity for new contributors to projects internal and open-source, demonstrating that the maintains care about onboarding and the developer experience. Learn how my team goes from zero to test-driven development of our Python codebases in (nearly) one command.

### Description

In this talk, I'll review the basics of the venerable `make` ecosystem and some supporting cast members useful for automating development environment setup on a per-project basis. We'll install some tools that install Python and set up tooling that makes IDEs and CLIs happy, too. Some concepts are modeled after niceties found in other modern language ecosystems and build tools. We've deployed this system on more than a half-dozen codebases at the time of talk submission and will likely exceed two dozen before April 2022.

### Audience

This presentation is aimed at folks who want to make it easier to onboard new contributors to their Python codebases by exploring environment setup automation approaching the much-sought "one command" gold standard by embracing the idea that every project should have a Makefile that has `deps`, `check`, `test`, and `build` commands regardless of the underlying ecosystem and should "just work" after installing dependencies with `make deps`.

Some familiarity with Make would accelerate learning, but I'm anticipating covering enough of it that folks who haven't seen it before should be OK. This will be most valuable for folks who have experienced the pain of not really knowing the Python ecosystem and how to set up the common tools, esp. when coming from an ecosystem where there is "the one tool" that does everything.

TSWBAT construct a basic Makefile, add customization to install Python(s), run checks and tests, and build an artifact.

### Outline

* 3 min - intro(self)
* 10 min - intro(make)
* 10 min - setting up make for Python
* 5 min - setting up common tasks
* 2 min - issuing challenges

