title=Pattern Implementations
date=2016-07-02
type=pattern
tags=patterns, creational patterns, structural patterns, behavioral patterns
status=published
description=Notes about some implementations of various patterns, in various languages.
~~~~~~

Let's talk a bit about the various pattern implementations, the languages in which they are being written, and what to "get" out of them.

<!--more-->

## Goals
The "implementation" or "examples" section of any pattern discussion holds several goals (and a few "anti-goals"):

* ***Be able to put a concrete-ish example in front of people seeking such.*** It's hard to understand exactly how the pattern is supposed to work without pictures or code. I am not great with graphical tools, so for me it's easier to use code to provide that demonstration.
* ***NOT to expect "ready-made code" for reuse.*** Patterns are not drop-in building blocks that can save you time and energy when doing your own implementation. These examples are here to demonstrate a few techniques around implementation, but attempts to re-use the code directly will probably always meet with failure at some level.
* ***Demonstrate how to do certain things idiomatically within a particular language.*** Each language brings with it a particular idiomatic style or feature set that may shape how one might use a particular pattern. I am not an expert with all of these languages below, but part of this exercise (for me) is to learn (and document) how to exercise the idioms of a particular language using the pattern as a scaffold upon which to hang it.
* ***Provide a mechanism by which to concretely compare and contrast one pattern against another.*** Is a Strategy really all that close to a Command? Having concrete examples of each allows for a certain amount of comparison-and-contrast, and hopefully sparks some good discussion around when to use each.
* ***NOT to suggest that one language is "better" than another.*** Any such qualitative judgment around one language over another is entirely in the eyes of the beholder; no such judgement is intended from me, and any attempt to use this exercise as a means to judge one language more harshly than another will quickly earn this author's scorn. Different languages chose to do things in different ways for very good reasons; if you cannot explain the reasons, then you have no business offering up the judgement.

## Languages
In general, there's a long list of languages I will use to define some example implementations of the patterns in the catalog. Note that while this isn't an "ordered" list, meaning I will probably do implementations in a seemingly-random order, the hope is that when this is all said and done, the list of pattern implementations will range across the following:

#### C++
*An imperative, strongly-typed object-oriented language for native platforms.* This was one of the original laguages used for examples in the GOF book, and it would seem highly useful to revisit them now, particularly given the changes that C++ has seen since 1995.

Specifically, I will be looking for opportunities to incorporate C++11 and C++14 features into the pattern implementations, particularly templates (and the STL), exceptions, code blocks, and more. I will try to remain aware of the idiomatic approach to some of these, but since some are still freshly-minted, there may be no established idioms upon which to draw.

#### Swift
*An imperative, strongly-typed object-oriented language for the LLVM (iOS/Mac OS X) platform.* For the most part, Swift is pretty straightforward as a GOF pattern implementation language, since it more or less finds itself in the same space as its kin, C++, Java and C#. The example implementations were written starting after Swift 2.2 was released; Swift 3.0 is on the horizon, but no clear definition (as of this writing) as to what that feature set will/won't turn out to include.

Note that Swift has no "abstract class" or "abstract method" in the Swift 2.2 language, so as a result, where the code may require some form of method-definition-but-deliberately-without-an-implementation, we will use Swift's `preconditionFailure` method instead.

#### Kotlin
*An imperative, strongly-typed object-oriented language for the JVM platform.* You can't really mention Swift without also covering Kotlin; where Swift is the default language for doing iOS development, Google has made Kotlin the same for Android. And honestly, Kotlin is quickly becoming my go-to choice for doing things on the JVM, even over Java itself.

#### C# #
*An imperative, strongly-typed object-oriented language for the CLR platform.*

#### F# #
*An object/functional, strongly-typed language for the CLR platform.*

#### Java
*An imperative, strongly-typed object-oriented language for the JVM platform.* Java follows C++ in the object-oriented tradition, and as such is pretty closely relatable to the GOF patterns, with a few modifications. Java lacks a number of the syntactic features of the C++ family tree, but the gap is smaller now (as of 1.8) than it was fifteen years ago. For the most part, since lambdas and function literals are still very new in the Java ecosystem, pattern implementations will show both "with and without" scenarios, at least until such point as doing so gets either (a) tiresome, or (b) less necessary (owing to greater proliferation of lambdas/function literals through the Java ecosystem).

