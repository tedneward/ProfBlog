title=Antipattern: The Lateral-Move Manager
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Many companies make the same sorts of mistakes with their managers, over and over again. If they were software designs, we'd call them antipatterns. One of them is when a manager comes over from an entirely different part of the company.
~~~~~~

"Hey, Susan? Look, I just talked with Bob, and he's getting antsy, talking about quitting and going someplace else." "Really? Well, we don't want to lose him to the company, but there's nothing above him in the org chart that's open." "Well, what if we slide him over into Vlad's old role over on the Atlas team?" "Well... Does Bob know anything about Atlas?" "Nah, but he's a smart guy, he'll figure it out." 

<!-- more -->

The lateral-move manager (LMM) is the manager who gets put in charge of a team because the company wants to retain them, but can't move them higher up in the branch of the org tree they were in. Fearing the loss of smart people, the company "promotes" them into a lateral role, usually in an entirely different part of the company. For the company, (at best) it's a chance to buy some "breathing room" to figure out where to promote this individual; for the individual, (at best) it's not the best promotion in the world, but it is a way to "learn more about the business" and/or "prove my promotional possibilities". And that's assuming that both parties are taking the best path they can with this; it relies on the best of intentions and behavior from the company, and the best of interpretations from the individual.

***Context:*** 

There's a couple of things at work here:

* **Limited vertical opportunities.** As much as companies would love to make every employee's "move" within the company an upward-angled one (moving to a higher layer of the org chart), the practical fact is that companies often don't have openings in the right places to make that possible. It's sheer numbers--if each team is 5-7 people, led by one manager, and the manager above them is keeping track of 3-5 teams.... Well, it doesn't take a PhD in maths to figure out where that's going. Even with an IC career track, you still run into numbers: Even if we discount the numbers of developers who never want a promotion, and the numbers of developers who are willing to go up the IC track (assuming your company has one), you still have typically 2 or 3 developers per team who are interested in management.

* **Unlimited desire for advancement.** Really smart people want to improve their standing at the company, which for mean means a move up the org chart. But if the company doesn't have that opening directly "above" them, those really smart people may choose to put on their walking shoes and find another company that does.

* **Fear of manager attrition.** "We can't afford to lose them! Do you know how hard it is to hire good people?" It's a common refrain, whispered in the halls of HR and senior management. "If we don't promote them, they'll leave to go someplace where they can get that role they want!"

* **Have competence, will travel.** In certain cases, a manager demonstrates a knack for correction and troubleshooting, and their destination team has just crossed some threshold of "problematic" that needs fixing. In these situations, upper management will often be coy about the reason for the move, for two reasons: one, they don't want to trumpet the idea that "the team needs fixing" and demoralize the team (nobody likes being told they're broken), and two, they don't want to admit the mistake(s) that led to the team's current state. 

***Consequences:*** 

* **Nobody's fooling anyone.** Even if nobody in the management chain will admit to it, a lateral move is often pretty easy to figure out the rationale/reasoning behind: *Either* it's that desire to keep someone who's deserving of a promotion but can't get one, *or* it's a performance-related move to get somebody out of running a team they're deeply unqualified to run. And, naturally, everyone is going to assume it's the latter. Or worse.

* **Depth and the deep lack thereof.** When a manager moves to a new team or organization, depending on how "far away" (in terms of org chart distance) they are from their original team, they will be either a little incompetent, or grossly incompetent, at what the new team does. It's a simple matter of unfamiliarity and lack of experience with the new team's work. The lack of depth in the new team's goals, habits, and culture will create a whole host of uncomfortable situations at first, leading to potential misunderstanding, embarrassment, or outright hurt feelings. And of course, some decisions that will need to be "walked back" once the LMM's boss hears of what's going on.

* **Eagerness and the overabundance thereof.** On the other hand, the LMM is moving from one team laterally to another, so the situation feels familiar--therefore, the well-worn habits and tactics they've used in their previous team should work flawlessly over here on the new team, right? Coupled with the boundless eagerness and energy to demonstrate their competence and experience, the LMM will often make some astonishingly bad decisions in the early days.

***Variants:*** 


***Mitigation:*** 

**If you work for the Lateral.** Take a deep breath and prepare for some gentle nudging and/or quiet correction of your boss. They mean well, they just don't know what they don't know. They're likely to figure it out before too long, but until that happens you might have to quietly pull them to the side and explain a few things.

* **Don't assume it's a performance-related move.** Yes, the LMM just got transferred from the Docs team to your team over here in Ops. Yes, you know somebody who knows somebody who heard from their brother's wife's first cousin that the Docs team had a failed release not that long ago. None of this means that the move was performance-related, so don't make any assumptions that would lead you to make bad decisions later. And, even worse, the performance problem may actually be your team, and making the wrong assumptions here will really hurt you (and your relationship with your new boss).

* **Don't go for the 'gotcha' moments.** Look, I get it, the new boss totally just said something stupid in the meeting, and here's a golden opportunity to demonstrate your mastery of the material and maybe score some points with the team, and.... But no matter how it feels to you, to the new boss, you're going to become Private Enemy Number One, and above all you need to work with your manager for the forseeable future. (Unless you're looking to get fired, of course.) Yes, the LMM needs to be corrected, but it has to be done in such a way that it doesn't cause them to "lose face"; if it's a team meeting, you can probably correct them in-place, but if there's any "outsiders" in the meeting, you probably want to do so either in a Slack DM or a quiet hallway conversation after the meeting.

* **Be the SME for them.** If the LMM has any self-awareness, they'll be painfully aware that they don't know what they don't know. Unfortunately, that often means they don't even know what questions to ask. That provides you an opportunity to demonstrate your own utility to the team by offering to help walk them through some of the details of the team's history and why certain decisions were made. (This assumes you don't have any sort of documentation that explains all that--and if the team doesn't have that documentation, here's a perfect opportunity to demonstrate why taking time to build out that documentation would be important!) Keep in mind that doing this *isn't* brown-nosing, it's providing important backstory and data and knowledge. That's a far cry from vapid empty compliments.

* **Embrace the opportunity.** A new manager means a chance to potentially revisit "settled" topics and explore alternatives. Lots of things are done for a particular reason, but it never hurts to re-visit those topics and see if those reasons are still relevant, and sometimes the LMM can hit on an idea from their old team that can be adapted to fix a problem that the team didn't even realize they were having.

**If you are the Lateral.** Depending on the situation, you're either being asked to mark time by working on this team for a while, or you're being seen as a "fixer" and the new team needs guidance.

* **If you're the "fixer", keep that to yourself.** In these situations your boss will often tell you as much, and give you some kind of briefing about what's going on that needs fixing. Under no circumstances can you share with anyone on the team that this is why you're there--even if it's 100% true and everybody in the company knows it, saying so (particularly if used as a justification for a decision!) will demean and demoralize the people you're leading.

* **Lead with questions.** Things worked well a certain way on your old team? That's lovely, but it's history--it's a new team, with different people, different problems, and different processes. (Even in companies that have "standardized" all of their processes, each team still puts their own slant on things.) Even if you're thinking about making a statement, turn it into a question. You are the newcomer here, and you need to embrace that.

* **But embrace asking questions!** Your presence on the team, coming from a different team, gives you a tremendous amount of leeway and latitude at asking questions, so use that to ask lots of "why" questions. It's a golden opportunity for both you and the team to discover new things.

**If the Lateral works for you.** 
