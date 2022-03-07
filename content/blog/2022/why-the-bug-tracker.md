title=Why the Bug Tracker
date=2022-02-26
type=post
tags=process, management, development
status=published
description=Allen Holub posted a tweet and a blog entry claiming that the use of a bug tracker was a crutch that teams should deliberately throw away. He's wrong, but he's not entirely wrong.
~~~~~~

**tl;dr**: Allen Holub is a smart, experienced developer whose seen a lot of things in his time. But his take on the bug tracker--that it "is a symptom of a deeper problem--insufficient focus on quality" misses the mark badly on a number of fronts, even as he is slightly right about it.

<!--more-->

First, [the tweet](https://twitter.com/allenholub/status/1496326760719216643) reads:

> I do wonder why anyone thinks that it’s a good idea to not just fix a bug the moment you become aware of it. Bug-tracking systems have always struck me as weird. Don’t track them; fix them.

Then, [the post](https://holub.com/bugs/) goes on in greater detail. Let's take some of this apart.

> You do not need a bug tracking system. In fact, a bug tracking system is a symptom of a deeper problem--insufficient focus on quality.

It's a bold opening, and certainly one designed to catch peoples' attention. This is what comes from being a professional content creator, and I'm just as guilty of it at times.

Look, I get where he's coming from: I've worked on teams (particularly back in the early days when I was doing C++ on some large projects), where the bug tracking database seems to only ever get larger and more complicated and certain bugs just never get fixed and nobody ever seems to care. I remember looking through bug databases at employers and marveling at reports that were from over a year ago, and the features they referred to didn't even exist anymore--or were so deeply different that the bug just didn't matter anymore. It was a HUGE source of noise for me as a developer.

But...

> In general, I fix bugs the moment they appear—not in a drop-everything sense, but as soon as I can get to it—usually within a few hours, but sometimes in a day or two when I’m done with the current story. Of course, if I’m working in the code when I notice a bug, I just fix it right then. The software I write has no known bugs in it as a consequence (and yes, I never don’t use TDD and I always add real tests as I work—these are two different things). I can trust the code as I’m working, and I can verify that I haven’t broken anything as I work by running the tests every few minutes. Takes all the pressure off and radically improves development speed.

> I don’t use a bug tracker because I don’t need to. There are no bugs to track.

> I know that people who haven’t tried it will be skeptical that writing a bunch of tests increases your speed, but programming has never been about the speed at which you type. Time spent typing a test is nothing when compared to overall development time, which is mostly thinking. Having the tests in place eliminates all the staring-at-the-code-wondering-if-it-will-work time and lets you focus on the problem you’re solving rather than whether the code works or not.

These three paragraphs are essentially a time-honored argument that "TDD and tests mean your code is better quality". It's an old argument. It's an argument that has some truth to it. However, the fact that Allen "doesn't need to" use a bug tracker because "there are no bugs to track" makes it pretty clear that he's never worked on a project that is sufficient size and scope that it's more than just him working on the project. *(Full disclosure, I've never worked with Allen, and I'm not aware of his current work status or his work history--this is all analysis, not fact.)* He's never stepped into a project that existed before he was able to bring his TDD discipline (and it is a discipline, folks, it requires a tremendous amount of willpower to do successfully) to bear.

Frankly, it's the argument of somebody who's essentially saying, "I'm better than all you idiots who can't see the clearly-superior way of working" and while it kinda fits in with his irascible "grumpy elder statesman" persona, it's not a great way to win friends and influence people.

Part of Allen's assumption here, too, is that nobody who's *not* a programmer will ever find a bug, and I don't know that he's *that* arrogant to assert that. That means that if the bug is to be fixed, there must be some place where people who are not programers can let the programmers know that "the bug exists, and these were the conditions in which we saw the bug (to the best of our memory anyway)". They aren't in a position to fix them.

Additionally, Allen seems to assert that he has complete discretion over how he is going to spend his time; he gets to decide whether he works on the bug or a feature next. As much as we'd like to assume that programmers will always prioritize what is in the business' best interest when prioritizing their work, we already know that's [not always the case](https://blog.codinghorror.com/gold-plating/). And, in all fairness to programmers, they may not have the necessary context to choose between getting feature A out the door as a higher priority than fixing bug B, particularly if bug B only occurs sporadically and to a small audience, and feature A will win a million-dollar deal. And, to the programmer's chagrin, ***that is a perfectly reasonable decision to make.*** Programmers don't like it, particularly those who value their craftsmanship, but when you value your craftsmanship over business value, you're already on shaky ground.

Lastly, bug trackers serve as a means of information transfer--on a large project, I may not have the knowledge of the code in which the bug occurs, and for me to come up to speed on that area of the code well enough to be able to diagnose the problem and create a useful fix... that could take orders of magnitude longer than if I just note the problem and let somebody who has knowledge of that code attack it.

(Side note: How many of us have worked with people who've spent so much time in all parts of the system so that we can just describe the problem and they can go "Hmm.... yup, I know where it is, here's how you fix it"? One of my best friends was that guy on a team we were on twenty-five years ago. I've seen it at client engagements since then, too. And you know what happens? Everybody comes to that guy for every bug, and soon nobody bothers trying to learn the system. Let that person help drive the fix, but don't let them do the fix.)

The power of the bug tracker is also well beyond the moment the bug is discovered and its fix. Bug trackers can also provide a database and history, documenting what the problem was and how we fixed it, so that future iterations of teams can do searches through the database to find common scenarios and see if there's a larger problem that could be fixed, either cutting down the time required to diagnose a bug, or potentially finding a solution further upstream that prevents a whole class of bugs.

(I am well aware that not many teams use a bug database that way. That doesn't mean it's not a powerful tool for those teams who do.)

But the next paragraph starts opening up some interesting avenues.

> If you have so many bugs that you need to track them, it seems to me that you have serious problems in the way you do development. Fix that first. You can start by throwing away every bug report older than a month. If it’s important, it will come back. Then distribute the bugs out to the teams. In other than a very small organization, the teams will need to work out some way to fairly route bug reports. Throwing dice works pretty well. Assign a number to each team. Throw the dice. You can round robin, too. The team can fix it whenever it’s convenient, but there should be an upper limit on that—a few days, maybe. If your stories are properly sized, that means you can finish the current story before you move to the bug fix. If you’re interrupting people, you’re doing it wrong. A bug is rarely a crisis.

It's a throwaway line, but "throwing away every bug report older than a month" hides a much more interesting take that could've been much more valuable: ***what is the time a bug spent in a bug tracker before it is closed?*** If a team has a bug tracker with bugs in it that stretch back by more than a month, then clearly those bugs have been deprioritized, and they should be moved into some kind of state indicating that; some teams call that a "Won't Fix" (and please by all that's holy include a reason for it so people can get the full history as to why that decisions was made). A team can and should set up some kind of review board or process (or discipline, it doesn't have to be all that formal, if the team is disciplined enough to follow through) for bugs in the tracker.

See, here's the thing that I think Allen has accidentally stumbled upon: ***The distance between the bug's discovery and it's resolution is a useful signal.*** If it takes your team less than a day to fix a bug, you're in a great place. If it takes your team less than a day to resolve that a bug will never be fixed, you're also in a great place, because now you won't waste time looking at it every single time you go into the bug database. If it takes you weeks, or months, to figure out what you're going to fix, however, you're in the same conceptual place as those teams that spent weeks or months gathering requirements.

Once again, "being agile" means identifying your source of feedback, and tightening up the loop of feedback-to-action.

And that has nothing to do with a bug database.