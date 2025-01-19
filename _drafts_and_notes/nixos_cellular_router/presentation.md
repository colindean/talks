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
totalTime: 1200
# include-after: |
#     <link href="deps/asciinema-player/asciinema-player.css" type="text/css" rel="stylesheet"/>
#     <script src="deps/asciinema-player/asciinema-player.js" type="application/javascript"></script>
# title-slide-attributes:
#     data-background-image: "targettech.png"
#     data-background-size: "10%"
#     data-background-position: "50% 100%"
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
in northern Appalachia in an area of the United States we call the Rust Belt.

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
We have a lot to cover and I need to keep pace to include all of it.
Please do shout out if you can't see something, though, or another technical
problem with the presentation occurs.

:::

---

## My Linux, 2001–2019 {.nocaptions visibility=hidden}

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

## My Linux today {.nocaptions visibility=hidden}

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

## {.nocaptions .image-borders background-color=#aaa}

![Trustix Secure Linux](trustix.png){height=1em}
![Red Hat Linux](redhat.png){height=1em}
![Ubuntu Linux](ubuntu_2004.svg){height=1em}

![ElementaryOS](elementary.svg){height=3em}
![Debian](debian.svg){height=3em}
![ChromeOS](chromeos.svg){height=3em}

![SteamOS](powered_by_steamos.svg){height=2em}
![QNAP](qnap.svg){height=2em}

::: notes

I've used Linux in various forms since 2001 starting with Trustix Secure Linux,
spending more than a decade using primarily Ubuntu while also actively using macOS and Windows.
I currently split my time between Elementary and ChromeOS,
but have had an unexplored interest in NixOS and GUIX since first hearing about them around 2017.

:::

---

# {background-image=nixos.svg background-size=auto}

::: notes

Almost a year ago, I hastily picked up NixOS when I spotted a clear opportunity
to treat a shiny new NixOS installation as an appliance of sorts.
I threw together a makeshift system that was supposed to be very temporary.
I grabbed some unused hardware with a very specific advantage — a built-in LTE modem–
and reached for something I'd really only read about: NixOS.

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

## Problem

Heating or cooling an empty house is wasteful.

I do not know when packages and contractors come and go.


::: notes

In February of 2024, just a few weeks after FOSDEM, I finalized the purchase
of a house about a 10 minute drive from where I'd lived for 12 years.
I immediately started renovation on this house built in 1968
with a high-end furnace installed in 1987.
It could fail at any moment, but it can heat the 185 square meter house from
15 degrees Celsius to 20 in about 40 minutes.
Being able to control it remotely, starting it when we were getting ready to leave
our then-current house, could be a game changer for our comfort while working there.

I was also to have a large number of packages delivered and strangers abound as new contractors
working on the house came and went,
so I wanted a doorbell camera for observation
and occasional interaction.

:::

---

## Diagnosis

* Need Internet, but easy options too expensive for need
* No mobile hotspot device
* No LTE modems

::: notes

The cheapest reasonable Internet service available to me cost around $50 per month.
At that price, I could choose between T-Mobile 5G with a 10 gigabyte data cap
or Verizon fiber at 300 Mbps with no cap.
T-Mobile's data cap wasn't sufficient for the doorbell camera's lowest quality setting.
Verizon's option was overkill when I really only needed around 31 kilobits per second
for the camera plus the thermostat's maybe half a kilobit per second averaged out over a month.

I didn't have a mobile hotspot device and most of what I saw was lackluster and frankly throw-away
quality for what I wanted to spend.
I also had some extra unused Raspberry Pis laying around, but no extra systems with an LTE modem.

:::

---

### {.nocaptions}

<!-- lightbulb -->
<span style="font-size:4em">&#x1F4A1;</span>
<span style="font-size:3em">
<!-- laptop -->
&#x1F4BB;
&#x1F4BB;
&#x1F4BB;
</span>

![$10 bill front and back](https://designhistorylab.com/sp2010dhl/kashani/pictures/10dollarbill.jpg){width=25%}
![$10 bill front and back](https://designhistorylab.com/sp2010dhl/kashani/pictures/10dollarbill.jpg){width=25%}
![$10 bill front and back](https://designhistorylab.com/sp2010dhl/kashani/pictures/10dollarbill.jpg){width=25%}

::: notes

Then I remembered the three laptops I bought at Micro Center for a mere $60
during the 2022 recession of the COVID-19 pandemic in the US.
I remembered that a strangely expensive feature of them was an LTE modem in the M.2 slot.
Raspberry Pi were hard to come by during the pandemic and I devised some plan on the spot
when I saw them in the store.
I bought them with intent to sell the LTE modems for about $25 each and slot a SATA SSD,
and use them as a sort of a battery-powered cluster complete with a custom rack or something.
More horsepower, storage, and x86 compute, plus battery backup, for the cost of an entry-level
Raspberry Pi 4.
Not bad, Micro Center.

However, it became another ambitious project with cheap hardware forgotten
amid the other ambitions.

:::

---

## Remedy

Use a **low-cost LTE cellular provider** with an introductory rate of only $15/mo.

Use a **laptop with an LTE modem** purchased _new_ for $60.

Use **NixOS** `configuration.nix` to define the system,
_and nothing else_.

::: notes

After some searching, I found the laptops.
With some more research, I found that Mint Mobile, an US-based mobile virtual network operator
using T-Mobile's network, offered an introductory rate of just $15/mo for a 10 gigabyte monthly plan.
Their fine print seemed to indicate that overage was free, just with the speed reduced to something well
above my approximately 31 kilobit need.

Then NixOS was that thing that completed the idea.
The pledge was a single configuration file, and I wanted to see what the prestige would deliver.

:::

---

# Can I build a router in _one_ config file?

::: notes

Having built a router distro in college as my graduation project,
and having reviewed consumer networking equipment for several years a decade prior,
I knew a thing or two about the components I'd need.
I knew I'd need DHCP, DNS, a firewall,
and something to enable network address translation, masquerading, forwarding, and whatnot.

Assuredly, someone has done this on NixOS previously, I thought.

:::

---

# {background-image="evolve3nix1_with_accessories.jpg" background-size=constrain}

::: notes

Here's a picture of the Evolve3 laptop, a Maestro model with an approximately 29 centimeter screen.
The keyboard, trackpad, camera, and speakers are a step above garbage.
For the elementary students for whom this machine was made, they'd not really know the difference.
and the two USB ports — only one USB 3 — could work around those limitations.

I'd need an Ethernet adapter to plug it into the switch, but I had couple of those laying around.

:::

---

# {background-image="evolve3_inside.jpg" background-size=constrain}

::: notes

Everyone loves a good board shot.

This little machine has an Intel Celeron quad core processor at 1.1 GHz,
4 gigabytes of DDR4 RAM,
and a 64 gigabytes of eMMC storage.
I would come to learn while setting it up that the built-in WiFi drivers are
**NOT** included in the Linux kernel, and there was no Nix module for it.
So I pulled out a USB WiFi adapter that is,
mostly so that I could leave the Ethernet adapter in its LAN services mode.

I loved that it had a battery, too.
We were going to be toggling the electricity frequently as we replaced outlets and switches
throughout the house.
I avoided the need for a whole new uninterruptible power supply unit.

:::

---

# Values

* Inexpensive hardware could fail or be stolen
* Reproducible configuration
* Minimize administration
* Short-lived: 3–4 months

---

## Can my partner make this work if I am unavailable?

* Linux or Nix? No.
* Power cycle? Yes.

---

# Nix

---

## `hardware-configuration.nix`

```nix

{ config, lib, pkgs, modulesPath, ... }:
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix")];
  boot.initrd.availableKernelModules = [
    "ahci" "xhci_pci" "usb_storage" "sd_mod"
    "sdhci_pci" "rtsx_usb_sdmmc" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];
```

---


```nix
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/<uuid>";
      fsType = "ext4";
    };
  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/<uuid>";
      fsType = "vfat";
    };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/<uuid>"; }
    ];
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
```
<small>…nothing special. Autodetect &#x1F44D;&#x1F3FB; <!-- thumbsup --></small>

::: note

So yeah, the installer's autodetect handled this bit just fine for this laptop.

Note that for this and the rest of the slides showing Nix code,
I've optimized the formatting for skimmability on the slides,
not for what a formatter would output.
There may also be orphan opening or closing curly brackets missing
to keep the slides readable.

:::

---

## `configuration.nix`

_(the good parts)_

```nix
networking.hostName = "evolve3nix1";

# Enable networking
networking.networkmanager.enable = true;

# Enable the X11 windowing system.
services.xserver.enable = true;

# Enable the GNOME Desktop Environment.
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;
```

::: notes

I found I needed to enable NetworkManager to best play with the LTE modem while setting it up.
One gap in the Nix config — or at least the documentation, if it feature existed—
was something how to tell NetworkManager information about the LTE connection.
For example, the network Access Point Name to use.

I also wanted a desktop environment.
Once the LTE modem was working, I had Internet on the device,
so I could troubleshoot and build this configuration in place.
This avoids having to tether to my phone.

My user wasn't interesting.
It just had membership in the networkmanager group and installed Firefox.
:::

---

```nix
environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    htop
    ethtool             # manage NIC settings
    tcpdump             # view network traffic
    conntrack-tools     # view network connection states
];
services.openssh.enable = true;
system.autoUpgrade.enable = false;
system.autoUpgrade.allowReboot = false;
```

::: notes

There are the packages I found I needed along the way
in addition to what packages were automatically selected
when I enabled DHCP, DNS, and other services.

I wanted SSH in case I wanted to manage it remotely.
With very limited paydirt on this home network with
nothing more than a doorbell camera, thermostat, gateway, and access point,
I felt it OK not to go further than the out of the box settings.

Lastly, I wanted to explicitly upgrade manually.
Functioning was more important than security for this scope.
:::

---

```nix
# router bullshit
boot.kernel.sysctl = {
    "net.ipv4.conf.all.forwarding" = true;
    "net.ipv6.conf.all.forwarding" = true;

    # By default, not automatically configure any IPv6 addresses.
    "net.ipv6.conf.all.accept_ra" = 0;
    "net.ipv6.conf.all.autoconf" = 0;
    "net.ipv6.conf.all.use_tempaddr" = 0;

    # On WAN, allow IPv6 autoconfiguration and temporary address use.
    "net.ipv6.conf.wwp0s21f0u3i4.accept_ra" = 2;
    "net.ipv6.conf.wwp0s21f0u3i4.autoconf" = 1;
};
```

::: notes

Set some syscontrols, most importantly enabling forwarding.

You'll start to see some of the interface names at this point.
I couldn't at the time figure out how best to abbreviate or rename them.
If I refactor this configuration, I'll figure that out quickly instead of
typing cryptic names constantly.

:::

---


```nix
networking = {
    interfaces = {
      enp0s21f0u5 = {
        useDHCP = false;
        ipv4.addresses = [{
            address = "10.201.1.1"; prefixLength = 24; }];
      };
      wwp0s21f0u3i4.useDHCP = true;
    };
    nat = {
      enable = true;
      internalInterfaces = [ "enp0s21f0u5" ];
      externalInterface = "wwp0s21f0u3i4";
      enableIPv6 = true;
```

::: notes

Now we're getting to the serious stuff.

This sets a static IP address on the wired network adapter
and sets the LTE modem adapter to use DHCP.

:::

---

```nix
    # nixos iptables firewall
    firewall.enable = true;
    # use netfilter firewall
    nftables = {
      enable = true;
    };
  };
```

::: notes

I tried more complicated nfttables rules, but couldn't get them working quickly.
So I gave up, prioritizing getting something working for this temporary solution
than having a perfectly secure castle.

:::

---

```nix
services.dnsmasq = {
    enable = true;
    alwaysKeepRunning = true;
    settings = {
      domain-needed = true;
      bind-dynamic = true;
      interface = [ "enp0s21f0u5" ];
      dhcp-range = [ "10.201.1.2,10.201.1.253,255.255.255.0,24h" ];
    };
  };
```

::: notes

Next, let's give the LAN some DNS and DHCP with dnsmasq.

I struggled a bit with DHCP.
I started with dnsmasq and for some reason, it wasn't working.
Neither my other laptop nor the access point — a Ubiquiti UAP-AC-Pro– could get an IP address.

:::

---

```nix
services.kea.dhcp4 = {
    enable = false;
    settings = {
      interfaces-config = { interfaces = ["enp0s21f0u5"]; };
      lease-database = {
        name = "/var/lib/kea/dhcp4.leases";
        persist = true;
        type = "memfile";
      };
      rebind-timer=2000; renew-timer=1000; valid-lifetime=4000;
      subnet4 = [
        {
          pools = [ { pool = "10.201.1.2 - 10.201.1.253"; }];
          subnet = "10.201.1.0/24";

```

::: notes

So I tried using a few different services, notably this attempt with Kea.
I don't know _why_ this doesn't work as written, but I know I disabled it eventually
and dnsmasq just, well, worked.

I suspect there were some colliding services but the config didn't warn me about that visibly.

:::

---

```nix
networking.firewall.interfaces.enp0s21f0u5 = {
    allowedTCPPorts = [
      # ssh
      22
      # dnsmasq; dns-over-http
      53
    ];
    allowedUDPPorts = [
      # dnsmasq; dns dhcp
      53 67
    ];
  };
```

::: notes

And to complete it, this firewall configuration seemed to work sufficiently.
This worked, unlike setting a ruleset manually using an example
I found in some searches online.

While I don't remember the specific incantations to make the firewall work
while building that router distro for my college graduation project,
I remember how it made me feel: sad and confused.

Nix made this little bit nice.

:::

---

# In practice

---

## LTE coverage

Enough.

---

## Throughput

Sufficient.

---

# Takeaways

---

## NixOS made this _svelte_

/svĕlt/

<small>_adjective_</small>

1. Slender or graceful in figure or outline; slim.
2. **Attractively thin**; gracefully slender.
3. Refined, delicate.

<small>_The American Heritage® Dictionary of the English Language, 5th Edition_</small>

::: notes

I'm impressed by how little work I had to do to get this working,
esp. compared to the _first_ time I set up a server to run as a router,
and even compared to the process I followed when setting up routers manually
in my LAN party days before the rise of configuration management tools
like Chef and Ansible.

:::

---

```bash
$ rg -v "^\s*\#.*" configuration.nix | rg -v "^\s*$" | wc -l
142
```

\- 27 (Kea)

\- 10 (locale)

\- 10 (audio)

= 95 SLOC

::: notes

142 lines of meaningful configuration, minus the approximately 27 lines
for the disabled Kea DHCP configuration, is 115 lines.
Remove 10 lines for extra locale settings that are probably unnecessary
as well as around 10 lines for unused audio settings for PulseAudio and Pipewire,
and this whole configuration is less than 100 lines.

:::

---

## F@#k around and find out

::: notes

I remember some guardrails keeping me from completely messing up.
But things still took a lot of searching and experimentation.
Some of my reference material was out of date by only a year or so
and some things had changed.

What were my biggest mistakes?

1. Underestimating how much a speedtest transfers.
   I ran a few and ate a gigabyte pretty quickly,
   because it only takes about six minutes to download a gigabyte at
   the approximately 20 megabit throughput I experienced.
2. Early on, I'd not enables automatic updates.
   I don't know what updated, but that ate a couple of gigabytes
   in the first month.

:::

---

## Document(ation)

::: notes

What found I really wanted was more documentation of options and more examples.
NixOS isn't old but it's not that young, either.
I'm sure someone's working on it somewhere, and if not, well, maybe someone will:
I'd love to see a configuration.nix editor available out of the box that
offers complete documentation for every option built into the editor.

As a complete newbie to Nix and NixOS, this would have probably saved me a lot of time.
Also, using my other laptop, with a larger screen and regular-size keyboard would have
saved me some time.
I underutilized the SSH server I had set up correctly early on in building this configuration.

:::

---

## Approximate time to build

<span style="font-size:4em">
<!-- hourglass -->
&#x231B;
&#x231B;
&#x231B;
&#x231B;
&#x231B;
&#x231B;
</span>


::: notes

It took about six hours total to build this, including reading documentation
and sourcing some examples.

:::

---

## Ongoing maintenance

<span style="font-size:4em">
<!-- hourglass -->
&#x231B;
&#x231B;
&#x231B;
</span>

<span style="font-size:2em">
<!-- date -->
&#x1F4C5;
&#x1F4C5;
&#x1F4C5;
&#x1F4C5;
&#x1F4C5;
&#x1F4C5;
</span>

::: notes

I'd estimate my investment in upkeep at around three hours in the six months
this was active from March 2024 until September when I had Verizon's fiber service
installed ahead of anticipated move-in later that month.

Mint Mobile's introductory plan expired after three months, but I was able to find another deal
extending it for two months for $20 per month. I had to pay $45 for the final month, though.

We ended up not moving in until mid-December but having fiber there enabled me to work from the house
during the many contractor visits and to use my breaks from work as a developer to
put a coat of paint on something, rewrite some outlets, or run some of the more than 1,000 feet of Ethernet
cable I installed.

:::

---

# What's next?

* Old house: Verizon -> LTE
* Matt Layher's [routnerr-3](https://github.com/mdlayher/homelab/tree/main/nixos/routnerr-3)

::: notes

BRIEFLY, OLD HOUSE

I'll probably redo it, and base it on the latest revision of the config example
from which I go the most inspiration.
Big thanks to Matt Layher for sharing this, and for updating at the end of 2024,
which I discovered while building this presentation.

:::

---

# FIN

Thanks, yinz!

|   |   |
|---|---|
|**fediverse**|`@colindean@mastodon.social`|
|**bsky**|`@cad.cx`|

::: notes

Thanks, yinz.
There some Pittsburghese for you all.

:::

---

# Attributions {.nocaptions}

* [Relief location map of the USA (without Hawaii and Alaska)](https://commons.wikimedia.org/wiki/File:Usa_edcp_relief_location_map.png), Uwe Dedering, 2010.
* Evolve3 Maestro desk picture by Colin Dean, 2024.
* [Evolve3 Maestro internal picture](https://imgur.com/a/ussxg8d) by Colin Dean, 2022.
* [Creative Commons "Attribution-Share Alike" license icon](https://commons.wikimedia.org/wiki/File:CC_BY-SA_icon.svg), Creative Commons, 2008.

![CC-BY-SA logo](cc-by-sa.svg)

---

## Logo attributions

* Red Hat Linux, Ubuntu, QNAP, Elementary logos owned by their respective companies.
* Trustix Secure Linux owned by Comodo.
* SteamOS logo owned by Valve Software.
* NixOS logo by Tim Cuthbertson.

---

# See also

* [Evolve III Maestro 11.6" Laptop Computer - Dark Grey](https://www.microcenter.com/product/683082/evolve-iii-maestro-116-laptop-computer-dark-grey?rd=1), Micro Center website.
* [Review: Evolve III Maestro E-Book 11.6"](https://www.reddit.com/r/linuxhardware/comments/tk6hdp/evolve_iii_maestro_ebook_116/) by `see_spot_ruminate` on /r/linuxhardware, March 2022.
* [mdlayher's homelab `routnerr-2`](https://github.com/mdlayher/homelab/blob/14968b1744367982d10d3803d58b1fe40a4c351d/nixos/routnerr-2/configuration.nix)
