title=The Shapes of Data: Object
date=2025-2-3
type=post
tags=engineering, storage, database
status=published
description=Object-shaped data is often characterized by one-way references between clusters of data grouped together by a few key concepts.
~~~~~~

**tl;dr** Objects, despite being the most common tool form of mainstream programming languages, are often not as well-understood as a data concept as one might think. In an object data model, entities are defined as unions of state and behavior (and behavior is often of much less concern to the data modeler) that in turn can be related to other objects through a variety of mechanisms (type, ownership, association, and so on).

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

### Refresher
Object systems are typically characterized by some basic components:

* *State* is a pretty self-explanatory concept, most closely akin to "the data". Typically this is made up of a series of named atoms that are closely bound.

* *Identity* is an implicit concept in most O-O languages, in that a given object has a unique identity that is distinct from its state (the value of its internal fields)--two objects with the same state are still separate and distinct objects, despite being bit-for-bit mirrors of one another. This is the "identity vs. equivalence" discussion that occurs in languages like C++, C# or Java, where developers must distinguish between "a == b" and "a.equals(b)"; where the first indicates whether the two references are pointing to the same objects, and the second determines whether the two objects contain the same state. It is an important caveat to any object system that while identity implies state, state doesn't imply identity.

* Identity then also gives rise to *association*, in that objects can be referenced from one another through the use of either an implicit or explicit pointer as either an explicit or implicit atom within the object. Note that associations in most (if not all) object systems are one-way: If Person holds a reference to Address, the Address has no implicit knowledge of that association and if we wish to navigate from the Address back to the Person that references it, we must explicitly create and manage that atom in Address. (Note that in most object systems any non-atomic state is held through association, with the exception of "value types" in .NET or just in C++ in general, where the ownership is more explicit via pointers/references.)

* The *behavior* of an object is fairly easy to see, a collection of operations clients can invoke to manipulate, examine, or interact with objects in some fashion. (This is what distinguishes objects from passive data structures in a procedural language like C.) Ironically, this is also one area that frequently has zero impact in object database systems, since every OODBMS released thus far has zero ability to execute object behavior--only retrieve/store/modify a collection of objects.

