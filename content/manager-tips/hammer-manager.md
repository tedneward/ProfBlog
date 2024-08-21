title=Antipattern: The Hammer Manager
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Many companies make the same sorts of mistakes with their managers, over and over again. If they were software designs, we'd call them antipatterns. One of them is when the manager only has one tool in their toolbox.
~~~~~~

"Did you hear Klaus going on about C++ again in there?" "Oh my gods, yes, it was hilarious. Seriously, we get it Klaus, you built your own operating system in C++ when you were fresh out of college. Let's get you back to bed, grandpa. Sheesh." "Hey, I'll take Klaus over Martin any day of the week--did you hear he's trying to get SaFE installed across the entire company again, even on teams that just went through Scrum training?" Nobody lives that expression "When all you have is a hammer, all the world looks like a nail" better than the Hammer Manager. 

<!-- more -->

***Context:*** 

* **Deep expertise.** Typically the Hammer has a deep expertise in that particular tool or process, such that they are able to answer most casual questions about it, and may even have some industry-recognized credentials around it. They might have spoken at conferences or even run training classes on it. They *know* this.

* **Proven history.** Why that particular tool? Because it worked! They had success with the Hammer once, and for gosh sakes, they're going to have success with it again, even if it kills all of you to do it. Their history also means that they will be able to cite situations where all seemed lost until their favorite tool appeared and saved the day (either figuratively or literally).

* **Lurking in the grass.** The Hammer is often hard to spot at first, because they actually had success before. In fact, that success may have catapulted them into the position they now hold, because upper management was pleased that they were able to get the job done. This only reinforces the Hammer's instinctive reaction to wield it, because who doesn't want to go back to something that worked once before?

***Consequences:*** 

The Hammer's preferred tool won't take long to emerge, and it may even get the team excited if the Hammer's choice is one that is a contemporary "exciting" choice, such as Go was in the late 2010s, or Rust is in the early 2020s.

* **Skewed thinking.** Because the Hammer typically has invested their time and energy into understanding their tool more deeply, they lack knowledge of some of the surrounding and "adjacent" tools and technologies--if they are a Java expert, they may have deliberately stayed away from .NET, Python, Ruby, or JavaScript, because "Java can do everything that other thing can do". Even if true, they are frequently making incorrect assumptions about the others, which can lead them to make incorrect inferences based on those assumptions.

* **Mismatched decisions.** However, it's not long before the Hammer's choice of tools starts to create problems within the team. The choice of C++ to build an HTTP API service starts to create problems as memory-management issues (always the bane of the C++ project) rear their ugly head. Project managers who don't understand SaFE's artifacts or processes begin to take shortcuts and/or invent their own processes to "correct" for what they perceive as a lack or "unnecessary overhead". And so on. These mismatches often start subtle, but before long they're simply too obvious to ignore.

* **"You're holding it wrong!"** The inevitable reaction of the Hammer is to steer criticism way from the tool and on to the tool users. "'Tis a poor craftsman who blames their tools" is a common aphorism quoted by the Hammer. Comparisons between their tool choice and another (reasonable) choice will be shot down fiercely: "There's not that much difference between Java and C++, and C++ doesn't have that huge overhead that the JVM does."

***Variants:*** 

One variation of this is the manager (typically CEO or CTO) who chases the latest "bright shiny" technology promoted by a VC-fueled startup culture. This **"Bright Shiny" Manager** reads the online news and business journals religiously, and is always looking to them to be their new Hammer. One year it's "machine learning", then the next year it's "blockchain", followed a year later by "large language models". Before that it was "data science". If the Gartner folks included it in their annual paper, it's a candidate to be the CxO's new Hammer, and there's a small chance each time that the CxO will leave the company to be a founder in that space.

***Mitigation:*** 

One path is an enforced period of time in a dark cell, with all access to their favorite tool cut off and nothing but a competing tool installed on a laptop. After a few years of this, they'll have moved on to the competing tool as their new "favorite", but at least they'll have moved on.

More realistically....

**If you work for the Hammer.** You really have one of two possible paths (other than "quit", which is always an option).

* **Embrace the Hammer.** Hey, if it's a technology (like Java or C#), then there's a good chance that it *could* work, and possibly be even better than what you thought you should be using instead. Don't be a Hammer yourself! This has the benefit of getting in with your boss's good graces, and you can always keep a quiet tally of all the places it doesn't work well in a journal or something.

* **Try to break them of their Hammer-ness.** Settle in, this is going to be a long ride. The Hammer isn't going to change their ways easily or quickly, so your first order of business is to decide how much you're dedicated to this option. If you are, then your first task is to embrace the Hammer's favorite, so that you can be perceived as a "fan". Over time, bring up situations that occur organically where the Hammer's favorite isn't working as well as everybody might have thought. Don't propose solutions--the Hammer has to come to the conclusions that their favorite isn't the "one-size-fits-all" solution they thought it was. 

Fortunately, you can practice both paths simultaneously, so you don't have to make any hard decisions up front.

**If you are the Hammer.** If you're reading this, you're probably in denial that you're the Hammer in the first place. "Of course I like X, but I'm not misusing it, I only use it where it makes sense!" The problem with that last bit of sentence, of course, is that "where it makes sense" has a tendency to be "everywhere, every time" when you're brought in to solve something. 

* **Test yourself.** The first step in any twelve-step program is to admit you have a problem, and Hammer Managers are going to be pretty adamant that they could admit they have a problem *if* the actually had one. Test yourself: Can you name three scenarios where your favorite tool or process is an absolutely terrible choice to make? Can you identify a class of problems that just don't fit (or fit well) for your favorite? How close are those class of problems to what your company does? Can you make the case for using something *other* than your favorite on a project? If any of these are hard for you to do, then you may have a problem.

* **Study something else.** Go learn something that's adjacent to what you like. If you're a Java fiend, go learn .NET or Python. If you're a certified SaFE coach, go spend some time in Kanban. If you're an RDBMS lover for decades, go spend some time with NoSQL. And so on. (The reverse of all of those is true, too, by the way!) Don't try to use the new thing the same way you used the old thing--each thing has its own nuances and idioms, and it will not serve you well to try and write Rust the same way you would Java. Heck, if all else fails, learn a new human language (French, German, Arabic, Polish, English, whatever isn't your native tongue) if you only know your native tongue; the experience will help you understand that the same words don't translate exactly correctly, and that each language has its own idioms that make no sense if translated literally. This will help you understand that each language (tool) brings its own biases and perspectives (approaches) to a given concept (solution), and make it easier to spot differences later.

**If the Hammer works for you.** Look, they were successful, you didn't realize they were a Hammer when you put them there, there's lots of justifiable reasons why you hired a Hammer Manager. Admit that you did, and start working to correct their world view:

* **Quietly double-check some of their decisions.** Is the Hammer's tool of choice smoothing things out or creating swirls of chaos and friction? You can't really judge until you have some first-hand evidence, and you can't get that until you go looking for it.

* **Make sure they have room to fail.** One of the reasons Hammers so love to cling to their favorite tools is the [deep-seeded fear of being wrong](./paranoia-of-wrong.md). Give them the explicit permission (and possibly direct order) to try something new--suggest using something different on an internal tool, or even create a 10-hours/week "side project" for their team to work on that will have marginal benefit to the company (but a much larger benefit to the team as they build it in something completely different).

* **Do some research yourself.** Hey, if their favorite tool is your favorite tool, you might be more susceptible to being a Hammer Manager than you thought. Drop yourself into the "If you are the Hammer" section above and see how well you do. If you are, then do some of the research necessary to get a fresh take on things.

