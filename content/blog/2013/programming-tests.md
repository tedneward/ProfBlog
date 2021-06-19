title=Programming Tests
date=2013-07-09
type=post
tags=industry, interviews, languages
status=published
description=In which I express frustration about programming tests during interviews.
~~~~~~

It's official: I hate them.

<!--more-->

Don't get me wrong, I understand their use and the reasons why potential employers give them out. There's enough programmers in the world who aren't really skilled enough for the job (whatever that job may be) that it becomes necessary to offer some kind of litmus test that a potential job-seeker must pass. I get that.

And it's not like all the programming tests in the world are created equal: some are pretty useful ways to demonstrate basic programming facilities, a la the FizzBuzz problem. Or some of the projects I've seen done, a la the "Robot on Mars" problem that ThoughtWorks handed out to candidates (a robot lands on Mars, which happens to be a cartesian grid; assuming that we hand the robot these instructions, such as LFFFRFFFRRFFF, where "L" is a "turn 90 degrees left", "R" is a "turn 90 degrees right", and "F" is "go forward one space, please write control code for the robot such that it ends up at the appropriate-and-correct destination, and include unit tests), are good indicators of how a candidate could/would handle a small project entirely on his/her own.

But the ones where the challenge is to implement some algorithmic doodad or other? *shudder*.

For example, one I just took recently asks candidates to calculate the "disjoint sets" of a collection of sets; in other words, given sets of { 1, 2, 3 }, { 1, 2, 4 } and { 1, 2, 5 }, the result should be sets of {1,2},{3},{4}, and {5}. Do this and calculate the big-O notation for your solution in terms of time and of space/memory.

I hate to say this, but in twenty years of programming, I've never had to do this. Granted, I see the usefulness of it, and granted, it's something that, given large enough sets and large enough numbers of sets, will make a significant difference that it bears examination, but honestly, in times past when I've been confronted with this problem, I'm usually the first to ask somebody next to me how best to think about this, and start sounding out some ideas with them before writing any bit of code. Unit tests to test input and its expected responses are next. Then I start looking for the easy cases to verify before I start attacking the algorithm in its entirety, usually with liberal help from Google and StackOverflow.

But in a programming test, you're doing this alone (which already takes away a significant part of my approach, because being an "external processor", I think by talking out loud), and if it's timed (such as this one was), you're tempted to take a shortcut and forgo some of the setup (which I did) in order to maximize the time spent hacking, and when you end up down a wrong path (such as I did), you have nothing to fall back on.

Granted, I screwed up, in that I should've stuck to my process and simply said, "Here's how far I got in the hour". But when you've been writing code for twenty years, across three major platforms, for dozens of Fortune 500 companies and architected platforms that others will use to build software and services for thousands of users and customers, you feel like you should be able to hack something like this out fairly quickly.

And when you can't, you feel like a failure.

I hate programming tests.

**Update:** By the way, as always, I would love some suggestions on how to accomplish the disjoint-set problem. I kept thinking I was close, but was missing one key element. I particularly would LOVE a nudge in doing it in a object-functional language, like F# or Scala (I've only attempted it in C# so far). Just a nudge, though--I want to work through it myself, so I learn.

**Postscript** An analogy hit me shortly after posting this: it's almost as if, in order to test a master carpenter's skill at carpentry, you ask him to build a hammer. After all, if he's all that good, he should be able to do something as simple as affix a metal head to a wooden shaft and have the result be a superior device to anything he could buy off the shelf, right?

**Further update:** After writing this, I took a break, had some dinner, played a game of Magic: The Gathering with my wife and kids (I won, but I can't be certain they didn't let me win, since they knew I was grumpy about not getting this test done in time), and then came back to it. I built up a series of little steps, backed by unit tests to make sure I was stepping through my attempts at reasoning out the algorithm correctly, backed up once or twice with a new approach, and finally solved it in about three hours, emailing it to the company at 6am (0600 for those of you reading this across the Atlantic or from a keyboard marked "Property of US Armed Forces"), just for grins. I wasn't expecting to get a response, since I was grossly beyond the time allotted, but apparently it was good enough to merit a follow-up interview, so yay for me. :-) Upshot is, though, I have an implementation that works, though now I find myself wondering if there's a way to do it in a functional/no-side-effect/persistent-data-structure kind of way....

I still hate them, though, at least the algorithm-based ones, and in a fleeting moment of transparent honesty, I will admit it's probably because I'm not very good at them, but if you repeat that to anyone I'll deny it as outrageous slander and demand satisfaction, Nerf guns at ten paces.
 
