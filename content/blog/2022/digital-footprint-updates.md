title=Digital footprint updates
date=2022-02-22
type=post
tags=website, azure, industry
status=published
description=Some discussion about what I'm doing with my various websites.
~~~~~~

As I've mentioned on LinkedIn, I've been *sans* FTE employment since just before the holidays last year, and I'm using the time to do some re-shuffling of some of my "digital footprint" on the Internet. Let me explain a bit about what's going on here, mostly so that if you're consuming an RSS feed for one, and you're not getting what you expect, you may want to flip over to the other. (Or both!)

<!--more-->

For starters, I've come to realize that I want two, separate "representations" of myself on the Internet for public consumption, one professional, the other personal.

The professional persona will be here, on newardassociates.com, in which I talk pretty much about what everybody expects me to talk about (if you don't know me personally): programming languages, platforms, virtual machines, management, and so on. Think of www.newardassociates.com as the pair to my LinkedIn account. That means there will be two top-level domains:

* [www](http://www.newardassociates.com): The professional website and "starting point" for anybody looking to view services, articles, presentations, and so on.
* [blogs](http://blogs.newardassociates.com): This is where a lot of my blog articles will end up living, and at some point I may redirect some of the links at blogs.tedneward.com over to here permanently, just to encourage professional readers to come here. The plan is to wire this up with [IFTTT](http://ifttt.com) to pick up on a new blog post and post it to LinkedIn, in fact.

The personal persona, tedneward.com, will be a bit more free-form, and wide-ranging. I may talk about technology, but I will also feel more free to host other non-professional things, such as D&D, fiction I feel like posting, maybe some photos, and who knows what else. That means there's going to be a couple of different domains there, as well:

* [www](http://www.tedneward.com): The starting point.
* [research](http://research.tedneward.com): My "research garden" of links and notes for a whole bunch of things, including personal, professional, and anything else that seems interesting to me. Feel free to wander around in there if you like, but keep in mind that you're wandering around in a digital version of my study, so if the mess doesn't make sense...
* [blogs](http://blogs.tedneward.com): This has historically been where I kept my professional blog (since 2005!), so I'll keep those links alive (some or most of them, anyway--some are just way too outdated to think anybody will care), but future posts will be all over the map. This one will wire up with [IFTTT](http://ifttt.com) to announce new posts to Twitter, since Twitter is where I'm more comfortable showing off multiple sides of myself as an individual, rather than just branding as an "industry professional".

The key? I'm doing all of this using static site generators, Markdown, GitHub, GitHub Actions, and hosting them in Azure. This way, I can either use the GitHub web-editor to create a new post online directly (and have it auto-posted to the site within minutes), or queue it up by writing locally and shipping when I push to main. Automating all of this has been a thorn in my side for quite a while, but I wanted a reason to learn GitHub Actions, and while I could've done some or all of this using a variety of other platforms, I've been meaning to spend a little time with Azure anyway, so here we go. (And no, I didn't consider running one on Azure, one on AWS, one on Digital Ocean... because life is too short and I'd rather find a different forcing function for each of those cloud providers.)

If you're still reading, thanks for staying with, and hopefully this will reduce the barrier-to-blog that's kept me from writing more in the last few years. (It's kinda not, but let's pretend that's what it was and let me slide, OK?)