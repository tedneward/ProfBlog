title=Embrace Change (Not Perfection)
date=2025-1-31
type=post
tags=management, engineering, design
status=draft
description=As software engineers, we understand that we can never get it right the first time in our projects. Yet we also spend an exceedingly long time thinking about how to take data in to treat it as perfect--why do we hold these two wildly different beliefs simultaneously?
~~~~~~

**tl;dr** Ever had one of those situations where you find that some data about your engagement with a company or institution is incorrect, go through the motions to correct it, only to discover it has mysteriously changed back to the original, incorrect, value? The other day I was driving with my wife back from some doctor's appointments and we were talking about some social media friends she has that were complaining about the same. It's the modern take on "tilting at windmills", yet it's so common we just accept it as an everyday part of modern life. It got me thinking about the problem from a software perspective, rather than a human or corporate perspective. And I think we, software developers, are partly to blame for the situation. Incorrect data, it seems, is impossible to correct in any system larger than a single database.

<!--more-->

Consider, as an example, the classic TV trope (such a "King of the Hill" episode) where a beloved character is suddenly thrust into an obviously incorrect situation (Hank's driver's license, on renewal, lists him as being female instead of male), at which point "hijinks ensure" (as the old TV Guide used to say). Unfortunately, for those who've had to try and correct one of those "obvious" errors, large organizations have a deep stubbornness to them, and their databases even more so. That in turn means that even though the situation might correct itself once, it's entirely possible that it repeats itself later for no apparent reason whatsoever. (Hank might convince the local Arlen branch to update his gender on his license, but it's entirely possible that the next time he renews, it's back to listing him as female because the state has him listed as female in one of their systems, thanks to the erroneous value in the Arlen branch.)

Setting aside the comedic value in such situations, from a software engineer's perspective, how is this not a deeply embarrassing indictment of our industry? Think about it--we will spend weeks or months on writing code to try and keep invalid or incorrect data out of the system, yet when it happens, we shrug it off. "That's a data problem, nothing wrong with *my* code," engineers have been wont to say (and hide behind) during post-mortem meetings--assuming, even, that such a meeting takes place after such an error occurs. (Spoiler alert: No such meetings ever take place.) That's like pilots gathering around a TV to watch a re-enactment of a all-hands-lost plane crash and giggling at the "comedy of errors" the cockpit crew is going through, proudly claiming, "That's never happened on *my* plane!".

While we computer scientists might try to hide behind the idea that "Well, it's all human error somehow" (which is what the NTSB almost always cites in a plane crash, by the way), but the fact is we've spent little to no time owning the problem, and I think it's high time we should. 

It's not an easy problem to solve, and Lord knows it's a thankless issue that will never net anyone a Turing Award or Nobel Prize, but when's the last time you applauded when the airplane landed at the airport safely (or, even better, when the maintenance crew comes on board and delays the flight by three hours to replace a sensor in the cockpit)? Practicing these sorts of industrial discipline are never exciting or headline-generating, but when you total up the time and energy lost to chasing these kinds of gremlins, not to mention the potential downstream errors from the incorrect data (perhaps Hank's auto insurance policy goes up in cost, or even cancels altogether, because now the insurance company has him listed as a woman driver--because this is Texas, after all, and...), we really need to address this particular elephant in the room.

To be clear, I don't have a proven solution here; I'm speculating and making suggestions. My hope is that it sparks some kind of discussion or brainstorm, but my realistic assessment is that I'm shouting into the full-throated roar of "Hurricane Leave-It-Alone". We've lived with this problem for fifty years (or more), so we literally have multiple generations of software developers who've literally grown up with this problem (and can't imagine it working any other way).

Before jumping into solutions, let's examine a few salient points to make that color the problem.

### Axiom: Bad Data Enters the System
Humans are a wondrously unstable sort who constantly find ways around fences and gates to do the things they aren't. "Programming today is a race between software engineers striving to build bigger and better idiot-proof programs, and the Universe trying to produce bigger and better idiots. So far, the Universe is winning." (Rick Cook, *The Wizardry Compiled*) If a human has any input into a computer program, then there's a way the human can screw it up. *We cannot eliminate human error short of eliminating the human entirely.* 

That then leads us to realize that *no matter how many layers of validation exist, there will be a path that allows for semantically incorrect data to enter.* Go back to our original example: Hank Hill being listed as "female" is not invalid data, since "female" is an acceptable value for "gender", but it is incorrect. (This raises the important distinction that *not all valid data is correct data*.)

Thus, if errors can always happen, then *we need to stop striving to prevent the impossible, and instead promote the recovery of the incorrect*.

> **Never assume it's right the first time.** There's some interesting parallels here between incorrect data entering a system and incorrect software being built. For different reasons, both exercises have to deal with incorrectness in the system, which is best eliminated by rapid cycles of feedback, each of which is followed by short, sharp iterations to correct what's wrong.

