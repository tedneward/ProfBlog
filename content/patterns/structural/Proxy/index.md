title=Proxy
date=2022-02-25
type=pattern
tags=pattern, structural
status=published
description=TODO
~~~~~~

***tl;dr*** The Proxy pattern ...

<!--more-->

## Problem

## Context

## Solution

Some questions arise out of this:

## Implementations

## Consequences
A Proxy tends to lead to several consequences:


## Variations
A couple of different takes on the Proxy include:

### RPC Codegen Artifacts

Often called "stubs and skeletons" (CORBA) or "proxies and stubs" (DCOM), distributed system RPC toolkits often code-generated Proxy instances at compile-time, which could then be called (client-side) or subclassed to provide implementation (server-side). In this manner, the generated client-side Proxy is acting as a distributed form of [Flyweight](../Flyweight/), often to the point that a given Proxy instance would in fact notify the server of its existence in order to keep the server-side instance alive longer via reference-counts.

### Forwarder-Receiver

This was documented in Pattern-Oriented Software Architecture, Vol 1; it is essentially the RPC Codegen Artifacts variant, above.
