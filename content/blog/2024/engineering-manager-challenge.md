title=An Engineering Manager Challenge
date=2024-5-20
type=post
tags=management
status=published
description=What would you do if you had to make the choice here?
~~~~~~

My LinkedIn feed recently brought me a question posted about [an interview question the original poster faced](https://www.linkedin.com/feed/update/urn:li:activity:7198459086902878208/):

> "You're the tech lead and your team is getting stretched thin. You decide to add resources *(sic; not my choice of words here)* but you can afford 1 senior full-stack developer or 2 junior full-stack devs. Which do you choose and why?"

It's a decent engineering manager question. So....

<!--more-->

***tl;dr*** I think the issue is an ROI calculation, based on short-term relief vs long-term relief. It's an immediate-cost vs long-term ROI analysis, in other words, but measured in the currency of time/effort, rather than money. (The capital expenditure here is way smaller than the operational cost, when you start adding up your teams' time.) The longer the window, the more the juniors make more sense.

Now, let's dive deeper into why I think this.

### Context
Let's make a few assumptions here, that (1) the juniors we'd hire are going to come with basic skills in our tech stack (i.e., they know how to write React, Java, and SQL, but have no clue about our codebase), and (2) the senior would not only have the basic skills in the stack, but be of sufficient skill in our stack that she could debug into the stack itself if need be. That may be an unrealistic assumption, both in terms of what we (collectively) mean by "junior" and "senior", but clarifying what "senior" and "junior" means here is going to make a huge difference in the outcome. In particular, we'll want to spend a moment thinking very consciously about the senior--if our tech stack is React/Java/MongoDB, and we find a senior who is most comfortable in Angular/C#/MSSQLServer, would that individual still qualify as a "senior" in this discussion? For my money, the answer to that is going to be very much dependent on what our stressors are, and where we could see new hires jumping in.

Along similar lines, let's also assume that our tech stack is fairly mainstream. If we're using something that's *too* bleeding edge, the junior/senior split isn't going to matter as much, because each will still likely need to spend time coming up to speed with our stack. If we're using Elm, Jolie, and ArangoDB, both juniors and seniors are going to spend half their time looking up how to do common things in the unfamiliar parts of the stack. (And God help us all if there's Perl in here somewhere.)

Lastly, I think it's important to assume that the rest of the team is going to welcome the newcomer(s). If the team is stressed, that's not always a given, particularly since the newcomer(s) will (a) disrupt the existing team dynamics, and (b) likely have lots of questions and/or suggestions that were asked or discussed a while ago. If the team has no patience, bringing anybody in is going to be a bit rough, on both the existing team and the newcomer(s). If the team sees the newcomer(s) as a welcome relief, they'll be much more likely to go whatever extra mile necessary to make them feel welcome.

>*EDIT (22 May 2024):* A few comments from [my LinkedIn post](https://www.linkedin.com/posts/tedneward_this-was-an-interesting-question-on-one-of-activity-7198605380766109696-8umw) to this blog entry pointed out there were a few things more that should've been here:
>
>* *"There is no such thing as a full-stack developer."* While I agree with the statement, it's often important to take the context as-is and work within it, particularly when (as was the case for the original poster) the question comes in an interview. Moreover, as much as I disagree with the use of the term, it is a standard, and it does lead to the next important assumption....
>* *"... I would hire a frontend and a seperate backend developer."* That's actually a really good point--it often makes more sense to have some degrees of specialization within the team, and once we examine the full-stack assumption on its own merits, we open up the idea that maybe it's actually better-and-easier to hire people into particular roles. This is a really good point, which still falls outside the framework of the question, but definitely something to consider in a real-world scenario.
>* *"As an Engineering Manager, you can negotiate the scope and schedule...."* Another great point, *assuming* you actually have that flexibility. I would amend the statement to read "As an EM, you *should* have the ability to negotiate the scope and schdule...", but unfortunately there are some projects where scope and/or schedule are constrained in ways that aren't easy to amend. (If an app needs to be ready before the Super Bowl, it's not like we can change the date of the Super Bowl!) All that said, if you have the flexibility, that's another lever to slide, because if you can slide the scope or the schedule, you can potentially relieve some of the pressure that leads the team to feeling stretched. That *also* said, headcount is also a pretty precious commodity, so if you have it, there's a strong drive to exercise it and hire, because if you solve the problem without hiring, there's a near-1.0 chance that it'll be taken from you and given to another team. It's not necessarily fair, but it is a truth of even small companies.
>* *"I'd also consider the makeup of the team. If you have 3 juniors.... If you have 3 seniors...."* I actually can't believe I missed this in my analysis, and yet, I can; I typically look to hire "diamond" or "pyramid" teams, that are either balanced senior-midlevel-junior (sort of a 1:2:1 ratio) or junior-heavy (1:2:3 ratio), but that's no excuse in forgetting to question the assumption.
>* *"How big is the team? What is its present composition, output, turnover, etc?"* This is more of the previous, and all are good points to consider.
>* *"If the team is feeling stretched thin, it's because they have too much work to do, and the planning isn't getting done correctly already."* That's a pretty good point, and also highlights another assumption that may not be legitimate to assume, in that there's actual deadlines here. It's entirely possible/reasonable that the team is simply stretched thin over a constant workload (think a support-ticket bug-fixing maintenance team, for example), and there aren't immediate deadlines that are in jeopardy.
>
>Most of these assumptions don't, in large part, change the analysis of my answer, although the front-end/back-end distinction could very well weigh in significantly. Lesson learned, and thanks for the comments!

