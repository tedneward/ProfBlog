title=The R-and-D Research Team
date=2024-06-12
type=post
tags=management,research,development,teams
status=published
description=What is an R-and-D research team?
~~~~~~
There are four different kinds of R&D teams, each with very different actions and goals, and each with very different outcomes. The success of the team often depends on aligning the activities of the team with the intended goals, and it's actually quite reasonable for a company to have two or more teams, each operating independently and towards different ends. In this post, I explore the Research Team.

<!--more-->

As a reminder, there are four kinds of R&D Teams:

* the [Scout team](./scout-team.html), exploring what tech others in the industry have built (e.g., Flutter, SwiftUI, etc)
* the [Spy team](./spy-team.html), exploring what competitors have built
* the [Library team](./library-team.html), building lowest-common-denominator libraries used (sometimes) within the company
* the [Practical Research team](./research-team.html), building novel solutions to the company's (and others') problems

### The (Practical) Research Team
The Research team (also more recently called "the innovation team" or the "disruption team" in more "hip" companies) is the one most people think about with respect to an R&D team. It's important to note, however, that the team cannot be just focused on research--like the Scout team, the Research team has to have a constant eye on what they build having a practical impact on the company that sponsors them. For that reason, I often make the conscious decision to put the word "practical" in front of the name, so that the emphasis is on practical research that will have a direct effect on the company's ability to execute.

**The Problem:** It has been proven, over and over again, that companies that don't spend time thinking about how to leverage technology to make their business run more effectively or more interconnectedly or more... well, pick your favorite adverb here, it probably applies... will find that they are being surpassed by competitors who have. This statement, however, is exceedingly vague, and is often vague on purpose--nobody exactly knows what the "next big thing" will be, so they don't know ahead of time what the right adverb is to use!

For example, there was a time when simply shipping something on the company's website was sufficient. Then it needed to be up there more quickly than the competitors. Then it needed to be faster and more interactive. Then the push was to get more users on the platform. And so on and so on. With each "internet generation" a new adverb became the watchword of the industry, and massive amounts of time and energy were spent chasing that adverb. (Case in point: For a while, the chief goal was "scale"/"scalability", and many companies went bankrupt trying to build a platform that could handle the "inevitable" challenges of having a million simultaneous users on the platform--even before they had their first user.)

If a Research team is trying to build things that will help the company go to "where the puck will be, instead of where it is now", as the famous hockey player is famous for saying, then the Research team is one that is firmly in the position of having to make fantastic guesses on a regular basis, and--worse--be right all the time or risk being accused of wasting time and money. (Picture this exchange, if you will: "What do you mean you went out and built tools for integrating with a blockchain?" "But boss, back in 2020, you said..." "Blockchain is dead! (I read it in Forbes!) You should be chasing after AI!" Now imagine what the exchange was like in 2016, 2012, 2008, ....)

The humbling truth for most businesses is that whatever the current industry hype is, it's probably not the thing that will most "move the needle" for the company. And, worse, you can almost be certain that your competitor's CEO is currently yelling at their staff about the exact same thing--in 2024, everybody is chasing AI, such that the memes ("Hey, we have a pitch meeting in five minutes; do me a favor, take our pitch deck and replace all the uses of 'blockchain' with 'AI', would you?") are omnipresent on the social media feeds. And yet, even as we know that everybody is chasing it, the biological imperative inside of our lizard brains keeps whispering, "Yeah, but what if they're RIGHT this time? We could be hopelessly behind!" (all the while trying desperately to make you forget that it whispered the same thing about blockchain five years ago).

In many respects, the problem with a Practical Research R&D team isn't the "research" part of it--it's the "practical" part of it.

