# Historical Modeling with Rust

## Notes

* Changes, not state
* Better than:
    * System log - what to do with all of these logs?
    * Audit log - logging in-application but what if it gets inconsistent
      since it's a human putting the log call there?
    * Event sourcing - Everything becomes events but this is very complex to
      program and manage
* Introduced to the concept at CodeMash 2017 by Michael Perry, its originator
* Some HM techniques present in a Rails app I co-wrote but lots of work to do
  to make it actually fully HM-full
* [Diesel](http://diesel.rs) is a Rust ORM
* Why Rust?
    * Why not?
    * Rust is about making fast code safer
    * Make databases safer by _never deleting anything_

## Links

* <http://historicalmodeling.com>
* <http://diesel.rs> - <https://github.com/diesel-rs/diesel>