Assumptions set, let's analyze.

### Analysis
Juniors are initially a drag on the project velocity as the others on the team help bring them up to speed. Over time (months), however, they can end up significantly increasing team delivery velocity as they begin to jell with the rest of the team and start pulling their own weight. This can be eased some by making sure their initial assignments are appropriate to developers with less experience (both in general and with the codebase). Best approach I've seen is to have them take on bugs rather than building features while they're coming up to speed.

However, keep in mind that the senior is going to need onboarding time, too! No developer, not even the mythical "10X Developer", is going to be able to jump into a brand-new codebase and immediately add value without requiring other team members' help/assistance. Usually the senior can come up to speed faster (weeks instead of months), but the onboarding cost is never zero.

We also need to consider the auspices under which we're bringing them in--specifically, is this a contract basis, or are we making them full-time offers? Contract vs full-time is an important distinction here, too. If this is just a short-term contract, don't bother with the juniors for the same ROI-based reason. However, I think a contract approach here is wildly inappropriate, because all you're doing is kicking the "stretched thin" feeling down the road for a time, and eventually you'll be right back to square one, and all the time invested in the onboarding will have been a waste. So either hire them full-time, or don't bother.

Also, factor in the interviewing and hiring time. Interviewing and hiring seniors takes much longer than hiring a pair of juniors--this holds true regardless of the market. Seniors are also more likely to have multiple interviews running simultaneously, and thus a higher chance of rejecting an offer or ghosting partway through. Plus, juniors are generally more intrinsically motivated to demonstrate they were a good bet, so they'll be more likely to take on the challenge more enthusiastically. (In fact, the hard part might be getting them to actually ask questions, because they want to prove they don't need the handholding, when it would be far more efficient if they just ask.) As for determining their skillsets, juniors will take a little more time to interview, since they'll more likely be unwilling to admit what they don't know, whereas most seniors are (generally) comfortable with elucidating their less-comfortable spots. Juniors also will potentially have blind spots outside the tech, and may take longer to adjust to the culture; but while seniors may be more accustomed to adjusting to new cultures, may also be more intransigent and stubborn if they decide they don't like the culture. That can play out in the team interpersonal dynamics in a big way.

Remote will have a play in here, too, and generally it's not a great story: You're probably going to want people who will be willing to "come into the office" frequently, in order to get direct exposure to others on the team in the most high-signal way possible. If the whole team is remote, then you're going to need to figure out how the newcomer(s) are going to have easy access to other team members in order to ask the questions they're inevitably going to have. This means you're probably going to need them to "buddy up" with existing team members, either by virtually pairing together on code, or else by having them share a Teams/Zoom call that's muted for much of the day but still live. (Slack or Discord just may not be quite at the high-interactivity and low-barrier-to-question level that an open channel or an in-presence "swiveling chair" situation would provide.)

### In short
If the timeframe is less than a month, don't hire anyone--you won't get the ROI. If the timeframe is less than 6 months, hire the senior--you won't get the ROI from the juniors in that short a timeframe. Otherwise, hire the juniors.

Once you've hired, pair the newcomer(s) with a rotation of the existing team members for the first several weeks (seniors) or months (juniors) or until the newcomer(s) are able to complete work without requiring more than one question per unit work (story, bug, etc). I think the superior approach is to have them fix bugs in the code to start (the first two or three weeks or months), then have them add functionality to existing features, and only after that do you have them create new features.

But as with all answers of this type, context will influence and matter greatly on the outcome. *Caveat emptor.*
