title=Antipattern: The Headless Chicken Manager
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Many companies make the same sorts of mistakes with their managers, over and over again. If they were software designs, we'd call them antipatterns. One of them is when the manager panics, knows something is wrong, yet is afraid to do anything.
~~~~~~

"You're kidding me. The build broke, we can't compile half the tests, we're not even sure Product wants half these features, and Jeremy still can't make up his mind about what we need to work on next?" "Hey, it could be worse--over on Venkat's team, they're still in mandatory overtime, trying to find that one bug that Venkat insists is there, even though they haven't seen evidence of it since last year." "You want to talk about worse? Vlad's team has completely changed their backlog three times this week, each time they met with a different Product person." When a chicken's head is cut off, it runs around aimlessly, completely oblivious to the what's going on around it until it does. When things go wrong, some managers panic, others flail. For some reason, some managers seem to believe the chicken's behavior is one to emulate during times of crisis or decision-making.

<!-- more -->

***Context:*** 

* **Panic takes many forms.** Contrary to the title of the anitpattern, not all Headless-Chicken Managers (HLMs) will be running around in an outright panic. Some will be doing it quietly and with a grim sense of determination, in many cases so as "to not spook the troops".

* **Frequent changes of direction with overinflated expectations at each change.** The HLC knows something's wrong, but doesn't know what or how to fix it. Therefore, they start doing the management equivalent of going up on WebMD: They start Googling and/or reading the flavor-of-the-month management books. Like the non-technical leader who desperately skims Forbes or CIO Magazine looking for the quick-hit solution to their out-of-control IT technical debt, the HLC is desperate to find something that will fix their out-of-control issues. (What's worse, the HLC's issues could be either technical, or personnel-related, or sometimes both.)

* **Recent loss of credibility.** Sometimes a perfectly good manager turns into an HLC when they've suffered a hit to their credibility--an unexpected departure of the most senior person on the team, for example, or a release or launch failure in front of everybody (figuratively or literally). Unused to the feelings of failure, the manager starts questioning *everything* and becomes an HLC looking for answers somewhere... anywhere....

***Consequences:*** 

The consequences of a Headless Chicken's decisions tend to fall into some predictable patterns:

* **Little time or thought went into it.** The HLC is absolutely sure that doing nothing is the root of all evil, so they will jump to the first idea that pops into their head (whether native-born or ingested from an article), without even the barest of research or analysis put into the possible outcomes of that thought. Worse, the team will not be consulted about the idea, nor will their input substantively affect the decision.

* **Emphasis on fast execution leads to poor execution.** "Get it done, and get it done now" becomes the mantra, and the over-indexed emphasis on speed often creates a new set of problems. ("Log into the database and fix the data by hand!" is one of the all-time favorite options that often leads to even worse disasters.)

***Variants:*** 


***Mitigation:*** 

**If you work for the Headless Chicken.** Eeesh, there's not a whole lot you can do except brace for it. Your options here are a little limited. As you get to know the manager better, some possibilities open up:

* **Prop them up.** If your manager knows they react badly and wants to get better, you can perhaps provide some support in the form of suggestions and/or being a sounding board. In essence, you can give them a private space in which to react badly, then talk their way "off the ledge", so to speak, so they can think more clearly.

* **Calm down the others.** If it's not a crisis situation, you can work to de-escalate the reactions of the team around the manager. Sometimes the manager sees the team's concerns or panic and it inflames their own--talking to the rest of the team to get them to calm down can in turn get your manager to a point where they can start to see resolution possibilities.

**If you are the Headless Chicken.** "For gods' sake, get a hold of yourself!" Oh, if only it were that easy.

* **Practice your crisis management.** One of the reasons we panic is because we're not sure what to do in the heat of the moment. You can't take away the possibiity of crisis, but what you can do is remove its novelty. In the political/military space, there is a concept called "wargaming" in which leaders are gathered into a room and presented with a hypothetical situation as if it were happening in real-time, and leaders are challenged to come up with responses. It's all a form of practice. Take a page from their book: Practice a server outage! Practice a bad deploy! Practice a security vulnerability! Obviously, don't do this is prod, and equally obviously, you'll never predict with 100% accuracy what will happen when something goes south, but you'll find over time that your practice gives you some tools "in the moment" even if the situations aren't the same.

* **Stop reading. Start listening.** One of the things the management books never actually tell you is that sometimes the best people to ask the questions of are the ones right around you--your team, your peers, and your boss. It hurts the ego to have to ask "What the heck should I do now?" but it can be a powerful tool, and in most healthy relationships, people will want to help.

**If the Headless Chicken works for you.**

* **Recognize that they may be afraid.** You may be the reason they're panicking. If, for example, they know that it's hard for your company to hire people and they just lost the senior developer on the team, they may fear your reaction or frustration. If that's the case, you're the *last* person they want to have this conversation with. You may want to talk to your other directs (the HLC's peers) and get their impressions of what's going on, and possibly even work with the HLC through a third party to resolve the issue. Once the issue is resolved, however, you have a bigger problem: You need to get the HLC to stop being afraid of you, and that means a deep dive into how to build a psychologically-safe team. (If one of your reports is afraid of you, or of disappointing you, it's an even bet that others on the team are, too.)

* **Reassure them that failure is an option.** Psychological safety becomes paramount with the HLC. They need to know that their every move isn't being scrutinized under a microscope and their every decision won't go into their "permanent record". They need room to maneuver, and sometimes that room is obtained simply by telling them that you're not going to be watching them maneuver.

* **Help them think through the problem.** Why are they panicking? What's the real issue here? What does "success" look like in this? Ask probing questions, designed to help them think through the problem and come to their own analysis and conclusions; avoid Socratic questions, which lead them to the answers you've already determined are the "correct" ones, or they will only come to depend on you for answers.


