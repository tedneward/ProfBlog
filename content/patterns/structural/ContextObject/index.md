title=Context Object
date=2022-02-25
type=pattern
tags=pattern, behavioral
status=published
description=Use an object to provide some degree of inference or reference about the environment in which another object or group of objects is operating. 
~~~~~~

***tl;dr*** Context Objects often provide a degree of scope for a group of objects operating within a larger space (such as an app server), and as such often serve as a means of access both outside of the scope (for those objects within it) and to the inside of the scope (for those objects outside of it) without violating encapsulation. 

<!--more-->

To create a Context Object, define a wrapper object that encapsulates all aspects of an operation, including details that may not be directly related to that operation. Context allows an object or graph of objects to be handled in a single logical unit, as part of a logical unit of work.

In its simplest form, a Context Object can also serve as a Parameter Object.

## Problem

## Context
*(Irony....)*

## Solution

Some questions arise out of this:

## Implementations

## Consequences
A Context Object tends to lead to several consequences:


## Variations
A couple of different takes on the Context Object include:

---

From the blog post:

<h2>Context</h2>
<h3>Context (Object Behavioral)</h3>
<p>Define a wrapper object that encapsulates all aspects of an operation, including details that may not be directly related to that operation. Context allows an object or graph of objects to be handled in a single logical unit, as part of a logical unit of work.

<h3>Motivation</h3>
<p>Frequently an operation, which consists fundamentally of inputs and a generated output, requires additional information by which to carry out its work. In some cases, this consists of out-of-band information, such as historical data, previous values, or quality-of-service data, which needs to travel with the operation regardless of its execution path within the system. The desire is to decouple the various participants working with the operation from having to know everything that is being "carried around" as part of the operation.  <p>In many cases, a Context will be what is passed around between the various actors in a Chain of Responsibility (223).

<h3>Consequences</h3> <p>I'm not sure yet.<br> <h3>Known Uses</h3> <p>Several distributed communication toolkits make use of Context or something very similar to it. COM+, for example, uses the notion of Context as a interception barrier, allowing for a tightly-coupled graph of objects to be treated as an atomic unit, synchronizing multi-threaded calls into the context, also called an apartment. Transactions are traced as they flow through different parts of the system, such that each Context knows the transaction ID it was associated with and can allow that same transaction ID (the causality) to continue to flow through, thus avoiding self-deadlock.  <p>Web Services also make use of Context, using the SOAP Message format as a mechanism in which out-of-band information, such as security headers and addressing information, can be conveyed without "polluting" the data stored in the message itself. WS-Security, WS-Transaction, WS-Routing, among others, are all examples of specifications that simply add headers to SOAP messages, so that other "processing nodes" in the Web service call chain can provide the appropriate semantics.  <p>(I know there are others, but nothing's coming to mind at the moment.)

<h3>Related Patterns</h3>
<p>Context is often the object passed along a Chain of Responsibility; each ConcreteHandler in the Chain examines the Context and potentially modifies it as necessary before handing it along to the next Handler in the Chain.
<p>Context is also used as a wrapper for a Command object, providing additional information beyond the Command itself. The key difference between the two is that Context provides out-of-band information that the Command object may not even know is there, for processing by others around the Command. </p>

---

The followup looked like this:

<blockquote>
<p>Wow--lots of you have posted comments about Context. Let's address some of them and see what comes up in the second iteration:  <ul> <li> <p>Michael Earls wrote:  <blockquote>Very timely. I'm building a system right now that fits this pattern. We spent about five minutes determining what to call "it" (the little "black box" that holds the core command, entity, and metadata information). We settled on "nugget". Now there's prior art I can refer to. I'm using Context with WSE 2.0 and SOAP extensions for the pipeline in exactly the way you describe. Nice.</blockquote>and  <blockquote>Another Related Pattern: Additionally, the Context may also be an container/extension/augmentation/decoration on the UnitOfWork (???).</blockquote>I suspect you're right--Context can be used to hold the information surrounding a UnitOfWork, including the transaction it's bound to (if the transaction is already opened). This is somewhat similar to what the MTS implementation does, if I'm not mistaken. <p></p> <li> <p>Kris wrote:  <blockquote>The HTTP pipeline in ASP.NET comes to mind, with the HttpContext being passed through for various things like session state, security, etc. One possible side effect that I can see (hopefully you can drop some thoughts on this one), is how to manage dependencies between the chain, as well as order of invocation of chain elements. The MS PAG stuff I believe talks about this somewhat with the Pipelines &amp; Filters pattern, but I'd love to hear your thoughts as well.</blockquote>The PAG stuff (Sandy Khaund's post) was part of what triggered this post in the first place, but I want to be careful not to rely too much on Microsoft prior art (WSE, Shadowfax, HttpContext, COM/MTS/COM+) since in many cases those systems were designed by people who had worked together before and/or shared ideas. The Rule of Three says that the pattern needs to be discovered "independently" of any other system, although with Google around these days that's becoming harder and harder to do. :-) As to managing dependencies between the chain, I think that's out of scope to Context itself--in fact, that raises another interesting pattern relationship, in that Context can be the thing operated upon by a Blackboard [POSA1 71]. Context doesn't care who interacts with it when, IMHO. <p></p> <li> <p>Dan Moore wrote:  <blockquote>Another context <i>(pun intended? --TKN)</i> I've read a lot about is the transactional context used in enterprise transaction processing systems. This entity contains information about the transaction, needed by various participants.</blockquote>Yep. Read on (Dan Malks' post). <p></p> <li> <p>Dan Malks wrote:  <blockquote>Hi Ted, Good start with your pattern writeup :) We document "Context Object" in our pattern catalog in our book "Core J2EE Patterns" 2nd ed., Alur, Crupi, Malks. I hope you'll find some interesting content in our writeup, so please feel free to have a look and let me know what you think. Thanks, Dan Malks</blockquote>Thanks, Dan. As soon as you posted I ran off and grabbed my copy of your book, and looked it up, and while I think there's definitely some overlap (boy what I wouldn't give to workshop this thing at PLOP this year), Context Object, given the protocol-independence focus that you guys gave it in Core J2EE, looks like a potential combination of Context and Chain of Responsibility. I wanted to elevate Context out of just the Chain of Responsibility usage, though, to create something that isn't "part of" another pattern--I'll leave it to you guys to decide whether Context makes sense in that regard. <p></p> <li> <p>Mark Levison wrote:  <blockquote>On related patterns: Context is what is passed into a Flyweight (alias Glyph's). We've been using Context for over two years on current project.</blockquote>Really? Wow; I never would have considered that, but of course it makes sense when you describe it that way. I'm not really keeping track, but I think we've reached the Rule of Three.
