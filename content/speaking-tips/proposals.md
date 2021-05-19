title=Speaking Tips: How to Write Good Proposals
date=2016-08-07
type=page
tags=speaking tips
status=published
description=A list of links to pages about doing public technical presentations.
~~~~~~

*tl;dr* One of the first things a speaker needs to do is create a good proposal for a talk at a conference.

<!--more-->

Mind you, none of these are ever guaranteed to make you a hot topic, or the next TED presenter. That, as it turns out, is the result of these tips, hard work, and a lot of experience (usually in the form of thousands of presentations). And, of course, every presenter will have their own stories, their own tools, and their own particular approach to accomplishing things. As they say on the Internet, Your Mileage May Vary.

Without further ado....

## Beginnings
Most speaking experiences start with first getting accepted to speak at a conference, user group or some other gathering, and that isn't going to happen until a proposal has been written and submitted to the body in question.

(Yes, sometimes the conference will specifically ask someone to do a presentation for them---it's happened to me more than once. However, that's only happened recently, and that's only because I have an existing body of work that they seek to draw from. Again, certainly exceptions are possible, but for the most part, you're going to have to work your way up to get to that "invited to speak" status.)

## The process
Generally, a conference puts out a "call for papers" or a "call for proposals". Unless the conference is an academic conference, however, the "call for papers" isn't really a call for papers; that's a term that's a holdover from the academic world, where one would write a paper, submit the paper to the conference, and offer up a short overview of the paper's contents to the audience and take questions on it as part of the presentation. That's not really how the modern software development conference or user group works anymore. (Whether that's a good thing or a bad thing is, of course, open for
debate.)

Instead, the conference is expecting would-be speakers to submit short abstracts---usually somewhere in the 100 - 500 words range in length---describing the presentation that is being offered. Note that different conferences will have different requirements around the abstract, and that takes us to our first tip.

Let's take as a practical example the most recent (now closed) call for proposals for [Seattle Code Camp](https://seattle.codecamp.us/), which utilized a centralized proposal tool called [Papercall.io](https://www.papercall.io/seattle-codecamp-2016). (Again, the "paper" here is the misnomer term I mentioned earlier; it really should be "talkproposalcall.io", but that clearly doesn't roll off the tonue nearly as easily. It sort of trips and stumbles and *bleah* twists up the tongue.)

### Read the directions
It is absolutely amazing to me how many times a would-be speaker submits a talk abstract that violates one or more of the conference's stated requirements. It would seem to be pretty straightforward, and yet, sometimes....

First of all, ***note the opening and (most importantly) the closing date***. While it's often not impossible to submit talks after the closing date (depending on the conference, the number of submissions they have or haven't received, and/or what your excuse is for why the submissions are late), it's never guaranteed. Besides, do you really want to be "That Guy" or "That Girl" that is always trying to turn in your homework late?

(Yes, conference organizers do talk to one another, and yes, they do share stories about speakers.)

Next, examine the call for any hints or ideas about what kinds of topics are (and are not!) accepted. Trying to put talks on NodeJS in at a Ruby conference isn't always a guaranteed rejection, but unless your NodeJS talk somehow maps to the areas of interest that conference (and its attendees) have, it's not likely to make it past the filter.

For Seattle Code Camp, the body of the CFP reads as follows:

> We are interested in topics that touch on all aspects of software, database, dev-ops, web and mobile development. Hardware hacking topics are popular with our attendees so talks about IOT, robotics, 3d printers and Arduino are sure to be a big hit. We’ve also seen plenty of soft skills talks at past camps.

OK, without going any deeper than this, we can see already a set of topics:

* Database
* Dev-Ops
* Web
* Mobile
* Hardware hacking (IOT, robotics, 3-d printers, Arduino)
* Soft skills

This is a pretty wide range of topics, and more importantly, note how they haven't set up any sort of restriction around the kinds of tools, languages, or vendors. This is a very broad range of possible materials to choose from; this is also a community Code Camp, which tend to reflect the community's involvement in various tools around town. Probably going to be fair bit of .NET and Java, a little Ruby, a little NodeJS, and some Android/iOS.

By comparison, let's look at another conference call, this time for [RubyConfIndia 2017](https://www.papercall.io/rci17). (Why this one? I wanted to pick something that was some distance away from a Seattle Code Camp, and this one happened to be in the list of OpenCFPs when I wrote this.) Here, their presentation requirements are:

