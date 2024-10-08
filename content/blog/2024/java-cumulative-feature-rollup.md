title=A Java Language Cumulative Feature Rollup
date=2024-8-28
type=post
tags=java, jvm, language
status=published
description=Every listed new feature since Java8.
~~~~~~

I found myself asking myself the question, "What's every new feature Java has introduced since the last time I really cared about new Java language features?", and didn't find an easy answer via Google. So, I decided to create that list.

<!--more-->

Note that most JDK releases are a combination of new language features, new library features (and by libraries I mean the modules that ship with the JDK), and sometimes new virtual machine features to support either of those two. In the list below, I do my best to categorize which features apply where. I'm also going to elide out anything that seems relatively trivial or is a Preview feature in the release.

- 213: [Milling Project Coin](https://openjdk.org/jeps/213) (9)

    - Allow effectively-final vaiables to be used as resources in try-with-resources
    - Allow diamond with anonymous classes if inferrable

- 222: [jshell](https://openjdk.org/jeps/222) (9) (VM): "Provide an interactive tool to evaluate declarations, statements, and expressions of the Java programming language, together with an API so that other applications can leverage this functionality."

- 238: [Multi-Release JAR files](https://openjdk.org/jeps/238) (9) (VM): "Extend the JAR file format to allow multiple, Java-release-specific versions of class files to coexist in a single archive." In other words, an MRJAR can sport different versions of a class for different releases of Java.

- 259: [Stack-Walking API](https://openjdk.org/jeps/259) (9) (Library/VM): "Define an efficient standard API for stack walking that allows easy filtering of, and lazy access to, the information in stack traces."

- 261: [Module system](https://openjdk.org/jeps/261) (9): Hello darkness my old friend....

- 266: [More Concurrency Updates](https://openjdk.org/jeps/266) (9) (Library): Some enhancements around publish-subscribe (`Flow` and friends), the `CompletableFuture` type and some other enhancements. Looks to be entirely library-centric.

- 286: [Local-Variable Type Inference](https://openjdk.org/jeps/286) (10): Use `var` as a type placeholder in local variable declarations. (What they should've done back in Java7 when they went the other direction.)

- 181: [Nest-Based Access Control](https://openjdk.org/jeps/181) (11): "Introduce nests, an access-control context that aligns with the existing notion of nested types in the Java programming language. Nests allow classes that are logically part of the same code entity, but which are compiled to distinct class files, to access each other's private members without the need for compilers to insert accessibility-broadening bridge methods." I'm guessing this now invalidates/supercedes the need for the synthesized methods I always used to use as an example for why it was useful to look at Java bytecode. *sigh*.... I mean, it's best to close the hole, but now I have to find a new demo.

- 361: [Switch Expressions](https://openjdk.java.net/jeps/361) (14): "Extend switch so it can be used as either a statement or an expression, and so that both forms can use either traditional `case ... :` labels (with fall through) or new `case ... ->` labels (with no fall through), with a further new statement for yielding a value from a switch expression." Functional programming infiltrates the language once again.

- 371: [Hidden Classes](https://openjdk.org/jeps/371) (15): "Introduce hidden classes, which are classes that cannot be used directly by the bytecode of other classes. Hidden classes are intended for use by frameworks that generate classes at run time and use them indirectly, via reflection. A hidden class may be defined as a member of an access control nest, and may be unloaded independently of other classes." Now that's interesting, never heard of that before....

- 378: [Text Blocks](https://openjdk.java.net/jeps/378) (15): "A text block is a multi-line string literal that avoids the need for most escape sequences, automatically formats the string in a predictable way, and gives the developer control over the format when desired." Looks like it uses the triple-quote "heredoc" syntax popular in other languages.

- 394: [Pattern Matching for instanceof](https://openjdk.java.net/jeps/394) (16): 

- 395: [Records](https://openjdk.java.net/jeps/395) (16): 

- 306: [Restore Always-Strict Floating-Point Semantics](https://openjdk.java.net/jeps/306) (17): 

- 409: [Sealed Classes](https://openjdk.java.net/jeps/409) (17): 

- 431: [Sequenced Collections](https://openjdk.java.net/jeps/431) (21) (Library): 

- 440: [Record Patterns](https://openjdk.java.net/jeps/440) (21): 

- 441: [Pattern Matching for switch](https://openjdk.java.net/jeps/441) (21): 

- 444: [Virtual Threads](https://openjdk.java.net/jeps/444) (21) (Library): Fibers come to Java. Finally.

---

The full list, as given by the OpenJDK pages, are below.

The *LTS*-marked releases are the Oracle Long-Term Support releases.

### [JDK 9](https://openjdk.org/projects/jdk9/)

- 102: Process API Updates
- 110: HTTP 2 Client
- 143: Improve Contended Locking
- 158: Unified JVM Logging
- 165: Compiler Control
- 193: Variable Handles
- 197: Segmented Code Cache
- 199: Smart Java Compilation, Phase Two
- 200: The Modular JDK
- 201: Modular Source Code
- 211: Elide Deprecation Warnings on Import Statements
- 212: Resolve Lint and Doclint Warnings
- 213: Milling Project Coin
- 214: Remove GC Combinations Deprecated in JDK 8
- 215: Tiered Attribution for javac
- 216: Process Import Statements Correctly
- 217: Annotations Pipeline 2.0
- 219: Datagram Transport Layer Security (DTLS)
- 220: Modular Run-Time Images
- 221: Simplified Doclet API
- 222: jshell: The Java Shell (Read-Eval-Print Loop)
- 223: New Version-String Scheme
- 224: HTML5 Javadoc
- 225: Javadoc Search
- 226: UTF-8 Property Files
- 227: Unicode 7.0
- 228: Add More Diagnostic Commands
- 229: Create PKCS12 Keystores by Default
- 231: Remove Launch-Time JRE Version Selection
- 232: Improve Secure Application Performance
- 233: Generate Run-Time Compiler Tests Automatically
- 235: Test Class-File Attributes Generated by javac
- 236: Parser API for Nashorn
- 237: Linux/AArch64 Port
- 238: Multi-Release JAR Files
- 240: Remove the JVM TI hprof Agent
- 241: Remove the jhat Tool
- 243: Java-Level JVM Compiler Interface
- 244: TLS Application-Layer Protocol Negotiation Extension
- 245: Validate JVM Command-Line Flag Arguments
- 246: Leverage CPU Instructions for GHASH and RSA
- 247: Compile for Older Platform Versions
- 248: Make G1 the Default Garbage Collector
- 249: OCSP Stapling for TLS
- 250: Store Interned Strings in CDS Archives
- 251: Multi-Resolution Images
- 252: Use CLDR Locale Data by Default
- 253: Prepare JavaFX UI Controls & CSS APIs for Modularization
- 254: Compact Strings
- 255: Merge Selected Xerces 2.11.0 Updates into JAXP
- 256: BeanInfo Annotations
- 257: Update JavaFX/Media to Newer Version of GStreamer
- 258: HarfBuzz Font-Layout Engine
- 259: Stack-Walking API
- 260: Encapsulate Most Internal APIs
- 261: Module System
- 262: TIFF Image I/O
- 263: HiDPI Graphics on Windows and Linux
- 264: Platform Logging API and Service
- 265: Marlin Graphics Renderer
- 266: More Concurrency Updates
- 267: Unicode 8.0
- 268: XML Catalogs
- 269: Convenience Factory Methods for Collections
- 270: Reserved Stack Areas for Critical Sections
- 271: Unified GC Logging
- 272: Platform-Specific Desktop Features
- 273: DRBG-Based SecureRandom Implementations
- 274: Enhanced Method Handles
- 275: Modular Java Application Packaging
- 276: Dynamic Linking of Language-Defined Object Models
- 277: Enhanced Deprecation
- 278: Additional Tests for Humongous Objects in G1
- 279: Improve Test-Failure Troubleshooting
- 280: Indify String Concatenation
- 281: HotSpot C++ Unit-Test Framework
- 282: jlink: The Java Linker
- 283: Enable GTK 3 on Linux
- 284: New HotSpot Build System
- 285: Spin-Wait Hints
- 287: SHA-3 Hash Algorithms
- 288: Disable SHA-1 Certificates
- 289: Deprecate the Applet API
- 290: Filter Incoming Serialization Data
- 291: Deprecate the Concurrent Mark Sweep (CMS) Garbage Collector
- 292: Implement Selected ECMAScript 6 Features in Nashorn
- 294: Linux/s390x Port
- 295: Ahead-of-Time Compilation
- 297: Unified arm32/arm64 Port
- 298: Remove Demos and Samples
- 299: Reorganize Documentation

## [JDK 10](https://openjdk.org/projects/jdk/10/)

- 286: Local-Variable Type Inference
- 296: Consolidate the JDK Forest into a Single Repository
- 304: Garbage-Collector Interface
- 307: Parallel Full GC for G1
- 310: Application Class-Data Sharing
- 312: Thread-Local Handshakes
- 313: Remove the Native-Header Generation Tool (javah)
- 314: Additional Unicode Language-Tag Extensions
- 316: Heap Allocation on Alternative Memory Devices
- 317: Experimental Java-Based JIT Compiler
- 319: Root Certificates
- 322: Time-Based Release Versioning

## [JDK 11](https://openjdk.org/projects/jdk/11/) *LTS*

- 181: Nest-Based Access Control
- 309: Dynamic Class-File Constants
- 315: Improve Aarch64 Intrinsics
- 318: Epsilon: A No-Op Garbage Collector
- 320: Remove the Java EE and CORBA Modules
- 321: HTTP Client (Standard)
- 323: Local-Variable Syntax for Lambda Parameters
- 324: Key Agreement with Curve25519 and Curve448
- 327: Unicode 10
- 328: Flight Recorder
- 329: ChaCha20 and Poly1305 Cryptographic Algorithms
- 330: Launch Single-File Source-Code Programs
- 331: Low-Overhead Heap Profiling
- 332: Transport Layer Security (TLS) 1.3
- 333: ZGC: A Scalable Low-Latency Garbage Collector (Experimental)
- 335: Deprecate the Nashorn JavaScript Engine
- 336: Deprecate the Pack200 Tools and API

## [JDK 12](https://openjdk.org/projects/jdk/12/)

- 189:	Shenandoah: A Low-Pause-Time Garbage Collector (Experimental)
- 230:	Microbenchmark Suite
- 325:	Switch Expressions (Preview)
- 334:	JVM Constants API
- 340:	One AArch64 Port, Not Two
- 341:	Default CDS Archives
- 344:	Abortable Mixed Collections for G1
- 346:	Promptly Return Unused Committed Memory from G1

## [JDK 13](https://openjdk.org/projects/jdk/13/)

- 350:	Dynamic CDS Archives
- 351:	ZGC: Uncommit Unused Memory
- 353:	Reimplement the Legacy Socket API
- 354:	Switch Expressions (Preview)
- 355:	Text Blocks (Preview)

## [JDK 14](https://openjdk.org/projects/jdk/14/)

- 305:	Pattern Matching for instanceof (Preview)
- 343:	Packaging Tool (Incubator)
- 345:	NUMA-Aware Memory Allocation for G1
- 349:	JFR Event Streaming
- 352:	Non-Volatile Mapped Byte Buffers
- 358:	Helpful NullPointerExceptions
- 359:	Records (Preview)
- 361:	Switch Expressions (Standard)
- 362:	Deprecate the Solaris and SPARC Ports
- 363:	Remove the Concurrent Mark Sweep (CMS) Garbage Collector
- 364:	ZGC on macOS
- 365:	ZGC on Windows
- 366:	Deprecate the ParallelScavenge + SerialOld GC Combination
- 367:	Remove the Pack200 Tools and API
- 368:	Text Blocks (Second Preview)
- 370:	Foreign-Memory Access API (Incubator)

## [JDK 15](https://openjdk.org/projects/jdk/15/)

- 339:	Edwards-Curve Digital Signature Algorithm (EdDSA)
- 360:	Sealed Classes (Preview)
- 371:	Hidden Classes
- 372:	Remove the Nashorn JavaScript Engine
- 373:	Reimplement the Legacy DatagramSocket API
- 374:	Disable and Deprecate Biased Locking
- 375:	Pattern Matching for instanceof (Second Preview)
- 377:	ZGC: A Scalable Low-Latency Garbage Collector
- 378:	Text Blocks
- 379:	Shenandoah: A Low-Pause-Time Garbage Collector
- 381:	Remove the Solaris and SPARC Ports
- 383:	Foreign-Memory Access API (Second Incubator)
- 384:	Records (Second Preview)
- 385:	Deprecate RMI Activation for Removal

## [JDK 16](https://openjdk.org/projects/jdk/16/)

- 338:	Vector API (Incubator)
- 347:	Enable C++14 Language Features
- 357:	Migrate from Mercurial to Git
- 369:	Migrate to GitHub
- 376:	ZGC: Concurrent Thread-Stack Processing
- 380:	Unix-Domain Socket Channels
- 386:	Alpine Linux Port
- 387:	Elastic Metaspace
- 388:	Windows/AArch64 Port
- 389:	Foreign Linker API (Incubator)
- 390:	Warnings for Value-Based Classes
- 392:	Packaging Tool
- 393:	Foreign-Memory Access API (Third Incubator)
- 394:	Pattern Matching for instanceof
- 395:	Records
- 396:	Strongly Encapsulate JDK Internals by Default
- 397:	Sealed Classes (Second Preview)

## [JDK 17](https://openjdk.org/projects/jdk/17/) *LTS*

- 306:	Restore Always-Strict Floating-Point Semantics
- 356:	Enhanced Pseudo-Random Number Generators
- 382:	New macOS Rendering Pipeline
- 391:	macOS/AArch64 Port
- 398:	Deprecate the Applet API for Removal
- 403:	Strongly Encapsulate JDK Internals
- 406:	Pattern Matching for switch (Preview)
- 407:	Remove RMI Activation
- 409:	Sealed Classes
- 410:	Remove the Experimental AOT and JIT Compiler
- 411:	Deprecate the Security Manager for Removal
- 412:	Foreign Function & Memory API (Incubator)
- 414:	Vector API (Second Incubator)
- 415:	Context-Specific Deserialization Filters

## [JDK 18](https://openjdk.org/projects/jdk/18/)

- 400:	UTF-8 by Default
- 408:	Simple Web Server
- 413:	Code Snippets in Java API Documentation
- 416:	Reimplement Core Reflection with Method Handles
- 417:	Vector API (Third Incubator)
- 418:	Internet-Address Resolution SPI
- 419:	Foreign Function & Memory API (Second Incubator)
- 420:	Pattern Matching for switch (Second Preview)
- 421:	Deprecate Finalization for Removal

## [JDK 19](https://openjdk.org/projects/jdk/19/)

- 405:	Record Patterns (Preview)
- 422:	Linux/RISC-V Port
- 424:	Foreign Function & Memory API (Preview)
- 425:	Virtual Threads (Preview)
- 426:	Vector API (Fourth Incubator)
- 427:	Pattern Matching for switch (Third Preview)
- 428:	Structured Concurrency (Incubator)

## [JDK 20](https://openjdk.org/projects/jdk/20/)

- 429:	Scoped Values (Incubator)
- 432:	Record Patterns (Second Preview)
- 433:	Pattern Matching for switch (Fourth Preview)
- 434:	Foreign Function & Memory API (Second Preview)
- 436:	Virtual Threads (Second Preview)
- 437:	Structured Concurrency (Second Incubator)
- 438:	Vector API (Fifth Incubator)

## [JDK 21](https://openjdk.org/projects/jdk/21/)

- 430:	String Templates (Preview)
- 431:	Sequenced Collections
- 439:	Generational ZGC
- 440:	Record Patterns
- 441:	Pattern Matching for switch
- 442:	Foreign Function & Memory API (Third Preview)
- 443:	Unnamed Patterns and Variables (Preview)
- 444:	Virtual Threads
- 445:	Unnamed Classes and Instance Main Methods (Preview)
- 446:	Scoped Values (Preview)
- 448:	Vector API (Sixth Incubator)
- 449:	Deprecate the Windows 32-bit x86 Port for Removal
- 451:	Prepare to Disallow the Dynamic Loading of Agents
- 452:	Key Encapsulation Mechanism API
- 453:	Structured Concurrency (Preview)

## [JDK 22](https://openjdk.org/projects/jdk/22/)

- 423: Region Pinning for G1
- 447: Statements before super(...) (Preview)
- 454: Foreign Function & Memory API
- 456: Unnamed Variables & Patterns
- 457: Class-File API (Preview)
- 458: Launch Multi-File Source-Code Programs
- 459: String Templates (Second Preview)
- 460: Vector API (Seventh Incubator)
- 461: Stream Gatherers (Preview)
- 462: Structured Concurrency (Second Preview)
- 463: Implicitly Declared Classes and Instance Main Methods (Second Preview)
- 464: Scoped Values (Second Preview)

## [JDK 23](https://openjdk.org/projects/jdk/23/)

- 455: Primitive Types in Patterns, instanceof, and switch (Preview)
- 466: Class-File API (Second Preview)
- 467: Markdown Documentation Comments
- 469: Vector API (Eighth Incubator)
- 473: Stream Gatherers (Second Preview)
- 471: Deprecate the Memory-Access Methods in sun.misc.Unsafe for Removal
- 474: ZGC: Generational Mode by Default
- 476: Module Import Declarations (Preview)
- 477: Implicitly Declared Classes and Instance Main Methods (Third Preview)
- 480: Structured Concurrency (Third Preview)
- 481: Scoped Values (Third Preview)
- 482: Flexible Constructor Bodies (Second Preview)

---

These are the "diffs" list given by the OpenJDK pages on each of the LTS release pages. In essence, these are rollups from one LTS release to the next.

# JDK 11 -> 17

## Additions

403: 	Strongly Encapsulate JDK Internals (17)
390: 	Warnings for Value-Based Classes (16)

### HotSpot JVM
386: 	Alpine Linux Port (16)
391: 	macOS/AArch64 Port (17)
340: 	One AArch64 Port, Not Two (12)
388: 	Windows/AArch64 Port (16)

### Flight Recorder
349: 	JFR Event Streaming (14)

### Garbage Collectors
344: 	Abortable Mixed Collections for G1 (12)
345: 	NUMA-Aware Memory Allocation for G1 (14)
346: 	Promptly Return Unused Committed Memory from G1 (12)
379: 	Shenandoah: A Low-Pause-Time Garbage Collector (15)
377: 	ZGC: A Scalable Low-Latency Garbage Collector (15)
376: 	ZGC: Concurrent Thread-Stack Processing (16)

### Run-Time System
341: 	Default CDS Archives (12)
350: 	Dynamic CDS Archives (13)
387: 	Elastic Metaspace (16)
358: 	Helpful NullPointerExceptions (14)

### Language
394: 	Pattern Matching for instanceof (16)
395: 	Records (16)
306: 	Restore Always-Strict Floating-Point Semantics (17)
409: 	Sealed Classes (17)
361: 	Switch Expressions (14)
378: 	Text Blocks (15)

### Libraries

#### 2D Graphics
382: 	New macOS Rendering Pipeline (17)

#### Cryptography
339: 	Edwards-Curve Digital Signature Algorithm (EdDSA) (15)

#### I/O
352: 	Non-Volatile Mapped Byte Buffers (14)
380: 	Unix-Domain Socket Channels (16)

#### Networking
373: 	Reimplement the Legacy DatagramSocket API (15)
353: 	Reimplement the Legacy Socket API (13)

#### Reflection & Method Handles
371: 	Hidden Classes (15)
334: 	JVM Constants API (12)

#### Serialization
415: 	Context-Specific Deserialization Filters (17)

#### Utilities
356: 	Enhanced Pseudo-Random Number Generators (17)

### Tools
392: 	Packaging Tool (16)

## Preview & incubating

### Language
406: 	Pattern Matching for switch (Preview) (17)

### Libraries
412: 	Foreign Function & Memory API (Incubator) (17)
414: 	Vector API (Second Incubator) (17)

## Deprecations

### HotSpot JVM
374: 	Deprecate and Disable Biased Locking (15)
366: 	Deprecate the ParallelScavenge + SerialOld GC Combination (14)

### Libraries
398: 	Deprecate the Applet API for Removal (17)
411: 	Deprecate the Security Manager for Removal (17)

## Removals

### HotSpot JVM
363: 	Remove the Concurrent Mark Sweep (CMS) Garbage Collector (14)
410: 	Remove the Experimental AOT and JIT Compiler (17)
381: 	Remove the Solaris and SPARC Ports (15)

### Libraries
407: 	Remove RMI Activation (17)
372: 	Remove the Nashorn JavaScript Engine (15)

### Tools
367: 	Remove the Pack200 Tools and API (14)

# JDK 17 -> 21

## Additions

### HotSpot JVM
422: 	Linux/RISC-V Port (19)

#### Garbage Collectors
439: 	Generational ZGC (21)

#### Serviceability
451: 	Prepare to Disallow the Dynamic Loading of Agents (21)

### Language
441: 	Pattern Matching for switch (21)
440: 	Record Patterns (21)

### Libraries
444: 	Virtual Threads (21)

#### Collections
431: 	Sequenced Collections (21)

#### Cryptography
452: 	Key Encapsulation Mechanism API (21)

#### I/O
400: 	UTF-8 by Default (18)

#### Networking
418: 	Internet-Address Resolution SPI (18)
408: 	Simple Web Server (18)

#### Reflection & Method Handles
416: 	Reimplement Core Reflection with Method Handles (18)

### Tools

#### JavaDoc
413: 	Code Snippets in Java API Documentation (18)

## Preview & Incubating

### Language
430: 	String Templates (Preview) (21)
445: 	Unnamed Classes and Instance Main Methods (Preview) (21)
443: 	Unnamed Patterns and Variables (Preview) (21)

### Libraries
442: 	Foreign Function & Memory API (Third Preview) (21)
446: 	Scoped Values (Preview) (21)
453: 	Structured Concurrency (Preview) (21)
448: 	Vector API (Sixth Incubator) (21)

## Deprecations

### HotSpot JVM
449: 	Deprecate the Windows 32-bit x86 Port for Removal (21)

### Libraries
421: 	Deprecate Finalization for Removal (18)
