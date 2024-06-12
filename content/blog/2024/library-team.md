title=The R-and-D Library Team
date=2024-06-08
type=post
tags=management,research,development,teams
status=published
description=What is an R-and-D library team?
~~~~~~
There are four different kinds of R&D teams, each with very different actions and goals, and each with very different outcomes. The success of the team often depends on aligning the activities of the team with the intended goals, and it's actually quite reasonable for a company to have two or more teams, each operating independently and towards different ends. In this post, I explore the Library Team.

<!--more-->

As a reminder, there are four kinds of R&D Teams:

* the ***Scout team***, exploring what tech others in the industry have built (e.g., Flutter, SwiftUI, etc)
* the ***Spy team***, exploring what competitors have built
* the ***Library team***, building lowest-common-denominator libraries used (sometimes) within the company
* the ***Practical Research team***, building novel solutions to the company's (and others') problems

### The Library Team


**The Problem:** In any given company consisting of more than one development team operating in parallel, there comes a point when each team creates their own independent solution to a particular sliver of the domain or infrastructure. Once the duplication becomes known, concerns about the duplication became a topic of discussion, and the teams spend some (sometimes tiny, sometimes significant) time talking over the issue, in what sometimes turns into outright negotiations.

But as the company grows, more and more teams come into play, and before long, it's something of a free-for-all as teams try to figure out what's shared and what's sharable. In some organizations, being the team that's sharing the library becomes a point of pride--or worse, metrics--and thus creates incentive to convince everybody else to use our stuff, as well as disincentive to use anybody else's stuff.

THe problem multiplies, however, when the teams that use another team's library start to discover bugs or a lack of particular features necessary to the adopting team's requirements. Pressure begins on the owning team to incorporate these new features--which the owning team really has no need for--and the inevitable conflict escalates to higher management to hash out. Quickly one or all parties realize that there is no real winner here: If the owning team is required to add the features, their own schedules and delivery are affected; if the adopting team(s) are told to add the feature themselves, the codebase now reaches a point where no one team has a real sense of how the code operates anymore; if the adopting team(s) are told that the library is "as-is" and no support from the owning team is available, the adopting team often uses that as a pretext to "go their own way" and "build it the right way". In essence, everybody loses.

**Successful Execution:** For successful reuse to occur, a library team must be formed with the explicit goal of being an "internal vendor" of software to other teams within the company. They own, operate, maintain, and innovate around the software library or libraries that are intended for use across the organization, and the relationship is formalized much as a formal relationship is built between a vendor and their customer: explicit expectations are written and signed, a contract (of sorts) around support requests and/or updates is created, and the library team begins to interact with the adopting teams around prioritization of fixes, tweaks, and updates.

The Library Team is a flavor of R&D, although it may not seem like it at first, since they are more focused on providing goods and services (in the form of tools, frameworks/libraries, and support) than most people associate with an R&D team. However, if R&D is defined as an effort intended to create competitive advantages for the company's developers through technology, then this team certainly fits. 

In contrast to the perception that an R&D team is always about creating something bright and shiny and new, the emphasis for the Library team has to be on the ongoing support of the things created. Just as no language, framework, or tool would ever be adopted by a company without understanding (and leaning on) some kind of support structure and/or community around it, efforts to create internal reusable products have to have a surrounding suport structure. Later, as time passes and the usage of the internal product grows, the library team will take on some of the internal community support as well, engaging with internal developers the same way an external vendor's Developer Relations team would engage with developers.

Thus, the Library team's execution falls into a variety of phases:

* **Discovery.** The library team is searching for new 
* **Innovation.**
