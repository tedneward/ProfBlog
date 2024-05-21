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
