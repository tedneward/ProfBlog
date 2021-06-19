title=Abstract Factory
date=2016-07-02
type=pattern
tags=creational patterns, patterns
status=published
description=A catalog of patterns, revisisted.
~~~~~~

*tl;dr* Patterns, 20 Years Later: The Abstract Factory pattern is often "combined", conceptually, together with [Factory Method](FactoryMethod.html) into a sort of uber-"Factory pattern". The two are distinctly separate in the Gang-of-Four literature, however, and for some pretty good reason, as the intentions are different. Subtly so, in some ways, but still different.

<!--more-->

## Problem
Provide an interface for creating families of related or dependent objects without specifying their concrete classes.

## Context
*A system should be independent of how its products are created, composed, and represented.* The example the GOF used was that of a portable GUI toolkit seeking to abstract over the different implementations of the same UI constructs: buttons, scrollbars, etc. However, any scenario in which a set of differing (yet usually similar) implementations that will be constructed from a client without the client being aware of the implementationally-different types is a candidate for Abstract Factory. In addition, the GOF example accidentally leads one to believe that only one of the different families of implementation classes would ever be used (one would not expect to instantiate Windows buttons on a Linux box, for example), but the pattern itself holds no such restriction.

*A system should be configured with one of multiple families of products.* Consider, for example, a case where an e-commerce system will need to use different "families of products" (meaning actual implementations) for calculating the tax and/or restrictions on a shopping cart, based on where the cart is being shipped. Thanks to the wildly different rules between countries (and the sub-state structures in those countries, like states in the US or provinces in Canada), this is often a non-trivial exercise that still needs to present a uniform interface. In this case, each cart can use the Abstract Factory to construct the appropriate (family of) tax-calculating object(s) to do the calculation.

* A family of related product objects is designed to be used together, and you need to enforce this constraint.* As much as it would be nice to trust that clients will not mix and match types not designed to work together, it's not always that simple, particularly when clients believe they "know better".

*You want to provide a class library of products, and you want to reveal just their interfaces, not their implementations.* The GOF saw interfaces (in a more Java/.NET sense) as the contract between clients and the actual implementation, but with the addition of function types as a a first-class citizen to most languages, single-method interfaces could be simplified down to functional signatures alone. However, because Abstract Factory tends to focus on the entities being constructed being one of a larger "family" of related types, these will likely remain traditional interfaces. (However, the underlying implementation is then entirely wide open.)

## Solution
In the classic Gang-of-Four solution, define an AbstractFactory type (typically an interface) which defines one or more "Create" methods declared to return instances of various AbstractProduct types (such as AbstractProductA or AbstractProductB), where the AbstractProducts are the types that want to abstract away the differences between target 1 and target 2. (In the GOF example, 1 and 2 were OS/2 Presentation Manager and OSX Motif, and A and B were Window and ScrollBar.) Then, clients would use an instance of the AbstractFactory to create the product instances they wished to use, and remain entirely ignorant of the actual implementation details.

Some questions arise out of this:

