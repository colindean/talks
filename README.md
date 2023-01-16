Talks by Colin Dean
===================

Quick Links
-----------

|[![SpeakerDeck](https://img.shields.io/static/v1?label=Speaker%20Deck&logo=speakerdeck&message=Slides&style=flat&color=009287&logoColor=009287)](https://speakerdeck.com/colindean)|[![Sessionize](https://img.shields.io/static/v1?label=Sessionize&logo=Sessionize&message=Proposals&style=flat&color=1AB394)](https://sessionize.com/colin-dean/)|[![Papercall](https://img.shields.io/static/v1?label=Papercall&message=Proposals&color=FC611F)](https://www.papercall.io/speakers/colindean)|[![YouTube playlist](https://img.shields.io/static/v1?label=YouTube&message=Videos&color=FF0000&logo=youtube&logoColor=FF0000)](https://www.youtube.com/playlist?list=PLd9Sormn4MEL-dTa_2kEHaRqG11zuhQms)
|---|---|---|---|

Introduction
------------

This repository is an archive of the various talks I am writing, have written,
and/or have delivered. All talks are original unless noted in the talk or its
directory.

Each talk is in its own directory, and I'll try to remember to tag whenever I've
finalized a talk I delivered.

Contributing
------------

Posting my presentation work online for the world to see has its benefits!

Did you find a bug in example code? Did you find a typographical error? Did you
find a factual error? Please submit a pull request or file an issue.

Colophon
--------

I generally use either [Apple Keynote](https://www.apple.com/mac/keynote/)
or [Pandoc](https://pandoc.org) + [Reveal.js](https://revealjs.com/) for my presentations. 
Sometimes, I'll use Google Slides if I need something fast or I start it on a mobile device.

For exporting PDFs, I generally use the built-in functionality of Keynote but I've heard that
[better-keynote-export](https://github.com/mcfunley/better-keynote-export) works well.
For browser-based systems, I'll simply print from the browser or use a headless browser to export.

For older presentations, I've used

* [Rabbit](http://rabbit-shocker.org/en/), presentations written in Markdown 
  using Rabbit's [special
syntax](http://rabbit-shocker.org/en/sample/markdown/rabbit.html)
* [Marp](https://github.com/yhatt/marp) or [Marp Next](https://marp.app),
  a batteries-included tool for Markdown-formatted presentations
  
### CLI Demonstrations

When necessary, some tools are available to facilitate this:

* [asciinema](https://github.com/asciinema/asciinema) - produces asciicast files for character-perfect playback
* [svg-term-cli](https://github.com/marionebl/svg-term-cli) - convert asciicast to SVG, for gorgeos web-based playback
* [asciinema gif generator (agg)](https://github.com/asciinema/agg) - convert asciicast to GIF, reduce filesize with [gifsicle](https://github.com/kohler/gifsicle)

Always prefer asciinema to a screen recorder for presentation capture.
Embed the gif or a video version of it ([gif2mp4?](https://github.com/colindean/hejmo/blob/master/scripts/gif2mp4)) in fancier slides apps that don't have asciicast integration.

See also [How to share terminal demos as razor-sharp animated SVG](https://wasimlorgat.com/tils/how-to-share-terminal-demos-as-razor-sharp-animated-svg.html).

Principles of Authorship and Delivery
-------------------------------------

### Abstracts

* Abstracts should be written in inverse pyramid style. That is, the first sentence or paragraph should have as much information as possible while the last sentence should be ancillary information that almost could be omitted.

### Slides

* If there is a sentence on a slide, it is the only sentence on the slide.
* No numbered lists greater than 10 items, exceptions for steps or outlines
  * List item text may only wrap if there are fewer than four items in the list
* No more than one graphic per slide.
* The complexity of a graphic indicates how long it should be displayed:
  * Memes (avoid, in general) - long enough for a laugh, but if you have to explain it, it's not appropriate
  * Graphs and charts - It's OK to show it quickly if only demonstrating a trend and not pointing out specific features of the graph. The figure must still be proper, with a title, legend, axis labels, etc., to stand up to scrutiny.
* Title slide should identify the speaker, a URL, and relevant contact info.
* End slide should identify the speaker, a URL, and relevant contact info.
* The URL for the talk should be its directory within this repository.
* The contact information should include Twitter handle, event hash tag, and a talk hash tag.
* The color scheme must be readable at no less than 30 ft away.
* The color yellow shall not be seen, except when grouped logically with red and green.
* The slides shall be numbered, but the total number of slides shall be
  optionally displayed.
* Slide text should be no smaller than 40pt if it is the main text on the slide.
  Smaller sizes can be used for footnotes useful for those reviewing the slides
  later.
* Contrast must be visible on crappy projectors.
  * Gray on a black background shall be no darker than 30%.
  * Gray on a white background shall be no lighter than 70%.
  * Avoid using black and gray to distinguish text, instead use capitalization
    or a different font, i.e a serif and a sans-serif font together.

### Audience Management

* *Do not* take questions *during* the talk
* Do not take questions *after* the talk, unless there are more than five minutes remaining in the session.
  * Take no more than one question per two minutes available.
  * Do not be afraid to respond with "That's a great question, but I cannot answer it succinctly in the time available."

### Demonstrations

* Avoid live or replayed CLI demos because it is too easy for the audience to
  miss some key detail or lose the signal amid the noise of log output.
  * Live demos can go horribly wrong out of human error or remote service unavailability.
  * Playback of recorded demos must nearly always be accelerated because— let's be honest— watching CLI is often like watching paint dry.
* Pre-record _always_ when demonstrating something. There's no shame in producing a pre-baked cake when all you're saving the audience is time for chemistry and physics to do their thing.

Choice Quotes for Inspiration
-----------------------------

> If you can’t write your message in a sentence, you can’t say it in an hour.
*Dianna Booher*

> There are always three speeches, for every one you actually gave. The one you
practiced, the one you gave, and the one you wish you gave.
*Dale Carnegie*

> He who wants to persuade should put his trust not in the right argument, but
in the right word. The power of sound has always been greater than
the power of sense. *Joseph Conrad*

> Best way to conquer stage fright is to know what you’re talking about.
*Michael H Mescon*

> 90% of how well the talk will go is determined before the speaker steps on the platform.
*Somers White*

> Great is the art of beginning, but greater the art is of ending.
*Henry Wadsworth Longfellow*

> Criticism comes easier than craftsmanship.
*Zeuxis*

Choice Articles on Process
--------------------------

* [[Eileen Uchitelle's] Process for Writing
  a Talk](http://eileencodes.com/posts/my-process-for-writing-a-talk/)
* [Don't Take Questions from the Stage](http://baugues.com/questions) by [Greg Baugues](https://twitter.com/greggyb)
* [The Ultimate Guide To Memorable Tech Talks](https://medium.com/@nnja/the-ultimate-guide-to-memorable-tech-talks-e7c350778d4b), a series by [Nina Zakharenko](https://twitter.com/@nnja)
* [Duarte's Resources list](https://www.duarte.com/resources/)

License
-------

Unless otherwise stated in a talk's individual directory, each talk is licensed
under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view
a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/.

Any code examples included in the directory for a talk, but not embedded in the
talk itself, are licensed under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

Special Note
------------

The opinions and recommendations presented in these talks are my own, and do not
necessarily reflect the beliefs or recommendations of my employer(s)
past, future, or present.
