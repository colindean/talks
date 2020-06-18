---
title: Source Code Management with Git and GitHub Enterprise
author: Colin Dean
theme: white
css: custom.css
#hash: true
#history: true
transitionSpeed: "fast"
---

# Agenda

1. Terminology
2. Tools
3. Workflow
4. Best Practices

----

# Intent

* Introduce concepts
* Inform a base understanding
* Inspire further research

----

# Terminology

Lots of terms, acronyms & initialisms, and abbrev.

----

## Acronym: laser

## Initialism: FBI

----

## Initialisms

| Term | Meaning                |
|------|------------------------|
| SCM  | Source Code Management |
| VCS  | Version Control System |
| CI   | Continuous Integration |
| CD   | Continuous Deployment  |
| CR   | Code Review            |
| CLI  | Command Line Interface |

----

## Initialisms

| Term | Meaning                |
|------|------------------------|
| SSH  | Secure Shell           |
| GH   | GitHub                 |
| GHE  | GitHub Enterprise      |

----

<!-- terms have to be in groups of three due to length of descriptions, no more
than six items in a page -->

## Terms

| Term        | Meaning                                                               |
|-------------|-----------------------------------------------------------------------|
| Author      | The person who wrote the code                                         |
| Commit      | The encapsulation of a single change with a summary and description   |
| Committer   | The person who wrote the change summary                               |
| Reviewer    | The person reviewing the code changes                                 |

----

## Terms

| Term         | Meaning                                                               |
|--------------|-----------------------------------------------------------------------|
| Patchset     | A series of changes combined together as a body of work               |
| Pull Request | A concept modeling a proposed merging of two branches, also called a merge request |
| Code Review  | The process by which peers review code with constructive criticism    |

----

# Tools

| Term   | Meaning                                                 |
|--------|---------------------------------------------------------|
| Git    | The predominately-used distributed VCS                  |
| GitHub | A popular centralized SCM, CR, and collaboration system |
| Hub    | A popular CLI tool for interacting with the GitHub API  |

----

# GitHub Public vs GitHub Enterprise

* GHE lags behind public
* Most features are the same
* Sometimes need to specify which when referencing

----

# Workflow

0. Clone
1. Branch
2. Edit
3. Test
4. Commit
5. Push
6. Pull Request
7. Merge
8. Pull

----

### Git + GitHub Workflow Diagram

```{.graphviz caption="Git+GitHub workflow"}
digraph git_github_workflow {
  rankdir=LR;
  size="9,9"

  graph [fontname = "helvetica"];
  node [fontname = "helvetica"];
  edge [fontname = "helvetica"];

  node [shape = point ]; start
  node [shape = octagon, label = "Clean\nClone"]; clean_local_repo
  node [shape = doubleoctagon, label = "Working\nCopy"]; working_copy
  node [shape = tripleoctagon, label = "Dirty\nWorking\nCopy"]; dirty_working
  node [shape = square, label = "Working\nBranch"]; working_branch
  node [shape = circle, label = "Remote\nBranch"]; pushed
  node [share = circle, label = "PR'd"]; open_pr
  node [share = circle, label = "Merged"]; merged

  start -> clean_local_repo [ label = "Clone" ];
  clean_local_repo -> working_copy [ label = "Branch" ];
  working_copy -> dirty_working [ label = "Edit" ];
  dirty_working -> dirty_working [ label = "Test & Refactor" ];
  dirty_working -> working_branch [ label = "Commit" ];
  working_branch -> pushed [ label = "Push" ];
  pushed -> open_pr [ label = "Pull Request" ];
  open_pr -> merged [ label = "Merge" ];
  merged -> clean_local_repo [ label = "Pull" ];
}
```

----

# Clone

    git clone git@git.example.com:colindean/talks.git
    git clone https://git.example.com/colindean/talks.git

_Use SSH whenever possible._

----

# Branch

    git switch -c colindean_87_fixes-stuff

_Many teams have branch naming conventions._

----

# Edit & Test

Do the thing! Write the tests!

----

# Commit

    git add newfile.txt
    git commit -av

_Write browsable summaries and detailed body text._

----

# Commit summaries

## Bad 🚫

"Updates image URL"

## Good ♥️

"Fixes broken image because of outdated URL"

----

![XKCD 1296](https://imgs.xkcd.com/comics/git_commit_2x.png){height=400px}

----

# Push

    git push -u origin HEAD
    git push # subsequent pushes

Push to store your work, even if you don't open a…

----

# Pull Request

    hub pull-request

or create it on GitHub.

CI/CD will test your code and report.

----

# Code Review

Follow your team's best practices.

Use GitHub's guide.

Watch conference talks from:

* Adrienne Tacke
* Aaron Goldsmith
* Amy Gebhardt
* Colin Dean

# Best Practices

----

# Ask for help

![XKCD 1597](https://imgs.xkcd.com/comics/git_2x.png){width=35%}

----

# Do not use the force

Bad:

    git push --force

Lease, don't own:

    git push --force-with-lease

----

# The best `git` best practices presentation

[Deliberate Git](https://vimeo.com/72762735)

`https://vimeo.com/72762735`
