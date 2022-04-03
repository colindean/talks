---
title: "make python devex"
subtitle: "How a 45+ year old tool can MAKE Python developer experience easier"
author:
  - Colin Dean
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
totalTime: 900
include-after: |
    <link href="deps/asciinema-player/asciinema-player.css" type="text/css" rel="stylesheet"/>
    <script src="deps/asciinema-player/asciinema-player.js" type="application/javascript"></script>
title-slide-attributes:
    data-background-size: "10%"
    data-background-position: "50% 100%"


---

## Agenda

* Problem: Getting things right is hard
* Diagnosis: project definitions leave too much undefined
* Remedy: Standardized Makefile for <i class="fab fa-python"></i> Python dev

---

Please save your questions until the end.

<small>Grab a piece of paper so you can write them down.</small>

::: notes

COLIN:

Please save your questions until the end.
We have a lot to cover and need to keep pace to include all of it.
Please do shout out if you can't see something, though, or another technical
problem with the presentation occurs.

:::

---

## Problems

---

* What Python version should I use for development?
* What Python version will be used for production?
* How do I install Python at a specific version?
* How do I ensure that my project works on a diverse development and production
    installation base?

---

## Diagnosis

---

### Inconsistent Python versions and installation source

* System? Homebrew? Pyenv? Conda? …MacPorts? …Nix?
* Tech Debt Risk: dependencies stop supporting older versions
  * Python [3.6][py36] EOL
  * Python [3.7][py37] & [3.8][py38] in security-only phase
    * EOLs June 2023, October 2024
  * Python [3.9][py39] final non-security release May 2022

[py36]: https://www.python.org/dev/peps/pep-0494/
[py37]: https://www.python.org/dev/peps/pep-0537/
[py38]: https://www.python.org/dev/peps/pep-0569/
[py39]: https://www.python.org/dev/peps/pep-0596/

::: notes

COLIN:

We don't have clear single-source installation of our Pythons
and we don't use versions consistently.

Using system-provided Python is just wrong.
Using Homebrew Python is hitting a moving target.
Using PyEnv is probably most correct outside of Conda,
which [PythonSpeed reports is the most performant][faster-python],
but both require knowledge of the tool and some setup.
I'm sure there are still MacPorts holdouts in the audience
and the rumblings of the Nix horde can be heard in the
distance.

It's OK if you don't know what any of these are because
this developer experience in the end _should_ abstract them away
and do so on a per-repository basis with conventions established
across teams.

:::

[faster-python]: https://pythonspeed.com/articles/faster-python/

---

### No one can remember `pip`/`poetry` commands

* …or wants to type them,
* …or wants to use the correct, full-length command,
* and neither enables build actions outside of their domain.

::: notes

COLIN:

pip is a venerable tool and, under the hood, even poetry uses pip
but pip was built in a time outside of configuration file conventions.
The new PEP standard pyproject.toml really helps a lot but it takes
some steps to get to development cycle usability.

All of those steps are automatable. If a repo is not using poetry, or
needs to use pip in an intermediary step, then it's best to script
these actions instead of executing them manually having listed them in
README.

:::

---

### Scripts are hard to manage and scale

* A collection of scripts that gets copied around
* Specialization for the repo difficult once shared
* Documentation often left to READMEs, not tooling

::: notes

COLIN:

We can write a bunch of scripts for this automation, but
eventually, any sufficiently advanced system of one-off scripts
eventually reimplements proper DAG — directed acyclic graph — build
tool, so let's just use one from the start!

:::

---

## Remedy

--

### Standardized `Makefile` for Python + Shell dev

* Use Make, which is widely available.
* Minimize project-specific customizations in order to enable copy-paste to new projects.
* Use `make` tasks in CI builds to mirror dev environment.

::: notes

COLIN:

I've long used a minimal Make setup in every ecosystem to provide
a common onboarding experience, be it a Java project using maven or
gradle, an SBT project for Scala, or projects in Ruby, Rust, Groovy,
or a variety of other ecosystems I've worked in, all with varying
maturity of their build system and dependency retrieval tooling.

