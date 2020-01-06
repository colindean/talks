# Document Workflow talk submissions

## Write the Docs 2020

### Title

Building a content-focused, scientific document authoring workflow for Data Scientists and Engineers alike

### Talk Abstract

I observed a white paper authoring collaboration workflow problem at my Forbes 50 employer wherein a tedious workflow around legacy tooling caused undue stress, headaches, rework, and, ultimately, a cosmetically poor-looking document with inconsistent content _and_ styles. Knowing that a good document requires both good content and presentation, I proposed and led the creation of a simple workflow amenable to our team's software engineers and data scientists: treating the white paper text as code with technologies including Markdown, GitHub Enterprise, Pandoc, LaTeX, and a review process that gets the tooling out of the way in order to enable content authors to focus less on logistics and more on writing and reviewing.

The result was that a team of seven engineers and data scientists created a 50-page document containing text, diagrams, equations, graphics, and more in just two weeks. The result greatly pleased our directors and executives. They praised our team not only for the incredibly valuable content, but also the professional appearance of the document. When they learned about the peer review process we used to create it, they wanted more teams to use it.

This talk focuses on the problems of passing around files by email or shared drives, the problems of collaborative editing of online documentation, and the problems we're still addressing in our solution that we've now used to author several significant internal documents.

### Who and Why

This talk is aimed primarily at software engineers who value document aesthetics as much as content and who have a team that values or aspires to value documentation as much as code. This simple system is approachable by anyone who can write documents with Markdown formatting. With some automation, the need for an engineer overseeing the project goes away entirely.

After listening to this talk, the audience will be able to:

* Understand the value of treating documents like code and have methods to facilitate this.
* Use the code review tool of their choice for document change reviews
* Discover easy-to-use command line tools for building professional-looking documents
* Live in a world where Markdown and LaTeX work together like Python and Assembly language
* Replace cumbersome, error-prone workflows with one that makes almost everyone happier

### Unsubmitted notes

Months ago, I identified a disconnect between several teams at my Forbes 50 employer. Some teams wrote white papers using Microsoft Word, passing a file around via email or OneDrive. One person was in charge of "reviewing changes" or merging multiple versions when two people concurrently reviewed a revision. Seeing the problems of this, other teams wrote documents using Confluence or MediaWiki. Concurrent editing was still a problem and reviews suffered. Last change in was the victor.
