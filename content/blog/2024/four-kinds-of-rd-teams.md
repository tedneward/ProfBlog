title=The Four Kinds of Research-and-Development Teams
date=2024-06-01
type=post
tags=management,research,development,teams
status=published
description=What kind of R-and-D team do you want to build?
~~~~~~
Many developers get really excited when they join an R&D team, because it signals in their minds that they're among an elite group looking to move the needle for a company. We imagine the business suddenly soaring in revenue and profit because of the whatever-thing we just built. We can hear--in the mind's ear--the kudos and praise raining down from the C-Suite as the whatever-thing we just built is rolled out company-wide and maybe, just maybe, industry-wide. We're excited!

Wait, what was it we were trying to do again?

<!--more-->

In my [last post](../2024/the-problem-with-rd-teams.md), I talked about some of the problems with R&D teams and how they're run. What I didn't really get into in that post, however, was the idea that (I believe) there are four different kinds of R&D teams, each with very different actions and goals, and each with very different outcomes. The success of the team often depends on aligning the activities of the team with the intended goals, and it's actually quite reasonable for a company to have two or more teams, each operating independently and towards different ends.

In brief, there are four kinds of R&D Teams:

* the ***Scout team***, exploring what tech others in the industry have built (e.g., Flutter, SwiftUI, etc)
* the ***Spy team***, exploring what competitors have built
* the ***Library team***, building lowest-common-denominator libraries used (sometimes) within the company
* the ***Practical Research team***, building novel solutions to the company's (and others') problems

Let's address each of these in some level of detail.

### The Scout Team
The Scout Team is what most corporate R&D teams go after: The hunt for new technology that will somehow provide the company with a competitive advantage over its competitors, despite the fact that the competitors are all themselves out there scouting the industry just like this team is. New programming languages, new databases, new architecture styles, new whatever-fill-in-the-blank, just so long as it is (a) new and (b) not yet mainstream, it's a candidate for the Scout Team's infinite desire to create prototypes that bear a remarkable resemblance to the demos that the new thing has on its website or in its documentation.

**The Problem:** The Scout Team suffers from several intrinsic flaws:

* *The Scout Team isn't always a great evaluator of technology.* Honestly, it often comes down to the team lead's personal preferences and/or opinions. Do we scout Dart/Flutter, or React Native? Do we scout MongoDB, or CouchDB? Do we scout Pulumi, or Terraform? Some teams will try to do an apples-to-apples comparison of two relatively-similar technologies, but usually this effort just leads to the realization that "the differences are marginal" and, unfortunately, not particularly compelling. Which then begs the never-asked question, What would happen if we just threw a dart against the dartboard and picked one at random and tried building our prototype in that?

* *Any gained advantage is temporary.* Great, you've identified that you can build your mobile apps 5% faster using React Native. You must now engage in a deep coverup of epic counterespionage, because if your competitor gets wind of the fact that you're using this technology (and they will, if they watch your website's Careers page, which some competitors will do), they have every opportunity to follow in your footsteps and begin using it as well, which effectively negates your advantage and renders all the work the Scout Team effectively moot. Given the cost of the Scout Team against the time where you actually had the advantage, the ROI on the Scout Team's efforts generally isn't there, particularly when you could play "second mover" and watch your competitors' Careers page, instead.

**Successful Execution:** If the Scout Team is to be successful, it must first begin with either a business problem to solve or a hypothesis it seeks to prove and disprove (yes, both). "We believe that we can produce customer-acceptable mobile applications in half the time if we use a cross-platform toolkit to build hte mobile app" is a reasonable hypothesis, because it leads to the natural question, "What does 'customer-acceptable' mean?" as well as "Well, how long does it take us to build a mobile app in both iOS and Android today?". Technology-centric folks (myself included) will feel more comfortable with formulating a hypothesis than a business problem, so either the team has to run its hypotheses past product owners or business analysts or even customers themselves before adopting one for scouting.

Then, once the problem or the hypothesis has been adopted, the team should move into a series of phases:

* *Discovery (1 to 5 days):* What's out there? This shouldn't take longer than a week, maximum. For some topics, it might even be just a day. Google to your hearts' content, and capture the results in some kind of table to be able to do the best (highly-ignorant, because you really are just getting started here) comparison. Keep in mind, you're not at a decision point yet, you're literally just comparing the options. No code is written yet.

* *Discussion (2 hours):* Once the discovery is finished, do a quick conversation (in person or online) about the options. All the attendees are given the table, encouraged to bring their own opinions, and as soon as the meeting starts, take a vote on the top 3 to explore. (I prefer "$100-voting" schemes, where you get to "spend" a fictitious amount of money/votes on up to three options, and the results are tallied. It's flexible voting, and allows those with really strong opinions to make the strength of that opinion known.) What stand out as the top three choices, given the problem or hypothesis? Limit yourself to three. 
    One will probably emerge as a majority favorite, another will be a lukewarm choice, and two others will be argued about extensively. Put a hard limit on this meeting, and if the team can't decide which one to explore as the third option, make the call to only use two--that'll usually coalesce agreement around a third (surprisingly quickly). If it doesn't, then clearly neither one has much momentum behind it within your team, so just do two.

* *Exploration (1 week):* Now, depending on the size of the team, comes exploration, during which the thing is downloaded, installed, a few demos are built/explored, and initial conclusions are drawn. In order to avoid strong opinions coloring the analysis, however, make sure that whichever team member voted the strongest in favor of the technology is *not* given the technology to explore. That is to say, if Ted spent $50 on Flutter, Woody spent $25, and Scott spent $10, then Scott should be the one to explore Flutter. The reasoning here is simple--if Ted voted so strongly for Flutter, he runs a strong risk of being biased in favor of it, and will be less likely to spot the negative traits. Scott, however, feels less strong, and so will likely be more open-minded. (Yes, this system can be gamed if somebody really wants to try and game it, but honestly, if you can't trust your R&D team to be able to approximate some degree of unbiased investigation, then you probably have bigger problems.)
    Keep in mind here, you're *not* building your prototype yet. You're literally just trying to get a sense for the "unboxing experience"--can we run demos right away? Are other dependencies involved? Do we have the right tools or infrastructure already, or would we need to pull down more in order to get even the simplest example up and running? This goes a long way to hint at what the overall developer experience will be.

* *Prototype Decision (2 hours):* Once the team has had a little experience with each of the three options, it's time to decide which one to build the prototype in. The previous exploration step is essentially a preview for what comes next, but the team can't realistically build anything of substance if they're trying to do it across a large number of options, so reducing it down to one helps keep things focused. Meet with the team, with each of the three options presented, examples discussed, and make a decision out of the three.

* *Prototype (1-3 months):* Now the time is right to build out the prototype, always with an eye towards the hypothesis or the problem. Don't just build a CRUD app--any tool can do that. Build something that has the difficulty characteristics that your business deals with. Got a mainframe you need to talk to? Figure out how that would work as part of the prototype. Complex workflow? Really convoluted price-calculation logic? All that has to be a part of the prototype, or it's not a successful prototype.

* *Presentation (1 week):* Having spent the time building out the prototype, now the team needs to build out the presentation: Specifically, the questions answered, the issues addressed, the results, and so on. But keep in mind that at least *half* of this presentation would need to be forward-facing--that is to say, it needs to talk about what adoption would look like and how it would play out within the company. Which teams would adopt first? How would they go about adopting? What's the timeframe? What do the steps look like, going from zero to "adopted"? Without practical execution steps, your prototype is just a target, not a plan.

### The Library Team


### The Spy Team


### The Practical Research Team