* *Where should the decision logic around which ConcreteProduct to construct be?* The Abstract Factory pattern assumes that the logic around which ConcreteProduct to build should be centralized in the ConcreteFactory for that particular product family; if that isn't the case, for some reason, then this starts to wander more into [Factory Method](FactoryMethod.html) territory.
* *From where does the client obtain the AbstractFactory instance?* The Gang-of-Four don't really come out and say this out loud---their examples (a MazeFactory) actually never show the actual construction of the ConcreteFactory that the client wishes to use, which then leaves open the more important question of whether the client is aware of which concrete subtypes it is actually constructing. They do mention the idea of using [Singleton](Singleton.html)s, which then negate the question of whether the client needs to know, since the Singleton could hide the actual implementation details, but that brings up some of the issues surrounding Singletons into the mix. The GOF also talk about the ConcreteFactory instances being [Prototype](Prototype.html)s, but here they assume that one ConcreteFactory would be responsible across many product families.
* *Does the product family itself need to change?* If the product family (the "A" and "B" in the Solution discussion above) needs to remain open-ended and extensible, then the AbstractFactory interface will undergo constant revision, and that will in turn necessitate changes to the various ConcreteFactory implementations. That kind of churn can cause serious stomach upset.
* *Do the products need to share implementation across families?* This is the kind of problem that frequently plague a single-implementation-inheritance language, since a given type can only inherit from one base, but in the case where AbstractProductA is an interface, a given implementation can inherit from as many interfaces as desired. (In fact, in some environments, the implementation can even tell what kind of interface it was invoked through, though in that scenario the implementation should probably be broken into separate implementation classes.)
* *Does the type of ConcreteProduct constructed mirror static type lines?* In other words, should the type of the ConcreteProduct constructed mirror a class hierarchy, or could it potentially change at runtime? If it does need to vary, then the ConcreteFactory will need to adjust at runtime, which is something the GOF never considered.
* *Do any of the ConcreteProduct types require parameterization?* The GOF examples assume that the constructed ConcreteProducts either require no paramterization to their construction, or that the ConcreteFactory knows all of the necessary parameters to do the construction. If this is not the case, then we have the unenviable situation where somehow different kinds of parameters need to somehow flow through the abstraction layer to the concrete layers, without violating the encapsulation that AbstractFactory tries to create.
* *What if there really isn't multiple product families?* More often than once, Abstract Factory is brought to bear because "someday, we may want a different version of this", without any identifiable reasons why a second product family might be necessary, or what it might look like. (The Java community was particularly prone to do this in the early 2000s.) While the use of the Abstract Factory still has a few benefits in such a case, the real benefit of an Abstract Factory is around multiple "parallel" product families.

## Implementations

## Consequences
Abstract Factory tends to lead to several consequences:

* *It isolates concrete classes.* The Abstract Factory pattern helps control the classes of objects that an application creates. Because a factory encapsulates the responsibility and the process of creating product objects, it isolates clients from implementation classes. Clients ,manipulate instances through their abstract interfaces. Product class names are isolated in the implementation of the concrete factory; they do not appear in client code. (This is strongly why most references to the "Factory pattern" are usually referencing this pattern.)
* *It makes exchanging product families easy.* The class of a concrete factory appears only once in an application---that is, where it's instantiated. This makes it easy to change the concrete factory an application uses. It can use different product configurations simply by changing the concrete factory. Because an Abstract Factory creates a complete family of products, the whole product family changes at once.
* *It promotes consistency among products.* When product objects in a family are designed to work together, it's important that an application use objects from only one family at a time. 
* *Supporting new kinds of products is difficult.* Extending abstract factories to produce new kinds of Products isn't easy. That's because the AbstractFactory interface fixes the set of products that can be created. Supporting new kinds of products requires extending the factory interface, which involves changing the AbstractFactory class and all of its subclasses.

## Variations
A couple of different takes on the AbstractFactory include:

### Registry
In some scenarios, we want to make use of an Abstract Factory (or [FactoryMethod](FactoryMethod.html) to return objects out of a bound set of subtypes based on some kind of parameterized request. (Classic examples are the Microsoft Windows use of the Windows Registry for COM object construction, or the JDBC DriverManager to construct JDBC Connection objects.) In this case, the Abstract Factory becomes a Registry of constructors (either [Constructor Function](ConstructorFunction.html)s or implementations of the AbstractFactory interface), using the parameters to decide which ConcreteProducts to construct.

In the traditional Abstract Factory, each method of the interface produces a separate ConcreteProduct; with parameterization, it's possible that fewer methods will be required, and thus reduce the burden that the Abstract Factory imposes regarding Abstract Product expansion/growth.

Note that the Registry will actually be a two-step process: first, the decision-making step in which the Registry decides which ConcreteFactory to use, and the second, the actual construction process. In languages that support them, either (or both) of these steps can be standalone functions (if the Creator has no other responsibilities, of course.)

### Factory Module
For some languages which support explicit module syntax and semantics, and top-level functions, the Abstract Factory can be buried behind the module interface, rather than an object instance, but providing the same kind of experience. Typically this will be more "large-scale" than the standard Abstract Factory, in that the module is always expected to be stateless or a [Singleton](Singleton.html), and as such, generally won't have much in the way of additional responsibilities. However, this also very neatly encapsulates the Concrete Factory implementation away from prying eyes, and relies on the language/platform's module system to find the appropriate Concrete Factory in question (whether that is encapsulated away from the client or not can be an implementation decision).

