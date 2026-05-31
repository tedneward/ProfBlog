title=Things I Think I Think... The New Internet Era
date=2026-5-31
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=published
description=Mulling out loud (and defending) why I think the next few years are a new "Internet Era".
~~~~~~

Unless you are not yet old enough to drink, or lived out in a shack above the treeline in a mountain range, you probably remember to some degree the "Internet Era". Also known as the "Dot-Com Era" (along with its closely-releassed sequel, the "Dot-Bomb Era"), it was a time when the Internet was new, the boundaries were untested, and everyone's credulity was pushed out to the utter limits.

The reason I bring this up, of course, is that current thinking among AI critics holds that we are on the cusp of a "post-bubble" AI phase. That is to say, the "AI bubble" (which is a real thing, I hold that as axiomatic) is going to pop any day now, and when it does, all kinds of chaos and terribleness is unleashed. However, I draw different conclusions out of the "Dot-Com/Bomb" eras, mostly because (a) I already feel like I know the bubble is going to burst, so I don't have any real questions there, but (b) I want to know what's going to survive the silicon "pop" and what's not. And by "what" I mean "who"--which companies will survive the shift and which won't?

<!--more-->

In the early days of the Internet, focus was on the Internet itself. Like it was, on its own, the end goal. Companies were formed to be "E-" companies (anything with an "e" prefix, a la "eBay") or an "I-" company (anything with an "i" prefix, a la "iMac"s, which obviously were a product and not a company but at the moment I can't think of a good "I-" company that's still around). The emphasis was on "The Internet"--whatever the company did, "The Internet" was at the center of it. Everything revolved around "The Internet". Microsoft even famously decided that it was going to put "The Internet" at the centerpiece of its operating system, when it decided to have users "browse their desktop" [^1]. "The Internet" was going to make everyone a ton of money, and everyone knew it.

And companies responded accordingly, in some cases going so far as to create "[Chief Internet Officers](https://www.netlingo.com/word/chief-internet-officer.php)". (Not to be confused with its contemporary cousin, the "[Chief Web Officer](https://en.wikipedia.org/wiki/Chief_web_officer)".)

Before I continue on, I'd like to point out that this is not the first time the industry has responded to a new technology by seeking to create a top-level C-suite role for it and then turning to that individual and saying, "Go on! Make it happen!" At the turn of the *previous* century, the world saw the emergence of the [Chief Electricity Officer](https://www.vam.ac.uk/blog/digital/cdos-the-new-chief-electrical-officers), a role designed to bring the company in line with the burgeoning field of "electricity".

Funny how we don't have any of those around anymore.

This is because as time progressed, we came to realize that *focusing on the technology itself doesn't accomplish much*. All of the companies that were formed to focus on the thing--in the most recent example, The Internet--eventually came to realize that the thing is only useful as a means to some other end. OReilly (the book publisher) had a commercial web server product, as competition to Netscape's and Microsoft [^2]'s commercial offerings. Today, the HTTP protocol is so ubiquitous (and, it turned out, simple) that we run HTTP servers out of single-line Python scripts. Just as electricity eventually just became part of the purview of the staff that manage the building's physical presence--and in some buildings, particularly manufacturing operations, that's a nontrivial task, to be sure--and dropped out of the CxO suite accordingly.

Success in either era came only when people realized that "the thing" was nothing more than a means to an end, and established the end accordingly. Electricity helps manufacture things, or helps the staff work more efficiently (consistent lighting) or provides power to automation (washers, dryers, etc). The only people who do anything around the electrical grid itself are commercial power producers, the folks who install solar panels on your roof, and electricians.

Therefore, ***success in this upcoming era will not be to those who establish "Chief AI Officers", but understand that AI is simply now a (powerful) part of your implementation strategy, and act (and code and staff and train) accordingly***. The "moat" isn't AI itself, and the frontier models are never going to be "moaty enough" to keep a decent enough distance from open-source or locally-trained models. Just having a ton of compute available (which both of them don't have, as evidenced by Anthropic having to swallow its pride and sign the deal with Musk/X) isn't enough to keep the wolves at bay.

A couple of notes that I think come out of this:

* Apple survives quite well, given its near total non-engagement with AI thus far.
* Microsoft manages, though will have to do a ton of internal re-orgs to re-re-adjust to the new AI. Likewise for Facebook [^3] and Google. Their stock may take a hit, executives may get cycled out for their "bad judgment" (even though a lot of it is being demanded by Boards), but they'll survive. They have other products on which they rely.
* OpenAI and Anthropic will collapse, and quickly get snapped up by somebody else when their value degrades enough to be a "convenient buy". (Honestly, it's too easy to stand up your own "ChatGPT" using open-source tools, and many developers are now seeing "Write your own coding agent harness" as the new Coming-of-Age Trial in the same way we used to think about writing a web server back in the 2000s.) The shift of domains will likely be the biggest public impact, but the economic untangling of all the loans and VC debt could very well be a new "sub-prime"-level banking crater.
* NVidia will never be much more valuable than it is now, because while the massive data centers aren't ever going to happen, the demand for GPUs will certainly continue. However, the manufacture of a GPU is not a relatively hard problem to solve if you're already a chip manufacturer, and Intel/AMD/others have plenty of incentive to retool some supply lines to start building out cheaper (and more importantly, available) GPU lines.

Keep in mind, too, that with the growing public backlash against all things AI (as exemplified by the "boos" at speakers praising AI during graduation speeches), companies whose brand is tightly aligned with AI (which seemed like a great idea in 2025 and a terrible idea for 2027) will likely take PR hits to go along with it all. Apple, Microsoft, Meta, they all have something to be known for beyond their AI efforts; OpenAI and Anthropic, not so much.

---

[^1]: Ironically, what subsequent releases later came to demonstrate was that they basically wanted the desktop to be an HTML page. The ironic part here is that this idea is so common now to so many different things--I mean, VSCode, an Electron app, is basically an HTML page with a full-page editor written in Javascript, when you boil away all the plugins--that it really doesn't even make anyone blink anymore, much less file lawsuits with the Department of Justice.

[^2]: Microsoft's Internet Information Server is the only one that's even remotely survived, it's now so deeply buried inside the operating system that I don't think anybody even still realizes it exists. It was there, though, last time I popped open the Control Panel and started looking around at the background services that get installed.

[^3]: Facebook/Meta's bigger problem appears to be the millions (literally) of lawsuits that are being brought against it for its social media algorithms. Those fines could stack up in a hurry, and the company may end up having to do some serious restructuring or become an acquisition target to survive. The social media website itself will survive, though, it's crossed the Threashold of Immortality by this point.
