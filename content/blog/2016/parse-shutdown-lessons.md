+++
concepts = ["Cloud", "Containers", "DevOps", "Industry", "Management"]
date = "2016-01-30T03:28:13-08:00"
languages = ["JavaScript"]
platforms = ["Node", "iOS", "Android", "AWS", "Azure", "GoogleCloud"]
title = "Parse shutdown lessons"

+++

**tl;dr** Facebook/Parse announced that they are 
[shutting down the popular Back-end-as-a-Service](http://blog.parse.com/announcements/moving-on/).
While opinions are certainly going to vary as to why, I thought it an interesting situation to examine
and, upon reflection, comment.

<!--more-->

As I read the post, a couple of things immediately came to mind:

***"That's a very restrained blog post."*** Seriously, it says more by what it doesn't say than what
it actually does say:

> "We have a difficult announcement to make. Beginning today we’re winding down the Parse service, and
> Parse will be fully retired after a year-long period ending on January 28, 2017. We’re proud that 
> we’ve been able to help so many of you build great mobile apps, but we need to focus our resources 
> elsewhere."

Quite honestly, this has all the sentiment and emotion of a "Dear John" letter. "We understand that
this is difficult, but really, it's not you, it's me. Please try to move on with your life and in time,
you will find that it's better this way for all of us." The only real explanation given is that "we
need to focus our resources elsewhere."

Facebook is how big, and somehow they can't keep the Parse team focused on doing what they were doing?
Sorry, no, I don't believe it. This isn't about needing to re-route critical resources (people?
servers? office desks?) to other parts of the company, not by a long shot.

***The Parse acquisition was always a weird one, to me.*** Quite frankly, I couldn't really figure
out what Facebook wanted with Parse in the first place. Facebook is not really a developer-facing
company, when you get right down to it. Yes, they're a software comapny, and yes, they've recently
been tossing some interesting open-source projects out the door---but Facebook, unlike Microsoft,
Amazon, or Google, doesn't really have a business model that incorporates developers at the core.
They make money off of people who use Facebook, and buy things from ads displayed in Facebook, and
towards that end Facebook certainly wants developers to build applications that make use of
Facebook, but Parse really didn't do any of those things.

***The Parse guys had to know this was a possibility.*** Frankly, it's always a possibility when
there's a buyout---the acquiring company either changes their strategy, their opinion, or finally
reveals that their main goal was to (a) remove you from the playing field, or (b) redirect your
"assets" (which usually means the people working for you) to other parts of the company. Sure, it
was all wonderfully believable that Facebook admired the plucky startup and wanted to see them
continue to support other plucky startups. Also listed in the wonderfully believable category:
Santa Claus, the Free-Market Fairy, and the idea that Bill Cosby is just misunderstood.

***The companies that bet on Parse on their back end must have mixed feelings right now.*** To be
sure, the Parse guys are bending over backwards to try and make this a smooth transition: not only
are they providing a 
[database migration tool](http://blog.parse.com/announcements/introducing-parse-server-and-the-database-migration-tool/), 
but they've also open-sourced a 
[Parse Server](http://blog.parse.com/announcements/introducing-parse-server-and-the-database-migration-tool/)
implementation, which (on the surface, anyway) claims to be API-compatible with the original Parse
Server. So, sure, there's a migration strategy in place, and they've given basically a years'
notice to people, to give them plenty of time to bail out. But right now, every Parse naysayer
is standing up in the conference room and shouting, "SEE?!? I TOLD YOU SO!!", even if their main
objections to Parse were along a completely different axis. Meanwhile, every company that was
considering any kind of cloud system is probably having something of a re-think, because if it can
happen to Parse, why can't it happen to Azure, Google Cloud Platform, Bluemix, and so on?

(And for the record, it's a stupid comparison, but it does, I think, highlight the difference between
betting on a company that provides the cloud hosting directly---a la the people who own the hardware
and the dirt it rests on---and those companies that use said hosting to provide some kind of value-add
on top of it, which of course includes all the various "aaS" members like Heroku, Mongolab, and a
whole gaggle of others. Azure, AWS and Google Cloud are not going away; the massive investment in 
the physical infrastructure alone means that those companies are in it for the long haul. Anything 
else, though, I can't say with absolute certainty---"easy up" can just as quickly become "easy down"
when the investment doesn't seem to be paying off the way upper management thought it should.)

***The OSS "cloud standards" guys are going to become very annoying, very quickly.*** In the same
vein as the Parse naysayer, every OSS project that tries to hide the underlying cloud platform
differences away from the developer is going to be using this as the perfect reason/example for
why you should work against their "cloud-standard API" and not trust the actual cloud provider
itself. It's the Java "Write Once Run Anywhere" argument all over again, and frankly, I think
it's a tired old retread that really just needs to die. Write Once, Cloud Anywhere is never going
to yield the kind of benefits that its proponents hold up, if you ask me, in the same way that
Write Once, Run Anywhere didn't---it won't be any one large reason that shuts it down, but a whole
host of little pinpricks that ultimately just lead the developer to say, "Ah, screw it" and just
work against their cloud provider of choice directly. Yes, in the event that a cloud provider
does end up shutting down, a rewrite will be necessary---but the JDBC API argued the exact same
thing against the case when you had to change databases mid-stream during development, and in
fifteen years of talking to people about JDBC, not to mention all the JDBC-based projects I was
part of personally, I never found one project where that actually happened.

***My UW students are going to be very sad.*** Each quarter that I've taught mobile development at
UW, I've had the students spend three or so weeks on a final project to show off their skills.
Most of those projects have required some kind of back-end service for data storage and retrieval,
and by far and away the most popular service of choice has been Parse. It'll be interesting to see
what they choose to use once Parse finishes shutting down.

***This is going to ripple through the BaaS market.*** There's a number of BaaS offerings available,
and Parse shutting down means that (a) all those soon-to-be-ex-Parse customers are going to be
looking for a new hosting home, (b) all current and future BaaS customers are going to be looking
a LOT more carefully at the terms of service and, particularly, looking for language around what
they can expect if the service shuts down, and (c) a new surge in "cloud vs private cloud" articles
are about to hit the Internet.

***I wonder how long before a Parse look-alike spins up.*** In many ways, Parse wasn't just about
the API that they offered, but the fairly quick-and-easy ability to stand up a server/service and
store data/user information/etc to it. Given that now the data storage component (MongoDB, for all
practical intents and purposes) and the server API component (the aforementioned Parse Server)
are now entirely in the open-source domain, how long will it take somebody with cloud space to
spare to spin up a "Parse-like" service and offer it as an alternative to those customers who
don't really want (or can't?) host the service themselves?

***I wonder how long it will take Google, Amazon, Microsoft and any other cloud provider to jump
all over this.*** Seriously, if I'm running the Microsoft Azure team, I'm telling somebody in
my organization to start working on a "How to Transition from Parse to Azure Mobile Services"
as of yesterday. Ditto for every other cloud provider on the planet. (And if it takes your team
too long to put said guidance out the door, perhaps you need to rethink your mobile back-end
offerings.)

***I wonder how many Parse employees are going to survive the purge.*** If the Parse service as
we've always known it is shutting down, then there's likely no longer a need for many of the
people who worked at Parse.

***I wonder how Google is going to reassure the Firebase team.*** [Firebase](https://www.firebase.com/)
is, without a doubt, one of the more interesting BaaS providers out there, and Google acquired them
around the same time that Parse was acquired by Facebook. If I'm on the Firebase team, I'm 
probably a little nervous that somebody at Google is thinking the same thing (whatever that was)
as the Facebook folks, and I'm wondering if my job is safe. (And just to be clear, I think shutting
down Firebase would be a Really Bad Idea(tm), for a whole slew of different reasons.)

***I kinda wish I'd gotten around to making an app with Parse before now.*** You know, just to be
able to say, "I was there when Parse was still a thing." Because, you know, hipster.

***I wonder how much money the Parse founders made.*** I imagine this isn't how they imagined
their service coming to an end, but having millions in the bank probably helps offset the "sting"
of having to write that "Dear John Customer" email above.





