title=Concurrency Patterns
date=2021-03-05
type=patternsindex
tags=patterns
status=published
description=Concurrency Patterns
patternfilter=concurrent
~~~~~~

***tl;dr*** Concurrency patterns specifically address the approaches (and consequences) of performing work in some semblance of parallel, whether using pre-emptive multithreading platforms or cooperative ones. This can include scenarios in which the work is being done on parallel CPUs, or across distributed systems (though the latency of network I/O will have significant impact on some of the benefits of concurrent operations).

<!--more-->

This was not one of the original categories of the Gang of Four book, likely because at the time fully pre-emptive concurrent hardware was particularly rare and restricted to high-performance computing. Subsequent patterns books came out during the decade that followed the GOF book, though, and many either addressed concurrency and synchronization either as a part of their pattern catalog, or as a standalone subject in its own right.

Note that "concurrent" and "parallel" are often used synonymously, while others feel that have self-evident differences. I've never gotten a clear distinction between the two (and never really wanted to take sides), so I tend to fall into the "synonymous" camp. Neither one, to me, is specific to where and how the concurrency/parallelism happens--it can be at a distributed system level, where different nodes in a network topology are processing something simultaneously, or it can be at the CPU level, where multiple silicon units are processing something simultaneously. Conceptually they're both describing elements of concurrency, requiring some degree of concurrent access to shared resources (memory, disk, database, network, etc), and thus fall into the pattern language(s) here. This means that many of these patterns are seen simultaneously within a CPU (sometimes even buried within a language/platform) and at the architectural level.

