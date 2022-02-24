title=Behavioral Patterns
date=2021-06-08
type=patternsindex
tags=patterns
status=published
description=Behavioral Patterns, 20 years later
patternfilter=behavioral
~~~~~~

***tl;dr*** Behavioral patterns specifically deal with the flow of control and being able to change, modify, capture, or segment that flow of control that contributes to the larger whole. They abstract the flow in some way "above" that of a single method or procedure call, so that the flow can be decoupled, disconnected, or adjusted at runtime in some fashion. They help make a system more independent of how flow is captured, allowing for composition and/or creation without requiring a full rebuild of the system.

<!--more-->

The Gang of Four wrote:

> Behavioral patterns are concerned with algorithms and the assignment of responsibilities between objects. Behavioral patterns describe not just patterns of objects or classes but also the patterns of communication between them. These patterns characterize complex control flow that's difficult to follow at run-time. They shift your focus away from flow of control to let you concentratejust on the way objects are interconnected.

Behavioral patterns feel like one of the hardest ones to classify, because they tend to use structure (inheritance and the like) to help direct and shift the flow of control, and that's sometimes hard to separate from [Structural](../structural/) patterns on the surface of things. In general, though, the original intent is still there: behavioral patterns' focus is on the flow of control and operations through (typically) a collection of objects (or functions), and the physical structure is there simply to aid and abet in that flow somehow--either by making it easier to chain that flow ([Chain of Responsibility](./ChainOfResponsibility/)), or modify that flow ([Null Object](./NullObject/)), or represent the flow as a discernible object ([Command](./Command/)). It's all about going with the flow.

### Segregation
Initially, the Gang of Four "split" the creational patterns into "class" and "object", based on the idea that "class" made use of inheritance to vary the class being created, whereas "object" delegated instantiation to another object. In the world 20 years later where (a) inheritance is no longer the huge force that it was back in 1995, and (b) functional and dynamic languages don't stress inheritance anywhere nearly as strongly as an object-oriented language would, it's not clear whether this distinction is still meritable.

> Behavioral class patterns use inheritance to distribute behavior between classes. .... [Template Method](./TemplateMethod/) (325)is the simpler and more common of the two. A template method is an abstract definition of an algorithm. It defines the algorithm step by step. Each step invokes either an abstract operation or a primitive operation. A subclass fleshes out the algorithm by defining the abstract operations. The other behavioral class pattern is [Interpreter](./Interpreter/) (243), which represents a grammar as a class hierarchy and implements an interpreter as an operation on instances of these classes.

> Behavioral object patterns use object composition rather than inheritance. Some describe how a group of peer objects cooperate to perform a task that no single object
can carry out by itself. An important issue here is how peer objects know about each
other. Peers could maintain explicit references to each other, but that would increase
their coupling. In the extreme, every object would know about every other. The Mediator (273)pattern avoids this by introducing a mediator object between peers. The
mediator provides the indirection needed for loose coupling.

For those languages that support inheritance, obviously it continues to be a viable option, but functional languages--in particular currying and partial function application--offers up a number of options that don't require inheritance. Much of the "revisisted" here will be about using functional operations (sometimes in conjunction with object tools, sometimes standlone) to help make it easier to capture and use behavioral patterns. The ability to pass functions as first-class values opens up a lot of options, and in many cases makes the implementation of a particular pattern's intent easier.

(Deeper breakout of each pattern here: Chain of Responsibility, Command, Continuation Chain, Interpreter, Mediator, Memento, NullObject, Observer, State, Strategy, Template Method, Visitor.)