### Axiom: Multiple Databases Exist
In any organization that is larger than a brand-new startup, there's more than one database at work. (In fact, it may even be true that most 2020-era startups have multiple simultaneously-active databases, which only underscores the point even further.) When data denormalization is the norm, even within a single database, we run the risk that a particular datum (such as Hank Hill's gender) is duplicated.

We need these multiple databases for purposes of relativity, because attempts to create a "single-source-of-truth" database has been all but proven incapable of existence by this point in time. Companies that pour millions (if not billions) into "master data management" routinely find the effort extremely taxing, and the MDM model is often wildly oversimplified (a flat table of 250 columns for billions of rows, all of them NULLable, with little to no relational enforcement) *or* wildly overcomplicated (metamodels, meta-metamodels, and meta-meta-metamodels are not unknown). Thus, each "significant component" of the enterprise (be that an organization or a service) makes use of a localized collection of the data it needs to carry out its operations: Shipping wants all the details of shipping labels, addresses, and postal codes about a customer, whereas Marketing's interest in customers is all about the order history (and none at all in where those orders went). Each component in the enterprise wants a database with the sliver of truth that's relative to its operation.

We also need these multiple databases for purposes of scale, because in any non-trivial enterprise, the amount of data being tracked can easily exceed the storage capacity of a single computer system. Today's cloud-hosted systems can automatically partition data out across multiple disks, but even they have limits (operational, physical, and/or financial). Hosting ten smaller databases is vastly simpler and cheaper than trying to store and access all data within a single entity.

The fact of multiple databases, each with a fraction (sometimes large, sometimes small) of the necessary data, means that at any given point in time, *a database only holds a portion of the truth of the world as captured in its system*. Those two qualifiers are critical, by the way--"a portion of the truth" and "as captured in its system" means that a database, by definition, does not contain truth, but only a relative sliver of it, and as soon as it is captured, it is incorrect. In other words, its portion of the truth is only relevant for a period of time, and is only the truth as we knew it at that time.

> **What is truth?** Philosophers have debated this for centuries, but database engineers and DBAs seem to treat any row/column pair as sacrosanct and true until proven false, even if it disagrees with what the outside world thinks. Unfortunately, they've propagated that mindset to everybody using the database, such that now, we assume the database to always be correct until proven otherwise, even though we *know* that humans operate databases, and *humans make mistakes.* Some systems are so chock-full of errors that their operators have gotten to the point of assuming the database is incorrect by default, but that's more the exception than the rule.

### Axiom: Databases Must Constantly Sync with Each Other
Knowing that we must have multiple databases, and that each one is only a sliver of the truth at a given point of time, we must embrace the fact that for almost any component in the enterprise, a given database is not the single source of all data needed--we often must reference other databases for information they need in order to proceed. Consider, for example, the canonical e-commerce site. In order to ship an order, the Shipping system must reference the Orders system to get the order to process (to find what items to pull from inventory bins and the like), and also the Customer system (to find the Customer's shipping address).

If you're the architect of the Shipping system, you want to keep this data handy--nothing kills your performance like trying to make multiple round trips to remote systems--but you also know that the "remote" data can change without your knowledge. So you often set up a batch approach where you'll take changes to your local database, and forward them "in batch" (that is, gather up a whole slew of changes into one bundle) to the databases that might be interested in your local changes. *We sync our local data to other data systems in order to get their updates to what they know to be the truth.* (Or think they know, anyway.)

This then, becomes the heart of the problem: Somewhere along the way, someone entered Hank's gender incorrectly, and the bundled batch pushed it downstream, because it was a change. Despite the fact that this new data might not have been verified, validated, or confirmed, it was a change, and therefore it needed to be batched and sent. And when the downstream system got the change, it faithfully updated its local copy of that data, which in turn may trigger further downstream changes.

And suddenly, Hank finds himself seeing tampon ads on his phone.

### Solution Ruminations
Given, then, that:

* *bad data enters the system*
* *multiple databases continue to exist* 
* *databases continuously update data back and forth between them*

... we find that *errors will continously cycle and propagate until eradicated in every database*.

Given that we cannot prevent the error, we have to then embrace the idea of *identifying and correcting the error*. A corollary to that is to do so *across all the systems it has entered*, lest the error re-propagate back to the system in which it was just corrected.

We can do that in a variety of ways:

* store everything in a single database (the "Master Database" Fallacy).

* create a mechanism where a particular update can "override" any further updates to that datum (in other words, formalizing the "System of Record" approach). This starts to get into the business of "weighing" different facts against one another, where one fact may be given as "more true" (or perhaps, better stated, "more likely to be true") than others. Hank's assertion that he is male should be given more weight than an update coming from a data-entry clerk three departments over, particularly if Hank has a birth certificate handy. (Of course, if this is the system storing birth certificates, maybe we weight things to favor the original input of the nurse and parents, and thus do we start to run into the Gordian Knot of weighted facts--how we decide those weights is always subject to some deep and divisive debate.)

* track and make visible to users where and how database updates occur (an "audit log" approach).