Make is widely available and built into macOS, or at least enough of
a standard Make installation to be useful. We can build a Makefile,
the configuration file for the program, that we can pretty easily share
safely across most Python projects. Lastly, install of invoking
particular tools specifically in CI, we can execute Make tasks
and allow that repo to have its own configuration for running.
That way, we can strike the right balance of convention and configuration.

:::

---

### Basic task runner

```Makefile
task: dependency-task ## Helpful explanation of the task
↦   command --that does --something
```

::: notes

COLIN:

This is the most basic usage of make.
With this, you can run `make task` and `command` will run.
It will run every time you invoke it.
You may see `.PHONY` near this: that simply declares that the task
will never produce a file and should be executed every time it is
encountered in the task DAG.

:::

---

### Produce files

```Makefile
build: output.txt output.pdf ## Build the things

output.txt: input.txt
↦   command --that produces --something $@ --from $<
```

`make build` will only run the `output.txt` task when:

* `output.txt` doesn't exist
* `input.txt` has changed since the last time the task was run

<small>
_↦ = tab_
</small>

::: notes

COLIN:

The other basic use case for Make is to produce files.
Originally, Make was intended to compile source files
and is still widely used in C and C++ projects for that purpose.
I've even used Make to compile Java projects long ago!

In this example, you can see that the output file has a task that
dependes on an input file. That input file could have a task of its
own, but Make can figure that out pretty well.
In this invocation, I've used some Make variables dereferencing
the output and input, respectively.


:::

---

https://github.com/colindean/plaintextaccounting_workshop

::: notes

COLIN:

I'm not going to do a full Make tutorial here.
If yinz are interested in such, I can do up something on it,
but Make is more than 45 years old so I think you can find
some useful content on it.

One such work is the automation chapter of a self-guided workshop
I built in 2020 about Plaintext Accounting.
That chapter goes into Make in nearly the exact same style as I use
in many of my Python projects.

:::

---

# Why Not X?

::: wordcloud

* `CMake`
* `Gradle`
* `SBT`
* `XMake`
* `Just`
* `OK`
* `Meson`
* `Brazil`
* `npm`
* `Maven`
* `Ant`
* `Rake`
* `scons`
* `ninja`
* `rad`

:::

::: notes

COLIN:

I've used probably two-thirds of these, and they're great for a
particular ecosystem, but literally none beat the ubiquity of Make.

When developer experience is the primary focus, using what the
developer already has available to bootstrap the rest is very important.
It's very easy to install one of the above tools should a codebase
necessitate it, but having a Makefile that bootstraps that installation
is nigh unavoidable.

:::

---

`make deps check test build`

::: notes

COLIN:

A principal engineer at Heroku many years ago instituted a policy
of having a Makefile with these four steps in every codebase,
even if all deps did was to install another build tool and
all the other three did was to run that build tool's similarly-named tasks.

This had the effect of ensuring a clean onboarding process for anyone
who may come along working on a project. It was a great success
for developers unfamiliar with a particular ecosystem's tools and
got the productive nearly immediately: clone the repo, then run make.
Wait a few minutes. Then you're in a red-green-refactor test-driven
development cycle with tooling virtually guaranteed to work.

This inclusivity is a key part of a healthy engineering culture.

:::

---

&lt;/rant>


::: notes

That got a little ranty, but I wanted to clarify the reason I'm
so adamant about developer experience, and this particular way
of realizing it.

Talk to me if you think there's a better way.
I've got strong opinions weakly held.

:::

---

snap back to reality

<small>
_(ope, there goes gravity)_
</small>

---

## Our Particular Setup

---

### With online help!

```
$ make help

Usage:
  make

Utility
  help             Display this help
  version-python   Echos the version of Python in use

Setup
  deps             Installs all dependencies
  deps-brew        Installs dev dependencies from Homebrew
  deps-py          Installs Python dev and runtime deps

```

---

```
Testing
  test             Runs tests

Building and Publishing
  build            Runs a build
  publish          Publish a build to the configured repo
  deps-py-update   Update Poetry deps

```

