title=Patterns Catalog
date=2013-08-25
type=patternsindex
tags=patterns
status=published
description=Index to all the patterns.
patternfilter=pattern
~~~~~~

The overall pattern catalog. The goals of this enterprise are admittedly audacious: to not only re-visit the original Gang-of-Four patterns, bringing them "up to speed" with modern languages and idioms, but also to incorporate concepts from functional (and object/functional hybrid) languages.

Note that these are "design patterns", meaning they are at the level of software implementation design, not "architectural" patterns (such as what we might find from Martin Fowler's "Patterns of Enterprise Application Architecture").

This roughly follows the same format as the original Gang-of-Four patterns catalog, but with a few changes.

* The original patterns are not duplicated in their entirety*. This is deliberate, in that I wish to avoid any copyright infringement and I want to encourage those who have not read the original book to procure a copy and do so.

* The patterns are cast into a "simpler" form.* Rather than the long form the GOF used, I have chosen to try and "simplify" the patterns by following a Problem/Solution/Context/Consequences format, with particular emphasis on Context and Consequences. A few Variations on the patterns have emerged over time, so I try to capture those, as well.

* Some additional patterns are described here.
    
* In seeking to bring the patterns up to "modern times" and languages, I have chosen to add a few more patterns that I think we have discovered along the way. These, in particular, should be treated with some level of skepticism and suspicion, as they have not been properly workshopped. Additionally, I will be going back through much of my patterns library and looking for additional patterns that seem to fit the rough category the GOF book occupied, and add them here (again, with some level of modernizing, if necessary).

This catalog is a continual work-in-progress; as more patterns are added to the catalog, their links will become active. Readers are encouraged to comment liberally, provide alternative implementations and/or suggest different language-specfic idioms, and/or participate in whatever fashion feels meaningful.

By the way, this will take time to flesh everything out, so please, be patient. I promise I'm trying to get to these as fast as I can without doing an ugly job of it.

The full index is at the bottom of this page, along with the implementations (in a separate list below that).

## [Creational patterns](creational/)
Patterns which specifically deal with the creation of objects/entities in the code. Includes [Abstract Factory](creational/AbstractFactory), [Builder](creational/Builder), [Factory Method](creational/FactoryMethod), [Prototype](creational/Prototype), and [Singleton](creational/Singleton) from the GOF book.

I've added [Constructor Function](creational/ConstructorFunction).

## [Structural patterns](structural/)
Patterns which describe the structural (usually compile-time-related, in langauges which are compiled) relationship between one entity and another. Includes [Adapter](structural/Adapter), [Bridge](structural/Bridge), [Composite](structural/Composite), [Decorator](structural/Decorator), [Facade](structural/Facade), [Flyweight](structural/Flyweight), and [Proxy](structural/Proxy). 

I've added [Closure-based State](structural/ClosureBasedState), [Context Object](structural/ContextObject), [Dynamic Object](structural/DynamicObject), and [Message-Passing Interface](structural/MessagePassingInterface).

## [Behavioral patterns](behavioral/)
Patterns which describe the runtime relationship between one entity and another, and the flow of control between them. Includes [Chain of Responsibility](behavioral/ChainOfResponsibility), [Command](behavioral/Command), [Interpreter](behavioral/Interpreter), [Mediator](behavioral/Mediator), [Memento](behavioral/Memento), [Observer](behavioral/Observer), [State](behavioral/State), [Strategy](behavioral/Strategy), [Template Method](behavioral/TemplateMethod), and [Visitor](behavioral/Visitor).

[Iterator](behavioral/Iterator/) is here, too, but as a pattern it is often subsumed into the language directly--though seeing as a discrete pattern helps when looking at the seemingly near-infinite number of variants on it.

One interesting "pivot" around Strategy is the Function Object: These two patterns are so close as to be almost intertwined; however, there are some definite subtle differences that I'll call out as part of the Strategy discussion. The concept of a Strategy is not tied directly to a function, and a Function Object need not always be a Strategy. I'm choosing (for now) to put that discussion under Strategy, but given even a small push I could be convinced that it should be its own pattern.

I've added [Null Object](behavioral/NullObject).

## Additional pattern language(s)
I've run across a few that I haven't yet been able to categorize in the above, and I don't want to lose track of them.

* [Context](../blog/2008/what-about-context) was a pattern I wrote up a while back; it probably belongs in here somewhere, along with some implementations to demonstrate it.

* [Envoy](../blog/2012/envoy-in-scala-javascript-and-more) This is a set of patterns around how to accomplish various functional ideas. The author originally demonstrated all of his examples in Scheme; a while back [I blogged](../blog/2012/envoy-in-scala-javascript-and-more) about how to implement the patterns in a few other languages. I fully intend to examine each of these and think about where they fit in the above, or, if not, what the new category should be.

    * Function as Object
      (Almost certainly a synonym for Strategy in its simplest form, or vice versa, depending on how we want to look at it.)
    * Closure
        (I'm calling this "[Closure-based State](structural/ClosureBasedState)")
    * [Constructor Function](creational/ConstructorFunction)
    * Method Selector
        (I think this is basically the Dynamic Object, above, but there are some nuances)
    * Message-Passing Interface
        (An MPI is definitely related to a Dynamic Object, but despite the name, the two are definitely different patterns; one allows for substantial runtime modification of an object, and the other represents how the object presents itself---its interface---to the world.)
    * Generic Function
    * Delegation
        (I think this is also part of Dynamic Object; that, or Decorator)
    * Private Method
        (This is probably an idiom for functional languages, not a full pattern, per se)

* Kuhne's ["Functional Pattern System for Object-Oriented Design"](http://homepages.ecs.vuw.ac.nz/~tk/fps/): Thomas Kuhne wrote his thesis (the above title) on patterns of functional style in OO systems, and his patterns would seem to have direct bearing on this effort. (I was fortunate enough to see an early draft of the work back in the late 90's, and his hand-signed copy of the printed thesis is one of my book treasures.) Again, I'll look for ways to incorporate them into the larger collection here.
  
    * Function Object
        (Like the Function as Object from Envoy, I think this is a Strategy or something similar to it)
    * Lazy Object
    * Value Object
    * Transfold
    * Void Value
    * Translator
  
* Monads/monoids. These staples of the functional community seem, to me, to be patterns, but with a bit more rigor implied to them. "Arrows" may be in a similar category.

I also plan to go back through some of my patterns books (such as the "Pattern Languages of Program Design" books that were published in the late 90's/early 00's) and cherry-pick some that seem to fit in the above categorization scheme.

In other words, this is going to be a *long* work in progress.

## Implementations
I have notes around the different pattern implementations (and the languages in which I am choosing to do them) [here](./PatternImplementations.html). However, the implementations will always appear in a separate page from the pattern itself, owing to the fact that (a) I want to explore several languages around each pattern, and it would make each pattern page extremely long to have them all in one place, but also (b) patterns can and should be language-independent, and therefore it makes sense to me to split them apart.
