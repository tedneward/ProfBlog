title=Technical Debt: A Definition
date=2016-01-18
type=post
tags=development processes, psychology, philosophy, industry, reading
status=published
description=In which I talk about the concept of technical debt.
~~~~~~

**tl;dr** A recent post on medium.com addresses the topic of technical debt; I had an intuitive disagreement with the thrust of the post, and wrote this as a way of clarifying my own thoughts on the matter. It raises some interesting questions about what technical debt actually is---and if we can't define it, how can we possibly understand how to avoid it or remove it, as opposed to our current practice of using it as a "get-out-of-this-codebase-by-blowing-it-all-up" card?

<!--more-->

[@kellan wrote](https://medium.com/@kellan/towards-an-understanding-of-technical-debt-ae0f97cc0553#.k5o49zz9r):

> Technical debt exists. But it’s relatively rare. When you start arguing with someone about technical debt, you’ll generally encounter a definition like: Technical debt is the choices we made in our code, intentionally, to speed up development today, knowing we’d have to change them later. Hard coding a variable because currently there is no plan to change it is a common example of technical debt. Similarly not modularizing a function.

> This is a fairly clear, succinct, and easy to reason about definition, that describes a phenomena that exists relatively rarely. Relatively rare compared to what? Compared to the amount of technical debt we ascribe to the codebases we work on. How then do we explain the overwhelming prevalence of technical debt we encounter when we talk to people about code?

> The term is being abused, or at least dangerously overloaded.

He's certainly right about that! But just prior to that, he says, "Technical debt doesn't exist", and sort of wanders around that idea for a bit.

Here's the rub: He then tries to define what technical debt actually *is*:

1. "Maintenance work."
2. "Features of the codebase that resist change."
3. "Operability choices that resist change."
4. "Code choices that suck the will to live."
5. "Dependencies that resist upgrading."

I'll leave you to read his descriptions of each.

### Critique
Unfortunately, a lot of the definitions he raises there are highly subjective and extremely difficult to understand, except at a base, emotional, almost visceral level. I mean, when you explicitly use the phrase "suck the will to live" as one of your definitions, it's hard to really put a concrete discussion around that.

Consider, for example, that particular point: "A significant percentage of what gets referred to as technical debt are the decisions that don’t so much discourage change but rather discourage us from even wanting to look at the code. ... We often describe this code with the suck-the-will-to-live quality as messy (spaghetti), unmaintainable, or amateurish. Often what we’re describing under the surface is fear and confusion. We don’t understand the code, and when we don’t understand things, as human, we tend to get scared, tired, and angry."

I'm sure every single person reading this has an immediate reaction, akin to the screams through the Force that Obi-Wan felt when Alderaan was destroyed. Everybody remembers That One Project, or That One Class, or That One File.... Nobody wanted to touch it, it was a mess, and people would look for every reason under the sun to avoid opening it, as if there was some kind of icky black ichor that could ooze out of the screen and keyboard and infect us with its ugliness.

And yet, if we compare the stories, we will all have very different concrete-terms descriptions of what that thing was. And I'll even bet that if you cast the net wide enough, and we spend enough time comparing stories, we'll even find that one man's "suck the will to live" is another man's "Whoa, man, that's actually kind of a cool hack."

Case in point: in the earliest days of my career, I was a contractor working on some C/Win16 code at Intuit. A really cool 3-month gig (and in those days, it was way cool to have Intuit on your resume). I was working as part of the "Slickrock" team, which was the code-name for Intuit's nascent electronic banking section of Quicken 5 for Windows. It was some cool stuff.

Except....

Well, first of all, everything was written in C. Not C++, as was the leading-edge of the day, but using Intuit's home-grown C/Windows library that they'd put together since the earliest days of the product. At the time, I was kinda bleah on the whole idea. (In retrospect, hey, if it still works, you know?)

And there was this one dialog box to which I was assigned, which had a bunch of bugs in it that needed fixing, that nobody else on the team wanted to touch. Eager to prove to all these grizzled veterans that I was capable of handling the toughest stuff, I leapt at the chance to get into this thing. (If you get this picture of the eager young Private fresh from boot camp, volunteering to go out on that mission that the grizzled old Sargeant knows will just crush the life out of him, you're probably not too far off the mark.)

And here's what I found: this dialog box code was one, giant, four-page-long function, where three-and-three-quarters of it was wrapped in one giant-ass `do-while` loop. But not just any `do-while` loop; no, this one was the most bizarre thing I'd ever seen. It looked something like this:

````c
do {
  /* do one thing */
  
  /* do another thing */
  
  /* check that thing */
  
  /* what about the thing over there */
} while (0);
````

It was my own private "WTF?!?" moment. No wonder everybody wanted to stay clear of this thing! This was the craziest code I'd ever seen, and clearly it was because they weren't using C++!

(Yeah, I kinda was that stupid back then.)

But when I showed this to one of the other engineers and said the 90's equivalent of "Dude, seriously?", he pointed out that I'd missed an important part of the whole thing:

````c
int result = -1; /* Not OK! */
do {
  /* do one thing */
  if (!thing-worked)
    break;
  
  /* do another thing */
  if (!another-thing-worked)
    break;
  
  /* check that thing */
  if (!thing-checked)
    break;
  
  /* what about the thing over there */
  if (!thing-over-there-checked)
    break;
    
  result = 0; /* OK! */
} while (0);
return result;
````

In other words, this incredibly idiotic thing actually served a useful purpose: it obeyed the old C rule of "single entry, single exit", and more importantly, it was rather elegantly obeying the fail-fast principle. (Why bother doing all these other checks if you've already failed at the first step?)

Now, I grant you, this could've been solved using C++ using exceptions; instead of the (not-really-a-)loop, he could just have done a "try", and then each step could've thrown their own new exception type, and there'd have been either a single "catch" to return the appropriate error code (since this block was returning either -1 or 0, depending on success), or even maybe a separate "catch" block to handle each different error condition, and---

But you know what? Today, looking back at it, I don't know if that would've been much clearer, or much shorter, or what-have-you.

Is this still life-sucking-code? Or is this an elegant hack? I'll be honest, I'm not sure anymore, of either position.

### Technical Debt: A Definition
I don't have one.

Seriously.

Not one I particularly like, anyway. Google it, and you get:

> Technical debt (also known as design debt or code debt) is a metaphor referring to the eventual consequences of any system design, software architecture or software development within a codebase.

"eventual consequences"? You mean, like "it works"? Seriously, consequences are not always bad, which is why the Gang-of-Four used that same word to describe the results of a particular solution applied to a particular problem within a certain context. Consequences can be positive, and they can also be negative. The use of the Strategy pattern can allow for varying an algorithm at runtime---but with it comes an added cost in complexity of determining which Strategy to load, for example, or the additional cognitive load of having to realize that now the Strategy being executed may be nowhere local to the code actually executing it (which would at some level seem to violate the principle of locality, depending on the situation).

Wikipedia goes on to say:

> The debt can be thought of as work that needs to be done before a particular job can be considered complete or proper.

Now that's interesting, because that certainly doesn't jibe with what @kellan was alluding to earlier---this sounds like things like documentation and tests and such. And yes, that definitely could create a problem, if a company/team/programmer goes off and writes a whole bunch of untested, undocumented code; I'd call that indebted code, probably, sure.

Unless, you know, it doesn't really need documentation. Or tests. Like, for example, a module composed of much smaller functions, each of which are effectively small primitives that really don't need testing, a la:

````ruby
def calcuate(lhn, op, rhn)
  return op(lhn, rhg)
end

def add(lhn, rhn)
  return lhn + rhn
end

def sub(lhn, rhn)
  return lhn - rhn
end

puts calculate(1, add, 2)
````

Do these really require comments? Tests? Wouldn't it actually *add* to the technical debt to put those into place, since now they must be maintained and kept up to date should something change in here?

I'm obviously reaching here, but I don't think the point is entirely invalidated by the simplicity of my example---after all, well-written methods are supposed to be small and focused, and we prefer classes not to be large, and so on, for precisely these kinds of reasons.

### Technical Debt: It's a metaphor, stupid
Go back to Wikipedia for a second; there, they finish the definition's first paragraph with this:

> If the debt is not repaid, then it will keep on accumulating interest, making it hard to implement changes later on. Unaddressed technical debt increases software entropy.

See, this is the heart of the matter: technical debt is a metaphor. That's it. That's all it is. It's a literary mechanism designed to help people who are not programmers understand that there are decisions made during the development process of a project, decisions which are deliberate choices to take a shortcut or avoid a more generic solution in the interests of getting past the obstacle quickly.

Except that nothing ever remains "just" a metaphor in our industry. Inevitably, we have to dissect it, treat as if it were a real, in-the-room-with-us kind of thing, and start crusades "for" or "against" it. Because REASONS.

And I admit, I'm not immune to this tendency myself. Because in examining a metaphor, so long as we recognize it's a metaphor and therefore bound to fail at some point (the model is not reality), we can actually find some interesting edge-cases that may or may not apply, and that leads us to some interesting conversations about the concept, even if it doesn't fit the metaphor anymore.

### Technical Debt: A Fowlerian Definition
Martin Fowler has gone into great detail about the different kinds of technical debt in the form of a [debt quadrant](http://martinfowler.com/bliki/TechnicalDebtQuadrant.html), arranged along two axes of "Deliberate vs Inadvertent" against "Reckless vs Prudent".

I like this, simply by virtue of the fact that it captures the mindset of the developer or the team at the time they were making that decision.

But I *don't* like it because, well, because who cares what they were thinking, or why? Isn't technical debt just technical debt? I mean, that $50 purchase on your credit card, was it a measured and thoughtful purchase, perhaps some tools at the local hardware store, so that you can perform some home repais, or was it a reckless and idiotic purchase, perhaps some tools at the local hardware store, so that you can pretend to yourself that you're actually going to take this weekend and perform some home repairs, but deep down you know you're just fooling yourself, you'll never get it done, and the tools will now be left to rust in a quiet corner of the garage (or worse, you'll leave them out in the backyard and it rains and and and)?

Seriously: the guy who wrote that `do-while` loop at Intuit? I have no idea what he was thinking---and did that intent really make a helluvalot of difference to me (or the rest of the team) as I (we) tried to pick it up and extend/modify/debug it? I won't speak for the rest of the team, but to me, it made not a single whit of difference.

But here's the vastly more important thing to realize about debt: At the end of the day, *you still owe $50*. 

Wherever that debt appears on Fowler's quadrant, you still have to pay it off. Or it will gather interest, and eventually (if you leave it long enough) bankrupt you. 

Granted, this is perhaps where that metaphor starts to wear a little thin. In a codebase, where we perhaps deliberately chose not to use a Strategy pattern, but instead just coded the algorithm by hand directly into the code, because we don't really see any need for any greater degree of flexibility, we have potentially amassed some (perhaps small) amount of technical debt. The $50 hammer, if you will.

In a traditional credit card scenario, that $50, compounded at 5% or 10% interest, will, without exception, eventually turn into a monstrous pile of debt that you cannot pay off, assuming you leave it unpaid for that long.

But that non-Strategized algorithm? So long as the client requirements don't change, there's not a thing wrong with it. It can continue to run, and run, and run, until the heat death of the universe, and nothing happens.

This suggests to me that technical debt isn't just about what the developers on the team at the time were thinking about. This suggests that technical debt has two more components to it:

* The thoughts of the developer(s) who have now inherited the code.
* The requirements (or lack thereof) of the project for which the code was written.

See, if the client never changes their requirements, *there is no technical debt*. So long as the code continues to run, without problem, then what the code looks like is entirely irrelevant. It's only when the client says, "OK, now we need to do this other thing with this codebase" that it becomes a problem.

Although, now that I write this, I realize that's not entirely accurate, either.

If the client's requirements haven't changed, but the code doesn't run, or runs into errors while running? Those are bugs, and the code needs to change (to remove the bug). And that's the other case where now, a developer struggling to understand the code in which the bug may (or may not) live will be running into difficulty. Enter technical debt again.

Which now suggests that technical debt is essentially "a developer's cognitive difficulty in understanding and/or modifying a codebase". Nothing to do with the decisions made at the time of the codebase's creation, and everything to do with the developer who is attempting to understand what the code is trying to do or how to modify it.

### Technical Debt: Moving on
So does @kellan (and Peter Norvig) have it right, that "code is a liability"?

On the surface of it, maybe: if I write code, it is *potential* technical debt.

See, it's not technical debt yet, because it won't actually be a debt until we trigger the "understanding and/or modifying" clause of the above. The Ruby script I hacked together to transform my old blog's XML over to Markdown files for the new system, I won't know whether that code is technical debt until I (or anybody else who wants to use or modify it) go back into it again and face the cognitive load of understanding  it or modifying it. So it's like the infamous cat in the box, neither debt nor not, until the box is opened.

