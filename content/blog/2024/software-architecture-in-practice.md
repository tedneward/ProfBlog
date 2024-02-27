title=Software Architecture, In Practice
date=2024-2-26
type=post
tags=architecture,management,enterprise,organizational design
status=published
description=Software architecture often means different things based solely on the kind of company at which you work; the larger the company, the more likely you are less "architect" and more "referee".
~~~~~~
One of the more curious things I've found, both in my time as a consultant and as a software management executive, is the striking differences between what the title "architect" means at different companies. Strangely (or perhaps, not so strangely), the nature of the job changes significantly depending on the size of the company and how "interwoven" the various software development teams are against one another. The larger, more interwoven the company, the more your job as an architect is "referee or facilitator between teams" than it is "decider of technical strategy and direction".

<!--more-->

Tell me if this story has ever happened to you: You are set up as an architect on a project. *Cool,* you think. *I'm going to make some solid decisions, make sure that they're well-reasoned, approachable, nothing too overkill, all the things that make an architecture a good one.* You spend some time analyzing the problem domain, you build out a few proofs of concept and a prototype or two, and your team is off and running. Knowing that your project doesn't exist in isolation, of course, you make room for some interoperability capabilities--let's say through an API. You make the firm decision that any access to your system has to come through the API.

One day, you get a call. Another team is working on a project that runs in parallel to yours, and they want to talk about how you've built some of your data-access code. *Sure,* you think, *That makes sense. They don't want to reinvent the wheel if they don't have to, and I'm here for it--that's good architecting!* You meet, and that other team comes away with some ideas of how to best connect to a database like yours--and the internal Git repo URL for your project, so they can see how to use it.

Another team, meanwhile, has also heard of your project's work, and wants to discuss whatever-it-is you're using for your API layer. More importantly, they want to understand how you're doing some of the validation logic. *Sure,* you think, *They're trying to avoid reinventing the wheel, too.* You meet, and once again they walk away with the Git repo URL for your project, because they wanted to see how to use that whatever-it-is.

But you're starting to get a weird feeling in your stomach that all these teams are too alike. You mention it to your boss, who nods thoughtfully and asks, "It's almost as if all these teams are building the same thing over and over again, no?" Somewhat uncertain, you nod, because, well, yeah, it kinda does. "Thanks for bringing this to my attention, I'll check with a few others and see if they get the same feeling. Good work." Feeling good that you may have done the company some good, you go back to your team and hunker down.

For a sprint or two.

Then, one day, you get called into an Engineering All-Hands. The Senior Engineering VP opens by saying, "We have great news. Thanks to some proactive investigation," and she gestures at you, "We have identified a major source of waste in our organization, that of duplicating efforts across many teams, and we are forming a group to combat it. We will be pulling all the architects together into an architect group, where we can share and spread architectural knowledge across the teams and create opportunities to aggressively share code." On the one hand, cool, but on the other hand, you're a little worried because your project--*ahem* your former project--is somewhat like those other projects, but it's kinda not. But, hey, you get a cool new title--"enterprise architect"--and it'll give you a chance to rub shoulders with other architects, so... yay?

After a few weeks' of reorg madness, things settle down, and you start having meetings with your former project team and the other project teams that you'd met with before, around the database and the API. Under the SVP's new mandate, the teams are breaking out these into separate microservices, and you're now in the uncomfortable position of trying to help your former team modularize code that was never intended to be modularized, for the use by teams that have problems that are similar--but definitely not identical--to theirs, with all the weird corporate battles around ownership and time allocation that come along for the ride: Who is responsible for bug fixes against the shared module/microservice? Who owns the decision-making around what can and cannot go into the microservice API? Each of the various teams look to you to champion their cause over the others, because after all, you were the one that helped them back when all this got started.....

---

