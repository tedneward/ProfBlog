title=AI-generated Applications
date=2023-03-17
type=post
tags=industry, languages, database, full-stack, architecture
status=published
description=What the fact that ChatGPT can write code tells us.
~~~~~~

**tl;dr** With the recent spate of AI-driven engines (like ChatGPT) that have been shown to be able to build applications from a complete spec, a lot of folks are having a bit of an existential crisis (or else gleefully pointing out somebody else's existential crisis). Nowhere is this more pronounced than in tech--the very industry that gave us ChatGPT may now be eating itself for breakfast! (Click here to find out more!)

<!--more-->

As is common, a post on LinkedIn triggered this thought; this time, it's from my friend [Aaron Erickson](https://www.linkedin.com/in/aaronerickson), who wrote:

> "I give it 3-5 years before AI makes low end "give me a spec and I give you code" style contracting that job shops do utterly obsolete. If all an agency does is write code to a spec, your business model is about to become irrelevant." --[post](https://www.linkedin.com/posts/aaronerickson_benefits-of-using-gpt-are-really-in-your-activity-7042580186478911489-cJDd?utm_source=share&utm_medium=member_desktop)

This was in turn in response to an earlier post which said, "Last night I used GPT-4 to write code for 5 microservices for a new product. A (very good) dev quoted GBP 5k and 2 weeks. GPT-4 delivered the same in 3 hours, for USD 0.11. Genuinely mind boggling."

No, it's really not that all that mind-boggling. It's an indicator of something I've been believing (and speaking about) for many years: ***Our tools are not elevating our game.***

## Levels of Abstraction
Part of the goal of any programming language is to take abstract concepts (like functions, procedures, objects, and so on) and transform them (compile them) into low-level constructs that a CPU knows how to execute (machine code). Different languages choose different levels of abstraction as first-class concepts; Smalltalk chose a very high level of abstraction (objects and messaging), whereas C chose a very low level of abstraction. In fact, C was originally intended as a "portable assembler" for most UNIX machines--hence it's heavy use of pointers and memory locations as part of its "surface area" when programming in it. It's why C was known as a "systems" language--you could build operating systems with it.

C++ chose to bring object-orientation to C, but for the most part, Bjarne Stroustrup wanted to keep the flavor and abstraction level of C intact. "If you don't use it, don't pay for it" was a common theme in the days of C++, and so for example, compiled classes wouldn't contain a v-table unless the class had an actual virtual method in it somewhere. References were pointers but without the ability to pointer-math them. (It's OK, you could always convert it back to an address with a cast.) And so on.

Other C++-inspired languages, such as Java or C#, followed the C++ model pretty closely, but even languages like Python adhere pretty closely to a lot of the things C++ and C held up. Slowly they've been taking steps away from the low-level nature of early C/C++ code, but still there's a ton of features in each of these languages that reflect an ancestry of a "portable assembler".

And we're using those languages to write microservices and full-stack applications?

## Degrees of Differentiation
Meanwhile, in the world where microservices are being built, we have dozens of languages and frameworks that all "make it easier" to write microservices, and almsot without exception, most of these microservices are all doing roughly 80% the same thing: take an incoming API request, do some logic to it, store it into a database behind the service. We debate over which languages to use, which frameworks to use, and which databases to use, but fundamentally it's all the same thing: we're rebuilding the same stuff with some (maybe) different "business logic" scattered in there somewhere.

The desktop, mobile, and web applications we build, meanwhile, all very much do the same things and display the same things and validate the same things. And in each case, we may argue over which web framework to use, which unit testing tools to use, and so on, and so on, *ad infinitum*.

A long time ago, early in my career, I went to work for a company that had a team building an application to help nurses in a call center take phone calls for a variety of things: referrals to doctors, general guidelines around whether to go to the ER, questions about their insurance plan, and so on. This was the first generation of a now-ubiquitous feature for insurance companies, but the Director of Development summed up the C++/Windows 2-tier client-server application and Oracle database very simply: "It's just dialogs over data."

Folks, it's almost *all* just dialogs over data. The dialogs have gotten more sophisticated and have different kinds of input to handle, but fundamentally, every health care, every financial, every e-commerce app... they're all just "dialogs over data".

And when you see that, you begin to realize that maybe instead of trying to write the next amazing object-oriented language that incorporates *this* feature from someplace else or adds *that* idea from some other language, we need to start thinking about how we elevate the abstraction level entirely.

## What about....
Think about this for a second. Imagine we want to build a system that allows attendees to sign up for talks by speakers at a conference. The object world spots three clear objects there: Attendee, Speaker, Talk. Three classes, with properties and methods. A few restrictions, obviously, such as limits on the number of attendees in a given talk, or that Speakers can "share" a Talk (give it together), and so on. We could easily come up with a half-dozen or more "business rules" without thinking about it too hard, and I'm sure we could get that number up to two dozen or more if we wanted to add a few more concepts (like Room, or prerequisite Talks before you can attend a particular Talk).

How long would it take you to build this application, from scratch, as a "front-end" (I'll let you pick web, mobile, and/or desktop) talking to a "back end" storing data in a database?

And yet, we've built something like this dozens of times before.

And we're wondering why an AI engine, which does *really well* keying off of thousands of examples of near-exactly-the-same-thing, knows how to build one of these?

Surprise: This is a large part of the reason low-code/no-code tools are creating a huge surge in interest right now. The low-code/no-code tool takes an opinionated "line" through all the different layers in an application stack, and suddenly you can turn out an application with some slightly-adjusted business logic that is ready to go in moments. How hard would it be to see a "low-code/no-code microservice" tool before long? Honestly, I'm kinda surprised that it hasn't already made it out the door yet.

## Steps forward
Aaron's right--if we don't elevate our game, we're going to find that AI can churn out these kinds of applications with ease; in fact, it'll probably get so good it'll have one meta-pattern stamped somewhere in its silicon axons and dendrons and it'll just "fill in" the salient spots. All the way up until I can't anymore, I mean.

One of the more interesting exercises to play is to take a look at [Naked Objects](https://en.wikipedia.org/wiki/Naked_objects). It's not a fun place for programmers to hang out sometimes, because it suggests that somebody could build an app with this in a fraction of the time, feels like low-code/no-code, what happens when we need to customize something, and so on.

But let's stop for a moment and consider: Naked Objects are a re-imagining of what Smalltalk (and Self) tried to build, which was an *entire environment* that contained front-end all the way through to storage. Gemstone, for example, had automatic data storage baked in to its Smalltalk development environment, so building an application there meant you had literally the entire "full stack" in one place, ready to go.

Ironically, so did Microsoft Access. And Visual Fox Pro.

In a previous post, I talked about what [I want to build](../2023/what-i-want-to-build.html), and this kind of an environment is high on that list of desirables. I don't think it needs to be an industry-spanning "take over the world" kind of language/tool/environment, though; I think it can actually be built out of existing off-the-shelf frameworks and tools, tuned to a particular corporate domain, allowing for developer and non-developer alike to create applications and extensions to the core platform.

It's simply a question of when we will stop chasing after assembly language, and genuinely embrace a higher level of abstraction.
