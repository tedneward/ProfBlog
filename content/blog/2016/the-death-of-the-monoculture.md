title=Death to Technical Monoculture
date=2016-01-13
type=post
tags=architecture, psychology, philosophy, distributed systems, industry, interoperability
status=published
description=In which I talk about the problems of monoculture in technical environments.
~~~~~~
It's really starting to appear like the "technical monoculture" that so pervaded the 90's and 00's is finally starting to die the long-deserved ugly death it was supposed to. And I couldn't be happier.

<!--more-->

I was sitting with a buddy of mine in a sports bar.

(Yes, it was [Canyons](http://canyonsrestaurant.com/). For those who don't know me too well, it's one of my favorites here in town---not that I really use it for a sports bar, *per se*, but because they are a good group of folks who have nice large wall-mounted TVs that we can remote into using GoogleCast from a laptop, which means, combined with their WiFi, copious outlets and a nice space in the back where we're more or less isolated from the rest of the crowd, I have a perfect place to host the [SeaLang meetups](www.meetup.com/SeaLang), yay. What's better than learning about new programming languages? Why, learning about new programming languages with beers, nom-noms, and Diet Coke!)

He happens to work for Microsoft, and we were commenting on how Microsoft really seems to be getting their mojo back, and a lot of it stems from the fact that Microsoft internally is really starting to embrace things outside of the traditional Microsoft sphere of influence. Case in point: Azure. If you're running on Azure, you have your choice of just about anything you can name as your programming language of choice (C# and Visual Basic, of course, but also Java---which will include pretty much anything that compiles to JVM bytecode, so throw in Scala, Groovy, Clojure, Kotlin, and a few more---and PHP and NodeJS, and ...) to use. They're embracing different data stores, too. And---and be honest, how many of you ever thought you'd see this---you can run Linux VMs on Azure to host all of this stuff if you want, so anything that Azure doesn't host "natively" can always be running inside of a VM.

The interesting thing about this conversation was that it really became apparent to us that the traditional "Microsoft shop" (of which, not surprisingly, Microsoft has long been one) is essentially an endangered species. No longer will it really be acceptable for a developer to "just" know Windows, C#, and SQL Server. You're going to need to know a whole lot more than that, because frankly, there's a lot of tools out there that are actually better than anything Microsoft offers natively. Redis, for example; there's no equivalent that I've found to Redis in the "Microsoft world", and frankly, why should I have to settle for an equivalent? If I like Redis, and it seems useful, why in Heaven's name shouldn't I be able to use it? Just host it in Azure in a Linux VM, and keep going.

But this street isn't entirely one-way. When the Pandora's box on the JVM got blown off (thanks to  AspectJ, which not only suggested that "objects are everything" was a fallacy, but also that one could run multiple languages on top of this virtual machine, and it could be a Good Thing), it opened a lot of Java developers' eyes to the fact that Java wasn't, perhaps, the last programming language they would ever use. And now, with the CoreCLR migrating to other platforms, coupled with the fact that the C# language is actually kind of a nice language to use....

Couple that with [Xamarin](www.xamarin.com) being able to cross-compile to different mobile platforms, or [RubyMotion](www.rubymotion.com) being able to do the same, and....

Oh, and toss in that recent announcement about Apple and Android for good measure...

Yeah. It's something of a new world.

As someone who's spent a decade and a half talking about interoperability across platforms, it's somewhat gratifying to see all of this starting to take shape. Scary, too, I'll grant you, if you're one of those people who's always felt that they could just learn the one thing and then go out and be emplyable forever.

But this is coming, and you have essentially only a few choices: Fight it (and essentially lose, since there's no signs that this is ever going to change), ignore it (and essentially become obsolete over time), or embrace it.

I think it fairly clear which path *I* choose. And to the best of my ability, I will help you if you choose it, too.