When a company gets to be of a particular size, the different project teams often find themselves needing to collaborate in various ways, but (it seems) often don't feel comfortable doing so at just the "programmer" level--it's almost as if we don't trust programmers, even senior ones, to make decisions for their team. That's the Team Lead's job! 

But the Team Lead is too busy being the Lead--meetings with the boss, with the team as a whole and also as individuals, and responding to fires that pop up every so often--to really sit down with the other teams to sort out technical issues, so... 

Then one day, an executive realizes, "Hey, we have an Architect, and they're (supposed to be) the smartest technical person in the room, so let's have them sort these integration issues out! Even better if they're actually not attached to any one team but are instead part of an "architect team" or part of the "Enterprise Architecture" org. Then, when we disagree, we're not disagreeing with our teammates, we're disagreeing with somebody outside of the team who clearly doesn't understand the team's issues as well as we do." Granted, they may not think of it in precisely thsoe terms--particularly that last bit--but the thought still pops up. (Even better, some organizations make the Team Lead be the Architect, or vice versa, which means it's really a no-brainer for that executive.)

At this point, however, the role has transitioned away from the "solver of technical problems" and moved squarely into the "referee of team dynamics" and "arbiter of integration". Once in this position, most enterprise architects find themselves in a position that is more organizational design than it is software design.

And then, once that realization hits, the unhappy enterprise architect has two ways out: get promoted to become full-time management (embracing the organizational design side of the story) or get out of enterprise architecture entirely, either by transitioning to an IC role writing code again, or to a smaller organization wherein they can be "just" an architect again.

For a little while, anyway.

---

The root of the problem? In the previous section it's actually easy to spot: *"trying to help your former team modularize code that was never intended to be modularized"*. Remember, microservices were an organizational design solution to a particular problem at Amazon: that of removing all dependencies. According to *Working Backwards*, Jeff Bezos spent a lot of time thinking about this.

> Speed, or more accurately velocity, which measures both speed and direction, matters in business. With all other things being equal, the organization that moves faster will innovate more, simply because it will be able to conduct a higher number of experiments per unit of time. Yet many companies find themselves struggling against their own bureaucratic drag, which appears in the form of layer upon layer of permission, ownership, and accountability, all working against fast, decisive forward progress.
> The answer lies in an Amazon innovation called "single-threaded leadership," in which a single person, unencumbered by competing responsibilities, owns a single major initiative and heads up a separable, largely autonomous team to deliver its goals.

In essence, the whole "microservices" approach popularized by Amazon was, in fact, not an exercise in software design, but in organizational design--by creating teams that were focused on a single objective, with an explicit agenda to eliminate dependencies that they might have. The elimination of dependencies, it turns out, is precisely the thing that holds up most teams, which (as any architect knows) is also the same principles around how to get the most throughput from a scalable system. "The enemy of scalability is contention." The more often a process has to content for a shared resource, the worse the performance curve gets.

For a team to truly be the master of its own destiny, it needs to be focused on one thing ("single-threaded"), with zero dependencies on external resources (databases, message queues, etc). It admits, up front, that there will be some violation of the Don't Repeat Yourself principle, but like all of the practices listed in the Pragmatic Programmer, they were intended as heuristics, not ironclad algorithms.

---

All of this, though, is really tangential to my main point: When you take an architect position, you really need to understand, up front, what role your position is really taking. Are you tied to a single-threaded organization? Then you are probably a software/system architect, focused on achieving a specific and concrete result. If you're matrixed across several teams, though, you're much more likely to become an organizational architect, focused more on helping teams navigate their cross-dependencies with one another.

Of course, there's always the third option, in which you are matrixed but have the authority to dictate to those teams the technical decisions you feel best suits their combined problem set. But, in all honesty, that position, I think, is a corporate legend: Everybody's heard of it, everybody yearns for it, but nobody's ever seen one in the wild except at an extreme distance, much less been in one. I used to think we called those roles "CTO", but having spent some time in and among CTO roles, I'm less convinced than ever that it actually exists.
