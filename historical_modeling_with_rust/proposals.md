# Proposals submitted

## CodeMash 2019

|Thing | Value |
|------|-------|
|Session title  |Historical Modeling with Rust
|Session format |General session
|Track|Programming Principles|
|Level|Intermediate|

### Description/Abstract

Historical Modeling is a database persistence technique which favors recording of historical events as a series of facts instead of as a set of events that can be replayed to reach a state or as a preservation of present state with complex logic necessary for more than one source of state to reach consistency. This technique promises to record all changes that occur to a system in domain-specific logic, recognizing update and delete actions instead as the creation of data the alters the current presentable state. This results in a database schema that is append-only, a concept that greatly reduces the complexity of reaching that desirable, consistent state in a distributed or decentralized application.

Rust is a systems programming language geared toward type-safe modeling along with fearless concurrency. Given Rust's promises of memory-safe operations in which a programmer need not worry about deleting data manually, it seems appropriate to talk about how implementation of historical modeling, the next generation of data persistence, makes sense in Rust, a next generation systems programming language.

I'll be showing off a simple implementation of an application implemented in Rust using a combination of Rust's finest "crates" libraries.

### Notes for Organizers

I learned about historical modeling at CodeMash last year, my first year in attendance. I was fascinated by it and immediately began implementing it in an app I was working on. The app to be presented is not that app.

I would be a second-time CodeMash attendee and first time speaker at CodeMash.
