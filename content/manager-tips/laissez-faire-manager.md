title=Antipattern: The Laissez-Faire Manager
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Many companies make the same sorts of mistakes with their managers, over and over again. If they were software designs, we'd call them antipatterns. One of them is the manager who just leaves everything to its own devices.
~~~~~~

"Thomas is going on PTO during the push right before the big release? Eh, it'll work out, the team always manages to get it done. After all... worst thing I could do would be to rush in there and make some kind of irreparable mistake...." Periodically, you run across a manager for whom everything just seems to sort itself out, without any required action on their part. The build magically fixes itself; the problematic team member magically gets handled; the team magically clears the obstacles out of their way....

<!-- more -->

***Context:*** 

The *laissez-faire* (which by the way, is French for "do nothing") manager, or LFM, typically has a story to tell from early in their career as a manager:

* "I made a call, and it screwed things up so bad." The LFM was faced with a hard decision, and after thinking about it, they made one, but it turned out to be entirely the wrong thing. Perhaps they made the decision too quickly; perhaps not. Perhaps they didn't do enough analysis; perhaps they did. What matters is that they made the decision, and they (and/or their team or their company) suffered for it. Surprise! This lesson taught them that **no decision is better than a bad decision.**
* "The problem presented itself, then solved itself." The story starts the same: The LFM was faced with a hard decision. But, before they could make the decision (regardless of which way they were going to jump), the problem "went away" with nary a consequence to be had. Surprise! This lesson taught them that **problems will go away if you leave them alone long enough.**

In some cases, there's a manager out there with both stories: the time they made the decision too quickly and screwed it up, followed by the time they did nothing and it went away. Regardless, the LFM typically has that story at the back of their head every time they are faced with a non-trivial decision to make.

There's a smaller percentage of LFMs who are simply too afraid to make a decision, so they pretend that they are guided by the stories they've heard of other managers who fell into one of the two above stories. "I'm smarter than THAT manager," they tell themselves and their spouses proudly. "I'm not going to fall into THAT trap." When pressed, though, they won't have actually lived it, and deep down, it's really driven by their insecurity about their management skills that keeps them from making a decision.

Keep in mind that a refusal to make a decision is not the same as an inability to make one due to [lack of time](./tech-lead-manager.md) or [presence](./absentee-manager.md). There's also the possibility that the LFM is, actually, a closeted [Flagpole Manager](./flagpole-manager.md) and they're waiting to see what the results of their queries to their superiors turn up.

***Consequences:*** 

Many of the consequences of the LFM are the same as that of the [Absentee](./absentee-manager.md):

* **Reduced progress.** The team often needs someone to remove obstacles to their progress, and the lack of an actionable decision impedes those decisions from being made, which in turn keeps the team from being able to move forward with their assigned tasks.
* **Lack of constructive feedback.** Asking the LFM to provide constructive feedback isn't usually a problem, but the LFM doing anything with that constructive feedback could be. It's one thing to say, "Hey, you're doing a great job", but it's something else to say, "Here's three ways I think our team is being blocked and here's what I'm going to do to help us unblock."
* **Team member exits.** If the manager remains *laissez-faire* for too long, the team members will conclude--quite rightly--that upper management isn't really all that concerned with their career development, and leave the team to find a team--and a company--that does. Or, worse, the LFM's lack of decisions will affect the release of the project, and the team members will bail in order to be outside the blast radius when the project fails.
* **Near-random decisions.** In the absence of decisions from leadership, lower levels on the org chart tend to make decisions that are optimized to their, specific, needs. This local optima may be useful for the individual, but could create a net-negative effect across the group. Consider, for example, which Java IDE a team should use: Eclipse, Visual Studio Code, or IDEA. Each one has their pros and cons and their respective merits and consequences. When the LFM cannot make the decision, each developer will conclude that they get to pick which tool to use for themselves, and suddenly three sets of project files must be maintained if consistency across the team is going to be upheld. And gods help you if the team can't decide on which build tool to use....

***Variants:*** 

It's arguable that the LFM is a variant of [Absentee](./absentee-manager.md), but again the intentions are different enough that they manifest some different outcomes.

A LFM can sometimes be mistaken for a [Perfectionist](./perfectionist-manager.md), since the Perfectionist often also wants to "take their time to come up with the *right* choice", but the differences will be apparent over time--where the Perfectionist eventually makes a choice, the LFM never does.

***Mitigation:*** 

**If you work for the LFM.** Well, the good news is that you can be pretty sure that your boss isn't going to surprise you with a bad decision any time soon; the bad news, of course, is that they're not going to surprise you with a decision (good OR bad) any time soon. This leaves you with a couple of options:

* **Make decisions yourself.** If you're of a senior-enough level, get together with the team and see if they will agree if you make the call (and take the credit/blame) for the decision needed. Obviously, some decisions won't be yours to make (you can't give everybody bonuses or tell everyone to take the day off), but there's a surprising number of intra-team decisions that you could, with the team's support, own. The danger here, of course, is that you're fundamentally enabling the LFM, and leaving them to grow more confident and complacent in their lack-of-decision-making.

**If you are the LFM.**

**If the LFM works for you.**

