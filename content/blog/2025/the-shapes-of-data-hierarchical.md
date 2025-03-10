title=The Shapes of Data: Hierarchical
date=2025-2-2
type=post
tags=engineering, storage, database
status=published
description=Document data, more formally known as hierarchical data, is data which coalesces naturally into singular, mostly-standalone entities.
~~~~~~

**tl;dr** Hierarchically-shaped data is characterized around strictly acyclic data that are arranged in a parent-child relationship, starting from a single well-known root data node. The relationship between nodes is explicit, with the roles of parent and child clearly delineated, but the actual association between parent and child is typically implicit and immutable.

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

### Refresher
Hierarchical data is most easily recognized as a "tree", such as that taught in every Computer Science course anywhere, where a well-defined root node has pointers to child nodes, each of which is also potentially a parent to other child nodes, *ad infinitum* (or at least until we run out of memory). In the data world, this is most easily seen in the [XML Infoset](https://www.w3.org/TR/2004/REC-xml-infoset-20040204/), which is an abstract discussion and description of this hierarhical model.

Careful readers of the Infoset specification will note that the descriptions are all abstract and at no point refer to "tags" or "angle-brackets"; the traditional thinking around XML, that of a markup syntax similar to HTML, is but one way of serializing an Infoset document, and some of the later attempts at [binary](https://en.wikipedia.org/wiki/Binary_XML) [XML](https://www.ibm.com/support/pages/binary-xml-specification) [serialization](https://learn.microsoft.com/en-us/openspecs/sql_server_protocols/ms-ssas/2b2a5c94-769e-4039-bef8-4fdbeaa14ecc) serve as an interesting separation of "data model" from "data representation".

However, while many readers will be willing to accept XML as the canonical example of hierarchical data, they may not be quite so willing to accept the link between "JSON" or document databases as hierarchical data formats. I make this assertion based on the following axiomatic statements:

* **JSON documents start from a well-formed root.** Any JSON document must start with either an array (`[...]`) or object (`{ ... }`). Any attempt to have multiple roots in a JSON document is considered an error and unparsable.

* **JSON documents can only represent parent-child associates.** A JSON document cannot have a cyclic graph anywhere within it.

Both of these statements can be verified either by casual reading of the [JSON specification](https://ecma-international.org/publications-and-standards/standards/ecma-404/), also explained in more graphical and plain prose [here](https://www.json.org/json-en.html), and/or casual experimentation at the [JSON linter](https://jsonlint.com/) website.

In addition, with respect to document databases, we note that a given document database, such as MongoDB or CouchDB, is formed of collections of documents, and each collection, like JSON itself, can be seen as an array of these JSON documents, such that the collection now serves as its own root. The database as a whole is often modeled in turn as a collection-of-collections, making the whole "collection of collections of documents" a hierarchical model, particularly when we consider that none of the popular document databases offer any "pointer" data types that can be silently traversed during query/retrieval.

### Shape analysis
The shape of hierarchical data is wrapped, not surprisingly, around the top-down nature of a hierarchy. That is to say, that:

* there is one well-known and well-formed root that serves as the starting point for navigation

* every node, with the exception of the root, has a parent, and may have children

* in some hierarchical stores (notably XML), each node may have one or more name-value pairs further describing the node (XML calls these *attributes*)

The hierarchical nature of the data, then, makes it an excellent choice for managing "top-down" kinds of systems, a la

* company hierarchies
* military organization
* decision trees
* biological taxonomies

Ironically, though, some of the data systems that start out feeling hierarchical, like human genealogy charts (I mean, parents have children, the end, right?) actually turn out to not be strictly hierarchical, owing largely to the fact that marriages can be dissolved, spouses can die, children can marry their uncles, and even more bizarre behavior. (I invite anyone who thinks a genealogical tree can be best represented as a hierarchy to map out the English royalty of the 1500s through the 1900s in a nice, well-ordered, singly-rooted tree--just try to figure out who the root is, to start!)

One thing that's interesting is that hierarchical data is actually one of the *oldest* ways to model information, which is partly why we have such an easy familiarity with it. We see hierarchies everywhere we turn in life, and as such it becomes an easy tool to reach for. Trying, however, to model a hierarchy in a relational database, as we often tried to do in the late 90s/early 00s, usually ended up in a massively complicated system, where much fo the complexity lay in navigating the hierarchy. This was partly why XML was viewed as such a godsend when it emerged as a data-centric tool in the early 00s. Pain points with XML led to the desire for a "simpler" approach, which led to JSON, which is just another hierarchy but with fewer options. (And it uses curly braces, which is more comforting to C++/C#/Java developers anyway.)

One other important note about hierarchical systems is that they are *not* intrinsically object systems. It's a common mischaracterization, since we often see classes in hierarchies (particulary inheritance-based), and a node can have attributes, just like objects can have fields. However, in an object system we can have a reference to another object--any other object--within the system without regard for its relationship to this object. This allows us to create cyclic graphs (among other things) which are impossible to represent accurately in a strict hierarchy.

For example, imagine the classic Person object:

```
class Person {
    String firstName;
    String lastName;
    int age;
}
ted = new Person("Ted", "Neward", 50);
```

This is pretty straightforward, whether Java or C# or C++ (or some other object language). If we try to model this in a hierarchy, it seems to flow well:

```
<person>
    <firstname>Ted</firstname>
    <lastname>Neward</lastname>
    <age>50</age>
</person>

{
    "ted": {
        "firstName": "Ted",
        "lastName": "Neward",
        "age": 50
    }
}
```

But when we represent the fact that Persons can get married, we encounter this object-relationship conundrum:

```
class Person {
    String firstName;
    String lastName;
    int age;
    Person spouse;
}

ted = new Person("Ted", "Neward", 50);
charlotte = new Person("Charlotte", "Neward", 39);
ted.spouse = charlotte;
charlotte.spouse = ted;
```

We would get a graph that looks like:

<pre class="mermaid">
flowchart TB
    ted[Ted]-->charlotte[Charlotte]
    charlotte-->ted
</pre>

But the hierarchical model gets twisted--we have to have a single root, so naively we would think that maybe we nest the "spouse" Person inside of the Person that references it, but that runs into the basic fact that there's two Person objects, so which is the root object? Which of these two spouses is "on top", so to speak? XML is going to get stuck right there, but JSON stands up and says, "Aha! I'm not a problem, watch!":

```
{
    "ted": {
        "firstName": "Ted",
        "lastName": "Neward",
        "age": 50
        "spouse": "charlotte"
    },
    "charlotte": {
        "firstName": "Charlotte",
        "lastName": "Neward",
        "age": 39,
        "spouse": "ted"
    }
}
```

... except that this is ducking the problem entirely, because JSON doesn't actually know about the relationship between these two objects--the "ted" and "charlotte" are essentially object identifiers (OIDs) that whomever or whatever is deserializing this JSON has to put bback together "by hand". This also means that the top-level of the JSON document becomes a flat namespace in which all of the Persons in the system are stored, with no intrinsic hierarchy to the data whatsoever. We can do the exact same thing with XML, by the way, if we chose to:

```
<objects>
    <Person oid="ted">
        <firstname>Ted</firstname>
        <lastname>Neward</lastname>
        <age>50</age>
        <spouse reference="charlotte" />
    </Person>
    <Person oid="charlotte">
        <firstname>Charlotte</firstname>
        <lastname>Neward</lastname>
        <age>39</age>
        <spouse reference="ted" />
    </Person>
</objects>
```

For whatever it's worth, this is a large part of the reason why the original SOAP specification (v1.1) punted on the details of how to represent an object hierarchy, and deferred that work to XML Schema (XSD), which then... punted on how to represent an object hierarchy in favor of being able to validate XML/hierarchical data. This *object-hierarchical impedance mismatch* was a large part of why XML services were labeled as "too complicated" and "too messy" and got everybody excited about JSON, which... punts on capturing object references just like XML did. But now we don't care as much for some reason.

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

Representing this in XML is going to be flat-out impossible without out-of-band OIDs, and the same is true essentially of JSON.
