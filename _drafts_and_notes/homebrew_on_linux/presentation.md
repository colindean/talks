---
# This should be submitted as "Homebrew on Linux?"
title: "Yes, Homebrew runs on Linux"
subtitle: "Using the latest with a rolling package manager, even without root"
author:
  - _Colin Dean_
  - "`@colindean@mastodon.social`"
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
# transition: none
transitionSpeed: "fast"
totalTime: 1200
header-includes: |
    <script>
        function connect() {
            const ws = new WebSocket("ws://localhost:56789");
            ws.onopen = () => setTimeout(() => ws.send("keepalive"), 30000);
            ws.onclose = () => setTimeout(connect, 1000);
            ws.onmessage = () => {console.log("reload from save!"); location.reload(); }
        }
        connect();
    </script>
---

# Who is this guy?

::: biopic
![Colin Dean, who wears many hats](deps/colindean-github-avatar/colindean-github-avatar.jpg)
:::

Software engineer and community builder

::: notes

I'm Colin Dean.

I've been a programmer for 27 years and a paid developer for 20 years this year.

:::

---

## {background-image="pittsburgh_on_a_map.svg" background-size="contain" background-color="#6699ff"}

::: notes

I'm here from Pittsburgh, a metropolitan area of around two and a half million people
in northern Appalachia in an area of the United States we call the Rust Belt.

:::

---

## Previous FOSDEM presentations

**2021**: A documentation workflow loved by engineers and data scientists alike

**2024**: make python devex: _How a 45+ year old tool can MAKE Python developer experience easier_

**2024**: NixOS + $60 laptop = cellular router: _Building an LTE router with a $60 (new!) laptop and a single file_

::: notes

This is my presentation to FOSDEM, but my first in person and my fifth time attending FOSDEM in some way.

:::


---

<!--
Please send me your questions!
-->

Please save your questions until the end.

<small>Grab a piece of paper so you can write them down.</small>

::: notes

COLIN:

Please save your questions until the end.
We have a lot to cover and I need to keep pace to include all of it.
Please do shout out if you can't see something, though, or another technical
problem with the presentation occurs.

:::

---

![Homebrew logo, Apple variant](deps/brew.sh/assets/img/homebrew.svg){width=36%}

::: notes

You can generally find me hanging out at the Homebrew table in the exhibition hall.
I've been a Homebrew contributor for 12 years and will complete my second term as one of its elected
Project Leadership Committee members in February 2027.

:::

---

# Yes, Homebrew runs on Linux

---

![Homebrew logo, Linux variant](deps/brew.sh/assets/img/linuxbrew.svg){width=36%}

---

# Why?

---

# Agenda

|   |   |
|---|---|
|Problem  ||
|Diagnosis||
|Remedy   ||


::: notes

I'm a huge fan of addressing problems through a problem-diagnosis-remedy
approach consistent with medical and other scientific approaches to problem
solving. If you search for "Colin Dean Problem Diagnosis Remedy" on the web,
you'll find my writings on it.

At a high-level, I'll be talking about a rather simple problem and diagnosis,
with a remedy… that remedy is why you're here!

:::

---

## Problem

::: notes

Like most software, Linuxbrew was created to solve a problem.

:::

---

### I cannot use the softare I want to use.

---

## Diagnosis

---

### I cannot install packages

---

### I cannot install (new) packages {transition=zoom}

---

## Remedy

---

### Values

1. Popular tools
1. Latest versions
1. Root not required

---

Rootless Rolling

package manager

---

# Agenda

|   |   |
|---|---|
|Problem  |_I_ cannot use the softare I want to use. |
|Diagnosis|_I_ cannot install (new) packages.        |
|Remedy   |I need a rootless rolling package manager.|

---

## { background-image=deps/brew.sh/assets/img/homebrew.svg background-size="contain" }

---

## { background-image=deps/brew.sh/assets/img/linuxbrew.svg background-size="contain" }

---

### Homebrew

