---
title: "make python devex"
subtitle: "How a 45+ year old tool can MAKE Python developer experience easier"
author:
  - _Colin Dean, Lead Engineer_
  - "`@colindean@mastodon.social`"
theme: white
css: target.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
totalTime: 1800
include-after: |
    <link href="deps/asciinema-player/asciinema-player.css" type="text/css" rel="stylesheet"/>
    <script src="deps/asciinema-player/asciinema-player.js" type="application/javascript"></script>
# title-slide-attributes:
#    data-background-image: "targettech.png"
#    data-background-size: "10%"
#    data-background-position: "50% 100%"

---

# Who is this guy?

::: biopic
![Colin Dean, who wears many hats](deps/colindean-tophat.jpg/197224)
:::

Software engineer and community builder since 2002

::: notes

I'm Colin Dean and I'm [[current position and team]].

I've been a developer for more than 20 years.
I started out in PHP before moving to Ruby, Java, and a proprietary language for
work, then spent many years working in Scala before picking up some Rust and
Groovy. I came back to Scala for a while then now find myself working in
Python since January 2021.

:::

---

## {background-image="pittsburgh_on_a_map.svg" background-size="contain" background-color="#6699ff"}

::: notes

I'm here from Pittsburgh, a metropolitan area of around two and a half million people
in northern Appalachia in an area of the United States we call the Rust Belt.

:::

---

# Developer Experience

::: notes

I focus a lot on developer experience.
I believe that good tools and good practices enable building good software.

:::

---

# Agenda

|   |   |
|---|---|
|Problem  |Getting <i class="fab fa-python"></i> Python developer experience right is hard
|Diagnosis|<i class="fab fa-python"></i> Python project definitions leave too much undefined
|Remedy   |Standardized Makefile for <i class="fab fa-python"></i> Python dev

::: notes

I'm a huge fan of addressing problems through a problem-diagnosis-remedy
approach consistent with medical and other scientific approaches to problem
solving. If you search for "Colin Dean Problem Diagnosis Remedy" on the web,
you'll find my writings on it.

At a high-level, I'll be talking about the pains I experienced and have
observed in the last approximately four years as an experienced developer
working in Python for the first time since 2005.
I'll talk about barriers to productivity in a Python codebase and how I've
overcome them using a venerable tool: Make.

:::

---

Please send me your questions!


<!--
Please save your questions until the end.
-->

<small>Grab a piece of paper so you can write them down.</small>

::: notes

COLIN:

This solution is in active development, so some things might have changed
since I last revised these remarks.
I'd love feedback and suggested improvements.

I'm filling in for someone who was unable to make it today,
so some of these slides or my notes may have some outdated information.

<!--
Please save your questions until the end.
We have a lot to cover and need to keep pace to include all of it.
Please do shout out if you can't see something, though, or another technical
problem with the presentation occurs.
-->

:::

---

# Open thoughts

![`tech.target.com/blog/make-python-devex`](ttblog_qrcode.svg){width=35%}

::: notes

This talk inspired the LONGEST POST EVER on the blog of my employer,
the 37th largest company in the US and the 8th largest retailer.

:::


---

# Open source

![`github.com/target/make-python-devex`](gh_mpd_qrcode.svg){width=35%}

::: notes

It also earned a coveted open source release
so I thank Target for doing open source stuff,
including its Open Source Fund, now in its second
year of funding open source projects.

:::

---

# Problems

---

* What Python version should I use for development?
* What Python version will be used for production?
* How do I install Python at a specific version?
* How do I ensure that my project works on a diverse development
  _and_ production installation base?
* How do I install dependencies?

::: notes

COLIN:

Working with my teams of engineers and data scientists, we encountered these
problems. [[READ LIST]]

If you're getting a tingling feeling that all of this could be written down
somewhere, you're getting the same feeling I felt within the first week of
working in Python for the first time in more than 15 years.

:::

---

## Which Python?

::: notes

This largely boils down to this particular question.

:::

---

# Diagnosis

---

### System Python unreliable, inflexible

