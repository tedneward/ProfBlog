title=Exploring Digital Solopreneurship
date=2026-11-24
type=post
tags=ai, business
status=published
description=A brief rundown of what I'm working on during this latest hiatus.
~~~~~~
In August I wrapped up a fractional VP of Engineering gig, and since my time at Capital One had come to a close, I was left with a bit more idle time on my hands. While scanning the want-ads (figuratively) looking for a new gig, I thought I'd take a spin around "solopreneurship", the new trend around a "solo entrepreneur"--somebody running a business entirely by their lonesome.

<!--more-->

Technically, I've been a solopreneur for close to 30 years now, having been the sole proprietor of Neward & Associates for a quarter-century. (Even more technically, that's not true, as my wife has often been the COO of the firm--invoices, expense reports, that sort of thing. But for most peoples' purpose, it's been a "company of one" since we formed it in 1999.) But the latest crop of AI tools has got a lot of people talking about "business operating systems" and "code-it-yourself" opportunities, and I wanted to give that a spin for a bit and see how things run (or not).

As such, I'm pleased to announce that the first two solutions/offerings that are being formally offered by Neward & Associates are in alpha and beta testing on iOS and Android. One is a [scoring application for the the card game Hearts](https://www.newardassociates.com/applications/hearts-scorer/index.html), and the other is a [similar utility for the card game Spades](https://www.newardassociates.com/applications/spades-scorer/index.html). Hearts shipped first, and Spades is coming soon, probably within a week or two (pending Apple's and Google's approvals, of course).

I'm coming to the realization, too, that while the coding agents (I've been using [OpenCode](https://opencode.ai/) a lot, rather than Claude or one of the others) are pretty good--and the use of specifications (like [OpenSpec](https://openspec.dev/)) can help formalize the process, the whole "specification-driven development" still isn't flawless, and still requires an engineer's touch. My workflow is still under development (I wrote one with specs, the other with a more informal "write out a plan, then implement the plan" which is similar but much less "weight" than formal specifications), but reviewing and testing are still things that I'm finding I need to keep an eye on. I don't have to review every line of code, but you can be sure I'm scanning each iteration once we're finished, and I commit/push once the iteration is solid, just in case I need to back something out (which I've had to do once or twice).

Where the agent definitely paid off was in setting up the [fastlane](https://fastlane.tools/) CI/CD for the apps; fastlane is able to automate to both the Google Play Store and the Apple App Store, but it's been (checks notes) literally a decade since I went through the full sequence of steps necessary to publish apps to either store, and wow the process has changed some. OpenCode was quite helpful in figuring out how to get fastlane to take the results of the build and get them into the stores, including making clear where steps were ones I (the user) had to take vs steps it could figure out on its own. Kinda nifty.

On the whole, the experience is definitely illuminating, and something I think any senior software engineer who's wondering about their career future should consider exploring--we've all thought about "I have this idea, but I'd need a team and a couple million to make it work", but now we have these tools available to us that can actually do the work of a team (or at least a bunch of interns), and much of these tools run for free or at minimal cost. Maybe the rest of the 2020s is destined to be "The Year of the Solopreneur"?
