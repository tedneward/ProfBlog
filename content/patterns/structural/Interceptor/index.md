title=Interceptor
date=2016-03-25
type=pattern
tags=pattern, structural
status=published
description=Provide additional functionality to an existing component by "intercepting" a request to the component and either replacing or supplementing the component's behavior.
~~~~~~

*tl;dr* Interceptors were popular particularly in distributed systems (CORBA, EJB, DCOM) providing transactional capabilities: an interceptor would begin a transaction, allow the component to carry out its work (usually involving some work against a database), and then commit, abort, or roll back the transaction based on the results of the component's behavior. 

<!--more-->

The concept is one that stretches well beyond distributed systems, however, including some of the more crude "aspect-oriented" implementations that used proxies or code-generation (either compile-time or run-time) to put behavior before, around, or after a component method or field. Additionally, component containers (such as a Java Servlet engine from the Java Enterprise Edition specifications) often provide interceptor functionality (such as "filters" in the Java Servlet specification).

## Problem

Often, behavior is common yet independent of a particular family of objects, and therefore is difficult to capture using traditional object-oriented means. While the behavior can often be 

## Context

*The additional behavior is common across component families.*

## Solution

Create a block of code that can be "hooked" into place where the original component's method is expected, such that callers to the original component's method are now invoking the Interceptor. The Interceptor can (and should) have access to the parameters passed in to the method call, but generally also pass those parameters (possibly modified) on to the original component's method for processing, and take the return value from that processing and hand it back (possibly modified) to the original caller.

Note that this allows for Interceptors to "stack", one after the other, each providing some specific behavior to a variety of different components that otherwise have nothing to do with each other.

## Implementations

## Consequences

* *Behavior can be dynamically determined.* Interceptors are often (though not always, depending on the tool and/or the need) installed at runtime, thus allowing for runtime configuration based on conditions that may not be known at compile-time or deploy-time, or even entirely based on user preferences or choices.

* *Performance.* Each interceptor adds additional processing (which often means one or more additional method call blocks) to the cost of carrying out the component's original behavior; too many such interceptors, and the performance cost of calling the component's behavior becomes buried in the surrounding "noise" of the additional behavior.

* *Clarity.* The ability to define the additional behavior in an Interceptor is both blessing and curse--the additional behavior is captured in one place, but it can sometimes be counterintuitive for additional behavior to be executing that isn't obvious when looking at the code for the original component, particularly if the Interceptor is installed at runtime. For example, when looking at a servlet, developers may be expecting to find authorization checks within the servlet code, and upon not finding them (and not knowing the authorization checks are actually happening within a filter that executes prior and after the servlet processes the request), conclude that they never happen.

## Relationships

Interceptors will often reference a [Context Object](../ContextObject) for support, expecting the parameters used to invoke the original component to be available, as well as any additional supporting data or functionality.

Interceptors can be chained like a [Chain of Responsibility](../../behavioral/ChainOfResponsibility/), but where the Chain generally looks for the first handler and aborts the remainder of the chain, interceptors are usually all guaranteed a chance to run and provide the behavior desired.

Interceptors are often modeled using [Proxy](../Proxy/), but the use of a proxy object is not required--only that the original component's behavior is adjusted. Proxies can often hold some interesting state of use only to the interceptor, but that can also be held via [Closure-Based State](../ClosureBasedState/) in situations where the original object must be maintained in place.

[Dynamic Objects](../DynamicObject) are particularly easy to use in conjunction with Interceptors, as the meta-object replacement of the object's behavior with the Interceptor is usually a trivial operation--however, the interceptor must be careful to retain a reference to the original behavior if the original behavior is to remain accessible to the Interceptor.

If all of an object's methods are valid targets for an Interceptor, and the additional behavior is known at compile-time (or at least at the time of instantiation), a [Decorator](../Decorator) may in fact be a more effective and/or efficient means of behavioral supplementation.

## Variations


