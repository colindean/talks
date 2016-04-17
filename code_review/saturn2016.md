Code review is an architectural necessity
=========================================

SATURN 2016 Architecture Methods and Design Patterns track

30 minute experience report by [Colin Dean](http://cad.cx)

Abstract
--------
There's a wealth of material on code review from a code quality standpoint, tracking a host of metrics and generating enough Big Data to employ a small army of analysts at some companies, I'm sure. But introducing code review at the architecture stage seems to be rarely done, maybe even sufficiently rare to qualify as novel. In this presentation, I intend to focus on some quality attributes valued by a team that conscientiously conducts code reviews, and that code review enables, but not guarantees, these attributes in the team's systems' architecture: accountablility, accuracy, auditability, debugability, efficiency, evolvability, failure transparency, inspectability, learnability, maintainability, manageability, modularity, predicability, repeatability, safety, serviceability, simplicity, standards compliance, testability, traceability, and understandability. I posit based on my own meandering experience across several projects, open and proprietary, that these quality attributes are enabled through code review and saved from being a poorly timed afterthought or patch onto an architecture. To do so, I'll analogize lawyers, debt collectors, credit ratings, and more.

Session mechanics
-----------------
A very rough outline is available here: https://github.com/colindean/talks/blob/master/code_review/code_reviews.md

This outline as written is geared more toward convincing a group of people to employ code review in their workflow. My end goal is to cast code review in the list of an architectural necessity because of the quality attributes it values and enables, if the code review is thorough and conscientious. I've considering doing this particular talk using Takahashi Method, although I'm not committed to it.

Target audience
---------------
Folks who haven't tried code review or who do it but hate it and are willing to change their views.

Learning Outcomes
-----------------
I want attendees to walk away with a newfound appreciation for code review. They should be able to integrate code review not as merely an engineering process, but as a key part of an application's architecture.

Keywords
--------
code review
ownership
security
risk minimization
credit rating
lawyers
accountablility
accuracy
auditability
debugability
efficiency
evolvability
failure transparency
inspectability
learnability
maintainability
manageability
modularity
predicability
repeatability
safety
serviceability
simplicity
standards compliance
testability
traceability
understandability

Proposal Review Feedback
------------------------
_(summarized)_

* QA-centric code reviews certainly have their place in the architect's toolbox
* Experience report or repeatable approach grounded in practice is a really good topic for SATURN
* Pick a few QAs to highlight or suggest more important or most appropriate to ensure thorough code reviews
* Focus on the mechanics that makes code review a good tool for architecture and the QAs it aims to ensure
* In companies with code reviews, many architectural discussions happen in those reviews
* Identify _how early_ in the architecture exploration we could do reviews on the architecture itself
* Investigate how value of code reviews could be obtained in architecture exploration or evolution

Notes and references
-----
* [How to deliver a great SATURN 2016 presentation](https://insights.sei.cmu.edu/saturn/2015/09/how-to-deliver-a-great-saturn-2016-presentation.html)
