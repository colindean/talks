# Scala conversion therapy: Mixing Scala and Java and eventually going full Scala

* Bloch-style builders for using Scala named parameters
* Identifying models: extract models into case classes, wrap with functionality
* Know interop patterns that will fail (implicits, AnyVal extended classes)

## General process notes influenced heavily by [Carol (Nichols||Goulding)](https://github.com/carols10cents)'s Pgh Techfest talk

* Identify _good_ reasons and _bad_ reasons to move to Scala from Java
  * Good:
    1. Performance
    2. Specificity
    3. Lower maintenance cost associated with less code and thus less room for human error
    4. Rewriting or refactoring almost always _improves_ code
  * Bad:
    1. Boredom
    2. Job security
    3. If you need to maintain 100% full compatibility with Java and don't want to compromise a little strictness in order to make backwards compatibility happen.
* Improve tests of Java system in order to understand current behavior and catch regressions.
* Make incremental changes, one object or package at a time.
  * Find isolated subsystems in a UML diagram, for example.
  * Private methods are great for refactoring first
* Use IntelliJ's "Convert to Scala" functionality, it does a pretty decent job of typing for you to save versus syntax problems.
  * Use code inspection to make suggested improvements to align with Scala style
* Run tests constantly. Use sbt ~testQuick, guard, or whatever your build system provides.
* Observe benefits of Scala

# Links

* [Sharing Our Experience With Scala at Smaato](http://blog.smaato.com/sharing-experience-scala-programming-language)
* [Variance in Java and Scala](https://medium.com/@sinisalouc/variance-in-java-and-scala-63af925d21dc#.nee13u5af)
* http://manuel.bernhardt.io/2015/11/13/5-years-of-scala-and-counting-debunking-some-myths-about-the-language-and-its-environment/
* https://m50d.github.io/2015/11/16/my-five-years.html
* [Carol (Nichols||Goulding)](https://github.com/carols10cents)'s talk [Rust out your C](https://github.com/PghTechFest/PghTechFest2016/blob/master/rust-out-your-c-carol-nichols-or-goulding.pdf) from [Pgh Techfest 2016](https://github.com/PghTechFest/PghTechFest2016)
