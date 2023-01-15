title=A DevRel Activity Ontology
date=2023-01-14
type=post
tags=devrel
status=published
description=A categorization and classification of various developer relations activities.
~~~~~~

**tl;dr**: Newcomers to Developer Relations are often curious as to what, exactly, makes up the range of activities that a Developer Advocate (and related individuals) undertake. In this post, I look to provide an ontology and means by which to examine what artifacts satisfy what needs, and how it isn't just about what artifacts a DevAd produces.

<!--more-->

First of all, if you haven't seen James Ward's ["Seven Artifacts of Developer Advocacy Projects"](https://jamesward.com/2021/09/26/the-seven-artifacts-of-developer-advocacy-projects/), I highly recommend it before continuing onwards here.

Let me begin with [my working definition of Developer Relations](../../devrel/): 
> That part of the company that engages with developers, both internal and external to the company, for the purpose of using that relationship for net gain to both sides. This can take the form of many things, but ultimately, (a) it's aimed at developers, (b) it's intended to facilitate greater positivity to one or both sides, and (c) it centers around developer activities of one form or another (that is, it could be technical, "human skill", or process, but it kinda-sorta has to be around the world of software development).

> ***NOTE:*** Some folks will take issue with the part of my definition that starts it off: "This is that part of the company....", arguing that it's not limited to companies, i.e., open-source communities engage in Developer Relations. That may be true, but what we're seeing is that by the time the OSS community gets to the point of formalizing their relationship to the developers using their products/tools, they've usually formed some kind of foundation and it becomes somebody's job to take that relationship on.

Keep in mind that in James' post, he appears to be thinking that "for any given DevRel *project*, these are seven things that can come out of each." So, for example, if the DevRel team works on a code sample (maybe it's a React example of how to use the company's SDK), this is the list of things that can all be obtained from that single investment of time and energy:

1. Code Samples
2. A Blog Post
3. A Presentation and/or Video
4. A Hands-On Workshop
5. Broad Social Media Reach
6. Product Feedback
7. Enriched Community, Partner, or Customer Relationships

... and he's right, to be sure. Matter of fact, I'm a *huge* proponent of that mindset--if you're going to spend the time to learn a thing, amortize the cost by spreading the benefit of that learning around and into as many things as you can. I've written magazine articles (or series of articles), blog posts, training classes, conference workshops, breakout session conference slides, and more, out of learning just one new thing (like a new framework or a new language or a new library).

## An Activity Ontology

But there's a deeper element here, around how we choose each activity and what we get out of each. As I see it,each of these provides value along three different "axes" of value to a DevRel team (and to the company that sponsors them):

* ***Reach***: How "far" does this artifact go? How many people can see it and/or consume it? Those things done over the Internet tend to have a large reach (particularly if the artifact is someplace where Google can find it and pop it up during search results), whereas those things done in person (such as the hands-on workshop) will have very short reach, since participation requires physical presence. For example, a blog post can echo across the entire world within minutes, and even across time itself--certain blog posts just keep getting rediscovered by new readers. That kind of reach is just not possible with an in-person workshop done at a conference event, even if the workshop has a thousand people in it (which, by the way, is categorically impossible to do--a group that size isn't doing a hands-on workshop, they're watching you lecture). 

* ***Interactivity***: This is the fidelity of communication--how "conversational" is the artifact? This in many cases is in inverse proportion to reach, but not always. The blog post doesn't really allow for great conversation (yes, you can open up comments on the blog, but we all know what happens when you do, and it's not pretty), whereas a workshop really requires a high degree of interactivity with the attendees. The blog post author doesn't learn much from their audience when posting the blog--the workshop facilitator, however, can learn all kinds of things from the attendees via the questions they ask, the problems they run into, the questions they don't ask, and so on.
    There's an important note to the points of Reach and Interactivity, though: Although the blog post and the in-person workshop may seem like they are mutually exclusive--and for some tools they are--they don't always have to be. I can do an "in-person workshop" over something like Zoom that can reach across the world, and if we record it, we get more Reach. I can make sure the blog post has comments enabled and people assigned to react and respond to the comments--or we can take the blog post to Hacker News or Reddit or StackOverflow, and make sure we keep a sharp eye on any discussion that emerges there, and increase our Interactivity. Reddit isn't *as* interactive as an in-person workshop, but that doesn't mean it is entirely a one-way communication, either.

* ***Direction***: One thing James hints at, but doesn't really call out strongly, is the idea that DevRel is a circular exercise: DevRel should be talking to both those developers inside the company as well as those outside of it. This means the usual activities of bringing development discussions to developers that might be customers of the company's product, but also bringing feedback from those developers on the outside back into the company for further discussion and/or examination.

    Let's also put something out here: DevRel can be just as much about mentoring and catering to the developers *inside* the company as it does *outside* of it. Particularly with the efforts around "inner-sourcing", wherein companies (particularly large ones) practice the same processes and practices for open-source projects on internal projects, it can be important for a DevRel team to be just as focused on bringing awareness and engagement to developers internal to the company as external. Matter of fact, I first engaged in this with my DevRel team at Smartsheet, where we took over the internal-facing "Lunch Talks" (also known as "Brown Bags" at other companies, where an internal employee talks about a subject over lunch) and internal training; did the same thing at Rocket Mortgage, where we created the "Tech Speaker Series" (where we had industry names do virtual all-day workshops for our engineers during the pandemic). So not all activities of DevRel are externally-facing, and realistically, *any* activity that is typically done externally-facing can also be done internally-facing.

## A DevRel Activity Catalog

