title=Architectural Patterns
date=2022-03-09
type=patternsindex
tags=patterns
status=published
description=Architectural patterns
patternfilter=architectural
~~~~~~

***tl;dr*** The topic of architectural patterns has been hotly debated among myself and my peers for a while, with no real clear-cut definition. Some feel they're self-evident, others feel like there's a lot of architectural solutions that are being overly generalized as patterns, and still others feel like architecture is itself overly broad/vague/general and therefore not easily capturable as patterns. Combine with this Fielding's Representational State Transfer (REST) self-describing as an architectural "style", and you have a space that's rife with uncertainty. Still, those patterns which have obvious application as architecture are easy to capture and discuss, so I choose to do that for now, though this section most likely will be refactored pretty heavily as time goes on. 

<!--more-->

The [Blackboard](../behavioral/Blackboard/) sets up individual components to cooperatively collaborate on producing a solution that may not be known *a priori*. When this is used at an architectural level, it is often a rules engine such as CLIPS or JESS.

[Layers](../structural/Layers/) is a classic architectural pattern in which different portions of the code are segregated. Traditionally, at the architectural level, Layers are split into "presentation", "logic", and "storage", and often implicitly correspond to tiers (physical topology in the network); in fact, this implicit assumption was often held too tightly, and created unnecessary network traffic and/or never openly considered as part of architectural conversations.

A [Pipes and Filters](../behavioral/PipesAndFilters/) architecture is most easily recognized at the *nix command-line, where multiple standalone programs (like `sed` and `awk` and `tee` and so on) combine to process a flow of text (characters) in sequence. Microsoft PowerShell uses the same architecture, this time using .NET components instead of standalone programs, and a pipeline of objects instead of textual characters.

[Message-Passing Interface](../structural/MessagePassingInterface/) is a common pattern for building distributed systems, where the messages travel over the network to intended recipients, usually through a message-delivery subsystem that allows for asynchronous and temporally-disconnected communication. If the message-passing has multiple recipients, where the first recipient to care about the message pulls it out of the queue/topic, thus combining with a [Chain of Responsibility](../behavioral/ChainOfResponsibility/), it is often called a "Publish-Subscribe" or "pub-sub" system. If the message-passing has multiple recipients and they all get equal opportunity to process the message, it is combinding with an [Observer](../behavioral/Observer/) and is often called an "Event Bus".

The [Microkernel](../structural/Microkernel/) architecture is popular among operating systems, where the smallest-possible core is defined as the OS kernel, and as much work as possible is deferred to components outside the kernel so as to minimize the "surface area" in the kernel and leave as much to be supplemental/replaceable as possible. Ironically, microkernel-based architecture among operating systems is less popular these days, mostly for performance reasons--the cost of crossing from kernel space to user space is high compared to keeping communication inside kernel space.



