title=Embracing "Old" Tech
date=2023-03-01
type=post
tags=industry, management, architecture
status=published
description=What to do when version n is "old", but n+1 isn't ready.
~~~~~~

**tl;dr** It's a common problem, and one we've seen in the industry several times--a technology (language, framework, platform, whatever) is making a significant, backwards-incompatible change, meaning any code written in "v.N" (the current, stable version) will require some coding changes if the project wants to move to the next "v.N+1" version. During v.N+1's incubation, everybody gets excited about the new features, and nobody wants to start a project on v.N. And that's a flawed take.

<!--more-->

This particular post was inspired by Cory House's Tweet below:

<blockquote class="twitter-tweet"><p lang="en" dir="ltr">I feel like <a href="https://twitter.com/nextjs?ref_src=twsrc%5Etfw">@nextjs</a> is in a weird spot at the moment. <br><br>I can’t recommend Next 12 because it’s “old” tech. You’ll want to convert to 13 as soon as it’s stable. <br><br>And, I can’t recommend Next 13 because it’s in Beta. <br><br>Thus, I can’t recommend Next at all until 13 is stable.</p>&mdash; Cory House (@housecor) <a href="https://twitter.com/housecor/status/1631136992422445056?ref_src=twsrc%5Etfw">March 2, 2023</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

... but to be fair to Cory, this is hardly new. I saw the same thing happen when AngularJS became Angular, when C++ broke from C, and quite frankly it's the discussion every time Microsoft announces a new presentation technology (WinForms vs WPF vs MAUI vs oh hell I've lost track where we are now).

The conundrum is clear: *Do we actually want to create a new project using "old" tech?* And my response is equally clear: Of course you do.

## The Fallacy of the New Tech
A long time ago, I blogged about [the Fallacies of Enterprise Computing](http://blogs.newardassociates.com/2016/enterprise-computing-fallacies). The very first fallacy is this:

1. ***New technology is always better than old technology***

And I tried to be pretty subtle about it, too:

> "This cannot be emphasized enough: This is fallacious, idiotic, stupid, and brain-dead."

Well, subtle for me, anyway.

I'll leave it to you to read the full text of the fallacy, but to be fair, there's a slightly different scenario here.

## The Fallacy of the New Version
First off, let's be really clear--anything that causes the reaction Cory describes ("Thus, I can't recommend Next at all until 13 is stable") is something that every framework/language/platform author desperately wants to avoid, because it hurts their adoption. This is partly why these authors avoid backwards-compatible changes entirely, and ironically, it hurts their long-term viability.

Look at Python2 vs Python3, for example. Python3 has cleaned up several significant contradictions in the language that Python2 was stuck with, and frankly, despite all the hullablloo around it, it was a necessary shift. (And yes, there's been a fair amount of words written on that transition.)

But in the long run, Python3's language model is much easier to understand for those changes, and overall it hasn't hurt Python3's adoption or use, *because nobody stopped using Python2*. (In fact, you can argue Python has the opposite problem.) It's clear that people can, and have, continued to work with the old version of Python and been quite successful--in fact, it's not unreasonable to suggest that this has been true for any v.N-vs-v.N+1 debate, at least the ones that I'm aware of. (Yes, Virginia, there are new WinForms apps being built even today!)

So why should Cory keep recommending and using Nest 12?

### The New Version Isn't Guaranteed to Work
Any time a tech is making a backwards-incompatible change, there's a strong chance (guarantee, really) that the new version is going to have bugs. Subtle bugs. Nasty bugs. Bugs that will only be found as hundreds/thousands/millions of users will find. There's a reason why my dad, the pilot, said "You never want to fly the model A of any airplane" and in our industry we said "Never use any Microsoft product until version 3".

*Waiting for Nest 13 to be stable could be an unacceptable wait time.*

### Time Stands Still for No Woman (or Man)
How long will you need to wait for the stable version to be ready? Will your customers/clients be willing to wait that long? Chances are good that putting a "hold" on the project's development until that threashold is crossed is an unacceptable delay. Hey, even if it's six months, you risk the budget allocated will go away, and let's not even imagine for a moment that you can have a dev team sitting on their hands all that time. They *will* get allocated to a different project, and that one will very likely not be willing to send them back when you're finally ready.

And what's the cost of starting the project now with Nest 12? "We know we will be taking on technical debt--we'll have to rewrite parts of the code when the new version comes out."

*You're always going to need to rewrite parts of the code. Get over it.*

### The Fallacy of Writing It Once
Here's a fact: things change. Technologies will grow and evolve. Platforms will emerge, platforms will go away. Languages will be new, mainstream, then legacy. Frameworks... well, we all know the lifecyle of the Javascript framework closely resembles that of the fruit fly. The point is, the things we use to build applications are in a constant state of evolution and change.

And even, if by some miracle, the development world (particularly the open-source part of it) were to suddenly stand up, declare "We're finished! It's all done! There's nothing new to add!", the business world doesn't. New competitors, new businesses, new ideas, new partners, new *everything* means that *as soon as you ship, your legacy begins*.

Michael Feathers is quoted as saying that legacy code is any code which is untestable; personally I think that legacy code is any code that's been deployed. It's all legacy code; the key question is how much "legacy" are we talking? 

Or, in other words, what's the technical debt for this particular release?

### Technical Debt is not Always Bad
We developers have come to regard technical debt as universally bad--there are some who will be quick to point out that ANY amount of technical debt is bad and therefore to be avoided like the plague. This is, in many respects, the implicit heart of what Cory's tweeting about above: "I know that migrating from Nest 12 to Nest 13 will require change, which means you will begin your project with technical debt even from the first line of code. Therefore, I cannot in good conscience recommend a path that incurs technical debt."

This is silly--every project starts with technical debt, and it's my assertion that you cannot build software without incurring technical debt. Some debt you won't discover until later in the project, but it's a fallacy to assume that any deployed software--even "Hello world!"--has no technical debt. There's always something.

And in the words of eXtreme Programming and the agile movement that followed it, "embrace change".

## A Use-Now, Upgrade-Later Strategy
To Cory, I would say this: Go ahead and use Nest 12. Even if you end up having to rewrite a significant chunk of the code, it's a known tech debt that you capture, document, and even perhaps start some parallel development against betas of Nest 13 to make sure you're not coding/architecting yourself into a corner. But the show must go on, and so must the development, so use Nest 12. Maybe consider some abstractions to hide the pivot points that the 12-to-13 migration will require. Maybe you find that 13 is more stable than you thought and you can embrace it even before it's shipped in a stable form. Any way you slice it, you are moving forward, a lot of code will be built that *won't* be affected by the migration, and you will even be able to ship something before Nest 13 comes out.

And if you find, during that parallel 13-based development track, that 13 isn't stable at all, and you want to wait until 14 or 15, you haven't crippled yourself by waiting.

## But What About Alternatives?
"Hey, you're forgetting that we don't have to use Nest! We could use...." Yes, you can, absolutely. But that takes the conversation into a different dimension: Should we use Nest 12 or should we use (some competitor)? That's an entirely different question to what Cory was tweeting originally (v.N vs v.N+1). It's a fair one, but changes the basis of the conversation.

To be fair, it's not an unreasonable one--perhaps there's a close competitor that can do everything Nest 12 can do. In which case it's a near-guarantee that you won't even need to think about upgrading to Nest 13, which could very well be a win! Yay!

But to avoid using a thing at all because a new version of it is coming out soon... that's a mistake.