```bash
$ date && sw_vers && uname -sm && /usr/bin/python3 --version
Fri May  6 12:39:51 EDT 2022
ProductName:	macOS
ProductVersion:	12.3.1
BuildVersion:	21E258
Darwin arm64
Python 3.8.9
```

::: notes

COLIN:

My team uses macOS for development and deploys to Linux.
Apple tends to keep its Python 3.x installation within
Python EOL dates but it's always a little out of date.
Apple removed system Python in macOS 12.3, as warned in 10.15 release notes.
It's still included with XCode, though.
Apple says not to rely on this and that it's for internal use only, a policy
similar to but stricter than Homebrew's,
but at least Homebrew's Python won't just disappear someday in a new XCode release.

That is, management of the system Python is
out of the user's control because it is coupled with OS and core development tool updates.

This one is a bit of a given; nearly all Python developers with a project in
production learned quickly not to use a macOS-provided Python.

:::

---

### Inconsistent Installation Methods and Source

* ~~Operating System-provided packaging?~~
* Homebrew?
* **Pyenv? Anaconda?**
* …MacPorts? …Nix?

::: notes

COLIN:

There are a ton of ways to install and use Python.
My team was consistently bringing their own Python, installing it however they
felt was most appropriate.

Using system-provided Python is unreliable, because it'll change and it'll go away
eventually.
Using Homebrew Python is hitting a moving target, and is inadvisable,
although this problem is lessened when using formulae for specific minor
versions.
Using PyEnv is probably as correct as choosing Anaconda,
which [PythonSpeed reports is the most performant][faster-python]
for some older versions of Python,
but both require knowledge of the tool and some setup.
Using Anaconda's repositories is also not free, while conda-forge is.
Learning this can be an expensive lesson.
I'm sure there are still MacPorts holdouts in the audience
and the rumblings of the Nix horde can be heard in the
distance.

It's OK if you don't know what any of these are because
this developer experience in the end _should_ abstract them away
and do so on a per-repository basis with conventions established
across teams.

:::

---

### Inconsistent Python versions

* Tech Debt Risk: dependencies stop supporting older versions
    * Python [3.8][py37] and older, EOL
    * Python [3.9][py39] and [3.10][py310] in security-only phase
        * EOL October 2025 & 2026
    * Python [3.11][py311], [3.12][py312], 3.13 supported
        * Final non-security release in April: 2025-2027
        * EOL October: 2027-2029

[eoldate]: https://endoflife.date/python
[py36]: https://www.python.org/dev/peps/pep-0494/
[py37]: https://www.python.org/dev/peps/pep-0537/
[py38]: https://www.python.org/dev/peps/pep-0569/
[py39]: https://www.python.org/dev/peps/pep-0596/
[py310]: https://peps.python.org/pep-0619/
[py311]: https://peps.python.org/pep-0664/
[py312]: https://peps.python.org/pep-0693/


::: notes

COLIN:

We didn't have clear single-source installation of our Pythons
and we didn't use versions consistently.

While many of our projects are tied to a particular version because of a hard
requirement on our cluster, we still had unexercised freedom to choose updated
versions in other contexts, including containerized services and pipelines.

We've since moved to containerized deployments,
even for our Spark jobs.
It's lovely no longer to be stuck on Python 3.7
as we were until last year.
:::

[faster-python]: https://pythonspeed.com/articles/faster-python/

---

### No one can remember commands

* …or wants to type them
* …or wants to use the correct, full-length command
    * `poetry run pytest`
* Neither enables build actions outside of their domain

::: notes

COLIN:

pip is a venerable tool and, under the hood, even poetry used to use pip
but pip was built in a time outside of configuration file conventions.
The new PEP standard pyproject.toml really helps a lot but it takes
some steps to get to development cycle usability.
Even newer tools like hatch, pdm, and uv have
different invocations.

All of those steps are automatable. If a repo is not using poetry, or
needs to use pip in an intermediary step, then it's best to script
these actions instead of executing them manually having listed them in
README.

:::

---

### Python ecosystem may necessitate compiling with options

* Apple M1 processor, ARM64 m-arch., ca. June 2020
* `macos_{11...15}` `arm64` binary avail. growing
* Passing compiler flags is not ergonomic:

