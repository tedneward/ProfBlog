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



***Consequences:*** 

The consequences of a Headless Chicken's decisions tend to fall into some predictable patterns:

* Little time or thought went into it. The HLC is absolutely sure that doing nothing is the root of all evil, so they will jump to the first idea that pops into their head, without even the barest of research or analysis put into the possible outcomes of that thought.
* Emphasis on fast execution leads to poor execution. "Get it done, and get it done now" becomes the mantra, and the over-indexed emphasis on speed often creates a new set of problems. ("Log into the database and fix the data by hand!" is one of the all-time favorite options that often leads to even worse disasters.)

***Variants:*** 


***Mitigation:*** 

**If you work for the Headless Chicken.** Eeesh, there's not a whole lot you can do except brace for it. Your options here are a little limited. As you get to know the manager better, some possibilities open up:

* **Prop them up.** If your manager knows they react badly and wants to get better, you can perhaps provide some support in the form of suggestions and/or being a sounding board. In essence, you can give them a private space in which to react badly, then talk their way "off the ledge", so to speak, so they can think more clearly.

* **Calm down the others.** If it's not a crisis situation, you can work to de-escalate the reactions of the team around the manager. Sometimes the manager sees the team's concerns or panic and it inflames their own--talking to the rest of the team to get them to calm down can in turn get your manager to a point where they can start to see resolution possibilities.

**If you are the Headless Chicken.** "For gods' sake, get a hold of yourself!" Oh, if only it were that easy.

* **Practice your crisis management.** One of the reasons we panic is because we're not sure what to do in the heat of the moment. You can't take away the possibiity of crisis, but what you can do is remove its novelty. In the political/military space, there is a concept called "wargaming" in which leaders are gathered into a room and presented with a hypothetical situation as if it were happening in real-time, and leaders are challenged to come up with responses. It's all a form of practice. Take a page from their book: Practice a server outage! Practice a bad deploy! Practice a security vulnerability! Obviously, don't do this is prod, and equally obviously, you'll never predict with 100% accuracy what will happen when something goes south, but you'll find over time that your practice gives you some tools "in the moment" even if the situations aren't the same.

* **

**If the Headless Chicken works for you.**

