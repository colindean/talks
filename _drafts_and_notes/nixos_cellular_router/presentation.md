---
title: "NixOS + $60 laptop = cellular router"
subtitle: "Building an LTE router with a $60 (new!) laptop and a single file"
author:
  - _Colin Dean_
theme: white
css: custom.css
slideNumber: true
hash: true
history: true
# transition: none
transitionSpeed: "fast"
totalTime: 1800
# include-after: |
#     <link href="deps/asciinema-player/asciinema-player.css" type="text/css" rel="stylesheet"/>
#     <script src="deps/asciinema-player/asciinema-player.js" type="application/javascript"></script>
# title-slide-attributes:
#     data-background-image: "targettech.png"
#     data-background-size: "10%"
#     data-background-position: "50% 100%"

---

# Who is this guy?

::: biopic
![Colin Dean, who wears many hats](https://avatars.githubusercontent.com/u/197224?s=300)
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
in an area of the United States we call the Rust Belt.

:::

---

## {background-image="colindean_fosdem_2021_video_intro.png" background-size="contain" }

::: notes

This is my second presentation to FOSDEM, but my first in person and my fifth time attending FOSDEM in some way.

:::

---

![Homebrew logo, Apple variant](https://docs.brew.sh/assets/img/homebrew.svg){width=36%}
![Homebrew logo, Linux variant](https://docs.brew.sh/assets/img/linuxbrew.svg){width=36%}

::: notes

You can generally find me hanging out at the Homebrew table in the exhibition hall.
I've been a Homebrew contributor for 12 years and will complete my first term as one of its elected
Project Leadership Committee members on Monday.

So, hello from a fellow packaging project, but I know Nix is so much more!

:::

---

## My Linux, 2001–2019 {.nocaptions}

![Trustix Secure Linux](trustix.png){height=2em}

![Red Hat Linux](redhat.png){height=2em}

![Ubuntu Linux](ubuntu_2004.svg){height=2em}

::: notes

I've used Linux in varying degrees of committment since 2001.
My first distro was Trustix Secure Linux, running on some servers for Ultima Online run by some Danish friends I'd met through the player-run server community.
This is of course no relation to the Trustix system in Nix.
They gave me a login on their server and let me play around a little.
A few months later, I burned a Phat Linux live CD and
then my parents bought me a boxed copy of Linux for Windows,
a repackaging of Linux Mandrake live CD sold in the US for a few years.
By 2003, I was dual-booting Windows XP and Red Hat for about a year before
the first release of Ubuntu came out.

:::

---

## My Linux today {.nocaptions}

![ElementaryOS](elementary.svg){height=2em}
![Debian](debian.svg){height=2em}

![ChromeOS](chromeos.svg){height=1em}

![SteamOS](powered_by_steamos.svg){height=1em}
![QNAP](qnap.svg){height=1em}

::: notes

I got "back to the Mac" in 2008 for my daily driver, having grown up on Macs
and being jealous of nearly infallible software suspend and clamshell
features of Mac OS X, something I'd struggled to get working on any Linux distro
of that era.

But, really, I was running Mac OS, Windows, and Ubuntu Linux plus this startup NAS vendor
called QNAP, whose hardware I wrote about for a tech website called ThinkComputers.

In the late 2000s, Linux became everywhere, mostly notably
in the form of Android and ChromeOS, which I happily adopted.

Like many people, I was using the operating system that was the most useful and comfortable
to me in the various contexts of my life:
gaming, programming, essential home computing as a service.
As a professional developer, I was and still am developing
mostly on macOS or Linux and deploying to Linux.

Eventually, there was a void in my life for a Linux desktop.
I don't remember exactly when this was, sometime in the late 2010s and before the pandemic.
I hopped a bit, settling on ElementaryOS for its stellar user experience,
especially having my preferences influenced by macOS for so many years.

I picked up a Steam Deck in 2024 and aside from playing with its desktop mode a little
because I'm the type to poke at things,
I'd not know that it's basically Arch Linux under the hood.

I've got Debian running on a bunch of systems,
including Windows Subsystem for Linux and chromeOS "Linux mode".

:::

---

# {background-image=nixos.svg background-size=auto}

::: notes

Almost a year ago, I added NixOS to that when in haste and anger,
I threw together a makeshift system that was supposed to be very temporary.
I grabbed some unused hardware with a very specific advantage — a built-in LTE modem–
and reached for something I'd had only light experience: NixOS.

:::

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

<!--
Please send me your questions!
-->

Please save your questions until the end.

<small>Grab a piece of paper so you can write them down.</small>

_This system matures frequently despite being in development for more than
a year._

::: notes

COLIN:

Please save your questions until the end.
We have a lot to cover and need to keep pace to include all of it.
Please do shout out if you can't see something, though, or another technical
problem with the presentation occurs.

:::

---

## Problem

Heating or cooling an empty house is wasteful.

I do not know when packages and contractors come and go.

---

## Diagnosis

Despite having purchased a smart thermostat and doorbell, I have no Internet at my house undergoing renovation because the cheapest option is $50 per month for 5G.

I do not have a usable mobile hotspot device.
I do not want to setup another complex system to adminster.

---

## Remedy

Use a low-cost LTE cellular provider with an introductory rate of only $15/mo.

Use a laptop purchased _new_ for $60 that has an LTE modem.

Use NixOS' declarative syntax to give me what I want.

---

# {background-image="evolve3nix1_with_accessories.jpg" background-size=constrain}

---

# Attributions {.nocaptions}

* [Relief location map of the USA (without Hawaii and Alaska)](https://commons.wikimedia.org/wiki/File:Usa_edcp_relief_location_map.png), Uwe Dedering, 2010.
* [Creative Commons "Attribution-Share Alike" license icon](https://commons.wikimedia.org/wiki/File:CC_BY-SA_icon.svg), Creative Commons, 2008.

![CC-BY-SA logo](cc-by-sa.svg)

---

## Logo attributions

* Red Hat Linux, Ubuntu, QNAP, Elementary logos owned by their respective companies.
* Trustix Secure Linux owned by Comodo.
* SteamOS logo owned by Valve Software.
* NixOS logo by Tim Cuthbertson.