```
$ LDFLAGS="-L/opt/homebrew/Cellar/unixodbc/2.3.9_1/lib -lodbc -liodbc -liodbcinst -ldl" CPPFLAGS="-I/opt/homebrew/Cellar/unixodbc/2.3.9_1/include -I/usr/include" HDF5_DIR=/opt/homebrew/opt/hdf5 poetry install
```

::: notes

COLIN:

Pythonistas seem pretty accustomed to having packages "just work" when
installed.
Unfortunately, Apple's transition from Intel processors to its own
processors, switching from the x86_64 architecture to ARM64 in the process, is
complicating installing Python dependencies.
Approaching five years in, most projects actively developed
have released macOS ARM64 binary packages.
It's *FAR* better than it was in 2021 and a lot better than summer 2022.
With newer versions of dependencies, I rarely see
compilation.
But what I'm starting to see now as I've adopted some
legacy codebases is newer OS and Python versions
necessitating compilation because there weren't
binaries published for this now-ancient version of
a package, because the triplet didn't exist back then.
ARM64 runners are available on most CI providers now,
but that doesn't mean a project is going to publish
a point release primarily to provide binaries
for an old Python version.

As a safeguard, we have to plan for it.
A project may eventually require building some packages from the source
distribution and that requires passing arguments or environment variables to
Python packaging tools.
This is scriptable but…

:::

---

### Scripts grow hard to manage

* A collection of scripts that gets copied around
* Specialization for the repo difficult once shared
* Documentation often left to READMEs, not tooling

::: notes

COLIN:

We can write a bunch of scripts for this automation, but
eventually, any sufficiently advanced system of one-off scripts
eventually reimplements proper DAG build tool — a directed acyclic graph--
so let's just use one from the start!

:::

---

# Remedy

---

### Automate

We need a **task runner** for onboarding _and_ resync instead of _just_ better documentation.

::: notes

[[read slide]]

:::

---

### Install

1. whatever installs Python
2. Python
4. whatever installs Python dependencies' dependencies
3. whatever installs Python dependencies
5. Python dependencies' dependencies
4. Python dependencies
5. everything else needed somewhere in there

::: notes

COLIN:

So, let's install it from something else so we're not bound to the OS vendor's whim
and we're all using the same versions, the same tooling, with the possibility
for the same experience to build a common vocabulary and common procedures for
developing and debugging our code.

:::

---

### Python installation methods

```{.graphviz caption="Python installation methods"}
digraph python_installation_methods {
  rankdir=LR;
  rank=source;
  size="6,6"

  graph [fontname = "helvetica"];
  node [fontname = "helvetica", shape = square, margin = 0];
  edge [fontname = "helvetica"];

  node [label = "System\npython"]; system
  node [label = "Homebrew\n(brew)"]; brew
  node [label = "Homebrew\npython"]; brewpy
  node [label = "Homebrew\npython@3.x"]; brewpyx
  node [label = "Anaconda\n(conda)"]; conda
  node [label = "conda\npython"]; condapy
  node [label = "pyenv"]; pyenv
  node [label = "pyenv\npython"]; pyenvpy
  node [label = "asdf"]; asdf
  node [label = "asdf-python\nplugin"]; asdfpyplugin
  node [label = "asdf\npython"]; asdfpy
  node [label = "nix"]; nix
  node [label = "nix\npython"]; nixpy
  node [label = "macports"]; macports;
  node [label = "macports\npython"]; macportspy;
  node [label = "uv"]; uv;
  node [label = "uv\npython"]; uvpy;

  system;

  brew -> brewpy;
  brewpy -> brewpyx;
  brew -> brewpyx;
  brew -> conda;
  conda -> condapy;
  brew -> pyenv;
  pyenv -> pyenvpy;
  brew -> asdf;
  asdf -> asdfpyplugin;
  asdfpyplugin -> asdfpy;
  nix -> nixpy;
  macports -> macportspy;
  brew -> uv;
  uv -> uvpy;

}
```

::: notes

COLIN:

There are a ton of ways to install and use Python:
Use the system-provided Python,
install a minor version packages from Homebrew directly (with [caveats about rolling updates][brewpy]; and don't forget that a version switch is system-wide),
install from Homebrew a version manager such as pyenv or asdf that can install specific minor or patch version and easily switch per-directory,
or install from Homebrew another, specialized package manager such as Anaconda that can install optimized Python builds in an environment activated per-project or per-directory.
Some newer tools such as uv can install it, too.
For my teams 2021 through 2024, Homebrew or Conda were the go-tos, for the most part.

:::

[brewpy]: https://docs.brew.sh/Homebrew-and-Python#python-3y

---

## Again: Which Python?

"This one, and you need not care."

::: notes

So, we return to this question with a clear way forward: explicitly say which
and provide a mindless way to install it.

:::

---

![XKCD 1987](https://imgs.xkcd.com/comics/python_environment.png)

::: notes

This is such a problem that XKCD made a comic about it in 2018.

:::

---

## Homebrew + Pyenv

```{.graphviz caption="Out Python installation method"}
digraph our_method {
  rankdir=LR;
  rank=source;
  size="9,9"

  graph [fontname = "helvetica"];
  node [fontname = "helvetica", shape = square];
  edge [fontname = "helvetica"];

  node [label = "System\npython"]; system
  node [label = "Homebrew\npython"]; brewpy
  node [label = "Homebrew\npython@3.x"]; brewpyx
  node [label = "Anaconda\n(conda)"]; conda
  node [label = "conda\npython"]; condapy
  node [label = "pyenv", color = green, penwidth = 3.0]; pyenv
  node [label = "Homebrew\n(brew)", color = green]; brew
  node [label = "pyenv\npython", color = green]; pyenvpy

  system;

  brew -> brewpy;
  brewpy -> brewpyx;
  brew -> brewpyx;
  brew -> conda;
  conda -> condapy;
  brew -> pyenv;
  pyenv -> pyenvpy;

}
```

::: notes

COLIN:

I chose Pyenv at the onset because it seemed to be the lowest barrier to entry to get the
exact version of Python we needed and avoid it changing from underneath the
developer when running updates.

I allowed for the user to have Conda or Homebrew-managed Pythons active because
I didn't want to break existing setups without a clear need to do so.

Homebrew as a base requirement is safe for us as we're all on Macs or Linux.

Advancements in build tools feature to install Python automatically may alter this pattern in the future.
:::

---

### Poetry for Python dependencies and packaging

* `pyproject.toml` standardization
* Separately-managed virtualenv
* Modern dependency mgmt with locking
* Builds packages

::: notes

COLIN:

I quickly settled on Poetry, as most new Python projects at the time seemed to be gravitating
toward it or Pipenv.
It's still a great choice.
Nearly all Python tooling has committed to supporting the
now standardized pyproject dot TOML format.

Poetry's own installer smartly manages a separate virtualenv, avoiding a pesky
problem where evicting dependencies not in an app's dependency tree can break
Poetry or other similar tools.

And, of course, Poetry combines dependency management and packaging into one
smart tool. It's nearly a no-brainer.

And, of course, I am keeping a very close eye on uv.

:::

---

### Installing Poetry

```{.graphviz caption="Poetry Installation"}
digraph poetry_installation {
  rankdir=LR;
  rank=source;
  size="8,4";
  compound=true;

  graph [fontname = "helvetica"];
  node [fontname = "courier", shape = rectangle]
  edge [fontname = "helvetica"];

  node [label = "brew install pipx", color=black]; pipx
  node [label = "pipx install poetry"]; pipxpoetry
  node [label = "brew install poetry", color=red]; brewpoetry
  node [label = "conda install poetry"]; condapoetry
  node [label = "asdf plugin asdf-poetry"]; asdf
  node [label = "asdf install poetry"]; asdfpoetry
  node [label = "curl https://install.python-poetry.org | python3 -", fontname="courier", color=green, penwidth=3]; official

  subgraph cluster1 {
    label = "Unsupported";
    rank=same;
    size=10;
    brewpoetry;
    condapoetry;
    asdf -> asdfpoetry;
  }
  subgraph cluster0 {
    label = "Supported";
    rank=same;
    size=10;
    official;
    pipx -> pipxpoetry;
  }

}
```

::: notes

COLIN:

There are also a ton of ways to install Poetry.
The Poetry maintainers strongly encourage using their installer or pipx.
While it can be installed via Homebrew or via pip, upstream does not support a brewed poetry and warns that a pip-installed poetry may create version conflicts.
We have encountered this problem and hobbled poetry in the process.

The reason the Poetry maintainers want users to install with the official installer or pipx is automatic and reliable virtual environment isolation.
Poetry does not need to be installed inside a codebase's active virtual environment.
Rather, it manages it externally.
So, when we install Poetry, it uses whatever Python 3.x is available because
it's probably safe to do so.
:::

---

![Installed Poetry uses its own virtualenv and manages other virtualenvs
externally](venvs.svg)

::: notes

COLIN:

When running Poetry, it runs in its own virtualenv and creates a virtualenv for the codebase.
The user can instruct Poetry which python executable to use when creating the virtualenv.

:::

---

### Rejected Solutions

* **Containers** - too slow, IDE problems
* **Develop on cluster** - wildly slow, IDE problems
* **Rewrite in another language/eco system** - Complexity not worth considering

::: notes

COLIN:

I rejected a few commonly suggested solutions out of productivity concerns.
The ideal solution would keep development iterations as quick as possible
and encourage test-driven development to produce high quality software.

While we deploy to containers, running our
data science workloads inside of a container,
which is really just running on a virtual machine
on macOS, is just too slow.

:::

---

### Glue

::: notes

COLIN:

But I needed some glue to make all of this automated from some common tooling.
I need the greatest common denominator.
:::

---

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

<https://github.com/colindean/plaintextaccounting_workshop>

<https://makefiletutorial.com>

::: notes

COLIN:

A full Make tutorial is out of scope for this presentation.
Make is more than 45 years old so I think you can find
some useful content on it.

One such work is the automation chapter of a self-guided workshop
I built in 2020 about Plaintext Accounting.
That chapter goes into Make in nearly the exact same style as I use
in many of my Python projects.

:::

---

## Why Not X?

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

Why not something else?

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

<small><code>make help clean</code></small>

::: notes

COLIN:

A principal engineer at Heroku many years ago instituted a policy
of having a Makefile with these four steps in every codebase,
even if all deps did was to install another build tool and
all the other three did was to run that build tool's similarly-named tasks.
Some others surfaced over time that made sense, too.

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

# Our Particular Setup

---

### With online help!

```
$ make help

Usage:
  make <task>

Utility
  help             Display this help
  version-python   Echos the version of Python in use

```

::: notes

COLIN:

A while ago, I came upon an excellent help generator tasks that I've now used
just about everywhere.
This enables a self-documenting Makefile with a helpful output: no reading of
a Makefile required to understand what the tasks do while keeping the task
names typeable.

:::


---

```
Dependency Setup
  deps             Installs all dependencies
  deps-brew        Installs dev dependencies from Homebrew
  deps-peru        Installs data dependencies using Peru
  deps-py          Installs Python dev and runtime deps
  deps-py-update   Update Poetry deps
```

::: notes

COLIN:

With one command, make deps, the whole cornucopia of software necessary to work
on the codebase gets installed. Libraries from Homebrew, Pyenv, Python, Poetry,
all Python dependencies, everything. If we need to re-run one of these steps,
we can run it without running the other things.

We use Peru to retrieve some large files used in testing. It's a great
ecosystem-agnostic dependency retriever as an alternative to git submodules or
a script that dumbly recopies data.

:::

---

```
Testing
  test             Runs tests

Building and Publishing
  build            Runs a build
  publish          Publish a build to the configured repo
```

::: notes

COLIN:

We can run tests with a simple make test.
We can also tell Poetry to build a wheel and sdist,
and publish them to our internal PyPI repository.

:::

---

```
Code Quality
  check            Runs linters and other important tools
  check-py         Checks only Python files
  check-py-ruff    Runs ruff linter
  check-py-flake8  Runs flake8 linter
  check-py-black   Runs black in check mode (no changes)
  check-py-mypy    Runs mypy
  check-sh         Run shellcheck on shell scripts
  fix-sh           Runs shellcheck & applies suggestions
  format-py        Runs black||ruff, may make changes
  format-shell     Runs shfmt on shell scripts & tests
```

::: notes

COLIN:

And we have plenty of code quality checks.
We love flake8, black, ruff, mypy, and more that enable us to write maintainable code
that captures our intent.

:::

---

# Challenges

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

As the fourth generation of ARM Macs roll out to developers, there's still a tiny but necessary
challenge to support both Intel and ARM architectures.
As I said earlier, I'm having to compile new stuff far less often, but it's now
the older stuff we're having to compile sometimes
I have to compile some dependencies from source,
because, in a lot of cases in data science, Python is merely a nice wrapper around
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
pyodbc and hdf5, which needed compilation
from source to install on an ARM64 Mac for a while.

Note that `uname -m` outputs the microarchiture, which is arm64 and
that `uname -s` outputs the system name, which is Darwin, the actual
system name for macOS.
The rest of the commands inside this block run Homebrew and a
standard tool called `pkg-config` to get the location of the libraries
that Homebrew installed. In 2023, hdf5 didn't follow `pkg-config`
conventions.
Maybe it does now.
I've not used it in a long time.

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

<!--

---

::: demo

<asciinema-player
src="demo.cast"
idle-time-limit="2"
speed="2"
poster="data:text/plain,Click the |> button to play the demo!"
title="Demo"></asciinema-player>

:::
-->
---

# Future work

::: notes

This was hopefully enough to catch your interest and spark conversation for
your Python team, or any team struggling to quickly onboard developers to new
codebases, or codebases they've not touched in many months.

I have no doubt this system will improve over time, but on its second major
iteration in a two years and openly talking about it inside and outside of [[my
company]], and contributing to several Python open source projects in that
time, it's clear that something like this is needed in some form for nearly all
software projects, Python projects included.

:::

---

## Improvements

* More Make documentation in Makefile
* Streamline one-time setup experience
* Environment debugging
* uv version

::: notes

COLIN:

The teams were I developed this have since disbanded,
unfortunately.
But, like a beautiful flower waving in the wind,
we're spreading the seeds of this method throughout
our company.

The greatest challenge we encountered while rolling
this out is some of the one-time setup required to tell IDEs and tools where to look for executables
installed from Poetry and pyenv.
We automated most it but such often frustrates those manage their dotfiles carefully,
including myself.
We honed it to a drop-in copypaste block that generally just worked.

We saw some troubleshooting complexity for folks with old setups.
We didn't want to mess up working setups, so we move more and more toward a stricter
environment setup as time goes on.
That is, we're more opinionated on where something gets installed so we can easily
reference from our shiny setup while minimizing the work that a developer needs to do
for one time setup, e.g. putting things into their shell configuration files.

And then there's UV.
I heard a fact yesterday that more than a third of
PyPI download traffic is to clients using uv,
and this is growing significantly with each new release.
I can't ignore it much longer,
but I really want a 1.0.

:::

---

# FIN {.r-fit-text background-image="" background-size="10%" background-position="50% 100%" }
<!-- # FIN {.r-fit-text background-image="targettech.png" background-size="10%" background-position="50% 100%" } -->

::: notes

COLIN:

That's it for this presentation.
If you're interested in learning more, ask me and I'll be happy to share the
most current iteration of this setup.

:::

---

### Colophon

* Pandoc rendering
* Reveal.js presentation

Slides source: https://github.com/colindean/talks
<!--* Asciinema CLI playback-->

::: notes

COLIN:

<!--
A quick slide on how the presentation was made,
big shouts to Asciinema on this particular project
for enabling us to show CLI activity at high speed!
-->

:::

---

# THANK YOU

https://tech.target.com/blog/make-python-devex

https://github.com/target/make-python-devex

<!-- # Questions? -->

::: notes

COLIN:

With that, we'll take your questions.
What's on your mind?

:::