> a range of topics, both occupational (i.e., about Ruby, Rails, code-heavy, etc.) and organizational (i.e., about team dynamics, communication, etc.), and all applicable hybrids. We want talks aimed at developers coming from a wide range of experience levels, from beginner-friendly how-tos to cautionary tales to deep dives for experienced devs. We want talks about all the different parts of the Ruby/Rails ecosystem, including related technologies (data stores, front-end frameworks) and related teams (QA, product management, clients).

A similar set of topics, but under the larger umbrella of Ruby and Rails. Note the "We want talks aimed at developers", not just because they are looking to target all levels (which implies that they're looking for some entry-level developer talks), but that talks aimed at dev managers and/or CEOs/CTOs are probably not going to be welcome here.

***But*** notice how even though these are two wildly different events, there's significant overlap? It turns out that most events are all looking for much the same kinds of things, only "slanted" to accomodate the community that event seeks to attract. One could almost replace "Ruby" with "Java" and "Rails" with "JavaEE" (or "Spring" or "Play" or ...), and have a paragraph easily ready for any Java-based conference environment.

Most conferences want the same stuff.

### Writing a good proposal
Writing a good proposal is a relatively simple premise: You are describing what you are going to talk about. It really shouldn't be all that hard, right?

Except... well... Here's a little secret that most speakers don't want anybody else to know: Much of the time, we haven't written the talk when we write the proposal. Thus, in some cases, we're trying to describe what the talk is going to say when we don't really know yet what the talk is going to say.

That would seem like a drawback. Except it's not, really.

Fundamentally, the point of the abstract is not to go into gory detail about the talk. In many cases, the more detail provided in the abstract, the less the attendee is going to get out of it. (And, spoiler alert, most attendees don't read abstracts, anyway, they go for the title; more on that in a bit.)

Thus, writing a good abstract doesn't require the talk to be written yet. You should have a good idea of what you want to say, granted, so having at least some kind of outline or rough "topic sentence" for the talk is always a good idea.

(Sidebar: At DevelopMentor, where I first learned how to give great technical presentations, we had a concept called the "two sentence story": every class or class module had to be something you could distill down into two sentences. If you couldn't do that, then it was a pretty clear flag that you didn't really know what it was about. This is a good place to start.)

For me, most proposals have three components to them:

#### Title
Don't go for catchy, don't go for cute, and don't go for something that is culturally-bound. Years ago, I suggested the title of "Functional Eye for the Object Guy" to one of my peers, and they ran with it. It wasn't until I was at a conference (where that peer was using that title for a talk given there) and I overheard some attendees remarking, "That is a weird title" that I realized we were at a show in Europe, and "Queer Eye for the Straight Guy" simply hadn't been "a thing" over there. All of the cultural reference weight that was supposed to go along with the title---the idea that here was a bunch of experts familiar with a number of topics (fashion, cooking, wine, etc) that "mainstream" people (straight guys) wouldn't understand but that these experts (the experts were predominantly gay, although some were actually  straight) could act as guides.... All of that context was lost the moment the talk moved outside of US borders.

Boring titles seem so boring. But, in many cases, they help convey to the audience what the talk is about far better than catchy titles do.

Personally, I have been using the same title structure for all of my talks (with the exception of my keynotes) for the last ten years, and frankly, while it's earned me some mockery from my peers, I'm quite willing to accept the mockery. "The Busy Developer's Guide to ..." is now a core part of my speaking brand, and it's a better-than-even chance that if you see that title somewhere on the conference schedule, it's me giving the talk.

And that's what branding is for, right?

More to the point, the title structure is pretty self-evident, and pretty intuitive:

* "Busy": What developer isn't busy? More to the point, the idea here is that attendees don't have a ton of time, and this talk recognizes that, and is going to distill the idea down so that you're not wasting your time.
* "Developer's": This is a talk for developers. (I also have a few "Architect's" and "Manager's" talks.) If this talk is for a specific type of developer, then I will throw that in as an adjective here. So a talk on MongoDB that's geared for people who run on the JVM will be "Java Developers" or "JVM Developers", as opposed to those running on the CLR.
* "Guide": It's not comprehensive, it's a guide. (Again, I have a few talks labeled "Intro", but frankly most attendees hate going to "introductory" or "basics" talks, so I tend to avoid those terms.)
* "to {topic}": The most self-explanatory part of the whole thing: I'm going to talk about {topic}.

You don't need to use this same kind of structure, but the talk titles should be straightforward, to the point, and describe in as few words as possible what this talk is going to cover. In my case, I also wanted to provide a hint as to the audience that I was expecting, to allow potential attendees to opt-out if they weren't my target audience.

#### Pain
Let's be clear: a talk has to have a purpose. There needs to be some kind of problem that the developer is having that your talk can solve. Otherwise, why would they come to your talk?

This first part of the abstract is what I call the "pain". Sometimes that pain is immediate and obvious: how to debug microservices running the Heroku cloud, how to performance-monitor databases running in SQL Server, how to determine if your system will scale to a hundred-thousand requests a day, whatever. The point is, some kind of problem is plaguing the developer.

Or the problem is more abstract: the developer doesn't know about some particular tool or language, and they may or may not realize that they don't know it. For a lot of developers, things like agile development processes fit into this category a decade ago, and DevOps tools and practices similarly up until a few years ago. Today, it's probably things like machine learning, data visualizations and/or artificial intelligence.

Point is, the developer has a problem, and your talk is going to talk about that problem. Make the pain apparent. Make it clear. Be obvious about it.

For example, in the abstract for my "Busy Developer's Guide to Go" (about the programming language, not the board game), I write:

> In the mid-2010's, Google announced a new programming language, Go, and the collective reaction of most of the programming world was a giant yawn. Yet another language, and even though it came from some serious industry veterans--Brian Kernighan and Rob Pike--it didn't really seem to be bringing all that much that was new or interesting to the table. By 2015, that tune had changed. Go is now one of the "up-and-comers" in the programming language world, and it owes its success to a variety of factors.

The pain here is pretty obvious: Go has some interesting things to it, as evidenced by the fact that there's a lot of people who are talking about it and using it and *aren't you concerned if you're not one of them*? What do they know? What's so interesting there that suddenly everybody wants some?

Pain.

And the point of the pain is simple: If an attendee, reading this abstract, doesn't feel that pain (perhaps because they've already looked into Go, or because they are simply somebody who doesn't care about what other programming languages there are in the world until their boss tells them to go learn it), then they can opt-out of the talk quickly and move on to the next abstract in the list.

To the organizers, it serves the same purpose.

But a life of only pain is only of interest to existentialist philosophers, nihilists, and a certain percentage of teenagers with too much time and money on their hands. Pain is nothing without....

#### Promise
Dude, you have to make the pain go away. That's the promise of your talk, that if the attendee who has the pain that your proposal is describing comes to your talk, you can make the pain go away. That's the reward they get in return for sacrificing an hour (or half-hour, or 90 minutes, or whatever) of their lives to sit in an uncomfortable chair and listen to you.

Again, from the same Go presentation abstract:

> In this presentation, we're going to take a hard look at the language, go over what it has (and what it lacks!), what makes it interesting, and get comfortable with some of the syntax basics, as a "first steps" towards building non-trivial Go programs in the future. It's probably not the last programming language you'll ever learn, but it is definitely on of the few that you should learn.

In other words, this talk won't make you a Go guru, but it will get you on the road to understanding what makes Go tick. You'll have enough syntax and semantics under your belt to decide what to do next.

(Yeah, it's a basics talk, an introduction, without using the words "intro" or "basics" in the title.)

#### Abstract
By the way, the talk proposal is called an "abstract" for a reason: It is not intended to be a point-by-point, blow-by-blow outline of your talk. It's intended to be high-level and succinct. Again, look at the Go presentation abstract. I don't mention exactly what features of Go we're going to cover, and I don't say exactly what the attendee will have coing out of it, except in pretty high-level terms.

The reason for this is simple:

* The talk is not yet written. That's the obvious reason, but there's a few other reasons less obvious.
* Your "story arc" through the subject matter will probably change once or twice. As you give the talk and/or as you get to know the material better, you'll start to realize that topic "F" is just not all that important, while topic "G" is something that really should be brought to their attention. 
* Your audience is different than what you thought they'd be when you wrote the abstract. Yeah, the organizers assured you that this would be all senior-level developers, but suddenly you get to the event, and lo and behold, it's mostly made up of total newbie programmers. Time to make some adjustments!
* Anything you say in the abstract, your audience will hold you to, even if you're trying to do right by them. If your abstract specifically mentions "F", then you're obligated to talk about it. If you don't mention "F" or "G" by name, then you have a degree of control over the talk all the way up until you give it.

Again, in the Go presentation abstract, I happen to think that Goroutines are a significant part of the reason why Go is an interesting part of the language. But if I find out that the audience is not really all that familiar with concurrent programming concepts, trying to show them goroutines is probably going to create more confusion than clarity. So I can quickly elide those slides out of the talk if I need or want to, without violating the contract that the abstract is setting up between myself and the audience.

Because at the end of the day, if your proposal is accepted, that same abstract is what they're going to publish on the website and in the conference program, and that becomes your contract with the audience: in exchange for your time, attendee, I will make this pain go away.

Writing a good abstract/proposal is hard. Which brings me to my next tip.

### Save your proposals
It is a common myth that conferences want all-new content. Well, it's not so much a myth as a "conferences would love to convince you that this is what they expect" kind of thing.

When I was first getting started in the conference-speaking game, there was one event vendor in particular that insisted that any talk that had already been given at a difference conference was not going to be accepted at their shows. I didn't believe them, and submitted a few talks that I'd done elsewhere.

Sure enough, because I hadn't read the directions, they sent back rejection notices. I never submitted to that conference again.

And that event vendor doesn't exist anymore, either.

We can argue about the reasons for said vendor's demise, but by this point, no event vendor I have worked with in the last decade has had that requirement. Frankly, it's just too hard for them to police, and what's more, if the talk is going to be any good, it needs to be given a few times so you can work the kinks out of it. Plus, as with most talks, once you've given it, you figure out a few ways you'd like to change it up, so like a good standup comedian's routine, it's never exactly the same bits from one night to the next.

(Spoiler alert, in case you didn't know this: Comedians use the same bits night after night, show after show, because they work, and because very few people ever see the same show multiple times.)

The same is true of proposals: once you've writtne it, don't just throw it away. Submit it to a couple of other places. Just because a show doesn't accept it doesn't mean it's bad---it means that they simply didn't want it. And they could not want it for a variety of different reasons:

* Somebody else they've already accepted is doing a talk on that, and they want to let that speaker do that topic.
* The topic is one they over-saturated on last year, and attendees don't want to see it anymore.
* The topic is one they feel doesn't meet their attendee profile.
* The topic is somehow controversial to their community.
* They had somebody speak on that topic, and it didn't go well, and they don't want to bring up bad memories.
* They have a similar talk from a speaker they know better than they know you, and (like most humans) they prefer the devil known over the devil unknown.

That last reason may stick in your "that's not fair!" filter for a second, but regardless, that's how most humans operate. (You know how you have your favorite restaurants because they serve the food the way you like it, in an atmosphere you like with servers that treat you well? You're basically playing favorites here, too.)

Thus, your proposal may be rejected for reasons that have nothing to do with it in itself. For that reason...

### Submit 3X proposals
If you want to do one talk, submit 3 proposals; if you want to do two talks, submit 6, and so on.

This can get a little out of hand---if you want to do six talks, submitting eighteen proposals could make it seem like you're trying to flood the system with talks and "game the system", so to speak. Organizers have been known to toss the whole lot of your proposals on the grounds that you're a douchebag.

But the point here is clear: the more opportunities you give the organizers to find something that works within their matrix of topics, the easier it is for them to say "Yes".

This does mean, however, that you may end up doing *more* than what you'd hoped; submitting three proposals could means you get three talks.

In which case, pop a bottle of champagne, party it up, because you hit a magic vein of "WOW" to the organizers, and you're somehow spot-on for what they want their attendees to see. Step up to the plate, hit three solid presentations, and you will be thrust into that "known speaker" category very quickly.

Which brings up another point.

### Get to know the organizers
Frankly, this is where you want to be as a speaker; when the organizers know you as a speaker, and presumably like your material and speaking ability, then the proposal becomes less about convincing the organizers and more about securing that contract between you and the audience.

And remember how I mentioned earlier that events will sometimes issue explicit invitations to speakers? Or that sometimes you can slide in after the submission close date? Neither of these things happens until you get to know the organizers.

Which is why it's incredibly important, when you get to the event, to find them, thank them for the opportunity to speak, ask them any last-minute questions you might have about the audience, and so on. Get to know them, find out what they are interested in as topics for the next show, allow them to get to know you and the wild hare-brained ideas that you might have for topics that they might actually be thinking about but hadn't yet found anybody to do as an experiment....

Yeah, you get the idea.

### Wrapping up
A good proposal/abstract is not going to guarnatee a great presentation. But it's the first step, since it in many respects will be your guiding statement and contract to the audience. The pain mentioned in the abstract has to be pain that attendees are feeling; the promise has to be strong enough that they will believe that you can take the pain away. (Or at least as much of it as an hours' talk can take away, anyway.)

Once the talk is accepted, however.... Well, we'll save that for next time.
