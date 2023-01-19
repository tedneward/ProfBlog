title=Developer Relations Activities
date=2023-01-18
type=page
tags=devrel, patterns
status=published
description=A pattern language of all the activities a DevRel team can do.
~~~~~~

This, like so many other pattern languages before it, looks to catalog, categorize, and through that effort, provide some clarity and/or guidance on the various activities practiced by the various members of a Developer Relations team. As with all pattern languages, it's not intended to be a tutorial, but more of a reference, and as such could easily see additional edits and clarifications as time progresses.

*The first part of this discusses some meta-elements about this particular pattern language; if you want to jump straight to "the good stuff", scroll down to the section headed "[Activity Catalog](#catalog)".*

## Pattern Form
The most basic pattern form I prefer is the simplistic one that states that "a pattern is a solution to a problem within a certain context that yields certain consequences". This then yields the four-element *Problem-Solution-Context-Consequences* tuple, consisting of each element described (and adapted slightly for our purposes here) below:

* ***Name***: preferably short, descriptive, and memorable.
* ***Building Blocks***: from my earlier ontology: Code, Presentation, Social, Writing. Often a given activity will be made out of two or more of these simultaneously, in a rough order of criticality; for example, a *Code, Writing* pattern will be better assigned to somebody who has stronger code skills, while a *Writing, Code* pattern will probably yield better results to somebody who has strong writing skills. (Ideally anybody would have strong skills in both, but then we get into the [Full-Stack Developer Fallacy](https://blogs.newardassociates.com/blog/2023/full-stack-developer-fallacy.html), but this time for Developer Advocates.)
* ***Problem***: a (preferably brief) description of the problem a team faces. Note that in many cases, the problem section in a pattern will be duplicated in another pattern--this is not in error, because a given problem can have multiple solutions to it, and both the context in which the problem lives and the desired consequences will help determine which pattern is most appropriate for use.
* ***Solution***: a (preferably brief) description of the solution to the problem.
* ***Context***: this will generally be certain constraints or additional elements around the problem that will influence the outcome--a common one, for example, being employee bandwith (the amount of time a team has to devote to the activity) or budget (the amount of money).
* ***Consequences***: the consequences are those that can be expected from application of the pattern's solution to the problem within the given context. Note that not all consequences will necessarily be positive--much of the benefit of the pattern approach is the realization that there is no "perfect solution" or "best practice", and that certain negative elements may arise out of the use of the pattern. Part of the decision-making criteria, then, is to examine the consequences, and determine if the positive consequences are what the team is aiming for, and the negative consequences "livable" or not really negative in the company's particular case.

Additional elements to the pattern form are possible/likely, depending on the individual pattern:

* ***Variants***: In some cases, a given pattern can be seen in a very slightly different manner, with essentially the same problem/solution/context/consequence tuple but slight variation in execution or consequence. It can thus be helpful to present it as a variation of the first, rather than engage in duplication.
* ***Also Known As***: Given that the DevRel space has not yet standardized on its terminology, it is common that there will exist different terms for what is essentially the same pattern.

## Glossary

Within the realm of Developer Relations, I find that agreement on the definition of some terms brings clarity to the discussion. I proffer these definitions for the purpose of this pattern language:

* ***Company***: Who the DevRel team works for and represents. Basically, if you're on the DevRel team, this is "us".

* ***Customer***: Anybody outside the company, whether they are a paying entity or not. DevRel teams will often want to segment this further (between open-source customers and paying customers, for example) in order to draw certain distinctions, but for the majority of these patterns it's sufficient to simply call anybody outside the company a customer. Note that based on the Direction (below) of the activity, the "customer" could very well be another team or developers inside the same company, so some nuance and flexibility in this definition is going to be needed. Basically, if you're on the DevRel team, this is everybody that's "not us".

* ***Direction***: DevRel should be a circular exercise: DevRel should be talking to both those developers inside the company ("internal") as well as those outside of it ("external"). This means the usual activities of bringing development discussions to developers that might be customers of the company's product, but also bringing feedback from those developers on the outside back into the company for further discussion and/or examination. Many companies are also building DevRel teams to be entirely internal-facing, supporting their developers in a variety of the ways that traditionally have been externally-facing (such as owning the continuing education efforts to grow the internal developers).

* ***Interactivity***: This is the fidelity of communication--how "conversational" is the exercise? This in many cases is in inverse proportion to Reach, but not always. The blog post doesn't really allow for great conversation (yes, you can open up comments on the blog, but we all know what happens when you do, and it's not pretty), whereas a workshop really requires a high degree of interactivity with the attendees. The blog post author doesn't learn much from their audience when posting the blog--the workshop facilitator, however, can learn all kinds of things from the attendees via the questions they ask, the problems they run into, the questions they don't ask, and so on.

* ***Product/Service***: What the DevRel team is looking to talk about. This can be a tool (such as an IDE or database), a library or set of libraries, a web service accessed over HTTP (commonly called an "API", "Web API" or "HTTP API"), some other kind of service (anything that ends with "-as-a-service" is a strong candidate), and so on. It need not be a formal artifact that is "sold"--open source projects around/about which the company sells services would be referred here as "product/service". Note that the company may have many product/services available, and a single DevRel team may support all of them, a few of them, or only one of them, but the distinction between one product/service or many product/services is largely irrelevant to the pattern catalog below.

* ***Reach***: How "far" does this activity go? How many people can see it and/or consume it? Those things done over the Internet tend to have a large reach (particularly if any artifact produced by the activity is someplace where Google can find it and pop it up during search results), whereas those things done in person (such as the hands-on workshop) will have very short reach, since participation requires physical presence. For example, the blog post can echo across the entire world within minutes, and even across time itself--certain blog posts just keep getting rediscovered by new readers. (Thanks, Google!) This contrasts with an in-person workshop done at a conference event, even if the workshop has a thousand people in it. In other words, the blog post can reach millions (and still going!), while the workshop only a thousand (and once over, can never go higher).

<div id="catalog" /><hr />
## Activity Catalog

[Article](#article) | [Blog Post](#blog-post) | [Book](#book) | [Booth])(#booth) | [Code Review](#code-review) | [Conference](#conference) | [Conference Session](#conference-session) | [Customer Check-In](#customer-checkin) | [Customer Meeting (Pre-Sale)](#customer-pre-sale) | [Forums](#forums) | [Gist](#gist) | [Guide](#guide) | [Hackathon](#hackathon) | [Hands-on Labs](#hands-on-labs) | [Live Streaming](#live-streaming) | [Newsletter](#newsletter) | [Reference Documentation](#reference-documentation) | [Sample/Example](#sample-example) | [SDK](#sdk) | [Social Media](#social-media) | [Sponsorship](#sponsorship) | [Technical Support](#technical-support) | [Tests](#tests) | [Training](#training) | [Tutorial](#tutorial) | [Webinar](#webinar) | [White Paper](#white-paper) | [Workshop](#workshop) | [YouTube](#youtube)

<div id="article" /><hr/>
#### Article
*Writing, Code*

Written piece published by a third party, whether that's a website (like a developer portal) or a print publication (the few that are left). Intended to be a standalone entity without referencing liberally elsewhere (although multi-part articles are certainly doable and can reference each other).

***Problem***: Certain developers are in a market that you don't reach--if your company is known for .NET yet you want to reach JavaScript developers, for example, or vice versa--and you need a way to reach them with a written piece that will have some "stickiness" to people.

***Context***: You want to use the opportunity to present something in a longer-form writing piece, reaching an audience that doesn't come to your website or your other activities already either because they don't know about your company or your product/service. You're looking for high reach from a single work effort (that of writing the article). You want code to be able to accompany the article, often in the form of a [Sample/Example](#sample-example), but the main effort is in the written prose, with code providing clarity to certain points, rather than laying out all the code and leaving developers to understand it on their own.

***Solution***: Write an article (generally 1500 words minimum, 4000 words maximum) that addresses the needs of that audience in a semi-direct, if abstract, fashion, submitted to a third-party publisher who will distribute it to their audience. When the article is published, make sure to provide traffic to the publisher's site by using [Social Media](#social-media) to advertise its publication to your known audience, as they may have interests in that area as well.

***Consequences***: Articles will often require some amount of editing and copyediting, which are not skills the typical DevRel team holds; work with an external editing/copyediting service might be required, if the publisher doesn't provide them. Note also that the publisher will often want either exclusive ownership or shared ownership (with an exclusivity clause) that could prevent the use of the article in other scenarios, such as a [Blog post](#blog-post) or [Book](#book).

Once written, the article may atrophy over time as the product/service deviates from what was written about it at the time of the article's publication; ideally, the publisher will be willing to allow for edits to the article to bring it up to date, but this will be effort that is entirely up to the company to provide. Because of this atrophy risk, articles should always be prominently dated so readers can get a sense of how "stale" the code or details described in the article are. [Blog posts](#blog-post) can also often be used to describe the changes between the article's publication and current-state, although finding ways to get the article and the blog post "connected" can be tricky.

The topic, if large enough, can often be the centerpiece of a [Conference Session](#conference-session), though typically an article will be too short to fill a 45-50 minute session, and will need expansion. 


<div id="blog-post" /><hr/>
#### Blog Post
*Writing, Code*

A written piece of varying length that appears on the company's time-indexed collection of such articles. Blogs frequently (but are not limited to) announce releases, reference other pages on the company site, and/or provide insight into new directions or company decisions.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="book" /><hr/>
#### Book
*Writing, Code*

A written piece that covers a large subject expansively, usually published through one of the "name" publishers (Addison-Wesley, O'Reilly, Manning, and others in the tech sector), although not always; some books can be self-published, or may even remain entirely internal to the company. (Example: Microsoft maintained internal documentation called "The Book of the Runtime" with detailed descriptions of how the CLR worked before .NET Core was open-sourced and that material made available publicly.) Books typically run 150 to 600 pages in length.

***Also Known As***: Handbook, Playbook, Manual

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="booth" /><hr/>
#### Booth
*Social*

At a conference.

***Also Known As***: Floor Presence.

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="code-review" /><hr/>
#### Code Review
*Code, Writing*

Examining code written by those outside the DevRel team (either Direction--inside or outside the company) and providing feedback/suggestions/improvements.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="conference" /><hr/>
#### Conference
*Presentation, Social, Code*

Company throws its own conference. External: typically to showcase its product/service as well as those of partners. Internal: allow developers to discover what other company developers are working on, as well as formal conference sessions designed for internal developer improvement.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="conference-session" /><hr/>
#### Conference Session
*Presentation, Code*

Doing a breakout session at a third-party conference.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="customer-checkin" /><hr/>
#### Customer Check-In
*Social*

Pro-active meeting with the customer post-sale, to make sure everything is going well.

***Also Known As***: Temperature Check, "Love" (as in "It's time to give the customer some love")

***Problem***:

***Solution***:

***Context***: Customers are known to the company and there is a known point-of-contact.

***Consequences***: Providing a pro-active communication often makes the customer feel like the company is taking an active interest in the customer's success.

***Variants***:

* **Partner Meeting**: If the company has signed partnerships with other companies, meeting with those customers will have the same benefits as the typical customer check-in. Customer-Partners tend to have a deeper relationship, however, so these meetings may need to happen more often or act as a two-way communication opportunity to discuss future plans or needs.


<div id="customer-pre-sale" /><hr/>
#### Customer Meeting (Pre-Sale)
*Social*

Working with Sales to help land a customer to purchase the product/service.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="forums" /><hr/>
#### Forums
*Social, Writing*

Company-hosted places where customers can post questions and receive answers from both company employees and the surrounding community.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***: 

* **Stack Overflow**. Stack is essentially a third-party-hosted forum, with the benefit of already being in existence; intimidating to some users; SO owns the content and thus can moderate posts and remove them.


<div id="gist" /><hr/>
#### Gist
*Code*

Smaller than a sample/example, designed to demonstrate a very specific snippet of code. Often entirely in conjunction with other artifacts.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="guides" /><hr/>
#### Guides
*Writing, Code*

Written docs that take more of a "story"-based approach to the product/service; not reference docs. Each guide covers some particular aspect or concept or insight or explanation about the product/service (such as a feature).

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="hackathon" /><hr/>
#### Hackathon
*Code, Social*

Code-for-24/48/72-hours on whatever sounds interesting. External: often around the product/service. Internal: on whatever the company developers find interesting. DevRel can either be coaches, organizers, or both.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="hands-on-labs" /><hr/>
#### Hands-On Labs
*Code*

Focus is entirely on the writing of code; sometimes a sequence of steps for a developer to do unguided or with minimal ahead-of-time instructions or lectures.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="live-streaming" /><hr/>
#### Live Streaming
*Presentation, Social*

Informal video content broadcast live. Very informal.

***Also Known As***: Twitch. Vimeo.

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="newsletter" /><hr/>
#### Newsletter
*Writing*

Recurring (monthly) emailed newsletter sent to opted-in customers. Include links to other artifacts (articles, samples/examples, etc). Works well in conjunction with [Social Media](#social-media).

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="reference-documentation" /><hr/>
#### Reference Documentation

Precise documentation about the API or interfaces or classes.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="sample-example" /><hr/>
#### Sample/Example

Fully-executable code but single-focused for third-party developers to use as a learning exercise.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="sdk" /><hr/>
#### SDK

Library of code intended to be used "as-is" as either the sole means or a helpful abstraction (layer on top of HTTP APIs) when using the company's software.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="social-media" /><hr/>
#### Social Media

Typically used for light customer contact and announcements.

***Also Known As***: Facebook Groups, Twitter, Mastodon, LinkedIN

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="sponsorship" /><hr/>
#### Sponsorship

Putting money into an organization's hands in exchange for visible branding to those who attend that organization's events or website. Conferences, User Groups, Advocacy Grops (IASA, etc)

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="technical-support" /><hr/>
#### Technical Support

Accepting bug reports, triaging the bug, developing a fix or workaround, and communicating that back to the bug-reporter. The actual intake of the bug can come from a variety of sources (forums, email, etc).

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="tests" /><hr/>
#### Tests

Unit or integration tests written to prove a particular hypothesis about the code (such as that it works, or that it integrates well, or so on). Often used as an artifact for developers to learn from--see also *Samples/Examples*.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="training" /><hr/>
#### Training

Formal classes in a lecture-lab style format. External-direction = training about the product/service. Internal-direction = training about the product/service *or* topics designed to improve the company's engineering teams.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="tutorial" /><hr/>
#### Tutorial

Either written or video content (or both) that takes a developer through a series of steps to accomplish some useful task, often related to the product/service.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="webinar" /><hr/>
#### Webinar

A scheduled one-way presentation done over video-conferencing software, typically over the Internet and publicly accessible. Typically more formal than a YouTube or LiveStream exercise.

***Also Known As***:

***Problem***:

***Solution***:

***Context***: You want the presentation to be more formal and "professional", similar to what might be seen in a more formal setting.

***Consequences***:

***Variants***:

<div id="white-paper" /><hr/>
#### White Paper

Written piece that conveys technical concept around the product/service at some level of depth; often intended as a pre-sale technique for those who want to dive more deeply into the product/service's offerings without having to make a greater commitment to downloading/installing the product/service.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="workshop" /><hr/>
#### Workshop

A guided set of steps taking a developer through a non-trivial task or set of tasks to accomplish some larger learning objective. Conference workshops. Open meeting/video workshops? 

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:

<div id="youtube" /><hr/>
#### YouTube

A video or series of videos (in a channel) on YouTube.

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:
