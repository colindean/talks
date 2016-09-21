<!-- $size: 16:9 -->
<!-- page_number: true -->
<!-- prerender: true -->

![bg original](trailer.jpg)

---

## Open Source at a National Lab

* Ian Lee, Lawrence Livermore National Laboratory
* 3 of 16 #1 systems in last 20 years
  * IBM BlueGene, Nov '04-'07
  * IBM Sequoia, June '12
* FUN FACT: "Warp core" room in STAR TREK INTO DARKNESS was filmed at LLNL.

---


### Open source makes sense

* Having to reimplement things wastes taxpayer dollars
* Different software stack
  * 10 **PB** filesystem
  * Scheduled jobs
  * Low latency interconnect - Infiniband
* RHEL-based
  * Lustre FS
  * SLURM resource manager
    * scales to 1.6M CPU cores

---

### Contributing back

* LLNL leads **ZFS on Linux** project
  * Goal: 100 **PB** array
* LLNL created **SPACK** project
  * Package manager that provides 7,500 combinations of just 48 commonly-used packages

---

### Federal Source Code Policy đ

* 20% of new code written for gov't must be published
* Legal areas still fuzzy
  * Export controls are crazy
  * Bureaucracy is crazy
  * Policy is better than no policy

---
### Standards and public APIS

* Using them instead of buying more closed software or building custom software.

---

> **History will show that proprietary solutions are not as reliable *[as open source]*.** - Ian Lee

---

### Limitations

* Projects are often limited to 1 year, so any delay in establishing collaboration is *detrimental* to a project.

---

## Teaching kids programming

* 5th grade teacher took a programming class taught by a 13 year old so he could *empathize*.
* Now he teaches programming and his students are excelling in other areas, too.

---

## Overcoming maintainer DDoS

Time and effort for processing responses is great

👥 👥 👥 🗣 😠 🗣 😡 🗣 👿 👉👤 😵 😩 😫 😭

---

### Ask for clarifications

> Can you elaborate?

> What did you mean by `X`?

People often answer their own question in the process of explaining it.

---

## Growing a Healthy Community by Dedicating Space

Gregor Martynus, hood.ie

* Open source is intimidating
* People will leave if they don't feel welcome

---

### Hoodie.camp

* Github API to show issues in a more user-friendly and welcoming way

---

### Tips

* Show recognition constantly.
* Be transparent.
* Use or create tooling for community management

---

> **You don't build community, you build a space.** - Saron Yitbarek

---

## Bringing back open source projects to life

Ernesto Monogallo

* Why rescue?
  * Dependency
  * Security
  * Fixes
  * New features

---

### How to get started

* Contribute where you can
* Contact authors or maintainers
* Biggest constraint is time
  * Best tool is collaboration
  * Community enables collaboration

---

## Fighting for the Future

Quinn

Persuading people in power to try new things, using _Street Fighter_ analogies.

"Unproven contenders make their case."

---

### Basics of the match

* Use the "training room": build demos. Show, don't tell!
* Learn to block: be ready for objections, criticism. Set expectations.
* Know your matchups: learn different lenses, have multiple stories.
* Learn to lose: **failure is feedback**. Be willing to be changed. Be iterative: it may be over, but why stop trying when you're right? Accept this: You. May. Be. Wrong.

---

## Lending Privilege

Anjuan Simmons

* Leonard Nimoy fought for equal pay for Nichelle Nichols on _Star Trek_.
* Nimoy _lended privilege_ as a white man actor to the black woman Nichols.

---

### Inclusion requires empathy

Empathy from a corporate level is best attained by hiring from every demographic.

---

### The Cathedral and The Bazaar

> **Given enough eyes, all bugs are shallow.** - Linus's Law

Some voices kept out of bazaar because of a lack of privilege or unwelcoming intimidation.

---

### Riding up the same hill on a bicycle

Privileged have a clear path.

Underprivileged have obstacles, chasms, and more inhibiting progress.

---

### Privilege

Access to benefits based on personal traits

---

### Portfolio of Privilege

|Birth Traits|Selected Traits|
|:----------:|:-------------:|
|Parental    |Gender         |
|Racial      |Religion       |
|Physical    |Education      |

_not a complete list_

---

### Diverse portfolios benefit more than financially

The value of the effort increases on a team with a diverse portfolio of privilege.

---

### Human nature is to share privilege with people _like ourselves_.

We have to recognize and combat this behavior.

---

### Lending privilege

* **Credibility** - give a platform
* **Access** - give opportunity
* **Expertise** - give a seat at the table

---

### Beware of **activism burnout**

* Hard when preaching to the choir
* Hard when preaching to unreceptive audience

---

### One quick action: *understand*

* Educate
* Learn

---

## Inclusion at Github

Danielle Leong

**Online harassment** is destructive behavior that undermines productivity.

---

### Targets are all over the place

Regardless of **age** or **gender**

The farther away from heteronorm and affluent, the more likely to be a target of harrassment.

---

### 25% of people 18-24 years old have experienced **severe** harrassment

---

### Harrassers

* Normal people who do things that seem fun or appropriate at the time.

> I never felt bad. I found your work so vile that I thought you didn't deserve sympathy.

> It's not done to express an opinion, it's done to _scare_ you.

---

### Github didn't handle it well, but lots better now

* Internal debate
* No moderation tooling
* No set definition of harrassment = **paralysis**

* Hurt users
* Silenced people
* Pushed people off platform

---

### Takeaways

* Build tools that **encourage good** behavior, _not_ policy to **punish bad** behavior.
* Community & Safety is not a nice to have, it is a _necessity_.
* Community Managers need tools
  * They are closest to context
* Get explicit consent
* Identify potential abuse vectors
* Reward good behavior

---

## Transforming Tribal Knowledge with Learning Trees

Jim Cole

---

Put things in Github Pages.

...with squirrel analogies.

---

## Crossing the Canyon of Cognizance: A Shared Adventure

Pamela Vickers

---

### "Kinda sucking at something is the first step at being kinda good at something."

1. Unconscious competence - You don't know what you know.
2. Conscious incompetence - You know what you don't know.
3. Conscious competence - You know what you know.
4. Unconscious incompetence - You don't know what you don't know.
5. Conscious competence of unconscious incompetence - You know that you know that you don't know what you don't know.

---

### Takeaways

1. Make a mind map to explain required skills
2. Trying to understand something is impossible without vocabulary
3. Keep tutorials up-to-date to help newbs

---

## Crossing the Language Divide in Open Source Projects

Aditya Mukerjee

---

### Enable non-English speakers to write code

* Easy
  * Translate documentation
  * Localize error messages
* Difficult
  * Encourage collaboration in any language
  * Bolting on i18n/l10n to development process after it has started

---

### Why not multilingual languages?

koro - write Go in Bengali

https://github.com/chimeracoder/koro

---

```go
package main

import "fmt"

ফ main(){
    যদি true {
    fmt.Println("Hello, world!")
  }
}
```

---

### Work so far

* Keywords
  * 115 additions, 6 deletions in patch to Go
  * Compiles, formats, converts back to English keywords
* Naming scheme WIP


---

### Takeaways

* Build a multilingual community from the start
* Enable volunteers to localize
* Reach out to specific popular communities

---

## Github Universe in review

![bg](portofsanfrancisco.jpg)

* Excellent food 👍
* Extravagant yet rustic 👍
* Kinda cliquey 👎
* *Conference* community absent 👎
  * `#githubuniverse` quiet 👎