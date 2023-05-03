mosh
====

`@ColinDean`

---

# Notices.

My words are not necessarily my employers'. Duh.

---

# Introduction

**MO**bile **SH**ell

mosh.org

---

# Verbosely

## Mosh is a replacement for SSH.

It's more robust and responsive, especially over Wi-Fi, cellular, and long-distance links.

## Remote `terminal` application that

* allows **roaming**,
* supports **intermittent connectivity**, and
* provides intelligent **local echo** and line editing of user keystrokes.

---

# Why mosh?

---

# Change IP. Stay connected.

Connected UDP - _may_ need firewall punch

---


# Encrypted

State Synchronization Protocol (SSP) secured with AES-128

---


# Sleep recovery

Reconnects automatically

---


# No echo lag

Typed characters shown immediately, sent when possible

---


# mosh is safe to use

No privileged code

No daemon

---


# Uses SSH login

* Connects via SSH
* Starts `mosh-server` on server
* Starts `mosh-client` on client

---


# `^C` always works

Control commands jump to front of send buffer

---


# Few dependencies

* Protocol Buffers
* ncurses
* zlib
* OpenSSL / Nettle / Apple Common Crypto

* utempter (optional)

---


# Use

    ssh colin@cad.cx

becomes

    mosh colin@cad.cx

---


# Complex use

    mosh --ssh="~/bin/ssh -i ./identity -p 2222" cad.cx

---


# Use a config file!

    ~/.ssh/config

---


# Caveats

* Supports UTF-8 *only*

* Must install mosh on server

  * No failover (yet)

---


# Planned features

X11Forwarding

SSH Agent

IPv6

---

# Availability

![Android](logos/Android_Robot_100.png)![Mac OS X](logos/macosx.png)![Chrome](logos/chrome.png)

---

# Availability on *BSD

![NetBSD](logos/NetBSD-smaller-tb.png)
![FreeBSD](logos/freebsd.png) FreeBSD

---

# Availability on Linux

![Arch](logos/arch.png)
![Debian](logos/debian.svg) ![Fedora](logos/fedora.png)![Ubuntu](logos/ubuntu.svg)![Gentoo](logos/gentoo.png)![openSUSE](logos/openSUSE.svg)

---

# Availability for macOS


![Homebrew](logos/homebrew2.png) Homebrew

![Macports](logos/macports.png) MacPorts

---

# Availability for Android

![JuiceSSH](logos/JuiceSSH.png)

---


# Common install invocation

    sudo apt-get install mosh

    brew install mobile-shell

or get it from mosh.org

---


# Yell at me.

@colindean

cad.cx

github.com/colindean/talks
