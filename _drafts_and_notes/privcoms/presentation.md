---
title: "Privacy,"
subtitle: "because you have nothing to share"
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
totalTime: 1800
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
![Colin Dean, who wears many hats](deps/colindean-tophat.jpg/197224)
:::

Software engineer and community builder

::: notes

I'm Colin Dean.
I'm a 2007 graduate of mother fair.
I was a Computer Science major with a minor in Creative Writing.
Which was mostly journalism.

Last year, I gave a much more flourishing establishment of my history at
Westminster, but in the spirit of sharing less, I'll keep that to a minimum.

I used to run The Holcad!
:::

---

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

## TL;DR {background-image=https://signal.org/assets/images/header/logo.png background-size="35%" background-position="center 85%"}

In 2025, use **Signal** Messenger.

<https://signal.org>

::: notes

Signal is a non-profit with an endowment
that will probably outlast most of the people
in this room.

People far more interesting than most of us will ever
be have an interest in keeping this service running,
and ideally, free in perpetutity.

:::

---

<!-- warning emoji -->
<span style="font-size: 5em;">&#9888;</span>

::: notes

I want to stress the nature of _personal_ here.
I think my personal infosec (information security)
and opsec (operational security) are pretty decent.
I am not perfect, but I follow the recommendations of
security professionals and of some people whose freedom
depends on their ability to control their communications and data at rest and inflight.

:::

---

## If you remember nothing else, remember these.


Ask your ~~stochastic parrot~~ generative AI chat assistant about them later.

::: notes

One slide and a warning doesn't make for
much of a symposium talk,
so let's expand into some basics of
_personal_ information security.

:::

---

### Threat model

What activities do you do?

What data do you have?

Who is the bad actor?

What resources do they have available?

**What can they do if they _got_ you?**

::: notes

(read slide)

I tend to separate actors into two kingdoms:
nation-state and everyone else.

If your threat actors, people who would act against you,
includes nation-states, like the United States,
your needs exceed what advice I'm comfortable giving
to you in this short presentation.
You should seek the advice of a certified security professional
or someone else with a similar threat model.

:::

---

### Trust boundaries

Is your data safe…

* in your own hands?
* in the hands of others?

::: notes

This talk is focusing on private communications.

Messages are typically stored for a while,
but if you're using Signal's disappearing messages
or Snapchat or Instagram stories,
those messages may be _ephemeral_,
meaning succinctly that they disappear eventually.

However, it's just data with an honesty timer:
once a message leaves your head, it's _said_.
Once a message leaves your device, your control,
you have to trust someone else with the message.
Even if the message is encrypted at rest and in transit,
it still has to be decrypted for your recipient to
understand it.

This expands your trust boundary: the systems and people
you can control and the same that you can _trust_,
even if you don't have direct control yourself.

:::

---

### Inherited risks

What risks do others pose to you?

::: notes

That control is not absolute.
I trust Mamma's Meatballs to get my pizza to me
within 45 minutes,

and they trust PennDOT to keep the roads clear,
but we all inherit the risks that weather
and bad drivers pose to me getting my food as ordered.

:::

---

### {background-image=https://img.nbc.com/sites/nbcunbc/files/images/2022/2/28/weakestLink_S2-Logo-1920x1080.jpg}


::: notes

Who's the weakest link?

:::


---

* **Contacts storage and service discovery.**
To whom do you give your contact list?

## outlaw math

---

### {.nocaptions}

![We must break with the totally erroneous perception that it is technically feasible to outlaw encryption. - Ondřej Pokorný](ondura_chatcontrol.png)

<https://social.unextro.net/@ondra/115204461144155511>

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



* [Creative Commons "Attribution-Share Alike" license icon](https://commons.wikimedia.org/wiki/File:CC_BY-SA_icon.svg), Creative Commons, 2008.



![CC-BY-SA logo](deps/cc_by_sa/CC_BY-SA_icon.svg)


---

# See also