* Many object systems also support either an explicit or implicit form of *inheritance*, in which an object "inherits" the properties of another, either "by value" (by creating full standalone copies of atoms from the parent in the child, such as what we see in Java or C# or C++) or "by reference" (by holding a reference to the parent, such as what we see in Javascript).

### Shape analysis
***The one-way nature of references in object systems often creates some design opportunities and restrictions.*** For example, in the following code:

In other words, working with a Person type that looks like:

```java
class Person {
    private String name;
    private Person spouse;
    private List<Person> children;
}

Person ted = new Person("Ted");
Person charlotte = new Person("Charlotte");
ted.spouse = charlotte;
charlotte.children.append(new Person("Michael"));
charlotte.children.append(new Person("Matthew"));
ted.children = charlotte.children; // deliberately point to same List
```

... not only is marriage not implicitly reflexive, but neither is parentage.

***Inheritance is another form of object association.*** Like the other forms, this associative relationship is usually one way; that is, children know their parents but not the other way around. In O-O programming, the parent can remain entirely ignorant of any derived classes through the use of dynamic dispatch (virtual methods), but this doesn't typically apply as a need in an object database. (An object query language obviates much of the need here.)

***While identity often appears in other storage systems*** (most notably relational databases, where identity is captured via primary key)***, in object systems it tends to be more subtle***, where the object identifier (OID) is often implicitly defined and stored. (This is similar to the "ROWID" that is often found in relational tables that serves as the unique identifier for the row in the table, regardless of primary key definitions.) This implicit identity can sometimes be a little confusing around objects that are equivalent but not identical, in the same way that it can be confusing in object languages.

***Most object databases supported some form of query language***, either a SQL derivative and/or utilizing the syntax of the programming language ([db4o](https://en.wikipedia.org/wiki/Db4o) called this 'naive' queries), and/or using a language-level API to build an exemplar object by which to search (called 'query by example' or QBE). This also often included a subtle parameter called "fetch depth", which essentially described how many object-association "links" to go down when retrieving the graph of objects to retrieve. For example, a fetch depth of 0 meant fetch the object queried and nothing else (leaving any associations empty or lazily-loaded), whereas a fetch depth of 1 meant fetch the object queried as well as the objects directly referenced from that object, and a fetch depth of 2 meant go to the objects directly referenced from the objects directly referenced from the object queried, and so on.

In other words, working with a Person type that looks like:

```java
class Person {
    private String name;
    private Person spouse;
    private List<Person> children;
}

Person ted = new Person("Ted");
Person charlotte = new Person("Charlotte");
ted.spouse = charlotte; charlotte.spouse = ted;
charlotte.children.append(new Person("Michael"));
charlotte.children.append(new Person("Matthew"));
ted.children = charlotte.children; // deliberately point to same List
```

We would get a graph that looks like:

<pre class="mermaid">
flowchart TB
    ted[Ted]-->charlotte[Charlotte]
    charlotte-->ted
    ted-->kids[List]
    charlotte-->kids
    kids-->michael[Michael]
    kids-->matthew[Matthew]
</pre>

Note that if Persons know their parents, things get pretty messy pretty fast:

<pre class="mermaid">
flowchart TB
    ted[Ted]-->charlotte[Charlotte]
    charlotte-->ted
    ted-->kids[List]
    charlotte-->kids
    kids-->michael[Michael]
    michael-->ted
    michael-->charlotte
    kids-->matthew[Matthew]
    matthew-->ted
    matthew-->charlotte
</pre>

But this also highlights that in an object system, there is not a single well-defined root/starting point. The collection of objects can, and frequently is, a cyclic graph that can be "entered" (for query purposes) from anywhere--this is in contrast to associative systems (where we can only query by the key) or hierarchical systems (where we must work from the document's root node on down).

***Most object database query engines also understand inheritance implicitly***, so in a simple hierarchy like this:

<pre class="mermaid">
classDiagram
    class Animal
    Vehicle <|-- Car
    Vehicle <|-- Boat
    Vehicle <|-- Airplane
</pre>

... the database understood that a query of "select all Vehicles" would retrieve Car instances, Boat instances, and Airplane instances, as well as any Vehicle instances. This could lead to some very fine-grained queries ("select all Vehicles that have a passenger compartment of 1 and a range of over 500 miles except for motorcycles and rocket ships"), which could also create some indexing nightmares.

***In many cases, an object database could only retrieve whole objects***, even if only a subset of the object graph was necessary/desired to satisfy the request. This could lead to some performance issues, but from a design perspective mostly meant that any activity had to be thought in terms of "whole objects". For example, we often employ a "master-detail" approach, where we fetch a list of entities (such as students at a university) and display their identifying characteristics (first and last name, and student identifier) in a large list, prompting the user to select one for in-depth (displaying all of the selected student's information) examination. In a system which supports "partial results", such as SQL where we can "select id, fname, lname from students" and retrieve only three columns out of however many are defined on students, we can efficiently retrieve only the data we wish to display on that "master" UI. In a "whole results" system like a traditional object store, we have to fetch all of the student objects, displaying first the full collection's first and last names then after that the selected student's details. This means fetching the entirety of the student object in the bulk query, but also means no further round trips to the storage engine are required.

> Thought Experiment: We often saw the desire in database systems for local code execution within the same node or process as the database server--in the RDBMS world we call them "stored procedures" and managed them through the database SQL interface--but the same concept never really took off within the OODBMS, where it would make actually much more sense. Some object query languages could invoke an object method as part of a query expression, but in general that didn't allow for object modification. It's intriguing to imagine what the overall experience of an OODBMS would be like if it could be a full object execution node, and not just data storage. Might even start resembling more of the old "distrubed objects" space, which is both a good thing and a bad thing....

> Thought Experiment: Although unconventional, we've found in the hierarhical database world (namely, XML) that a query language (XPath) used against an in-memory collection of entities (an Infoset document, usually in a DOM) to be a powerful way to interact with only the dataset I'm interested in. Curiously, what would happen if we tried to apply a similar thought process to large in-memory object collections? Feels like it could be useful....

### Implementations
A full list of object databases, apparently all of which remain in current use, can be found at https://db-engines.com/en/ranking/object+oriented+dbms . Note that this list does mix multi-model databases with object ones, which seems to be a common theme in a lot of lists like this.

* db4o - Used to be an open-source product from a company of the same name, then Versant bought them, released one or two more versions, then abandoned it. Last source drop (2015) is available at [SourceForge](https://sourceforge.net/projects/db4o/), though there's some GitHub mirrors out there too.
* [ObjectDB](https://www.objectdb.com/)

*Sadly, wandering through object-shaped datastore implementations is like walking through a graveyard in the middle of the night--so many reactions of the "Oh, man, I'm sad to see them gone" and "Oh, what might've been if only...." sort.*
