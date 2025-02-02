title=The Shapes of Data: Tabular
date=2025-1-27
type=post
tags=engineering, storage, database
status=published
description=Tabular data is "flat", meaning we have multiple instances of uniformly-shaped entities with no deviations.
~~~~~~

**tl;dr** One of the "OG" data formats, the tabular data structure, aka "the flat file", is still today a handy and reasonable way of exchanging data in an automatable fashion without significant integration work required. Its shape is ideal for a multitude of data molecules that all share the exact same contents.

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

### Refresher
In a serialized representation of the tabular format, such as a CSV file:

* each "line" (that is, sequence of characters terminated by the platform's recognized end-of-line sequence, such as a CR or CRLF pair) defines a single record

* convention holds that the first ("0th") line defines the "atom names" (aka "column" or "field" names) within the record

* each atom is separated by a delimiting character, which must itself be escaped somehow if the delimiter is a valid data value (the comma is most popular, but TAB characters are also a common choice since TABs rarely show up in the actual data)

* each line is expected to have some kind of value defined for each atom that comprise the record

* there is no uniqueness constraint anywhere in the representation--no keys and no identifiers

* different "molecules" (types) must appear in different tabular spaces

* there is no "reference" mechanism anywhere in the tabular shape

* most tabular data storage is done solely as files--there are few-to-no "tabular databases" that provide query/edit capabilities (though, to be fair, since many relational databases can import/export tables as tabular files, it becomes a relatively easy task to import the flat data, query/modify it, then export it as a tabular file again)

### Shape analysis
Within most programming languages, the tabular shape is often most easily represented as an array or list of strongly-typed records/structs. However, there are some distinct differences. In most O-O languages, an "array of objects" doesn't actually store the object, but only stores pointers/reference to objects, which allows for aliased repetition of an object in a collection:

Example 1:
```java
// This is pseudo-Java/C#/C++:

Person p = new Person("Fred", "Flintstone", 39);
List<Person> people = new List<Person>();
people.append(p); // Here's Fred!
people.append(p); // Uh, here's Fred again!
people.append(p); // Wait, Fred, third time?
```

Notice that while we assume the array looks like this:

<pre class="mermaid">
flowchart TB
    people-->p1[Fred]
    people-->p2[Fred]
    people-->p3[Fred]
</pre>

In truth it's more like this:

<pre class="mermaid">
flowchart TB
    people-->p1[cell 0]-->person[Fred]
    people-->p2[cell 1]-->person[Fred]
    people-->p3[cell 2]-->person[Fred]
</pre>

In other words, each cell in the array is pointing to the same object. We certainly could create the more "tabular-correct" representation, like so:

Example 2:
```java
// This is pseudo-Java/C#/C++:

List<Person> people = new List<Person>();
people.append(new Person("Fred", "Flintstone", 39)); // Here's Fred!
people.append(new Person("Fred", "Flintstone", 39)); // Uh, here's Fred again!
people.append(new Person("Fred", "Flintstone", 39)); // Wait, Fred, third time?
```

But this now has three distinct instances of Fred running around, and that duplication might cause havoc in other ways.

*(Hmm, I think they actually did an episode of the Flintstones where that exact thing happened.... [Yup, season 4, episode 104!](https://flintstones.fandom.com/wiki/Ten_Little_Flintstones!) )*

While the difference here is subtle, the key is that in the object/language scenario, we have references to Fred, rather than copies of Fred, such that if we change Example 1 slightly to read:

Example 1A:
```java
// This is pseudo-Java/C#/C++:

Person p = new Person("Fred", "Flintstone", 39);
List<Person> people = new List<Person>();
people.append(p); // Here's Fred!
people.append(p); // Uh, here's Fred again!
people.append(p); // Wait, Fred, third time?
people[0].firstName = "Wilma";
```

Now the array appears to contain three Wilma Flintstones. This is clearly different than in Example 2, where have distinct copies of each means only the first Person is modified.

In addition, the lack of any reference mechanism means that if we widen the definition of "Person" to include a spouse as a fourth atom, we run smack into the problem that we cannot reference another Person in the tabular format; the best we can do is copy some of the atoms and do a "fixup" later, a la:

FirstName | LastName | Age | SpouseFirstName | SpouseLastName
--- | --- | --- | --- | ---
Fred | Flintstone | 39 | Wilma | Flintstone
Wilma | Flintstone | 35 | Fred | Flintstone
Barney | Rubble | 38 | Betty | Rbuble
Betty | Rubble | 35 | Barney | Flintstone

*(Column labels appear only as a convenience to us humans.)*

Notice, however, that the mistakes (one syntactically incorrect, one semantically incorrect) in the Rubbles' records are completely acceptable to the tabular data store, leaving it up to the developer to catch "by hand". This lack of verification/validation is a rampant problem in any flat-file-based data interchange, and has plagued developers for years.