**Successful Execution:** Executing a Practical Research team takes a lot more work than the other three kinds, because the practical research team has to do more in the way of research. (There's a certain logic to that statement, no?)

For starters, part of the research has to be about what will "move the needle" for the *business as a whole*. This is where some degree of familiarity with the domain (or having a subject matter expert on the team, even part-time) will help immensely with identifying what those areas might be. But keep in mind, part of the discussion can be "shifted left" in the pipeline--if there's no immediately obvious way to move the needle for one group in the company, what about doing so for a group that appears earlier in the pipeline?

Consider Facebook, a social media company. Most of the company's work is in building the web platform on which Facebook provides its "feed" to each of its users. But "shifting left" takes us to some of the infrastructure behind that platform: building the web components, integration with incoming data sources, and (for a while there, anyway) making it easy for people to build apps (like games) on top of the platform or connected deeply with the platform. What does "shifting left" here look like? Well, if someone makes it easier to build a webapp, with particular semantics for how data is managed by the UI code, you get... React.

Did React completely solve all of Facebook's problems? Probably not. (We can debate the issue for days or weeks if we want, but that would actually be missing the point.) More importantly, a team inside of Facebook asked themselves, "What is it something that we and/or our partners or customers do that we can improve?" And then they iterated. Over and over again, and eventually it made its way outside the company to be something that others found useful, and next thing you know, it's pervasive in the front-end industry.

Which brings up an important point about all of this: Progress isn't made in big-bang "Eureka" moments. (Neither is scientific progress, for that matter, but that's a different discussion.) Progress is made in incremental steps with lots of iteration. The shorter those steps, the more iterations you get, the faster you learn about the thing you're iterating on. (This has actually been discussed in certain circles as the "OODA Loop", as coined by John Boyd fifty years ago.)

Consider this story from the book [Art & Fear](http://www.amazon.com/dp/0961454733/?tag=codihorr-20):

> The ceramics teacher announced on opening day that he was dividing the class into two groups. All those on the left side of the studio, he said, would be graded solely on the quantity of work they produced, all those on the right solely on its quality.

> His procedure was simple: on the final day of class he would bring in his bathroom scales and weigh the work of the "quantity" group: fifty pound of pots rated an "A", forty pounds a "B", and so on. Those being graded on "quality", however, needed to produce only one pot – albeit a perfect one – to get an "A".

> Well, came grading time and a curious fact emerged: the works of highest quality were all produced by the group being graded for quantity. It seems that while the "quantity" group was busily churning out piles of work – and learning from their mistakes – the "quality" group had sat theorizing about perfection, and in the end had little more to show for their efforts than grandiose theories and a pile of dead clay.

As a practial research team, you need to put out *lots* of work, not just one "eureka" work.

Are you looking for examples of practical R&D? Consider some of the ideas being put forth by [Microsoft Research](https://www.microsoft.com/en-us/research/), or [Oracle Labs](https://labs.oracle.com/pls/apex/r/labs/labs/projects). (For the record, MSR produced F#, and Oracle Labs is the group behind GraalVM.) IBM used to have a similar section, alphaWorks, which unfortunately got shut down a number of years ago due to IBM's inability to actually be successful. [Meta/Facebook](https://research.facebook.com/) has one, too. Does your company need to fund a multi-million (possibly -billion) dollar research group? Of course not. That's what companies with billions of dollars in their budget can afford to do. But a company of several hundreds in size can put together a single team of 5 +/- 2 developers to iterate on ideas to make the company's technology a better return on investment.

Which brings up the last point: A practical research team needs to be extremely visible to the rest of the company in terms of the work they are doing and the research they are carrying out. Because a team of this nature is usually a "net negative" in terms of the company's financials (they draw a lot of money in and rarely generate any money back), socialiing the work and demonstrating the current iteration is crucial to demonstrating the value of the team. In addition, it's important for people to get their hands on what the research team is doing--putting alphas and betas out into the world (or at least into the world inside the company, if there's no interest in open-sourcing the efforts) is important both to the visibility of the team as well as a means of obtaining feedback around the ideas.
