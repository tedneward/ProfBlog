title=The Shapes of Data
date=2025-2-1
type=post
tags=engineering, storage, database
status=published
description=Data storage takes on several different "shapes", and knowing the shape of both the data you're trying to store and the shape of the database you're using can make a huge difference in the complexity of your project.
~~~~~~

**tl;dr** Dating all the way back to the earliest of databases, data has had a "shape" to it, a natural schematic form that defines the various "atoms" and "molecules" that the database understands naturally. Relational data, such as that described by SQL and relational databases, is only one such shape; the various "NoSQL" databases often offer a different shape, but it's not always the same. What's more, just because a database uses a non-relational shape doesn't mean it's a natural fit to your object-programming language's code. When it doesn't, you have an impedance mismatch, which has to be solved somewhere (usually to the detriment of your code and complexity budget).

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

*(BTW, much of this material is stuff I've covered in the past in talks and other materials, but never really with this level of focus; if it sounds familiar, you've probably already heard me yak on about it before, so you might choose to move on.)*

### The Atom of Data: The Bit
Fundamentally, all data boils down to a single bit, 1 or 0. Everything that ever crosses a CPU, resides in RAM, or is stored on disk, is made up of dozens, hundreds, thousands, millions or even billions of these. Beyond that, though, the bit is entirely uninteresting, because with the very rare exception of either writing assembly code by hand or working with bitmasks in a higher-level language (lookin' at you, C), we don't really deal with bits very often. Even native boolean types are often "widened" out to a larger value.

### Er, I mean...
So while the bit is useful and necessary to understand at a foundational level, its purpose here is to combine in various ways to create higher-level data types, which are usually made atomic at the language or data-storage level:

* If we string bits together, we can use each bit in a binary numeric system to represent whole numbers. Depending on how many bits we use, we can get a pretty wide range of values:

    * 8 bits together is a *byte*, which can represent up to 256 (0 to 255) different values. Sometimes the first bit in the pattern is used to indiciate a positive or negative value, which makes this a *signed byte*, capable of storing -127 to +128.
    * Sometimes we string 16 bits together in a programming language and call that a *short integer*, or *short* for short (pun intended), and it can store 2-to-the-16 different values, which is a range of 0 to 65,535, or 64k. It also can be signed, which changes the range from -32k to +32k. 
    * 32 bits together is an *integer* in most circa-2000 programming languages, and again it can be unsigned (0 to 4,294,967,296), or signed (-2,147,483,648 to 2,147,483,647).
    * 64 bits, a *long integer* or *long*, gives us something like 18,446,744,000,000,000,000 possible values; that's 1.8446744e+19 for those of you who prefer scientific notation. (By the way, somebody double-check me on those two numbers, I tried to count the zeros and decimal places and lost track three times.)

* We can also string bits together in 32- and 64-bit formats, but this time use a different encoding mechanism to capture floating-point values.

But these are just numbers; a good chunk of our data is stored in human text, a la *strings*, which are collections of 8-bit bytes (if it's stored in ASCII) or 16- to 64-bit Unicode Transfer Format chunks; this is where UTF-8, UTF-16, and/or UTF-32 comes into play. And, in many cases, since we don't know how long a string should be (are we storing a single word from the dictionary, or the entire collected works of Shakespeare?), we have to either set a special value aside to indicate the end of the string (C used the value 0, or NULL, to indicate the end of its byte-wide strings storing ASCII characters, hence giving us the term "NULL-terminated ASCII string"), or we have to capture the length somewhere (Pascal put the length in the first byte, so that the first character in the string was always at index 1, which neatly offset the C quirk of the first byte being at index 0, but also led to a max size of 255 characters for the string), or we just have to set a fixed size and assume the string falls under that length, or something.

### Wait, we were talking about databases
Any database system worth its weight in weightless bits will define a set of "native" types that it understands atomically, just as programming languages do. The SQL standard, for example, defines a set of types like VARCHAR, a length-unlimited string type, or VARCHAR(2000), a string that can store up to 2000 characters. There's usually some performance- or feature-related consequences for choosing one over another, but these types form some of the core "atoms" of what we can store in the database.

Then, the database typically defines some kind of "higher", "molecule"-like, thing that allows for programmers to "assemble" larger things (often called "entities", since that's a nice vendor-agnostic term) out of the core atoms. So, for example, if we want to store demographic information about a person, we might want to store:

* Given (first) name: a string of up to some reasonable length
* Family (last) name: a string up up to some reasonable length
* Age: an integer value that can store 0 through, say, 150 or 200

<pre class="mermaid">
erDiagram
    PERSON {
        string familyName
        string givenName
        int age
    }
</pre>

We sometimes even get a little nutty and suggest that persons can be in a relationship to one another:

<pre class="mermaid">
erDiagram
    PERSON  |o--o| PERSON : marries
    PERSON {
        string familyName
        string givenName
        int age
    }
</pre>


It's not all that unlike creating user-defined types in programming languages (be they *classes*, *records*, *unions*, whatever). The really *interesting* question is if and/or how the database provides support for the definition of this user-defined type. If, for example, the database natively understands that "marries" relationship defined above, then we can use the database's native facilities (query language, for example) to retrieve the data we need more precisely (and more quickly and more scalably and more efficiently and...).

(Of course, in many scenarios, scalability, efficiency, or performance aren't high-need requirements--of course they're always nice to have, but sometimes you just don't care about that as much as you do other concerns, like "development time". In those cases, developers should of course use whatever tools are most appropriate--in a shop that knows Postgresql really well, use Postgres for everything! Just be aware that there's always some cost to navigating between these different "shapes"--the "impedance mismatch"--and after a certain point, that cost will want to be recuperated.)

### Schema vs schemaless
Those databases which allow us to define a formal definition for these user-defined types are said to support the notion of a database-enforced schema, and the most common examples of these are the relational databases of the world. (As a matter of fact, I can't think of an RDBMS that doesn't enforce, nay *require*, a schema definition for the database.) The database will have you define what your user-defined entities look like, and then go to great lenths to make sure that whatever gets stored in the database is in agreement with what's defined in the schema.

Contrast this with the recent spate of "NoSQL" databases, most of which not only changed the shape of the data they were storing, but also removed the notion of schema from the picture, because it turns out that most developers weren't really all that frustrated with SQL (well, not really), but with the fact that the databse was enforcing that the schema had to be defined, and then enforcing what was in the schema. Developers were finding that as they iterate on a project, they often need to refactor the "things" (classes, tables, files, whatever) they're defining, and while programming languages had pretty decent refactoring support, schema-enforcing relational databases did not. So the NoSQLs said, "Let's drop the schema!" And developers said, "Awesome!" (And then a typo wrecked the developers' whole week when they missed it in testing and it made its way into Prod, but that came later.)

The point to understand here is *schema is not a property of the data's shape*. We could have schema-less relational databases (we often call them CSV files), and we could have schema-enforced databases of other shapes (XML, for example, defined XSD, aka "XML Schema", to do exactly this). We don't see the full spectrum of all the combinations mostly because... well, I dunno why. Just seems like developers aren't interested in what some of those other combinations are (which, to be clear, I think is a mistake--those other combinations are fascinating).

Now, the last "atomic" type the database typically understands, natively, is some kind of *association* between atoms. It might be something as simple as a key-value pairing (associating the key to the value), or it might be as complicated as a foreign-key relationship in a relational data model, but typically each database understands that things have to relate to one another in some fashion.

And it's these relationships that typically define the "interesting" parts of what makes up the shape of the data in the database.

### The known universe
As near as I can count, there's only a few data shapes, which I'll go over in separate posts:

* [Associative](./the-shapes-of-data-associative.html), aka "key-value" ([Wikipedia]())
* Graph ([Wikipedia](https://en.wikipedia.org/wiki/Graph_database))
* Hierarchical, aka "document" (XML, JSON) (Wikipedia - [Hierarchical](https://en.wikipedia.org/wiki/Hierarchical_database_model), [XML](https://en.wikipedia.org/wiki/XML_database))
* [Object](./the-shapes-of-data-object.html) (OODBMS) ([Wikipedia](https://en.wikipedia.org/wiki/Object_database))
* [Relational](./the-shapes-of-data-relational.html) (RDBMS) ([Wikipedia](https://en.wikipedia.org/wiki/Relational_database))
* [Tabular](./the-shapes-of-data-tabular.html), aka "flat files" (CSV, TSV) ([Wikipedia](https://en.wikipedia.org/wiki/Flat-file_database))

*(I haven't finished writing up the graph and hierarchical notes yet, those are next)*

There's often some variance between particular examples of each, but fundamentally, these appear (to me!) to be the high-level distinguishing models. (Of course, if more models make themselves appear, I'll add them to the list.)

One of the older data shapes is that of the [navigational](https://en.wikipedia.org/wiki/Navigational_database) or ["network"](https://en.wikipedia.org/wiki/Network_model) data model, but I think, after some initial analysis/thought, that the network shape really is either entirely subsumed inside the object or graph shapes, or it sits somewhere in between the two on the Venn diagram, overlapped by each of the other two, and lying entirely within the space of the two combined. (I might be convinced otherwise, but somebody would have to work at it.)

There's also a class of database products that try to embrace more than one of these shapes simultaneously, calling themselves "multi-model" databases. In my limited experience with them, I've found that they usually embrace one model at the heart of their internal operation, and then project other models on top of that singular, internal model. (Which usually means that in a head-to-head shootout with a database product that "natively" understands a shape, the "projected" shape multimodel database loses. Badly.)

By the way, let's also make one thing very clear: How we represent these models in memory may look somewhat different from how they are serialized and stored to disk. For example, when I `new` up two objects in (pick-your-favorite-OO-language-here) and point them to each other, I don't see the pointer value of their location in memory because the language hides that from me (typically). If I were to store these two to disk, though, we'd need to (a) identify them and (b) put those identifiers someplace where they could be turned back into pointers later. The pointers are natively understood by the language (and, by extension, the database engine that we're talking about), so they're a "natural" part of the database's model/"shape".

Along those same lines, it's also important to recognize that the shape of the data understood by the database is not always going to be entirely reflected in how the data is stored on disk; lots of databases do some very interesting things at the storage engine level in order to gain performance, and then "make things right" when they load data into memory for analysis or processing. (In other words, the magic behind highly-performant storage engines is out-of-scope for what I'm trying to discuss here!) In other words, just because every major relational database stores their data in a B-tree (or -derived) format on disk doesn't make every relational database a hierarchical, graph, or associative shape. If we go down the stack far enough, we discover that everything is just made up of 1s and 0s! I choose to draw the line at how the data looks and interacts at the level at which the developer sees it, through either its query interface (SQL, OQL, Cypher, whatever), its API, or its storage format (if there is no consistent API--this applies to XML, JSON, CSV, TSV, and others).

And yes, we can convert the database's native format into another format, often using tools found in the database itself--most RDBMSes in 2025 can return a SQL query in JSON or XML, if you ask it nicely enough. Far from invalidating this post, though, I think it actually justifies it: If it was trivial to consume the results in the desired manner, why does the database need to provide the feature? :-)

### Thought experiments
In this section, I'm going to idly wonder about other models and/or thoughts around the shape of data in general or implementation ideas. Some thought experiments appear in each of the specific data shapes, too, if they're closely aligned to a particular shape. I don't know if I have any particular point or solution here--call this the "thinking out loud" section.

* ***Columnar.*** One obvious absence is that of the "wide-column" or columnar data store, in which we store data in such a way that it feels more column-oriented than row-oriented (which would be tabular). There's some pretty significant implementation differences when we do this, but I'm not 100% sure if the *shape* is any different than a tabular one--just take the table and rotate it 90 degrees, and lo, we have a columnar format. Am I missing something here?

* ***Multi-dimensional.*** In a non-relational table or collection, we identify unique values along a single dimension--the key has to be unique across all possible values. Relational databases have allowed for compound keys for decades, however, which leads rise to a shaped model of data that resembles either a two-dimensional cartesian grid or even three- (or four-? five-?) dimensional model of data. It's highly likely these could be represented by an associative data store with multipart keys corresponding to each axis in the model, but one thing about three-dimensional models is that you can turn them in various directions and look along any axis "first"--in an associative model the keys are structured hierarchically, but what if we want to see the plane of data where Z is known but X and Y are variable? Like, roughly speaking, imagine an analogy to a three-dimensional grid, where we can write queries like "select where x=0, y=0, z=0" to retrieve a particular cell, or "select where x=0, y=0" to retrieve a line, or "select z=0" to retrieve a plane. Now imagine a four-dimensional database and specifiying three of the axes to retrieve a cube, and it's starting to fold on top of itself in the same way relational queries can. (Twenty years ago, people in the data space talked about "hyperdimensional" databases, is this that same idea?)

    For starters as a thinking point, what if we took a traditional tabular instance, and added a second dimension, time, to it, making it into a cube of sorts? That would make any tabular shape into a temporal one, which would obviously make it harder to store in a flat-file, but again, the shape is often more important than its storage or its serialized representation. (After all, we can't really represent a fully-normalized relational database in a CSV file, and we "get" that.)

* ***Temporal.*** Speaking of time.... Many databases were exploring/operating around time as an implicit or explicit key in the storage of values, which makes me wonder if that's its own data model or a variation of multi-dimensional. Chris Date and Hugh Darwen had some thoughts on this, as did Rich Hickey, but I'm not sure how all of this plays out inside my head yet. I think I tend more towards the Cassandra style of "every atom in the database has a time value attached to it", but I find myself thinking that may be oversimplifying it immensely.

* ***Branching.*** Git made the branching model of data storage popular, and it's started to creep into database products. But is this really a new model of data, or is it simply an associative model that has a partiucarly-constructed key? That is to say, each "project" is a major-part key, and each "commit" is a minor-part to that key, and the complete (binary) commit is the value?

* ***Unstructured.*** Just like the absence of light is still a color (black), the absence of structure can still be data, although we can get really philosophical about this really quickly. Consider: Even though free text (like this blog post) is considered "unstructured", it still has structure, in that there are grammatical rules that explain the punctuation, style rules that govern the larger structure of the post, and spelling rules that govern the way the letters are made to work together. Below the surface, there's the Markdown syntax with which this post was written. So is data ever really 'unstructured', or is it that some structures are just hard to diagram/explain and others are hard to parse? (It's not just text, either--"unstructured binary data" can mean "it's structured, but not something we want to parse" all the way through "it's random sensor data and we're trying to infer structure where we're not sure if there is any".)