#### Scala
*An object/functional, strongly-typed language for the JVM platform.*

#### JavaScript
*An imperative, weakly-typed object-oriented interpreted language.*

JavaScript runs in browsers and on servers (using NodeJS), and will probably continue to extend its reach to a variety of other places as time goes on. JavaScript has been described in some quarters as being a functional language, but given that it lacks key critical functional features (partial application of functions, immutability by default), I do not consider it as such. I will also include implementations of ECMAScript6- and 7-oriented code, where it seems appropriate or important.

#### Python
*An imperative, weakly-typed object-oriented interpreted language.* Python is becoming ridiculously popular for a large number of reasons, and despite my earlier misgivings about the use of significant whitespace to denote scope blocks, after having toyed with it for a while, I'm starting to come around to the idea that maaaaaybe it's not so bad. It has some functional concepts like many of its peers, but again, it's not really a functional language because it lacks some of the critical things (immutability by default, partial evaluation, and so on) that make functional languages powerful. Useful, all the same, but not a functional language.

#### Ruby
*An imperative, weakly-typed object-oriented interpreted language.* Ruby is, in many ways, akin to JavaScript in its approach and feature list. It has just enough functional-like features (function literals, for example) that it can mimic some functional features, but like JavaScript, it cannot be called a "functional language" akin to Haskell or ML.


## Other languages
I also plan to explore some other languages, sometimes as an intellectual exercise (and as a way to practice writing code in those languages), sometimes because I think the language is going to gain more traction, and sometimes just because I'm intrigued. That list includes, but is not limited to:

#### Functional languages
* *[Yeti](http://research.tedneward.com/languages/jvm/yeti): an ML clone; a functional, strongly-typed for the JVM platform.*
* *[Haskell](http://research.tedneward.com/languages/haskell): one of the original pure functional languages; compiles to native platforms.* My Haskell is not great, however, so this will definitely be a learning exercise for me.
* *[Frege](http://research.tedneward.com/languages/jvm/frege): a Haskell clone; a functional, strongly-typed language for the JVM platform.* Quite frankly, if I'm going to learn a Haskell, I'll probably do it in Frege instead, since that runs on a platform I often care deeply about. Two birds, one stone.
* *[Elixir](http://research.tedneward.com/languages/elixir): a functional, weakly-typed language for the Erlang platform.* Like some others on this list, Elixir has some features that allow it to take advantage of some of these patterns.
* *[Erlang](http://research.tedneward.com/languages/erlang): a functional, strongly-typed language for the Erlang platform.*

#### Lisps
* *[Clojure](http://research.tedneward.com/languages/lisp/clojure): a Lisp; a weakly-typed functional language with a few object-interoperability features for the JVM platform.* My Clojure Fu is not as strong as I would like it to be, so I will periodically attempt a pattern in Clojure just to experiment and see how well/poorly I can implement said pattern.
* *[Scheme](http://research.tedneward.com/languages/lisp/scheme): one of the original Lisps; a functional, weakly-typed interpreted language.*

#### Dynamically-typed languages
* *[Lua](http://research.tedneward.com/languages/lua): an imperative, untyped, object-ish interpreted language.* Lua is a scripting language with only a very loose notion of objects (no inheritance to speak of, no class types to speak of), whose great claim to fame is that it is ridiculously easy to embed inside of a native application. (This is why Lua shows up so frequently inside of game engines.) This represents a pretty strong challenge to the patterns: can a language that lacks one of the core features the Gang-of-Four relied on---inheritance---still implement some of these patterns?
* *[Objective-C](http://research.tedneward.com/languages/objc): a weakly-typed object-oriented language for native platforms.* ObjC is more or less on its way "out" as the language of choice for Mac OSX/iOS, but I may periodically tinker with it as an implementation language, just for fun.

And of course I reserve the right to add a few more languages to the mix, if they're interesting. Because, in a lot of ways, while I hope that readers get a lot out of this, this whole exercise is more for me than anybody else.
