title=On Functional Programming in Java
date=2013-01-21
type=post
tags=industry, java, functional programming, reading
status=published
description=In which I respond to a criticism of using FP in Java.
~~~~~~

<p>Elliott Rusty Harold is <a href="http://cafe.elharo.com/programming/java-programming/why-functional-programming-in-java-is-dangerous/">blogging that functional programming in Java is dangerous</a>. He's wrong, and he's way late to the party on this one--it's coming to Java whether he likes it or not.</p>

<!--more-->

<p>Go read his post first, while I try to sum up the reasons he cites for saying it's dangerous:
<ol>
<li>Java is not a lazy-evaluated language. Programmers in Java will screw up and create heap and stack errors as a result.</li>
<li>See? Here's a naive implementation of Clojure code taken directly over to Java and look how it blows up.</li>
<li>Programmers can do bad things with this idea, so therefore we should avoid it.</li>
<li>Oh, and by the way, it's "dangerously inefficient" in Java/JVM, even though I offer no perf benchmarks or comparisons to back this statement, and I'm somehow ignoring that Clojure and Scala run on the JVM as well, apparently without problem.</li>
</ol>
That kind of about sums it up, I think.</p>

<p>Look, as Elliott points out, Java is not Haskell. Neither is it Lisp. It's its own language, rooted in imperative and object-oriented history, but no less able to incorporate functional features into its development than Lisp could incorporate object-oriented features. However, if you do stupid things, like trying to re-create an infinite (implicitly lazily-evaluated) list in Clojure by creating an actualized list that stretches to infinity... you're going to blow the JVM up. Duh. Not even the supercomputer on the USS Enterprise five hundred years from now will be able to construct that list.</p>

<p>Porting code from one language to another is not a trivial exercise. If you attempt to port line-for-line and expression-for-expression, you can expect that your ported code will not be idiomatically correct. (I know this already, having <a href="http://blogs.tedneward.com/2012/12/21/Envoy+In+Scala+JavaScript+And+More.aspx">done the exercise myself</a>.) The root of the problem in his ported code is twofold. One, he (rather foolishly and in elegant strawman fashion) badly simulates what an infinite list would look like in Java--a commenter does the better job by showing how an Iterator can be made to perform the same thing that Haskell actually does under the hood by producing the next value on demand, rather than trying to create a list of Integers stretching to infinity. For someone who professes to have some Haskell experience and love, it surprises me that Elliott makes this kind of mistake, which leads me to conclude that he's trying to create the strawman. Two, he assumes that anyone who programs in Java functionally will have to create all of their functional tools by hand, and frankly, using Guava or FJ here would make this code sample a LOT easier to swallow. The fact that he ignores both of these in his stawman again sort of reinforces the idea that he's deliberately crippling his strawman to make his point.</p>

<p>His underlying point, though, seems to be simple: "I work with bad programmers, who don't seem to understand how to write code functionally in Java without screwing it up." Dude. Sucks to be you. "Bad programmers will move heaven and earth to do the wrong thing." --Glenn Vanderburg.</p>

<p>What really sucks for him is that these features are coming in Java 8, including lambda expressions and library support including a Stream interface that will allow for exactly this kind of code to be written without pain. Those programmers Elliott is working with are going to be even more on fire to use their functional approaches (and all the associated goodness of doing so, including composability and what-not) in their Java code. What might make Elliott more happy is that at least they won't have written it; it'll all be written by guys much smarter than any of them.</p>
 
