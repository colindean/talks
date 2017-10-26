# time tracking with ledger

Command-line accounting tools are fun

---

# so you track time?

i, too, track time

---

# why do developers track time?

* billing
* billing
* remembering
* ensuring work/life balance

---

# why do developers track time?

* billing
* billing
* remembering
* **ensuring work/life balance**

---

# tools

* `ledger` - ledger-cli.org
* `t` - https://github.com/colindean/hejmo/blob/master/scripts/t

(I promise it'll get better if others clamor)

---

# Basic `t` usage

```
$ t in Taskname
$ t sw OtherTask
$ t out
```

---

# Forgot something?

```
$ t log 09:15 11:45 Coding
$ t edit
```

It's just a text file.

---

# Basic daily reporting

```
$ t hours
               8.47h  N
               1.03h    Development
               1.04h    Email
               5.90h    Meeting
               24.1m      IT
               4.50h      Recruiting:Interview
               30.0m    Training:Podcasts
--------------------
               8.47h
```

---

# Listing projects

![](projects.png)

---

# Time sheet

```
$ t sheet
```

Easy.

---
