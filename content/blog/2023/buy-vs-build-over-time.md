title=Buy vs Build... Over Time
date=2023-03-22
type=post
tags=industry, management, architecture
status=published
description=What to think when you realize you chose wrong.
~~~~~~

It's the age-old question of our industry--do we buy something to take care of a need, or do we build the thing ourselves? No matter which way you go, it seems like somebody comes around later and makes it clear you chose wrong. The deep secret, however, is that no matter which way you choose, you're likely to be wrong later, not because you chose wrong, but because the context of the choice changed.

<!--more-->

This particular post, as is common, was inspired by a LinkedIn post:

> At Tonic, we once tried to build our own integration engine. It looked simple enough. And it worked. The only problem was what we built lacked a UI. And our goal was to separate integration work from engineering work (can’t do that without a UI). To achieve that would have needed to rebuild the equivalent of MuleSoft or Coreppoint. After a year, I made the team do a formal evaluation of external options and we picked an integration engine and sunset our internal product. [post](https://www.linkedin.com/posts/borisglants_team-work-engineering-activity-7044374379052376064-t0Yu?utm_source=share&utm_medium=member_desktop)

I know a lot of engineers will look at this and blame the author for having chosen poorly. I argue that they chose correctly.

## Buy vs build
It seems like such a (relatively) easy choice: If we buy something, we don't have to build it. Vendors provide support, including bug fixes. This saves our engineering hours for the real problem we're trying to address. Plus, the purchased tool will almost-always be more polished and feature-rich than what we build. But buying something costs money! And if we build something, we can tailor it specifically to our needs, with no need for workarounds and weird adapters that turn an otherwise straightforward process into a Rube Goldberg machine. 

So, to decide which is the "right" choice, we need only figure out:

* if the vendor product has the features we're looking for, for at least the near- and short-term future,
* if the vendor product is at the right price point,
* if the vendor product will be supported (and how) for the length of time we need (in other words, is the vendor likely to go bankrupt),
* and if the vendor product can integrate into the rest of our software development fabric (processes, tools, languages, databases, etc).

And yet, stories of having made the wrong decision are so, so common. Why?

Decisions are always made within a context; most of the bullet items above don't really address the context of the decision directly, but rely on that context indirectly. Price, for example, can be a very complicated thing, including up-front and recurring costs, but also support and maintenance investment of time and energy. (Ask any IT leader about the costs of installing an Oracle database on-premise, and you'll get an earful.)

In the beginning of a project, we may not have enough experience or we may not have the bandwidth to really understand the nuances of the choice (whichever it is!). If the project doesn't go very far, then a "buy" decision was probably unwise, because now we're left with a product we don't need, or it provides capacity and features that we've never taken advantage of yet still paid for. If the project suddenly sees huge growth and potential further growth with additional needs, then the "build" decision was a bad one, because now we need those features and polish.

Rather than lament the "wrong" decision made a year ago for a buy-vs-build decision, accept that you can only make the best decision you can *given your current context*, and accept that it's entirely possible--in fact it might even be likely--that the context will change and lead you to making a different decision down the road.

And that's OK. Because we're always making decisions without perfect information (in this case, we can never know the future context or how it will differ from the current one), we have to accept that some of our bets won't pay off the way we thought. Waiting for the context to change, however, is never a great answer, *because the context is always changing*.

## Opportunity Cost
When I was a younger man, back in college when it was much more common to put your own desktop computer together yourself out of parts, friends and I would debate whether we wanted to buy a new computer rig. New motherboards were coming out, new graphics cards, faster hard drives, you name it. One friend always held off, saying, "There's a faster version coming out in a month, and if I buy now I'm just going to regret not having waited." I said the same for a while, until I realized that I was never going to buy anything, because there was *always* going to be something faster coming down the pipeline. Yes, Apple has released the M2 MacBookPro--but if we wait until next year, they'll have an M3 MacBookPro, and it'll be so much better because (something something something).

In economist circles, we call the cost of making a decision and losing the benefit of choosing otherwise the *opportunity cost*. Consider a simple decision: My wife wants to go to a Korean BBQ joint that just opened up, but I want to go to the steakhouse I like. If I choose to insist on my choice, the opportunity cost of not choosing to go to the Korean place will be (a) I won't discover that it's actually a pretty good place, (b) I won't get a chance to watch K-Pop band music videos, and (c) I may end up sleeping on the couch tonight. (Of course, my wife will be paying on opportunity cost of not choosing to go to the steakhouse, but that's a different conversation, and one she has to have with herself.)

In the case of buying computer hardware, the opportunity cost of waiting is to spend a whole year continuing to work/play on the even-older rig that I was looking to upgrade or replace. But opportunity cost cuts both ways! Choosing to "buy now" means that I may have to watch with a certain amount of envy as my roommates get to play a game that's even *faster* on their upgraded hardware, at least until I can do my upgrade, and then they get to salivate over my new purchase.

Within the "buy v build" decision, the real focus should be on opportunity costs: If we do build something now, what are we paying in opportunity cost? If we do buy something now, what can we *not* buy later, because we spend the money? For a lot of startups, for example, money is extremely tight, so that "what can we not spend money on" becomes a very important factor. For a lot of VC-backed startups, on the other hand, money *isn't* the critical-path resource, and now the real conversation becomes "what engineering hours would we not have, preventing us from building out some feature or another" if we build.

## Summary
The buy-vs-build conversation, as you can see, is never just about the vendor product feature set and the time/energy it would take engineers to build the same. It's about the context of the situation, and the opportunity cost we pay when we make the decision. Throw in the fact that the project's or company's context can change (sometimes drastically and sometimes instantaneously), and you have a recipe for a basic realization: ***You're never going to be always right.*** Or, to be more accurate, the decision you make today has absolutely no guarantee that it's going to be the right decision the further away we get from the decision point. The best we can do is make the decision for today, accept that we pay an opportunity cost in doing so, and keep an eye for when the context has changed enough such that we need to consider revisiting the decision.