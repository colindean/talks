# Observability and Monitoring for Data Pipelines

* o11y programming practices
* "What to measure" - or, where to put counters, gauges, loglines, etc.
    * Quick overview of these concepts and where to use them
* Logging/counting exceptions
    * JVM: avoid exceptions as flow control altogether is the conventional wisdom
    * Python: [3.11 features zero-cost exceptions](https://bugs.python.org/issue40222);
      faster to use exceptions as flow control when if statement is false,
      per [this S.O. answer](https://stackoverflow.com/a/68408809/204052)
* Scrape vs push

## Goals

* Avoid tool-specific recommendations
* Probably use Python code examples except some in Scala
  (e.g. [log4s](https://github.com/Log4s/log4s))
