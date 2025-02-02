title=The Shapes of Data: Relational
date=2025-2-1
type=post
tags=engineering, storage, database
status=published
description=Relationally-shaped data is characterized not by the tables, but by the database-native relationships between data elements, represented by sets and keys.
~~~~~~

**tl;dr** Relational data is, contrary to popular belief, characterized not by "tables", but by sets and relational variables (also known as "relvars"), and making use of a relational algebra and predicate calculus to make it easier to do set-oriented operations.

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

### Refresher
Because most developers come to relational databases via SQL, usually either studied briefly in classes at university or as-necessary to get the work done while on the job, they often don't realize the relational model is much more academic and foundational than the flavor of SQL they've come to use and know. [Date13] [^Date13] and [Fussell] [^Fussell] define the relational model as characterized by *relation*, *attribute*, *tuple*, *relation value* and *relation variable*.


* A *relation* is, at its heart, a truth predicate about the world, a statement of facts (*attributes*) that provide meaning to the predicate. For example, we may define the relation "PERSON" as `{SSN, Name, City}`, which states that "there exists a PERSON with a Social Security Number SSN who lives in City and is called Name". Note that in a relation, attribute ordering is entirely unspecified. 

* A *tuple* is a truth statement within the context of a relation, a set of attribute values that match the required set of attributes in the relation, such as "`{PERSON SSN='123-45-6789' Name='Catherine Kennedy' City='Seattle'}`". Note that two tuples are considered identical if their relation and attribute values are also identical. (This is in contrast to an object system in which two objects are only identical if they have the same unique identifier--typically a memory address.) 

* A *relation value*, then, is a combination of a relation and a set of tuples that match that relation, and a *relation variable* is, like most variables, a placeholder for a given relation, but can change value over time. Thus, a relation variable `People` can be written to hold the relation `{PERSON}`, and consist of the relation value 

    ```
    { {PERSON SSN='123-45-6789' Name='Catherine Kennedy' City='Seattle'},
      {PERSON SSN='321-54-9876' Name='Charlotte Neward' City='Redmond'},
      {PERSON SSN='213-45-6978' Name='Cathi Gero' City='Redmond'} }
    ```

    Thanks to our familiarity with tabular storage models, we ofen write this relation variable in a tabular format like so:

    SSN | Name | City
    --- | ---- | ----
    123-45-6789 | Catherine Kennedy | Seattle
    321-54-9876 | Charlotte Neward | Redmond
    213-45-6978 | Cathi Gero | Redmond

    Keep in mind, however, that in the model itself, the tuple is not exactly a row, and each tuple knows both the name and the value of each of its atoms.    

* We can then operate against these relation values using using a set of operators (described in some detail in Chapter 7 of [Date04] [^Date04]): restrict, project, product, join, divide, union, intersection and difference. We modify `People` by using the union binary operator (let's call it `+`) on it and a second, unnamed, relation variable containing a single tuple:

    ```
    People = People + {PERSON SSN='312-54-8796' Name='Ted Neward' City='Redmond'}
    ```

    After this operation, `People` now holds four tuples. Additional operators can be used to create *derived relation values*, relations that are calculated from other relation values in the database--for example, we can create a relation value that demonstrates the number of people living in individual cities by making use of the project and restrict operators across the `People` relation variable defined above. 

The other half of relational models is the deep understanding they have of relationships between relational variables. 

* The other half of the relational model is that of the formal relationships that can be expressed and understood by the database; we can define a relational value to have a unique identifying value (a primary key), and then reference that value within tuples.

### Shape analysis

### Popular implementations

* Databricks
* IBM DB2
* H2
* MariaDB
* Microsoft Access
* Microsoft SQL Server
* MySQL
* Oracle DB
* PostgreSQL
* Snowflake
* SQLite

[^Date04]: *Introduction to Database Systems* (8th Ed), C.J. Date, Addison-Wesley 2004

[^Date13]: *Relational Theory for Computer Professionals*, C.J. Date, OReilly 2013

[^Fussell]: Can't remember this reference right now