---

```
Code Quality
  check            Runs linters and other important tools
  check-py         Checks only Python files
  check-py-flake8  Runs flake8 linter
  check-py-black   Runs black in check mode (no changes)
  check-py-mypy    Runs mypy
  check-sh         Run shellcheck on shell scripts
  fix-sh           Runs shellcheck and applies suggestions
  format-py        Runs black, makes changes where necessary
  format-shell     Runs shfmt on all shell scripts and tests
```

* _coming soon_

---

## Challenges

---

### Supporting multiarchitecture

* macOS x86_64 **&** arm64 for dev
* Linux x86_64 for prod
* Python ecosystem mixed readiness

<small>
_Apple Silicon == M1 == arm64_
</small>

::: notes

COLIN:

As M1 Macs roll out to developers, there's a small but necessary
challenge to support both Intel and ARM architectures.
I'd hoped that enough time had passed for the Python ecosystem to
have fully shipped binaries for ARM Macs, but that's simply not yet
come to pass. I've found that as of Python 3.10 in mid 2022,
I have to compile some dependencies from source,
because, in a lot of cases, Python is merely a nice wrapper around
a library written in a compiled language like C, C++, or Rust.

:::

---

```Makefile
FLAGS =
ifeq ($(shell uname -m), arm64)
ifeq ($(shell uname -s), Darwin)
HDF5_DIR = $(shell brew --prefix --installed hdf5)
LIBS = odbc libiodbc
F_LDFLAGS = LDFLAGS="$(shell pkg-config --libs $(LIBS))"
F_CPPFLAGS = CPPFLAGS="$(shell pkg-config --cflags $(LIBS))"
FLAGS = $(F_LDFLAGS) $(F_CPPFLAGS) HDF5_DIR=$(HDF5_DIR)
endif
endif

POETRY = $(FLAGS) poetry
```

::: notes

COLIN:

This is an example of that. You'll probably see this in just about
every Makefile that necessitates setting compliation flags for
poetry to use. Here, I'm referencing dependencies needed by
pyodbc and hdf5, which for the foreseeable future necessitate
compilation from source to install on an ARM64 Mac.

Note that `uname -m` outputs the microarchiture, which is arm64 and
that `uname -s` outputs the system name, which is Darwin, the actual
system name for macOS.
The rest of the commands inside this block run Homebrew and a
standard tool called `pkg-config` to get the location of the libraries
that Homebrew installed. It'd be great if hdf5 followed `pkg-config`
conventions, but it doesn't so here we are.

:::

---

`macOS arm64`

```shell
LDFLAGS="-L/opt/homebrew/Cellar/unixodbc/lib -lodbc -libiodbc" \
CPPFLAGS="-I/opt/homebrew/Cellar/unixodbc/include" \
HDF5_DIR=/opt/homebrew/Cellar/hdf5
poetry
```

`macOS x86_64` || `Linux *`

```shell
poetry
```

::: notes

COLIN:

This is what the poetry command will look like in various scenarios.

:::

---

::: demo

<asciinema-player
src="demo.cast"
idle-time-limit="2"
speed="2"
poster="data:text/plain,Click the |> button to play the demo!"
title="Demo"></asciinema-player>

:::

---

# Future work for my projects

---

## Adding more to Makefile

* Streamlined Python installation
* More checks
* Test configuration
  * might move to pyproject.toml, pytest.ini, etc.
* Release process
  * Treat Python code as apps/libraries with build artifacts

---

# FIN {.r-fit-text background-image="" background-size="10%"
background-position="50% 100%" }

::: notes

COLIN:

That's it for our presentation.

:::

---

### Colophon

* Pandoc rendering
* Reveal.js presentation
* Asciinema CLI playback

::: notes

COLIN:

A quick slide on how the presentation was made,
big shouts to Asciinema on this particular project
for enabling us to show CLI activity at high speed!

:::

---

# Questions?

::: notes

COLIN:

With that, we'll take your questions.
What's on your mind?

:::
