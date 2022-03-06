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

