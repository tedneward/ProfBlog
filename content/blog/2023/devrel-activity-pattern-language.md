title=A DevRel Activity Pattern Language
date=2023-02-01
type=post
tags=devrel
status=draft
description=A pattern language of Developer Relations activities.
~~~~~~

**tl;dr** Developer Relations consists of a number of different activities that accomplish different things, but nobody's ever really sat down and talked about when to use which activity over another. I thought it was time to bring all of them together into a single, cohesive "whole". Being a fan of patterns, I thought the best way to do that was to weave them together into a pattern language.

<!--more-->

If you're already familiar with pattern languages and how to use them, or you're just impatient, go ahead and [jump to the language](../../devrel/activities.html). If you're a more patient sort, or if you're not sure how to use pattern languages, read on. (And if you come back here after taking a quick look at the catalog to see a little bit more about how to use it, I promise I won't tell anyone.)

## What is a pattern language?

[Wikipedia defines it thusly](https://en.wikipedia.org/wiki/Pattern_language): "A pattern language is an organized and coherent set of patterns, each of which describes a problem and the core of a solution that can be used in many ways within a specific field of expertise. ... A pattern language can also be an attempt to express the deeper wisdom of what brings aliveness within a particular field of human endeavor, through a set of interconnected patterns. ... (O)rdinary people can use this design approach to successfully solve very large, complex design problems."

In this scenario, the "very large, complex design problem" is that faced by a Developer Relations team, particularly its leader (team lead, Director, or VP): Of the large number of different activities we can do, which ones best accomplish our goals? Where can we put our precious resources (time and money) to get the most return? How best do we interact with the developer communities we serve (for the particular definition of "best" we care to define)?

In essence, the pattern language offers at least a modicum of structure: to conduct a Developer Relations *campaign*, first identify the *persona* of developer you seek to reach, the *results* (metrics, perhaps?) that will tell you you have reached them, and the *activities* that will help you best achieve those results. (This is a pretty high-level oversimplification of running a DevRel organization... but not too high-level, and not too oversimplified, I think.)

### OK, what's a persona?

In a nutshell, your target. Your audience. Your chosen developer demographic. It goes by many names, but in essence, it's a description of the kind of developer you're trying to reach. It may be easier to explain by example. Imagine you are working for a NoSQL database company, one that historically has been used for one purpose (perhaps as a caching layer) but has recently made some technical changes that enable it for use in a variety of other scenarios. As the VP of DevRel, your job is to bring the idea of using it in those other scenarios to light within the developer communities. 

Consider these personae:

> **Tina** is 25 and a front-end developer at ACME Manufacturing. She knows Javascript (React, mostly), CSS, and HTML, and works on software that provides UI to the various services that manage ACME's supply chain system with their partners. She has been coding for two years, having graduated from a coding bootcamp after college, and she has recently started dabbling with the use of document-oriented NoSQL databases over HTTP from her front-end applications.

> **Abdi** is 32 and a back-end developer at Netflix, where he focuses primarily on building ultra-reliable systems that never crash--or when they do, recover nearly instantly. He is a CS graduate from the University of Washington, been building back-end systems since he graduated, and spends nearly as much time reading about enhancements to the Gossip protocols as he does tips on how to better program in Rust (which is what he uses on the job).

> **Shawon** is 45 and runs an engineering team at Publix Markets (a grocery store chain). The team builds software to help the store manage its inventory and supply chain, and its most recent "big project" was the pandemic-inspired "grocery delivery service", in which customers can shop online, have store employees pick out the relevant items, and either have them ready for fast pick-up at the store location, or use a delivery driver to bring them to the customer directly. Shawon's background is as a former developer (C++, back in the day), but she hasn't touched code directly in ten years. 

Which of these is more likely to be interested in your messaging, enough to take a harder look at your product/service? Now, where does that individual go for information? Which developer portals, which conferences, which magazines (print or online), and so on? Establishing your target persona (or personae, there may be several) helps streamline the decision-making process around "which developers" you want to reach.

Note: While it might be tempting to "re-use" personas like the ones above, don't. Take the time to build your own--it serves as a useful reason for the DevRel team to get into a room with all the other teams (Sales, Marketing, Product, Engineering, whatever) and talk about exactly who this product/service is for. Some of your peer teams will have already done this exercise, some won't, but everyone--including Engineering--will benefit from the time spent building them.

### Wait, so I'm supposed to use all of them?

Oh, Lord, no! The pattern language is an attempt to categorize and summarize *all* of the different kinds of activities, but it's in no way intended as a "check every item off on this list" kind of collection. In fact, I'll argue that even *trying* to use them all is itself a huge red flag! Look at your goals, look at your available resources (bandwidth and budget), and make deliberate choices selectively that help get you closer to your goals.

Keep in mind that most DevRel team strategies will want to make use of several activities simultaneously, so choose ones that have a good mix of reach and interactivity; [Conference Sessions](../../devrel/activities.html#conference-session) have good interactivity, but limited reach, so consider pairing them with [Live Streaming](../../devrel/activities.html#live-streaming) to boost reach, and perhaps advertise both using [Social Media](../../devrel/activities.html#social-media). And so on.

## So... show me!

The [DevRel Activity Pattern Language](../../devrel/activities.html) is not "finished", in that no pattern language is ever really finished--there's always realizations and/or innovations that can be captured, analyzed, and categorized. Pattern languages are intended to be somewhat informal, yet hopefully comprehensive. It is not uncommon for people who have "lived this" for years to look at a pattern language and growl, "But I already know all these things! I've done this before!" The same was true of the original [Design Patterns](https://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612) book thirty years ago. 

### How do we use this?

What a pattern language does is provide us with a unified lexicon--a glossary--that we can all agree on without having to define our definitions every time a new person joins the meeting, as well as a framework by which to think about the choices we make and how they might easily work together with other choices and/or directions. Additionally, it can help give newcomers to the field a "leg up" on understanding the breadth and depth of the space, and provide a reference tool as they wade through this new space we call Developer Relations. And, honestly, I'm looking forward to using this as a reference when hashing out my next DevRel team strategy--and I'm hoping you will, too.

### What if I'm not the DevRel leader?

There's a couple of ways it can still be useful: as a list of all the *possible* things you could be doing, so that you can suggest a few during team meetings; as a list to discuss with the rest of your team so that you can have more focused conversations about goals and objectives; and maybe even a way to think about your own activities when writing up your accomplishments for the year/quarter/resume.

## Wrapping up

If you find it useful, I'm glad; if you don't, I'm sad, but thank you for your time anyway. And if you're *really* excited by this, perhaps you want to consider contributing some time to it by dropping me a note with your feedback? (And yes, I'd love to consider your company hiring me to run your DevRel org!)

### Thanks

Much thanks to Chris "Woody" Woodruff, Taylor Krusen, Scott McAllister, Matthew Groes, and James Ward, for their feedback, ideas, challenges, and suggestions. 