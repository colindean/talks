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

Notes from dry run
------------------

I stopped in minorly late and I have no clue what you’re talking about.
[1:03 PM]
ah, that was all about you
[1:03 PM]
whoa.
[1:03 PM]
relevant?
[1:08 PM]
I feel like your talk is gonna say ‘code review is good’ :stuck_out_tongue:
that seems like a given?
[1:16 PM]
Jean Lange on code review drives: you’re reading a lot.
[1:19 PM]
http://www.dictionary.com/browse/idiomaticity
Dictionary.com
the definition of idiomaticity
Idiomaticity definition, peculiar to or characteristic of a particular language
or dialect: idiomatic French. See more.

[1:23 PM]
also on ‘tips for thorough code review'
[1:24 PM]
bicker electronically: you recommend working in person
[1:24 PM]
but what if you can’t be in person?
[1:27 PM]
in review: your numbering seems weird? you mention ‘4th’ and ‘5th’ but not 3rd?
And I think you were referring to sub-bullets?
[1:27 PM]
jenny says: chop out most of the ‘about me’.
[1:27 PM]
andrew says: unless it’s about code review specifically.
[1:29 PM]
intertwine ‘about code review’ with ‘history’?
[1:29 PM]
krofcheck: really clear when you were reading. Bigger words. Harder for me to
follow. Faster. Speak to me!
[1:30 PM]
"I would have been much more engaged and followed the later part better if”...
you weren’t reading at me
[1:31 PM]
still John: talk about building the team (some of the stuff you put under
understandability and learnability are really about the team)
[1:31 PM]
steve: I would like to have the body of the talk focused on the assumption: you
believe in code review
[1:32 PM]
what you had was “therapeutic trash talk” - save those for the end, for
answering questions.
[1:32 PM]
could you use some examples? This code snippet is bad, how do we drive it to
get better?
[1:32 PM]
you say: that’s a separate talk.
[1:33 PM]
this is: from the software architect’s view, how does the black box of code
review fit into our architectural process?
[1:33 PM]
yo, did you say that?
[1:34 PM]
steve: I was sensitive to where you spent the time partly because the first two
talks were so much shorter. You weren’t really over time (but you were way
longer)
[1:34 PM]
"I was normalized to a lightning talk length" (edited)
[1:36 PM]
part of the intro to keep: I came to programming from journalism where review
is totally a normal part of the process. And yo, like physical printing and
committing. (edited)
[1:38 PM]
turge: I like your transitions
[1:39 PM]
steve: arrow transitions, I was reading it as filled in arrow is current topic
[1:40 PM]
I say: I agree that the reading parts were too fast and difficult to
understand. If you throw away some intro, slow down on those.
[1:40 PM]
we all liked the comic at the beginning!
