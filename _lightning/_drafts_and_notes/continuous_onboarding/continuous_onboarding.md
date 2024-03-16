---
title: Continuous Onboarding
keywords: [onboard, hack, destroy, repeat]
subtitle: |
    Automating inconvenience to decrease delay until productivity
    for new contributors and contributors recovering from data loss
author:
  - Colin Dean
theme: white
# css: custom.css
slideNumber: true
hash: true
history: true
transition: none
transitionSpeed: "fast"
totalTime: 300

---

# Continuous Onboarding

**Or, randomized re-onboarding**

_Or: How I Learned to Stop Worrying and Love the `rm -rf /`_

---

## Who Am I

![Colin Dean - @colindean](http://i.imgur.com/OQjWfCX.jpg){:relative_height='35' align='left' reflect_ratio='0.1' }

* Software Engineer @ Target
* Formerly IBM Watson, Vivísimo, Arcadia.io

---

## Obligatory statement

> All opinions are my own and not that of my employer(s).

Don't try this at home.

We've not _actually_ employed this anywhere.

Yet.

---

# Main points

1. Document onboarding
2. Automate onboarding
3. Destroy the dev environment regularly
4. Automatically rebuild environment

::: notes

This practice is meant to encourage teams to hone
their new-to-the-codebase developer experience to be so slick that
someone who loses their laptop or needs to just help out for a week or so on a project
can become productive in minutes, not hours or days.
It also encourages backups of important documents and 
creates a way that jewel code or company secrets _maybe_ don't live on mobile devices very long.

:::

---

# Why?

Forces good habits

* Document env for new hires
* Disaster recovery
  * Backup
  * Security policy adherence
* Limit intellectual property leaks

---

# Tools

* Configuration Management software
   * Ansible, etc.
* Home directory management software
   * GNU Stow, `chezmoi`, custom scripts
* Sledgehammer or thief
   * Old dying laptop? Go Office Space on it

---

### {background-image="https://cdn.thewirecutter.com/wp-content/uploads/2017/10/03-why-all-printers-suck-smash-500.gif"}

![Office Space printer scene](https://cdn.thewirecutter.com/wp-content/uploads/2017/10/03-why-all-printers-suck-smash-500.gif)

---

### {background-color="#669a2b"}

![Computer Reach logo](computer_reach.webp)

::: notes

Or maybe not. Donate your hardware, and maybe keep the storage media.
Put a drill through it.
Or give it a Viking funeral, ablaze on a raft into the water.

:::

---

# Original manifestation

---

```cron
30 16 * * 1-5 /opt/continuous_onboarding/bin/delete_one_percent_chance
```

> “At 16:30 on every day-of-week from Monday through Friday.”
> — [Crontab.guru](https://crontab.guru/#30_16_*_*_1-5)

---

```bash
if [ $(($RANDOM % 100)) -eq 86 ]; then
  for userdir in /home/*; do
    rm -rf /home/${userdir} &;
  done;
fi
```

---

## Problems

Too unforgiving

* No escape hatch
* No way to stop it during important things
* No way to save work
* Too likely to become too paranoid or fearful at a particular time of day

---

### People > Process

---

# Modern Technology for Modern Problems

---

## Ransomware

---

## New method

_Keep in mind that this is theoretical, and the amount of work necessary to build the software to do this right is "a lot"._

---

### One team member is chosen randomly per cycle

+ Per sprint or month; every other month for smaller teams
+ Less frequently than weekly
+ More frequently than quarterly
+ No person chosen more than twice in a row

---

### Frequency goal

optimize parameters for a **semi-annual experience** for each team member

---

### Data locked

- home directory archived and encrypted
- encryption key stored and distributed

---

### Encryption key

- distributed to the whole team
- use requires 2:N from peers, but their manager has the whole key

---

### Extenuating circumstances

> “This person has to present today but didn’t mark it on their calendar.”
> 
> “This workstation has 50 GB of data needed for work, and the person is working remotely on 5 Mbps DSL.”

---

### Escape hatch

local key storage with caveats

- "You can decrypt without restarting, but we'll tell _everyone_."

Discourages using the escape hatch _while not blocking important work_.

---

## Swear jar

---

# People > Process

--- 

# See Also

* [Graphite's Onboarding Roulette](https://graphite.dev/blog/onboarding-roulette)
  ([archive](https://web.archive.org/web/20240315110425/https://graphite.dev/blog/onboarding-roulette))
* [Lobste.rs comment in which I wrote more of this down](https://lobste.rs/s/mlek1h/onboarding_roulette_deleting_our#c_jsjuxt)
