mosh
====

author
: Colin Dean -> @colindean

subtitle
: Lightning Talks!

theme
: nari

allotted-time
: 300

# Notices.

My words are not necessarily my employers'. Duh.

# Introduction

**mo**bile **sh**ell

# Verbosely

Remote terminal application that allows **roaming**, supports **intermittent
connectivity**, and provides intelligent **local echo** and line editing of user
keystrokes.

Mosh is a replacement for SSH. It's more robust and responsive, especially over
Wi-Fi, cellular, and long-distance links.

# Why mosh?

# Change IP. Stay connected.

Connected UDP - _may_ need firewall punch

# Encrypted

State Synchronization Protocol (SSP) secured with AES-128

# Sleep recovery

# No echo lag

# mosh is safe to use

No privileged code

No daemon

# Uses SSH login

* Connects via SSH
* Starts mosh-server on server
* Starts mosh-client on client

# ^C always works

Control commands jump to front of buffer

# Few dependencies

Protocol Buffers
ncurses
zlib
OpenSSL

utempter (optional)

# Use

    ssh colin@cad.cx

becomes

    mosh colin@cad.cx

# Complex use

    mosh --ssh="~/bin/ssh -i ./identity -p 2222" fett

# Use a config file!

    ~/.ssh/config

# Caveats

Supports UTF-8 *only*

Must install mosh on server

^ No failover (yet)

# Planned features

X11Forwarding

SSH Agent

IPv6

# Availability

![Android](logos/Android_Robot_100.png) via ![JuiceSSH](logos/JuiceSSH.png)
![NetBSD](logos/NetBSD-smaller-tb.png)
![Arch](logos/arch.png)
![Chrome](logos/chrome.png)
![Debian](logos/debian.svg)
![Fedora](logos/fedora.png)
![FreeBSD](logos/freebsd.png)
![Gentoo](logos/gentoo.png)
![Homebrew](logos/homebrew2.png)
![Mac OS X](logos/macosx.png)
![Macports](logos/macports.png)
![openSUSE](logos/openSUSE.svg)
![openCSW](logos/opencsw.png)
![Ubuntu](logos/ubuntu.svg)

# Common install invocation

    sudo apt-get install mosh

    brew install mobile-shell

# Yell at me.

@colindean

cad.cx

github.com/colindean/talks