---

# In practice

---

## Cluster

---

## Desktop Linux {.nocaptions}

::: image-borders

![Debian Linux](debian.svg){height=3em}
![ElementaryOS](elementary.svg){height=3em}

:::

::: notes

Some packages in major distribution repos can fall behind
for a variety of reasons.
When I want the latest, I might be able to use backports
or switch to the testing release channel, but those might create other
conflicts that could disrupt my usage of the system.

Homebrew gives me what I want _now_, with less chance of a conflict.
It also only affects my user on the system, so other packages I install with
the distro package manager aren't affected unless they respect my user-level
PATH.

:::

---

## Managed Linux

---

### ChromeOS {.nocaptions}

::: image-borders

![ChromeOS](chromeos.svg){height=3em}

:::

::: notes

I've used Homebrew on my Chromebook since 2020,
when I got an Intel-based Chromebook for the first time.
I'm a long-time Chromebook user, starting in 2016
with an ASUS Chromebook Flip when ChromeOS didn't have an official "Linux mode"
that really just runs Linux in a VM or container.

Why?
Just like the reasons for using it on desktop Linux, because inside "Linux mode,"
it's just another Debian or Ubuntu system.

:::

---

![Chromebrew](deps/chromebrew/chromebrew-logo.png)

<small><em>* unaffiliated with Homebrew</em></small>

::: notes

Chromebrew exists and is not a project of the Homebrew team.
Its name and package definition DSL are similar, but it's not a fork.
ChromeOS 117 effectively killed the Chromebrew installer, but the project
remains active and loved by those who prefer not to use "Linux mode,"
the VM of which has some performance implications and requires some system
administration, for updates and whatnot.

:::

---

### SteamOS {.nocaptions}

::: image-borders

![SteamOS](powered_by_steamos.svg){height=3em}

:::

::: notes

SteamOS, running generally on a Steam Deck game console,
is just Linux under the hood.
It's a customized version of Arch Linux.
You can use Homebrew on it!
Arch is another rolling package manager, but Valve, the company behind Steam,
puts the breaks on it a little for qualification and owns the system partition.
With Homebrew, you can use your Steam Deck in "desktop mode,"
which exposes the Linux as a desktop and enables using the Steam Desk as just
another computer.

(If presenting from the Steam Deck, point that out.)

:::

---

# Takeaways

---

# What's next?

::: list-wip

* Pre-compiled ARM Linux "bottles"
* Beyond glibc

:::

::: notes

Homebrew does not officially support ARM Linux as of February 2025,
but this is maturing and the organization may decide to commit to it in the
future.
Currently, Homebrew technically does _work_ on ARM Linux, but requires building
all packages from source.
What's not yet in place is the infrastructure and volunteers to keep up with
any oddities of building more than 90% of our packages on ARM Linux.

Then there's also some exploration of supporting C standard libraries beyond
glibc, such as musl.
That's in the far future.

:::

---

# What's _not_ next?

::: list-nope

* HomebrewOS

:::

---

# Get involved

https://brew.sh

---

# FIN

Thanks, yinz!

|   |   |
|---|---|
|**fediverse**|`@colindean@mastodon.social`|
|**bsky**|`@cad.cx`|
|**slides**|https://github.com/colindean/talks|

::: notes

Thanks, yinz.
There some Pittsburghese for you all.

:::

---

# Attributions {.nocaptions}

* [Relief location map of the USA (without Hawaii and Alaska)](https://commons.wikimedia.org/wiki/File:Usa_edcp_relief_location_map.png), Uwe Dedering, 2010.
* [Creative Commons "Attribution-Share Alike" license icon](https://commons.wikimedia.org/wiki/File:CC_BY-SA_icon.svg), Creative Commons, 2008.

![CC-BY-SA logo](cc-by-sa.svg)

---

## Logo attributions

* Logos owned by their respective eponymous companies.
* SteamOS logo owned by Valve Software.

---

# See also