So with these three axes in mind, we can start to categorize some of the activities that a DevRel team does (whether around a particular project or not), with the idea that *if your company is looking to enhance its reach, it's interaction, or change/adjust its direction of engagement, we can choose activities accordingly*.

### The Foundation
First, we have the primary colors of the DevRel spectrum:

#### Code
**Also known as**: Samples/Examples; SDKs; Tests
**Reach**: *High* - Code can go anywhere a browser can be fired up, and since most languages are freely available, anyone who can see the code can usually grab tools to build and run it.
**Interactivity**: *None-to-Low* - Yes, I can file bug reports and raise issues on GitHub, but those are properties of GitHub, not the code. The code itself is pretty much entirely on its own, and the recipient is left to figure out what the code is trying to tell them.
**Direction**: Code can be passed to anyone, internal or external, so long as there aren't legal entanglements around it. 

#### Presentation
**Also known as**: YouTube; Webinars; Conferences (sessions); Meetings (customers or others)
**Reach**: *Depends* If the presentation is "live"/in-person, the reach is constrained to the physical space the audience can fit within. If the presentation is "broadcast" over video-capture platforms (like Zoom), then the reach grows significantly. If the presentation is recorded, that reach now extends beyond the moment in which the presentation is being given, adding longevity to the reach.
**Interactivity**: *Depends* The traditional presentation is one-way (from the speaker to the audience), and is often referred to as "eyes-forward" or "lecture-style". While a presenter can certainly gain some insight and feedback from questions asked during the presentation, most presentations are 75%+ presenter-talking, with some being 90%, 95% or even 100% presenter's voice, leaving only a small amount of room for that feedback. If the presentation is recorded or broadcast, the interactivity drops significantly.
**Direction**: *Bidirectional* It all depends on the audience composition.

#### Writing
**Also known as**: Documentation; Articles; Blog posts
**Reach**: *High* Thanks to the power of Internet protocols (such as RSS) and search engines, writing can be made available through a variety of mechanisms and consumed by literally any of millions of people online at any given moment.
**Interactivity**: *None-to-Low* While it's certainly possible for written pieces to have a "comments section" wherein readers can offer up thoughts and feedback, experience has taught us that unmoderated comments are usually a fast track to noise and spam, decreasing the quality of the feedback to zero quickly.
**Direction**: *Bidirectional* Writing is commonly used to reach both an internal and an external audience.

#### Social
**Also known as**: Twitter/LinkedIN/Facebook; GitHub; StackOverflow; Forums; Conferences (floor); Conferences (sponsorship)
**Reach**: *High* - The various "communication platforms" of the community are neither writing nor presentation but fast becoming its own medium. The longevity is debatable, and the risk can sometimes be high, but the reach can be astounding. Keep in mind, though, this isn't limited to just the traditional social media platforms--GitHub long ago figured out its role in life is as a developer social platform. And those are just the *online* platforms--analog platforms (like conferences) have been around for a long, long time.
**Interactivity**: *High* - These platforms don't accomplish anything unless people are using them, and if they're using them, by definition there's interactivity there. Interactivity is off-the-charts high here.
**Direction**: *Mostly external* While certain social media players (*cough* Facebook) experimented with specific instances of their platform running internally to the company (that is, on the company's intranet), it does not seem to have "taken off" in a widespread manner to replace the more traditional tools like "internal websites-plus-email-plus-Slack/Discord/chat".

It's important to realize that anything can be amplified by announcing their existence over social channels--the ubiquitous "Hey come to my talk in room 5 at the Ritzy Glass Hotel on the 30th of February" blast over every social media platform, that's table stakes. Being on the floor at a conference talking with developers is intrinsically a high-interactivity activity, while *sponsoring* at a conference (as in, name on the banner above the floor and on the website) is lower Interactivity, but higher Reach.

### The Hybrids

Then, we have the secondary colors of the spectrum, made up by blending two of the above together:

#### Code + Writing
**Also known as**: Tutorials; Reference API Documentation; Books; Articles; blog posts
**Reach**: *High*
**Interactivity**: *Low to none*

#### Code + Pesentation
**Also known as**: Workshops; Hands-on-Labs; Code Review; Training
**Reach**: *High*
**Interactivity**: *Low to none*

#### Code + Social
**Also known as**: Gists; Posts
**Reach**: *High*
**Interactivity**: *Low to none*

## Wrapping up

Keep in mind, this isn't an exhaustive list of everything a DevRel team might do. For example, part of what isn't on this list is "Participation in unowned OSS projects"--that is to say, OSS projects that aren't "owned" or founded by the company. (Microsoft currently participating in the development and enhancement of the OpenJDK is one such example.) In these cases, the goal here may be to help the company's DevRel activity by being a good player in a partner's ecosystem, or it may be to support some other corporate goals.

Now, based on the DevRel team's goals, different activities (and their variations) can be selected deliberately to match. If the team needs to broaden developers' awareness of the company and/or its tools (sometimes referred to as "brand marketing"), high-reach activities are called for, without as much concern for interactivity. If the company wants to engage more deeply with the community--perhaps as a stepping stone to creating a formal "close friends group" (such as Microsoft MVP, Google GDE, and other programs), then activities high in social factors should be evaluated. Need to help Sales boost some numbers? Social will help, ideally in combination with high interactivity, so that potential sales targets can be more easily identified and pursued. (Saving salespeople from making cold calls/emails--and your community members from having to receive them--makes everybody happier.)

There's probably deeper ontological analysis lurking in here, and maybe even a full patterns catalog, but releasing earlier and oftener is a bonus, so... have at! :-)
