title=The Shapes of Data: Hierarchical
date=2025-2-2
type=post
tags=engineering, storage, database
status=draft
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

* every node, with the exception of the root, has a parent, and may have children; no other references, such as to siblings, are present

* no cyclic references are allowed; in particular, no node may have a child node that is also its parent (or grandparent or great-grandparent or ...)

* data is typically stored as nodes in the tree, sometimes with "special" flags

We can see each of these points quite clearly in the XML Infoset Specification, but as an exploratory discussion, let's consider the following XML document:

```
<department name="Engineering">
    <manager>
        <employee id="1234">
            <firstname>Fred</firstname>
            <lastname>Flintstone</lastname>
        </employee>
    </manager>
    <employee id="2345">
        <firstname>Barney</firstname>
        <lastname>Rubble</lastname>
    </employee>
</department>
```

We have a single root node, the `department` node. It has associated with it several children: two "element" nodes (one containing the "manager" node and one containing the "employee" node) and an "attribute" node ("name"). The Infoset is quite clear that these nodes aren't classified as "manager" or "employee", but as XML-typed nodes ("element", "attribute") which in turn have descriptors that convey the parts that we has humans recognize (an "element" has a "name" containing the text that appears between the angle brackets). The text "Fred" is itself in a "text" node, although technically these could be four sibling "text" nodes, each containing "F", "r", "e", and "d" respectively.

As with the example, we often think about company organization/topology as a strictly-hierarchical arrangement, but this practice frequently falls down in the face of experience--companies will sometimes have co-CEOs, "matrix"ed teams, and even sometimes have employees reporting to more than one manager/department simultaneously.

### Query capabilities
Querying a hierarchical system historically was a matter of writing a bunch of navigational code by hand, maneuvering up and down the tree as desired, until the XPath (and later XQuery) specification(s) appeared, describing a query language that had at its core the foundational knowledge of traversing the hierarchy. XPath uses a fundamental concept of one or more "expressions", where each expression is evaluated to yield an object, which can be either an "atomic data value" (boolean, number, or string) or a "node-set" (a collection of non-duplicate nodes). Each expression's yield is then carried over into the subsequent expression as part of a stateful "context" which is then used to evaluate the next expression. These expressions, known as "location steps", are formed of an "axis", a "node test", and zero or more "predicates", which further restrict the path. 

So, for example, an XPath of `/child::*` evaluates the "child" axis (which means "examine the current node's immediate child nodes"), and the "node test" of "*" (which means "accept anything"), yielding that singular "department" node. (Technically the "/" is itself a location path, meaning "take the root node", which is what forms the context of the subsequent "child::*" step.) This leads to a mental model that feels similar to filesystem directory paths; however, unlike on a filesystem, we can have multiple nodes returned as part of a query. Thus, `/descendant::*` query will return every node in the document, regardless of its location in the tree. If we then write `/descendant::*/name()`, we will ask every node in the tree for its name.





