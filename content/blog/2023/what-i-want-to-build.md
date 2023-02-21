title=What I Want to Build
date=2023-01-02
type=post
tags=predictions
status=published
description=If I had a million dollars....
~~~~~~

**tl;dr** What would you do if you could do anything? Or, if you're a developer-manager-type, what would you build? Given that we're starting 2023, I thought it a reasonable time to take a stab at putting it out there into the universe.

<!--more-->

Part of the motivation here comes from the interview cycles I've been through; I've been asked the "What do you *really* want to do?" question many times, and it's always tricky to answer in the moment. Being the developer-manager type, I thought it might be useful to answer it more easily by casting the question in the light of *what would I really want to build*?

For the record, if you're reading this because you're a recruiter (and either you found this on your own or I sent you here), this isn't necessarily what I *expect* to build in my next job, but if any of these sound interesting, I'd love to put the team together to make it happen. But if your needs are different, let's still talk--these'll keep for a while, or I'll tackle them as a side project. *shrug*

# Big Projects

Let's start with the epic-level ideas that are probably way too big for any one person to tackle.

One common theme you'll find to a lot of these epics is the idea of elevating the abstraction level: Martin Odersky (creator of Scala) once commented that one of the key goals of Scala was to get programmers to worry less about the *physical* details of programming (what's a field, what's a method, what's a reference, etc) and focus more on the *concepts* they were trying to express. That idea has stuck with me ever since.

## A platform-oriented language

We've had object-oriented languages for decades now, and the functional/functional-object hybrids for at least a decade, and neither really "moved the needle" on programming productivity or elevating the levels of abstraction. So what I'd like to spend some time doing is building a language that knows how to build code for a *platform*; that is to say, a language that has some interesting higher-level abstractions than your typical object language:

* ***Service-oriented primitives.*** [Ballerina](https://ballerina.io) and [Dark](https://darklang.com/) each have some interesting exemplars here, allowing us to build first-class service endpoints. Theoretically any wire protocol could or should be useful here, but one of the key things I'd like this language to support is the [Restful Object](https://www.restfulobjects.org/spec/1.0/about.html) or the [Hypertext Application Language](https://stateless.group/hal_specification.html) specifications, making it self-descriptive to navigate through the entities online.

* ***Persistence.*** Honestly, there's so many different tools to persist an object to a data store, and most of the time any thoughts of optimizing the storage or retrieval is just wasted mental energy. Let's just let the compiler generate the details for loading and storing entities.

* ***Design-by-Contract primitives.*** Some languages have explored the idea of language-level primitives for invariant, pre- and post-condition enforcement (C++20 is incorporating it, even), and I see no reason why it can't elevate into a first-class contract.

* ***State-machine implementation.*** So much of our implementation work is managing state transitions within an object or family of objects, so let's elevate that to a language level and let the compiler sort out the details.

* ***Docker container artifact output.*** Forget the traditional binaries we've been churning out--the common output format is now Docker. Just have the compiler spit that out and be done with it.

* ***Observability and manageability built-in.*** Just like virtual machine runtimes put hooks in to allow for easier debugging, profiling, and management, put the necessary hooks in to the generated service code to allow syslogd or Grafana or whatever the current standard-of-choice is to observe these things.

The goal here would be to build a language (on top of one of the existing enterprise ecosystems--likely the JVM or the CLR/.NET ecosystem, though there's really no reason it couldn't be NodeJS or Python or Ruby either)--that allows us to go from "single source file" to "working full-stack service" with a single compile/assemble step. Right now, ***building services is too hard***, requiring too many different pieces assembled using too many different configuration files and languages, and while the flexibility is great across the entire industry, for any given company, there's likely a number of decisions ("corporate standards") that could reduce that flexibility significantly enough to allow for a language (which can always allow for exceptions if the language is designed to do so) to be able to generate most of that out of source.

And man, imagine how quickly you could innovate if you had this.... Build a fully ready-to-deploy service from a single source file?

## An application-oriented language

Remember the "good old days" of Visual Basic and Visual FoxPro and Paradox and a bunch of those other 4GLs, when a single developer could build a working application, database through UI, all by themselves? We've lost that somewhere along the way, and as a result, what we call the "citizen developer" is now forced to learn Python and NoSQLs and HTML and CSS and JS and and and....

Bleah. Building a user-facing app today takes *way* too much work, because the developer building an app today has about a thousand different physical concerns to deal with before ever dealing with the logic and concept of the app itself. 

There's ways to build an app on modern infrastructure and standards that could simplify all of this. The "low-code" movement is trying to capture this, but they're doing it with drag-and-drop application generators that don't show you code (or very small parts of it) or that generate vast amounts of code. Give us a nice high-level language, perhaps drawing signficant inspiration from Smalltalk and Io, that work off of a simple mental model, provide significant high-level out-of-the-box "primitives" (like, forget "string"--how about "Name", "SSN", "Date", "Age", and other really common data types that we always somehow want to reduce down to "string"s or "int"s?) complete with built-in validation and rules, and let them build applications that know how to present and store themselves? Make persistence an implementation detail (but cloud-friendly so it settles naturally on top of the existing clouds), make user interface a core concern that intermingles with the low-code logic (which gets replicated across both client and server tiers), and you have a very interesting language/platform for people to build some "personal applications" that would never, ever, EVER need to scale to Google levels.

Think Naked Objects meets Self meets a very reduced set of Python, over the Web and mobile devices, persisting as an implementation detail tucked away from the citizen developer (but knows how to export and/or provide an HTTP-based API for high-code access). The foundations are there, we just need to put the parts together.

## An open RPG fantasy engine/app

I was a huge fan of the AD&D computer video games of the 90s: Pool of Radiance, Secret of the Silver Blades, and so on. It probably was helped by the fact that I owned a copy of the first Wizardry and Bards Tale that were the AD&D video games' spiritual predecessors (which was only fair, since they both drew from the tabletop RPG as inspiration), but I hated the fact that once you'd played the game, you were essentially "done" until a new game came out.

![Pool of Radiance ad graphic](https://cdn.akamai.steamstatic.com/steam/apps/1882370/ss_12950922a50a1f30c6d4c961817eb0ee9377cebe.1920x1080.jpg?t=1648566548)

Meanwhile, over the years since, games like Battle of Wesnoth changed the story--a game engine could provide the mechanics and display and so on, while scenarios could be built against an open specification, allowing for literally an infinite number of possible plays. Plus, if we're going to go "open", let's open it up the entire way, to allow for expansion spells, skills, classes, anything we can imagine.

Mechanically, the classic fantasy RPG is not all that complicated once you pull the rules out of the equation, and the rules themselves operate by some core mechanics that (I think) can be extracted into an inference-like engine that can recognize how to deal with various combination scenarios. I'm thinking that the D&D 3.5e ruleset is the best way to go here--it's not the latest (so hopefully avoiding some of the copyright issues that might arise), and the principal critique was all the special-case scenarios in the rules that would be perfect to be captured in a game setting.

Essentially, I'm thinking a JavaScript engine hosted inside the game, with the user interface interacting with the engine, JavaScript because it's a popular language understood by many and therefore representing a lower barrier-to-entry for those gamer-types who want to populate the ecosystem. "Modules" (in the spirit of what we used to call the pre-canned adventures TSR used to sell) would be bundles of JavaScript files written by third parties, along with images or audio files for new monsters or scenes.

The various interactive-fiction engines also hold some level of intrigue here, as this goal is in large part the same as theirs, but they focus on the interactive storytelling, not the mechanics of hack, slash, loot, level-up, repeat. Still, if I do go down the path of thinking about a custom language for this thing, the TADS, Inform7, and Dialog languages all have their appeal as models for how to build out the non-data parts of the module.

The UI would be very simplistic: probably console for the v0.1, then v1 moving to the forward-facing view popularized by Wizardry and Bard's Tale, then maybe v2 shifting combats to the isomophic grid view, but probably not much further than that. The goal here would be to focus on the extensibility of the game, not trying to compete with Baldur's Gate or later.

Long-term, this could even morph into some kind of multi-player thing, but frankly, if I wanted to play D&D with friends, I would grab the books and head down the hallway in the college dorm--today, I'd just send them a Roll20 link. The video games were for when I just wanted to hack-and-slash my way through the dungeon as a loner late at night instead of doing my homework.

## A database built from GC principles

With the rise of NoSQLs--by which I mean non-relational databases--as a storage concept, and the prevalence of needs to track data's usage and ownership, there's a small part of me that wonders at the power of bringing some of the mark-sweep semantics of automatic memory management into the database tier. In particular, I think it would be powerful if data could know its origins--where it came from, who owned it, who touched it last, and so on--in a way that most databases currently lack. It wouldn't likely be the most high-performance system in the world, but by this point we've seen that performance is a relative term; we can afford to spend some additional cycles and some additional bytes on overhead if it means having necessary business functionality baked in (like being able to make audit tracking so very much easier).

Some of this is derived from the "worlds" concept defined in [Alessandro Warth's thesis on OMeta](https://web.cs.ucla.edu/~todd/theses/warth_dissertation.pdf): "We can think of a program as an agency set up to accomplish or reach one or more goals. For some goals--such as adding up numbers--there is a simple straight road in most programming languages. Other goals--such as finding the square root of a number--will require some search, but can still be homed in on very effectively. For more complex goals--such as certain kinds of parsing, problem solving, and editing in a user interface--it may not be possible for the program to simply home in on the desired result; instead, it may need to experiment with multiple alternatives, sometimes making mistakes that require retraction in order to make fresh starts.

"For some goals of this latter kind, it might be a good idea to use backtracking, as in Prolog (it would also be a good idea to automatically undo asserts that are backtracked over, which does not happen in Prolog). For problem solving on a larger scale, it might be a better ploy to use "possible worlds", perhaps even parallel possible worlds that can report progress to a coordination agent that is trying to make choices about best paths. If the problem terrain is really rough and tricky--a veritable "elephant to blind men"--then we might want to use the metaphor of dispatching "scouts" (or "scientists") with walkie-talkies who can simultaneously explore different parts and intercommunicate to gradually build up a better model of the obstacles and the possible routes around them.

"Unfortunately, the nature of state in traditional programming languages makes this "experimental" style of programming impractical. For example, because the state of a program is scattered around the computer’s memory in several kinds of data structures (e.g., arrays, objects, and activation records), it is both messy and difficult to undo the side effects of an action that has been performed by the program. Also, because there is only one "program state", a program cannot explore multiple alternatives concurrently.

"My approach to solving this problem was to introduce a new language construct that reifies the notion of program state as a first-class object. I call this construct a *world*. All computation takes place inside a world, which captures all of the side effects--changes to global, local, and instance variables, arrays, etc.--that happen inside it. Worlds provide multiple views on the state of a program, and mechanisms for interacting among these views. They subsume the mechanisms of backtracking, tentative evaluation, possible worlds, undo, and many similar control and state regimes.

"We shall see that while it is often convenient for programmers to use worlds directly, there are also cases where worlds are better suited as a kind of "semantic building block" for higher-level language constructs."

It got me to thinking--if worlds need to track changes and be able to backtrack, it means that state is using state to track changes to its state. Generally we just think of databases as a repository of standalone facts with little to no additional supporting metadata. But what if we start thinking about data in a database as a derivative of this "world" concept, where state knows its part of a larger state, including information about when/where/who/how it is used or from?

If, for example, a data element is deleted, we could track all of the places this data touches and/or is incorporated, and that in turn could/should trigger discussions about what to happen to that state--perhaps even automatically, without requiring programmer interaction. One could argue that this is simply making use of a graph database, but I think there's a notable distinction between the "shape" of the *raw* data (as presented to the user of the database), and the internal implementation and tracking information *metadata* that could be used to drive these sorts of things. Much as an object in memory in Java or C# has additional information (metadata) about it that isn't visible to the Java/C# developer, yet is highly necessary to enable things like synchronization, automatic memory management, and more (type information, for example, is necessary when calculating how much space to allocate for a new object).

## A persistent programming language

MUMPS has fascinated me since I first discovered it (recently), in that global variable declarations in MUMPS are, in fact, allocated space on disk.

To quote Keanu: *Whoa.*

That's some interesting thought right there: I allocate a variable, and it's immediately (and silently) stored to disk. Updates write to disk. Accesses read from the disk (but could also be cached, since the compiler is the one entirely in charge and has knowledge of when the variable is written).

And if the state of the program is entirely managed in terms of these persistent variables, *the entire state of the program is automatically preserved in the event of a crash.*

What if we took a traditional OO language and added this concept of "persistent types" to go along with the "transient types" we already use? (It would probably be in the form of a lexical modifier--`string name` being a traditional transient variable, while `string^ name` is a persistent one.) You probably wouldn't use it for all of your variables, but for your "domain" and/or "transactional" data? I think that would solve a lot of interesting problems right out the door.

There'd be a few things that would need to be sorted out (identity semantics being one!), but it's definitely worth playing around with further, particularly for those programs which really need to be able to pick up again after a crash and don't have heavy persistence needs on that tier (because they store their data long-term in a database on a server, for example).

## A service choreography engine

Lots of people built microservices, and then found that they needed to build services that choreographed process flow through those services. The danger here, of course, is that "choreography" is yet another word for "chatty distributed system", and a major cause for performance nightmares in your microservice fabric.

Part of the problem here is that applications built out of microservices want to retain control over the steps of the choreography, yet the thought of baking them into a traditional programming language that then in turn must be tested (with mocks and fakes and such) just makes the developers groan.

What if we could abstract away the details, and hoist a "script" into the service fabric to do the choreography? Testing the script would be a helluvalot easier when the service mechanics are already all tested and deployed, and ideally the script would run out in the same tier as the services--that is, in the cloud.

This speaks to the idea of an "orchestration" or "choreographer" service, accepting scripts as input, making the service calls, capturing the responses, and evaluating those results to decide where to go next with calls (if any). It feels somewhat like a "workflow service", a la Camunda, but not something that's end-user-facing; more a developer-facing service that has dynamic overtones allowing it to be more flexible than a traditional compiled service.

(Frankly, this one feels a little smaller than the others, I think.)

# Smaller Projects

There's some smaller projects, some of which are really no bigger than an application demo, but interesting to me nevertheless, that I have on my TODO list.

## Hearts Scorer

My family plays the card game Hearts a lot--my folks taught it to me, my wife knew how to play already when we met, and I taught it to my kids--and I'm always the one who handles the scoring. But math is hard--so let's build an app! Sell it on the AppStore for $0.99, just because.

## Spades Scorer

Same idea, different card game. Likewise, sell it.

## Tic-Tac-Toe

I've been working on a libgdx version of TicTacToe (for mobile devices, but easily for desktop or Web too), and a Ballerina implementation of a TicTacToe REST server. Time to marry the two up, and include some AI so people who want to play single-player can do so.

## "GSpaces"

A while back, academia posited this concept of "distributed spaces" or "tuple spaces" (as part of the Linda programming language), and with the rise of non-HTTP-based distribution tools (gRPC, Orleans, etc), I'm curious to resurrect the idea and see how far it flies. You wouldn't replace your database with this, but for transitory state and/or state that wants/needs to live in memory across clusters, this could be an interesting tool.

# And there's more....

... but most of the other ideas are just one- or two-sentence ideas floating around in my head.

Somebody got a million bucks they want to throw my way so I can explore any of these? Could be fun...
