title=The Shapes of Data: Associative
date=2025-2-1
type=post
tags=engineering, storage, database
status=published
description=Key-value, or associative, shaped data is the simplest of the shapes to understand, which makes it both powerful and deeply unuseful.
~~~~~~

**tl;dr** The shape of data that's associative, or the key-value data store, is a style of single-dimensional, making the key the biggest part of the shape.

<!--more-->

<!-- Let's use some MermaidJS for some diagrams here, shall we? -->
<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

### Refresher
In a key-value store, like Redis, data is stored in a collection made up of tuples of keys and values. Keys must always be unique, at least within a single "database". (Some data stores may support multi-tenancy "databases", where each is entirely isolated from one another.) Keys are typically complex data types in their own right, often made up of multiple parts, much like filesystem directory paths are made up of pieces. Values are not given any special treatment within the database, treated entirely as an opaque binary byte array.

Key | Value
--- | -----------------
K1  | AAA
K2  | Call me Ishmael.
K3  | CCC123DDD456

Different key-value stores will have different semantics around this fundamental data structure. Some will treat the parts of the key as a physical segregation of the dataset into smaller (and more easily retrieved) collections, while others will keep all the tuples in one large collection. Still others may allow for distinct collections, essentially providing a means to provide multi-tenancy, similar to how a relational database can host different named "databases" each with its own schema.

Key-value stores typically are entirely schemaless beyond the basic key-value data structure. Because the database infers no structure on the value, the values themselves have no database-enforced requirements on length, content, or structure.

> A Thought Experiment: A schema'ed key-value store could put schematic requirements on the value, verifying that the value follows some kind of file format, like BMP or JPG, or other binary format, like Java or .NET object serialization formats. Describing the binary formatting requirements would necessitate a highly-flexible descriptor language, maybe something akin to how other binary formats are specified (there's a history of different formats and IDLs here to choose from), and it would ideally be something open-ended to allow for pluggable run-time verification (maybe), but the idea is intriguing.

### Query capabilities
This one's pretty easy, since realistically, there are none: the database typically allows for retrieval of the value by looking up the key, and that's it.

Some databases will return a multivalued response, allowing the query to put wildcards in for some part of the key (much as `ls /Users/Ted/Documents/*` returns a list of the files and directories in that location).

Because the associative data shape doesn't do any inference in the value half of the tuple, there's really little to nothing we can do with anything except the key itself. The key, as noted earlier, can be seen as a kind of partitioning element to segregate the collection(s) in some sort of logical manner, but fundamentally this is a hierarchical partitioning, at best.

As for the value, most (if not all) associative data stores support zero sort of filtering criteria on the value. We query on the key--that's it.

### Shape analysis
In many respects, the programming model here is very similar as the "untyped collections" that popularized the Java and .NET communities early in their respective lifecycles (C#/.NET 1.0, where Java didn't get strongly-typed collections until Java5). In both Java and C#, programmers clamored for type-parameterizable collections, citing the concern over errors introduced by accidental insertion of unanticipated types in the collections held. However, it's also important to note that in the "untyped" programming languages Javascript, Python, and Ruby, the same call for type-safety hasn't been as strong, likely because those developers write their code in such a way to verify their expectations before use.

With the compound nature of keys, different "parts" of the key can be hierarchically variable; for example, if the stored value is "user session data", the key can be written to consist of both static and variable parts, the static being `users` and the variable being the user profile ID, such that the overall appearance of the key looks like `users:{user-profile-ID}`. This can also easily mirror what we see in URL slugs, a la `topic:{topic-name}:articles:{article-id}`. *So long as the key's parts are inherently hierarchical, the key makes for a convenient means to segregate the space.* As a result, any desirable filter criteria should be encoded into the key.

As one of the simplest "shapes" in the database world, the associative shape's entire ignorance of the value offers some interesting options:

* rather than being seen as a single value, the value can instead be an open-ended collection of values, such as a list or an array. Here we assume either some sort of structure or defining element markers (such as the comma in a comma-delimited list) which the programmer will parse after retrieving.

* in a logical extension of the above, we can treat the value associated with a specific key as an "append-only" and/or "growable" storage--take the value, append additional data to it, and re-store it under the same key.

* the extreme flexibility of values means the keyspace can be entirely heterogenous, storing "a little bit of anything", creating an unparalleled flexibility, but which in turn will require the most amount of programmer-required validation, verification, or maintenance, because the database offers absolutely zero guarantees about what can (or is) stored. This flexibility is also what makes associative datastores popular as caching systems.

[*tuplespace*](https://en.wikipedia.org/wiki/Tuple_space) systems, as exemplified by the academic sysem Linda and its semi-commercial spinoffs TSpaces (from IBM) and JavaSpaces (from Sun) were essentially associative storage, using the identity of an object (extended in this case to include the node in the network from whence it came) as the key and a serialized (often binary, using the object serialization capabilities of the Java language) representation of the object as the value. Microsoft's [Orleans](https://learn.microsoft.com/en-us/dotnet/orleans/overview) seems to be operating along similar lines, calling the key-value tuple a "grain" and offering several different flavors of keys: 

    * IGrainWithGuidKey: Marker interface for grains with Guid keys.
    * IGrainWithIntegerKey: Marker interface for grains with Int64 keys.
    * IGrainWithStringKey: Marker interface for grains with string keys.
    * IGrainWithGuidCompoundKey: Marker interface for grains with compound keys.
    * IGrainWithIntegerCompoundKey: Marker interface for grains with compound keys.

Because of the specific key-based nature of the database operations, ***most associative stores are extremely fast, and often highly scalable***, since the likelihood of two separate processes operating on the same key are highly unlikely. Some databases will, in fact, trust the developer to manage concurrency entirely. This also suggests that the data stored in an associative system should be more or less independent of one another, since *modifying two key-value tuples at once may not have transactional semantics*. 

### Popular implementations [^1]

In alphabetical order:

* [Aerospike](https://www.aerospike.com/)
* [Amazon DynamoDB](https://aws.amazon.com/dynamodb/)
* [Apache Ignite](https://ignite.apache.org/)
* [Azure CosmosDB](https://azure.microsoft.com/en-us/services/cosmos-db/)
* [BadgerDB](https://dgraph.io/badger)
* [BerkeleyDB](http://www.oracle.com/us/products/database/berkeley-db/overview/index.html)
* [Couchbase Server](https://www.couchbase.com/)
* [DragonflyDB](https://www.dragonflydb.io/)
* [Etcd](https://etcd.io/)
* [FoundationDB](https://www.foundationdb.org/)
* [Google Cloud Datastore](https://cloud.google.com/datastore)
* [Hazelcast](https://hazelcast.com/products/imdg/)
* [LevelDB](https://github.com/google/leveldb)
* [LMDB](http://www.lmdb.tech/doc/)
* [Memcached](https://www.memcached.org/)
* [Oracle NoSQL](https://www.oracle.com/database/technologies/related/nosql.html)
* [Pivotal GemFire](https://tanzu.vmware.com/gemfire)
* [Piyvel](https://github.com/wbolster/plyvel)
* [Redis](https://redis.io/)
* [Riak KV](http://basho.com/products/riak-kv/)
* [RocksDB](https://rocksdb.org/)
* [ScyllaDB](https://www.scylladb.com/)
* [Tarantool](https://www.tarantool.io/en/)
* [UnQLite](https://unqlite.org/)
* [Voldemort](https://www.project-voldemort.com/voldemort/)
* [YugabyteDB](https://www.yugabyte.com/)

[^1]: *https://www.dragonflydb.io/guides/key-value-databases*
