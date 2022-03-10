title=Value Object
date=2022-03-09
type=pattern
tags=pattern, structural
status=published
description=Some objects represent values and have no intrinsic sense of identity or uniqueness. As such, these objects must present different semantics around their use.
~~~~~~

***tl;dr*** A Value Object ...

<!--more-->

## Problem

## Context

## Solution

Some questions arise out of this:

## Implementations

## Consequences
Value Objects tend to lead to several consequences:


## Variations
A couple of different takes on Value Object include:

### Data Transfer Object (DTO)
DTOs are essentially Value Objects designed for transmission across network links; they are, in essence, bundles of data, typically intended as part of a query or query response, and quite often have no domain or business behavior defined. In languages which support tuples natively, these are most often a tuple implementation, although sometimes there may be some optionality semantics that are hard to capture with a tuple.
