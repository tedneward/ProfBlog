title=Developer Relations Activities
date=2023-02-02
type=page
tags=devrel, patterns
status=published
description=A pattern language of all the activities a DevRel team can do.
~~~~~~

This, like so many other pattern languages before it, looks to catalog, categorize, and through that effort, provide some clarity and/or guidance on the various activities practiced by the various members of a Developer Relations team. As with all pattern languages, it's not intended to be a tutorial, but more of a reference, and as such could easily see additional edits and clarifications as time progresses.

*The first part of this discusses some meta-elements about this particular pattern language; if you want to jump straight to "the good stuff", scroll down to the section headed "[Activity Catalog](#catalog)".*

Note that many of these activities will depend on other, non-pattern activities, such as developing a target persona, that will help drive most (if not all) of the activities--for example, knowing DevRel's target persona/personae will help identify which conferences, which session topics, the articles to write, and so on.

## Pattern Form
The most basic pattern form I prefer is the simplistic one that states that "a pattern is a solution to a problem within a certain context that yields certain consequences". This then yields the four-element *Problem-Solution-Context-Consequences* tuple, consisting of each element described (and adapted slightly for our purposes here) below:

* ***Name***: preferably short, descriptive, and memorable.

* ***Building Blocks***: from my [earlier ontology](https://blogs.newardassociates.com/blog/2023/devrel-activity-ontology.html): *Code*, *Presentation*, *Social*, *Writing*. Often a given activity will be made out of two or more of these simultaneously, in a rough order of criticality; for example, a *Code, Writing* pattern will be better assigned to somebody who has stronger code skills, while a *Writing, Code* pattern will probably yield better results to somebody who has strong writing skills. (Ideally anybody would have strong skills in both, or all of the above, but then we get into the [Full-Stack Developer Fallacy](https://blogs.newardassociates.com/blog/2023/full-stack-developer-fallacy.html), this time for Developer Advocates.) In addition, I've added a new building-block category, *Budget*, meaning non-trivial monetary amounts that the activity will require; a *Budget* activity is generally one that's amenable to "throwing money at the problem".

* ***Problem***: a (preferably brief) description of the problem a team faces. Note that in many cases, the problem section in a pattern will be duplicated in another pattern--this is not in error, because a given problem can have multiple solutions to it, and both the context in which the problem lives and the desired consequences will help determine which pattern is most appropriate for use.

* ***Solution***: a (preferably brief) description of the solution to the problem.

* ***Context***: this will generally be certain constraints or additional elements around the problem that will influence the outcome--a common one, for example, being employee bandwith (the amount of time a team has to devote to the activity) or budget (the amount of money).

* ***Consequences***: the consequences are those that can be expected from application of the pattern's solution to the problem within the given context. Note that not all consequences will necessarily be positive--much of the benefit of the pattern approach is the realization that there is no "perfect solution" or "best practice", and that certain negative elements may arise out of the use of the pattern. Part of the decision-making criteria, then, is to examine the consequences, and determine if the positive consequences are what the team is aiming for, and the negative consequences "livable" or not really negative in the company's particular case. Additionally, many of these activities can overlap in their execution--creating a presentation for a conference session can also be repurposed into an article or blog post, and many presentations can come together to form the spine of a book. Where some synergy exists with other patterns, this will be mentioned in the consequences section.

Additional elements to the pattern form are possible/likely, depending on the individual pattern:

* ***Variants***: In some cases, a given pattern can be seen in a very slightly different manner, with essentially the same problem/solution/context/consequence tuple but slight variation in execution or consequence. It can thus be helpful to present it as a variation of the first, rather than engage in duplication.
* ***Also Known As***: Given that the DevRel space has not yet standardized on its terminology, it is common that there will exist different terms for what is essentially the same pattern.

## Glossary

There's a [few terms](#glossary) that I'll use in the patterns; in the interests of organization, that Glossary appears at the end of this page.

<div id="catalog" /><hr />
## Activity Catalog

[Ambassadors](#ambassors) | [Article](#article) | [Blog Post](#blog-post) | [Book](#book) | [Booth](#booth) | [Code Review](#code-review) | [Conference](#conference) | [Conference Session](#conference-session) | [Customer Check-In](#customer-checkin) | [Customer Meeting (Pre-Sale)](#customer-pre-sale) | [Forums](#forums) | [Gist](#gist) | [Guide](#guide) | [Hackathon](#hackathon) | [Hands-on Labs](#hands-on-labs) | [Live Playground](#live-playground) | [Live Streaming](#live-streaming) | [Newsletter](#newsletter) | [Office Hours](#office-hours) | [Podcast](#podcast) | [Product/Service Development](#product-development) | [Reference Documentation](#reference-documentation) | [Sample/Example](#sample-example) | [SDK](#sdk) | [Social Media](#social-media) | [Sponsorship](#sponsorship) | [Swag](#swag) | [Technical Support](#technical-support) | [Tests](#tests) | [Training](#training) | [Tutorial](#tutorial) | [User Group Network](#user-group-network) | [Webinar](#webinar) | [Workshop](#workshop) | [YouTube](#youtube)

## ... including Also-Known-As's and Variants

[Ambassadors; Champions; MVPs; Experts; Heroes](#ambassors) | [Ambassador Sponsorship](#sponsorship) | [API Gateway](#product-development) | [Article](#article) | [Beta/Buzz Talk](#conference-session) | [Blog Post](#blog-post) | [Book; Handbook; Manual; Playbook; E-Book](#book) | [Booth; Floor Presence](#booth) | [Brown Bag; Lunch-n-Learn](#conference-session) | [Certification](#hands-on-labs) | [Code Review; Engineering Deep-Dive; "Let's Get Eyes On It"](#code-review) | [Conference; User Conference; Tech Week; TechReady](#conference) | [Conference Session; Talk; Presentation](#conference-session) | [Customer Check-In](#customer-checkin) | [Customer Meeting (Pre-Sale)](#customer-pre-sale) | [Developer Portal](#forums) | [Docker install](#live-playground) | [Exploration Tests](#sample-example) | [Forums; Bulletin Boards](#forums) | [Gallery; "Kitchen Sink" Demo](#sample-example) | [Gist](#gist) | [Github Issues; Jira](#forums) | [Guide](#guide) | [Guilds; Centers-of-Excellence](#user-group-network) | [Hackathon](#hackathon) | [Hands-on Labs; Codelabs; Homework](#hands-on-labs) | [Internal Code Review](#code-review) | [Lightning Talk](#conference-session) | [Live Playground; Sandbox; "Try" site](#live-playground) | [Live Streaming; Twitch; Vimeo](#live-streaming) | [Newsletter; Zine](#newsletter) | [OpenLabs; Code With Us](#hackathon) | [Office Hours](#office-hours) | [Partner Meeting](#customer-check-in) | [Pit Crew](#booth) | [Podcast](#podcast) | [Product/Service Development; Extensions; Providers](#product-development) | [Reference Application](#sample-example) [Reference Documentation](#reference-documentation) | [Sample/Example](#sample-example) | [SDK](#sdk) | [Social Media; Facebook Groups; Twitter; Mastodon; LinkedIN](#social-media) | [Sponsorship; Conferences; User Groups; Technology Advocacy Groups](#sponsorship) | [Sponsored Conference Session](#conference-session) | [StackOverflow; Reddit](#forums) | [Swag](#swag) | [Technical Support](#technical-support) | [Tests](#tests) | [Training](#training) | [Tutorial](#tutorial) | [User Group Network](#user-group-network) | [Meetup Session; User Group Session](#conference-session) | [Vidcast](#podcast) | [Webinar](#webinar) | [White Paper](#article) | [Wiki](#forums) | [Workshop](#workshop) | [YouTube](#youtube)


<div id="ambassadors" /><hr/>
#### Ambassadors
*Social*

***Also Known As***: Champions; MVPs; Experts; Heroes

***Problem***: You want to extend the reach of your efforts, beyond its current form, and in particular have a stronger presence in certain communities in which you currently have no representation or identity.

***Context***: Your hiring budget is limited and your team is already stretched to the limits of their bandwidth. 

***Solution***: Find people within your existing community (by examining your [Forums](#forums) or by speaking with interested parties at [your booth at conferences](#booth)) who are active, well-informed on your product/service, and eager to be more active. Create a program by which they will have certain identity ("Ambassadors", "Heroes", etc), and offer benefits to being a part of the program: provide them with [Swag](#swag); give them early access to some of your next steps and company pursuits; create "direct channels"--meetings between the Ambassadors and company executives--for feedback and news; have Ambassadors write for your [Newsletter](#newsletter); assist Ambassadors in finding [Conference Sessions](#conference-session); put them center stage at your own [Conference](#conference); assist them in the writing of a [Book](#book). Ambassadors can even be given opportunities to [blog](#blog-post) and/or contribute [samples](#sample-example) or [Reference Documentation](#reference-documentation), if the docs are managed via Git/GitHub. Ambassadors are also exellent help in starting or growing a [User Group Network](#user-group-network).

***Consequences***: Creating an extension of your DevRel team like this will almost certainly necessitate one of your team to the care-and-feeding (management) of the Ambassadors, including managing communications with them and setting expectations.

It will be extremely difficult to find metrics to the activities of the Ambassadors, so it's strongly likely that at some point after their foundation there will be a call to shut the program down in order to save money if there aren't obvious and visible benefits to doing so. Make strong efforts to keep the Ambassadors' activities front-and-center to the rest of the company, so that anyone can see the positives of the program without having to see numbers.

Sad as it may seem, not all of the Ambassadors will agree with one another, and it is almost certain that as the longevity of the program increases, and/or its size, two Ambassadors will disagree--publicly. Your brand will suffer the longer this drama continues, so be prepared: Create a Code of Conduct early, describing what is and is not tolerated, and enforce it when violations occur, either by gentle admonishment, stern warning, or outright removal from the program.


<div id="article" /><hr/>
#### Article
*Writing, Code*

Written piece published by a third party, whether that's a website (like a developer portal) or a print publication (the few that are left). Intended to be a standalone entity without referencing liberally elsewhere (although multi-part articles are certainly doable and can reference each other).

***Problem***: Certain developers are in a market that you don't reach--if your [company](#company) is known for .NET yet you want to reach JavaScript developers, for example, or vice versa--and you need a way to reach them with a written piece that will have some "stickiness" to people.

***Context***: You want to use the opportunity to present something in a longer-form writing piece, reaching an audience that doesn't come to your website or your other activities already either because they don't know about your company or your product/service. You're looking for high reach from a single work effort (that of writing the article). You want code to be able to accompany the article, often in the form of a [Sample/Example](#sample-example), but the main effort is in the written prose, with code providing clarity to certain points, rather than laying out all the code and leaving developers to understand it on their own.

***Solution***: Write an article (generally 1500 words minimum, 4000 words maximum) that addresses the needs of that audience in a semi-direct, if abstract, fashion, submitted to a third-party publisher who will distribute it to their audience. When the article is published, make sure to provide traffic to the publisher's site by using [Social Media](#social-media) to advertise its publication to your known audience, as they may have interests in that area as well.

***Consequences***: Articles will often require some amount of editing and copyediting, which are not skills the typical DevRel team holds; work with an external editing/copyediting service might be required, if the publisher doesn't provide them. Note also that the publisher will often want either exclusive ownership or shared ownership (with an exclusivity clause) that could prevent the use of the article in other scenarios, such as a [Blog post](#blog-post) or [Book](#book). Some publishers will provide a clause that allows the company to re-publish the article on their own web properties after a certain period of time has passed (1-3 months is common), but often will not provide this unless asked. Most publishers will also look for some form of contract to be signed, which may require legal review.

Once written, the article may atrophy over time as the product/service deviates from what was written about it at the time of the article's publication; ideally, the publisher will be willing to allow for edits to the article to bring it up to date, but this will be effort that is entirely up to the company to provide. Because of this atrophy risk, articles should always be prominently dated so readers can get a sense of how "stale" the code or details described in the article are. [Blog posts](#blog-post) can also often be used to describe the changes between the article's publication and current-state, although finding ways to get the article and the blog post "connected" can be tricky.

The topic, if large enough, can often be the centerpiece of a [Conference Session](#conference-session), though typically an article will be too short to fill a 45-50 minute session, and will need expansion. 

***Variants***:

* **White Paper.** If the article is written by somebody at the company and used as part of the company's marketing or sales efforts, it is often called a "white paper".


<div id="blog-post" /><hr/>
#### Blog Post
*Writing, Code*

A written piece of varying length that appears on the company's time-indexed collection of such articles. Blogs frequently (but are not limited to) announce releases, reference other pages on the company site, and/or provide insight into new directions or company decisions.

***Problem***: You want to keep interested customers informed and aware of all the activities, plans, and artifacts your company is producing, while making the material available to SEO as well, capturing their attention for some period of time.

***Context***: You want their attention to be on your company, but not through a third party or on a third party website.

***Solution***: Host a blog, which is a series of shorter written pieces that are date-indexed (most recent first), and written in an informal style. Have the DevRel team write blog posts, either alone or in partnership with others within the company. Each blog entry is often around a single, small concept, such as the announcement of a release or new feature, and often written to include code within the body of the post.  

***Consequences***: If the blog posts are accredited to the author (also known as a "byline"), the community gets the opportunity to get to know the author more directly, creating some brand recognition and familiarity, which in turn helps make the DevRel team more recognizable and approachable to customers and the community. (This will also help with [Conference Session](#conference-session) submissions and can be amplified by highlighting the posts on [Social Media](#social-media).)


<div id="book" /><hr/>
#### Book
*Writing, Code*

A written piece that covers a large subject expansively, usually published through one of the "name" publishers (Addison-Wesley, O'Reilly, Manning, and others in the tech sector), although not always; some books can be self-published, or may even remain entirely internal to the company. (Example: Microsoft maintained internal documentation called "The Book of the Runtime" with detailed descriptions of how the CLR worked before .NET Core was open-sourced and that material made available publicly.) Books typically run 150 to 400 pages in length, though shorter ones on more-focused topics are often popular as well.

***Also Known As***: Handbook; Playbook; Manual; E-Book

***Problem***: Your product/service is a complex (or deceptively complex--simple to start but complicated beyond the basics) subject and customers are overwhelmed with the options and features listed in your [Reference Documentation](#reference-documentation). They are looking for something more comprehensive than a [Guide](#guide) or [Article](#article), with broader scope and depth. You need to get a vast amount of information out into customer (and potential customer) hands. 

***Context***: The material is relatively stable (requiring little updates due to changes), and the principal aim is to educate and/or explain, with little interactivity or feedback required or needed.

In some cases, the material is complex enough that supporting code samples, in line with the prose, are provided, and need to be larger than a "snippet" in order to get a complex concept across. (For example, explaining the concept of "middleware" in an HTTP stack usually requires demonstrating several files and separate and distinct "middleware agents" to get the concept across.) This means that it may be too complex to get across in a single [Article](#article) or [Blog post](#blog-post), and spread it across multiples of either will break the flow of understanding for the reader.

***Solution***: Identify one or two people on the DevRel team who are comfortable with long-form writing, and have them write material to form a book. (Alternatively, the material can come together from a variety of sources, such as internal engineers, but then the one or two people will be editors, rather than authors, bringing all the material together to feel like it is written in one style, and ensuring material does not substantively overlap.) This book can either be self-published (often in electronic form only) by the company, or published through an established publisher for greater reach.

***Consequences***: The cost of writing a book is extremely high to the author, often requiring a full-time effort for many months, leaving zero bandwidth to participate in many of the other activities. The author's brand recognition and credibility will improve after the book's publication, however, and often open doors for the author and the company due solely to its existence.

Books are often written using GitBook.

Customer commitment to consuming a book is non-trivial, as most books require days to read, even without any other distraction, and most will require weeks or months given a typical day and commitments. The content must be worth the investment, or the reputation will be negative rather than positive. For this reason, books should be reviewed by subject-matter-experts to ensure its accuracy, and the book should be written to have some "longevity" beyond the current product/service release.

Books written by the DevRel team act as a much broader and deeper [Guide](#guide) and can go into depth and detail that is often not possible otherwise.

Books written by [Ambassadors](#ambassadors) instead of the DevRel team members can be very beneficial to both company and Ambassador; the Ambassador improves their own branding within the community (which is good for them), and the company sees deeper technical content distributed to the community without requiring a large time investment from their DevRel team or internal engineers. Usually the DevRel team and/or internal engineers will need (and want!) to be a part of the editing team, however, to ensure that the material is correct and/or in line with the company's messaging and future plans.

Books are popular as [Swag](#swag). Book excerpts can be used as [Articles](#article) and/or [Blog posts](#blog-post). Books are also highly eye-catching and credibility-building when displayed at the [Booth](#booth) and/or used in [Customer Pre-Sale Meetings](#customer-pre-sale-meeting), particularly if written by somebody on the DevRel team.


<div id="booth" /><hr/>
#### Booth
*Budget, Social*

***Also Known As***: Floor Presence.

***Problem***: You want to connect with developers within a certain community and have an opportunity to explain your product/service to them, ideally in the context of a conversation in which you can find out more about their issues, problems, concerns, budget, etc.

***Context***: The company wants to be present at an event that brings many people together under the umbrella of a particular identity (i.e., a tech-stack-centric conference) or region (i.e., a community event run for the immediate surrounding geographic area) or brand (i.e., a "destination" conference held in a popular city, like Las Vegas or Orlando), in order to connect with current and potential customers in a more interactive way.

***Solution***: You purchase booth space at a conference, and send a team to staff the booth during the conference's run.

***Consequences***: Participation in a conference event will often require somebody to be a point of contact for the conference; materials (such as the booth itself, printed handouts, any [Swag](#swag), and so on) will need to be shipped to the event, schedules will need to be coordinated, and so on. This is a non-trivial commitment of time and energy, particularly so as the conference gets bigger (it's a much larger commitment of time to have a booth at AWS re:Invent than at a 250-person local community conference).

Manning the booth is also a non-trivial time commitment; ideally there should never be fewer than two people at the booth while the "vendor floor" is open (typically a 12-hour timeframe), so three or four people will be needed during each day of the conference. Additionally, some sort of [Swag](#swag) to help draw initial interest to the booth is helpful, but do not be surprised when many developers stop by just for the swag.

Note that a company's booth presence does not prevent or assume the company [sponsoring](#sponsorship) the conference; where sponsorship flexes on Reach, the booth focuses on interactivity.

***Variants***:

* **Pit Crew.** If the company or the product/service doesn't directly fit the audience of the conference, but you still want a strong "presence" at the event, consider spending the Booth budget on sending a number of company employees to the event with the intent of "taking the field by storm": simply be out and around, milling on the floor, attending talks and absolutely being present at any [Conference Session](#conference-session) being given by the DevRel team or other company employees. Pit Crew can carry [Swag](#swag) around with them (if it's small) and hand it out as they move about the conference, or toss it out during the DevRel's talks ("Free T-shirt to anyone who asks a question!"). Be careful not to be too obnoxious about this, though, or the conference organizers (or the vendors that paid for a booth) may get annoyed and want to have a chat.
    Pit crew need not (and arguably shouldn't be) members of the DevRel team; sales, recruiters, marketing folks, and anyone who is looking to start speaking at events and/or considering a role as DevRel make for great Pit Crew, as it allows them to "feel the vibe" of a conference event. Associate Developer Advocates should always do a stint or two as Pit Crew before being sent on their own to a conference event.


<div id="code-review" /><hr/>
#### Code Review
*Code, Writing*

***Also Known As***: Engineering Deep-Dive; "Let's Get Eyes On It"

***Problem***: You have customers that are using the product/service, but they are running into issues (or at least claim they are running into issues) that they cannot resolve themselves. This could either be threatening their future engagement with the product/service, creating a bad brand experience that could harm the product/service's reputation within the community, or jeopardizing a partnership agreement with a partner. In some cases, the customer may be asserting that they have found an unreported bug and are seeking confirmation/validation. In other cases, it may be a performance or scalability issue.

***Context***: The customer/partner's code is complex and longer than can be consumed via an email or a posted question in a [Forum](#forums). Alternatively, the code is closed-source, and the customer is not able to (or interested in) share the code with anyone else.

***Solution***: Set up a meeting with one or more participants from the DevRel team and the customer. During this meeting, the DevRel team walks through the code with the customer, hopefully spotting the issue, bug, or misunderstanding in the customer's code.

***Consequences***: Customers may not show appreciation if/when the code is corrected (nobody likes to cry for help only to find out it was a problem in their head or on their side of the table), but in general customers are more appreciative when they can get past their problems than when they cannot.

Exposing DevRel teams to places where customers are having problems with the code becomes valuable feedback that can be communicated internally to Engineering, and lead to changes in either the [Guides](#guides), the [Reference Documentation](#reference-documentation), or sometimes the product itself. In some cases, if the issue appears often enough, it may warrant creation of [Blog posts](#blog-post) with accompanying [Samples](#sample-example), creation of a [extension or integration](#productservice-development), and/or trigger a refactoring of the [SDK](#sdk).

***Variants***:

* **Internal code review.** In some cases, it can be helpful to the DevRel team to better understand the product/service if they are used as reviewers of the code that make up the product/service (if it is not open-sourced already). While the DevRel team may not find any bugs or issues, the act of walking through the code can help Engineers think through some edge cases that might not be already covered, and the DevRel team will gain greater insight into how the product/service works "under the hood". 


<div id="conference" /><hr/>
#### Conference
*Budget, Presentation, Social, Code*

***Also Known As***: User Conference

***Problem***: You have a large group of developers (internal or external) that you want to reach publicly with a large amount of material that will help them use your product/service.

***Context***: You want to create some "buzz" around your product/service and/or your company, and use that "buzz" to gain some brand recognition, bootstrap some community activities, and/or persuade developers to take a deeper/harder look at your product/service collectively with their peers.

***Solution***: Create a company-funded conference dedicated to the company and/or the product/service, with high-ranking company executives taking prime slots to address the attendees about the company's successes, future directions, and exciting news. Use breakout sessions to further refine that messaging and further "deep dives" into the details of the product/service. Invite members of the tech press to attend for free, and provide opportunities for exclusive interviews with the company executives for the press to run.

***Consequences***: If [managing conference booths](#booth) is a time commitment, managing an entire conference is orders of magnitude more. Venue space must be procured, usually with accompanying hotel blocks of rooms for attendees (and employees); dates must be selected carefully to ensure that there is no accidental conflict with another event that might draw attendees, speakers, or employees away; the calendars of all the relevant individuals (particularly the executives) must be consulted to ensure that the individuals will be able to participate; and more. Attendance is also important--if too large of a venue is selected, and not enough attendees show up to make the hallways feel crowded, the event will feel empty, having the opposite of the desired effect. Risks around running a conference (particularly for the first time) can go very high.

Commensurately, the rewards of a successful conference can also go very high. A conference dedicated exclusively to the product/service and/or to the company, particularly if well-attended (even sold out!) can signal that the product/service has "arrived", and if the hallways are packed just enough, it creates a sense of "buzz" that the tech press will be happy to talk about in their articles and reports.

Throwing an event does not have to be exclusively reserved to companies of 10,000 or more; small companies can do so on a more informal level, without some of the hoopla and formality. However, proportionally, throwing an event always requires a non-trivial amont of time, and almost always requires at least an individual (if not a whole team) dedicated to the task of organizing, scheduling, managing, and monitoring the event.

For those companies that look to host an event (internally-facing or external) yet lack the bandwidth to do the logistical work, numerous third-party "event hosting companies" can be retained to provide the logistical support (up to a point--they will likely need company assistance in deciding what sessions to schedule and approve, for example) for running such an event. It will tend to drive the cost of the event up, but doing so will also leverage experts who have several events already "under their belts" and avoid some common beginner mistakes. 

***Variants***:

* **TechReady.** **TechWeek.** Some companies are large enough that it behooves them to hold an internal conference to talk openly about secret projects that cannot be discussed outside the company walls, and/or to conduct a wide variety of training on topics that the company is using. These are often combined with [Hackathons](#hackathon) to give developers a break from their "daily grind", connect with peers across the company they don't normally get to meet, and provide opportunities for training without having to explicitly take time away from a feature schedule or disrupt a sprint. (In those companies that run 2-week sprints, for example, it is common to take one week aside once a quarter for activities like this; given that each quarter is 13 weeks, this way the company gets six sprints per quarter plus one week for internal training and social gathering.)


<div id="conference-session" /><hr/>
#### Conference Session
*Presentation, Code*

***Also Known As***: Talk; Presentation

***Problem***: Your product/service is out, but adoption is low, and part of the problem seems to be that developers don't quite know how to use it or get started with it.

***Context***: Complex information, particularly abstract and conceptual information, is often hard to communicate in a purely "visible" spectrum (a la writing). For whatever reason, humans still seem to learn and understand more effectively when multiple communication channels are engaged simultaneously--that is to say, when they are shown things at the same time they are told things (so long as those things are supporting each other).

Perhaps there are conceptual parts to what the product/service does that are confusing, or the product/service has a large "surface area" of material that is overwhelming. There may be nuances to certain features that aren't visible at first, or advanced features that require some foundational understanding before being able to be used effectively.

***Solution***: Deliver a technical presentation at a third-party conference (that is, run by a group or company that isn't your own). It can be in a variety of different forms, ranging from an "all-code, no-slides" presentation in which you have the outline memorized in your head and you code-on-the-fly interactively with the audience, to an "all-slides, no-code" presentation in which you talk about concepts and ideas that would be tricky to pull off "on the fly". Most "breakout" presentations are somewhere in the middle, depending on the topic, the presenter, and (sometimes) the culture of the event.

Most conference breakout sessions are just under an hour in length; anything less than 45 minutes is better categorized as a "lightning talk" (see Variants).

***Consequences***: (Longer-term planning; submission to CfPs, which come 3-9 months before the event.)

Conference sessions come with financial and logistical requirements for the speakers, travel planning being the biggest of the lot. While many DevRel teams handle these themselves, consider making it easier for them to do so: allow them to work with a travel agency (a human one, not an online one) to make it easier to book travel (and get them home in the event of a travel disruption), and consider working with Accounting to streamline and expedite the process of reimbursement; although it is tempting to tell the team "just float it on your credit card", that may not be feasible and/or financially disadvantageous to the team.

Conference sessions often pair well with conference [Sponsorship](#sponsorship), including the purchase of [Booth](#booth) space and copious amounts of [Swag](#swag). If you have more than one session, or more than one of your team is speaking at the same event, consider bringing a [Pit Crew](#booth) and have them visibly present in each of your company's talks, not to act as a cheering section, but to be available for qustions that the audience might have but aren't willing to wait very long to ask. In these situations, consider putting somebody in charge of logistics and event coordination for all of those committed to the event (including [Pit Crew](#booth)), as doing the event as a team can be a strong emotionally-bonding experience to do things as a group (share the same flights, be at the same hotel, coordinate dinners and evening activities, and so on).

***Variants***:

* **Beta/Buzz Talk.** Although this is less common in an era of open-source, sometimes the desire is to "build buzz" around an upcoming release of the product/service, and one great way to do that is to do a presentation on the new features of the upcoming release before it is generally available. This way developers and customers can be "ready to go" when the release drops, and the feature set might even help attract new customers because they heard about it at the conference. [Ambassadors](#ambassadors) in particular love to give "Upcoming Features" talks, as it positions them and their own branding as being smart and "in the know" when it comes to the product/service. This material is also very powerful when used in a [Pre-Sales](#customer-meeting-pre-sale) meeting. 

* **User Group Session.** **Meetup Session.** A common staple of the [User Group](#user-group-network) is to have somebody from the company (or an [Ambassador](#ambassadors) come and speak to the group on some technical topic related to the product/service (more or less). The DevRel team can either help facilitate Ambassadors speaking at the group(s), or have members of the DevRel team do it directly (in which case the DevRel team will need to handle many of the logistics and expense for doing so).
    Note that because most user group sessions are more informal than other settings, expect that the presenter will spend more time with the attendees than at a conference. (It is common to go out for food and drinks after the event, or to mill in the room both before and after the talk.) 
    It is common for DevRel teams to use user group sessions as an opportunity to practice a talk before it is delivered as a [Conference Session](#conference-session). Some groups welcome this, but some resent it. If the relationship with the group is strong, ask for feedback on the talk; if it is not, treat it as a formal presentation every bit as "real" as the conference or a [Customer Meeting](#customer-meeting-pre-sale).

* **Sponsored Conference Session.** At times, a conference will sell a speaking slot to a [sponsoring company](#sponsorship), guaranteeing the company will have a speaker at the event without going through the traditional Call-for-Presentations process. Be warned that developers historically have not taken well to these slots, doubly so when the sponsor chooses to do a presentation or talk specifically around their product/service. If your team is sponsoring the slot (perhaps the Marketing or Sales team decided to buy it without consulting you), consider not taking it--let somebody from Marketing or Sales do the presentation, so as to preserve the credibility of the DevRel team with their developer audience. If the DevRel team *must* do the sponsored presentation, then be up front and respectful of the developer audience: "Hi, my name's Denny, I'm from ToolCorp, and we threw some money at the organizers to get this time slot. What I'd like to do is show you the pros and cons of our tools, and give you some idea of when--and when not--to use our stuff." Don't try to "hide" the fact that this is a sponsored session--most attendees can already tell, owing to the different advertising around sponsored sessions. If metrics are captured for this session, do not compare them to other Conference Sessions, as the surrounding context of each are different enough that it is comparing apples to oranges.

* **Brown Bag.** **Lunch-n-Learn.** When the direction of the activity is pointed internally, these become known as "brown bags" or "lunch-n-learns", wherein the DevRel team (or other internal employees of the company) deliver the presentation (often over the lunch hour) to other engineers within the company. These can be organized periodically (weekly or monthly), as part of an internal [Hackathon](#hackathon), or as part of the company's [internal conference](#conference) (or all of the above). If there is no formal internal training team, the DevRel team should take on the organization, logistics, and "acquisition" of speakers (internal or external) for such events; if there is a training team, DevRel can be frequent speakers, and/or help with the acquisition of speakers, and/or help with some of the logistics. Note that if internal employees are interested in speaking, DevRel should (must!) volunteer to assist that employee in the preparation and practice of delivering the presentation, since many developers are not comfortable delivering or preparing presentations.
    Note that if DevRel is scheduling these, it's often best to start with monthly events, then move to biweekly and weekly as the "pipeline" grows. Let the upcoming pipeline grow to six months' in advance before reducing the timing--for example, if you are doing monthly sessions, and you have six months' speakers/topics in the pipeline, go biweekly (thus reducing your pipeline to three months' worth) and rebuild the pipeline out to six months' worth before going weekly.

* **Lightning Talk.** Any presentation that is 30 minutes or less is generally best considered to be a "lightning talk", and requires very different preparation and delivery considerations. (You will not have time to write code on the fly. You will not have time to take questions. Instead of three things to talk about, focus on one. Scripting the talk is easier when it's shorter like this, particularly if the deadlines are "hard" and no wiggle room.)


<div id="customer-checkin" /><hr/>
#### Customer Check-In
*Social*

Pro-active meeting with the customer post-sale, to make sure everything is going well.

***Also Known As***: Temperature Check; "Love" (as in "It's time to give the customer some love")

***Problem***: The company wants to ensure that the product/service is continuing to meet the needs of its current customer base, and/or wants to get customer feedback on a proposed new feature or change to the product/service before it goes forward with something that might generate backlash or fail to generate the "splash" or ROI the company is seeking.

***Context***: It's after the product/service is already in the hands (that is, purchased) of the customer. Your customers are known to the company, and there is a known point-of-contact or easy way to connect with those customers.

***Solution***: Create a meeting (or series of meetings) with customers, either singly or in a focus-group format, in which the company is able to have frank and honest conversations and hear the responses clearly.

***Consequences***: Providing a pro-active communication often makes the customer feel like the company is taking an active interest in the customer's success.

Care must be taken when framing the questions to the customer(s), to avoid "leading the witness" to say what the company hopes it will hear. Ideally the conversation will be recorded (or notes taken) so that others within the company who were not present are able to "hear for themselves" what the feedback or responses are.

These conversations often benefit the company only when the customer(s) feel that they can be honest without fear of damaging the relationship, so confidentiality guarantees should be provided (and enforced), particularly to keep the conversations private to anyone "not in the room" at the time of the conversation. (That is to say, both parties should be discouraged to "leak" the conversations to the tech press or social media.)

***Variants***:

* **Partner Meeting**: If the company has signed partnerships with other companies, meeting with those customers will have the same benefits as the typical customer check-in. Customer-Partners tend to have a deeper relationship, however, so these meetings may need to happen more often or act as a two-way communication opportunity to discuss future plans or needs. Partner meetings can often bring with them requests from the partner to build [product/service integrations or extensions](#product-development) that either the partner will own after development, or the company will be required to maintain.


<div id="customer-pre-sale" /><hr/>
#### Customer Meeting (Pre-Sale)
*Social*

Working with Sales to help land a customer to purchase the product/service.

***Also Known As***:

***Problem***: Salespeople are, stereotypically speaking, not strong in technical skills. When selling or negotiating a deal or partnership, many issues of a technical nature will arise, and it can be difficult to ensure that reasonable solutions and/or promises are discussed as part of those negotiations.

***Context***: Given the complexities in most product/service offerings, it is unreasonable to expecting that salespeople will be able to be understand underlying details or nuances after a one- or two-hour technical briefing. (Frankly, this is true of many industries more than this one, yet it continues to permeate human society as a common myth.)

However, salespeople will often look for creative ways to get around potential-customer objections, both as a way to avoid obstacles that might prevent the deal, as well as part of the typical negotiation around things like price.

***Solution***: Ensure that somebody from the DevRel team is "in the room" (either figuratively or literally) to provide technical insight and "know-how" when questions around the product/service, its features, or its capabilities, arise.

***Consequences***: Just as salespeople are not technologists, most DevRel are not salespeople, and should therefore make sure they are "in sync" with the salesperson driving the meeting. Let the salespeople drive the meeting, and don't proffer ideas or suggestions without running them past the salespeople first--sometimes the salesperson will want to hold that idea or suggestion "in reserve", to use as a later point in the negotiation. Remember that concluding a deal is more of a competitive action than most engineering-types are accustomed to, and that the "win condition" isn't just solving the problem (like it is for many engineering issues).

***Variants***:


<div id="forums" /><hr/>
#### Forums
*Social, Writing*

Easily-accessible places online where customers can post questions and receive answers from both company employees and the surrounding community.

***Also Known As***: Support Forums; Bulletin Boards

***Problem***: Customers want to have a place in which to obtain answers without having to schedule conversations, comb through documentation, or read through lots of tests--in essence, they want to be able to post a question and get an answer (or a confirmation of what they think is a bug).

***Context***: Customers often want to do this Q-and-A style interaction asynchronously, with the ability to write code to support their question and/or see code in the answer. Customers also like helping other customers who are in similar situations--which helps build a sense of community around the product/service. However, they want some reasonable reassurance that the answers they are receiving are from "people who know", so that they do not have to wade through incorrect or incomplete or untested answers. 

***Solution***: One solution is for the company to host a forums system on the company's domain umbrella (see [Apple Developer Forums](https://developer.apple.com/forums/) for an example), in which customers can post questions and receive answers from employees or other customers.

Another solution is to make use of a third-party-hosted forum system, like Stack Overflow or Reddit, by creating a "channel" or a "tag" by which questions from the community on the product/service can be easily identified.

In either case, the DevRel team commits to being a visible presence on the forums, directly answering questions and/or visibly taking questions or issues internally and promising an answer within a reasonable period of time.

***Consequences***: Hosting forums requires a commitment to moderation, or the company runs the risk of creating a hostile environment that will alienate customers.

Additionally, hosting forums can have the benefit of being accessible to both internal employees as well as external customers, allowing for a degree of interaction without creating opportunities for customers to bypass traditional company information channels. (Customers having direct access to internal software engineers, by having their email address for example, can often have the negative side-effect of customers using those engineers for tech support purposes, distracting them from their other duties and/or creating issues for the [Tech Support](#technical-support) team.)

Forums make for an easy way to identify potential [Ambassadors](#ambassadors) from the community. Forums can also suggest [Samples/Examples](#sample-example), enhancements to [Guides](#guide) or [Reference Documentation](#reference-documentation), or even [extensions or providers](#product-development) for future development.

***Variants***: 

* **Wiki**. A wiki is essentially a forum, with the caveat that the roles are flexible--where traditional forums focus on question-followed-by-answer-and-discussion, a wiki is more free-form and allows for more collaborative interaction.

* **Stack Overflow**. **Reddit**. Stack is essentially a third-party-hosted forum, with the benefit of already being in existence. Stack also has gained a reputation of being intimidating to some users. Note that Stack also owns the content posted, and thus can moderate posts and remove them, leading to potential loss of information the company would prefer to keep around. To address concerns of incorrect information, Stack created the concept of "reputation", allowing readers to be able to filter better answers from worse. Reddit allows for long threaded conversations, with much discussion, but there is little code and often even less moderation. Both are extremely popular.

* **Developer Portals**. The traditional developer portal is often more than just forums--for example, it often aggregates links to developer-centric downloads like [SDKs](#sdk) or [Samples/Examples](#sample-example). However, much of the "stickiness" of the portal is its ability to capture developer attention via the question-and-answer forums.

* **GitHub Issues**. **Jira**. Forums are a natural mechanism to act as intake for [Technical Support](#technical-support), and most GitHub-hosted projects have an "Issues" page in which customers can file questions that are either answered (and closed) or then used as bug reports that are referenced from pull requests during [Code Reviews](#code-review). Jira serves a similar purpose, but usually Jira is behind a company firewall rather than being publicly accessible.


<div id="gist" /><hr/>
#### Gist
*Code*

Smaller than a sample/example, designed to demonstrate a very specific snippet of code, such as a single method, part of a class, or short REPL session. Often entirely in conjunction with other artifacts.

***Also Known As***:

***Problem***: Somebody has asked you or your team a question about your product/service, perhaps in a [Forum](#forums) or on [Social Media](#social-media), and the answer requires a degree of detail that casual spoken/written language cannot adequately capture. However, you want to answer the question quickly, and with a minimum of overhead.

***Context***: Writing a full [Sample/Example](#sample-example) is overkill, because the answer can be captured in just a few (less than four) lines of code in a very standalone manner. It would take longer to re-frame the question (in a [Blog Post](#blog-post), for example) than to just post the answer. However, many [Forums](#forums) and [Social Media](#social-media) systems do not respect "code" formatting well, and posting code directly into the answer can turn into an unformatted, jumbled mess.

Additionally, sometimes the question appears multiple times from different posters at different times, and it would be convenient to have the answer in a form that is easily shared across answers.

***Solution***: Post the code as a standalone snippet as a [GitHub Gist](https://gist.github.com/) attached to the company's or team's GitHub organization. Link the URL from the [Forum](#forums) or [Social Media](#social-media). The URL can be reused for additional answers, and as a collection of gists are built up, they can be browsed by others, either because they are seeing additional answers through similar answers, or by viewing the collection of gists on GitHub. Gists can also be subscribed to, like projects on GitHub can.

Note that several tools (like Visual Studio Code or the JetBrains suite of tools) have extensions or plugins that know how to work directly with the Gist API, making it easier to create and share them.

***Consequences***: Gists are full GitHub repos, and can "grow" from single files to whole collections of files organized in particular ways (projects, solutions, etc). Linking to the gist may lose its efficacy if following the link doesn't make clear what is being referenced; once a gist grows large enough, it may serve better as a more formal [Sample/Example](#sample-example). Large collections of gists might be better off collecting under [a "Kitchen Sink" reference application or gallery](#sample-example), for easier consistent configuration and/or display, and then referenced individually as files on GitHub.

Because gists don't have descriptive names, hyperlinks will be somewhat obscure, and therefore harder to spot accidental typos and/or accidental mis-linking (linking to the wrong gist).

Gists may not be top-of-mind when new updates and releases to your product/service come out, so set a reminder periodically to update a gist or mark it is obsolete. Be reluctant to delete the gist entirely unless you are able to find all the places where the gist is referenced on the Internet (unlikely), as "link rot" could lead customers or prospective customers to conclude that your support system or community is less strong than it actually is. (One broken link won't turn anyone away, but if numerous gist-links are 404s, people will start to wonder.)

***Variants***:


<div id="guides" /><hr/>
#### Guides
*Writing, Code*

Written docs that take more of a "concept"-based approach to the product/service; not reference docs. Each guide covers some particular aspect/insight/explanation about the product/service (such as a feature).

***Also Known As***:

***Problem***: Developers need more than just the description of an API call or the acceptable values for parameters to that call--they need to build a mental model of how the product/service works, particularly "on the inside", where they lack visibility. 

***Context***: [Reference documentation](#reference-documentation) is more tactical in nature, rather than conceptual, and developers at some point are going to ask questions like, "How does this work?" or "Why is it when I call A, then B, I get a different result than when I call B, then A?"

Customers will often need to understand the concepts behind the product/service in order to be able to understand its nuance, particularly when compared against competitors, or when measured up against something that might be a competitor (but actually isn't).

This is particularly apparent if the product/service is relatively novel or innovative in its space, as customers will not have much (if any) experience with the novelty or new concepts from other products or services they've used before.

***Solution***: Write one or more sets of longer-form prose pieces that each tackle the important concepts of the product/service. While precise details aren't necessary, there should be enough information in each one that a developer can build a mental model of how the product/service works "under the hood". For example, if the product/service stores data, some discussion of how the data is stored, how the data is queried, and when/how/if that data is encrypted "at rest" are necessary to give the developer a clear picture in their minds on how to approach using the data store.

Write these docs in a crisp, concise style, devoid of "tone" as much as possible. This is not the place to let the company culture fly or to weigh in with controversial technology opinions (except those that are baked in to the central concept of the product/service; it would be reasonable for a cloud service to weigh in on the advantages of running in the cloud, for example).

Certain guides will be specific to particular domains; popular guide topics include security, performance, scalability, accessibility, observability/monitoring, and reliability (backups), though many more are possible depending on the details and nuance of the product/service.

***Consequences***: Guides will often be the first set of documentation that developers will read when they begin their serious journey to understanding your product/service, and should therefore be something *very* carefully curated and edited. Consider using professional editing services and/or personnel to help ensure the writing is clear, consistent, and easily consumable.

Guides should link to the [Reference Documentation](#reference-documentation) liberally, relying on the reference docs to describe all of the different permutations and possibilities. This leaves the Guides to focus on the more commonly-used aspects of the product/service, and as a result stay streamlined and more easily consumable.

As the product/service becomes more widely used internationally, consider hiring translation services to create native-tongue transations of the guides into languages that represent your customer population; if you find that your product/service has a singificant user base growing in Eastern Europe, for example, consider a Polish or Czech translation.

Recognize that in many cases, the ability for an individual in your community to make the transition to [Ambassador](#ambassadors) lies in the ability to consume conceptual documentation about your product/service and then utilize that knowledge in [Forums](#forums) and to create [Conference Sessions](#conference-session) and [Articles](#article). Provide opportunities for your Ambassadors to collaborate on the authoring and editing of these documents, perhaps even before they become publicly available.

A [Book](#book) often covers the same material covered in Guides, but usually takes a more "high-level" approach to describing the contents, stretching across topics in ways that Guides typically don't. Books also often don't go into quite the depth of detail that Guides do, and look to be shorter than the full collection of your Guide(s).

***Variants***:


<div id="hackathon" /><hr/>
#### Hackathon
*Code, Social*

Code-for-24/48/72-hours on whatever sounds interesting. External: often around the product/service. Internal: on whatever the company developers find interesting. DevRel can either be coaches, organizers, or both.

***Also Known As***: GiveCamp. Startup Weekend.

***Problem***: A community of developers using your product/service helps to generate the feedback and engagement that your DevRel team needs, but there doesn't seem to be as much as you'd like. In some cases, you have a community, but they're using an older version, or aren't using the product/service for certain scenarios.

***Context***: Developers are a notoriously fickle lot, in that trying to tell them what to build will often generate resistance and/or pushback. The creative aspect to building software is what draws many to the field, and many developers aren't given much opportunity to exercise that creativity in their workplace.

For some products/services, the target personae are those that are entrepreneurs or innovators, particularly those that are in a city well-known for its startup "vibe" (such as the Silicon Valley, New York, Seattle, and a few others). These are locations in which developers leave the comforts of corporate life to pursue the statistically-risky space of startups, and are often looking for products/services that will allow them to get-to-market more quickly and get their product out in the hands of users.

***Solution***: Create, or sponsor, an event in which developers come together specifically for the purpose of "hacking" code to build an application or system. Usually such events are open to the public, and the teams that are formed are entirely temporary, made up of those who found a pitch idea to be interesting to work on. The events typically last anywhere from 24 hours to 5 days, and the shorter timeframe often implies an all-night kind of exercise; many of the original hackathon events were weekend events, beginning with pitches on Friday night, then "hacking" continuously for the next 48 hours and concluding on Sunday evening.

***Consequences***: Many events are public, [Sponsored](#sponsorship) by various vendors and/or other interested parties, and many offer prizes to teams whose hacked project ranks best in one of a variety of categories. The top prize often depends on the intent of the event--at Startup Weekend, for example, the top prize was an opportunity to meet with VCs and pitch them on the startup idea "hacked" together over the weekend, while at GiveCamp, "prizes" are often more celebratory in nature, offering up rounds of praise for those who "hacked" projects together on behalf of charities.

Company participation in a hackathon can come in many forms: direct sponsorship of the event as a whole, sponsorship by providing one or more of the prizes, sponsorship by providing free licenses or credits of the product/service, providing coaches and expert advice (either around your product/service or across a broader range of topics), and/or your company's employees' participation in the event itself. (Participation in the event is highly suggested for charity-centric hackathons, as it generates good feelings toward the company, gives the developers a good feeling of helping those in need, and generates good PR for the company.)

Some Hackathons provide time and space for presentations by sponsoring companies and/or experts/coaches that are volunteering their time at the event; these are essentially [Conference Sessions](#conference-session) but for the Hackathon audience instead of a conference. Many of the presentation slots are given to [Sponsors](#sponsorship). It is common that less than 10-15% of the attendees will come to a talk, but those that do are often extremely interested in using the topic as part of their hacking project.

Hackthons are also a great place to hand out [Swag](#swag), and/or have a [Booth](#booth) (more like a table) as part of the company's [Sponsorship](#sponsorship) of the event.

If the Hackathon is internally-facing, it is often done in conjunction with an internal [Conference](#conference), to help the company foster a culture of training and innovation. "Vendors" in this scenario are often company internal services or platforms, and "coaches" are often the senior developers, architects, and SMEs who assist the ad-hoc teams working on ideas that may or may not be company-related.

Logistics management will be important for a Hackathon depending on the degree to which the company chooses to participate: attendance will require physical presence (travel and hotel, if the hackathon is not local to the participants), and sponsorship will require greater work, depending on details. Consider having an individual on the DevRel team serve as "point of contact" for all logistical issues around the Hackathon. 

***Variants***:

* **Code With Us**. **Open Labs**. Rather than holding an event in which many different groups of people come together to hack on something short-term for a short period of time, customers may be looking for opportunities to hack together with experts on the product/service in a more collaborative and focused fashion. (These "open labs" were a popular Apple tactic during the days of OpenDoc.) The customer is free to bring whatever code they have or are working on, and either company engineers or (more often) members of the DevRel team sit and pair (or "mob") to work through a customer's concerns or obstacles for a period of time, usually a day, sometimes two. These can be on-site at the customer's location, on-site at the company's location, or possibly virtual (if the interactivity is good enough--paired editing and/or jumping up over to the whiteboard is very common in these activities, and the virtual experience may not yet quite be up to the task). These are usually scheduled, rather than impromptu, and considered private.
    Note that, although similar, this is still different from a [Code Review](#code-review), in that a Code Review is usually *post-facto*, after the customer has written the code, and the Open Labs are usually *pre-facto*, taking place much earlier in the development cycle, sometimes before any code is written at all.
    Customers might have NDA concerns about bringing their proprietary/closed-source language to be viewed (and hacked on) by developers outside their company (not to mention any IP ownership concerns), so have Legal draft a document that customers and your DevRel team participants can sign so as to allay concerns ahead of time.


<div id="hands-on-labs" /><hr/>
#### Hands-On Labs
*Code*

Focus is entirely on the writing of code; sometimes a sequence of steps for a developer to do unguided or with minimal ahead-of-time instructions or lectures.

***Also Known As***: Codelabs; Homework

***Problem***: You want developers to get some "practice time" in using your product/service, but getting started and/or figuring out how to accomplish certain larger multi-step tasks can be difficult for developers to figure out on their own. 

***Context***: Sometimes the product/service is complex enough that self-directed exercise is difficult for developers. The product/service might also be one that has subtle nuances that won't be obvious to developers until they have seen it "in action" or worked their way through a particular problem or set of problems. Or you may find from your [Customer Check-ins](#customer-check-in) or [Customer Pre-Sale meetings](#customer-meeting-pre-sale) (or from your [Tech Support](#technical-support) metrics) that a particular aspect of your product/service is tricky for developers to understand, or are mis-using regularly. It's clear customers don't understand your product/service well enough.

***Solution***: Some developers prefer to "learn by doing", so provide them with a coding challenge that takes a non-trivial amount of work to complete, along with documentation that provides "steps" for developers to follow to complete the challenge. (Challenges here don't necessarily mean "puzzles" or "riddles"--the classic "To-Do List" example application posted by some front-end frameworks is a good example of a Hands-On-Lab possibility.)

Walk developers through a series of smaller exercises to accomplish the larger task. Ideally each such "step" should take someone familiar with the material no more than an hour (at most!) to complete. Assume that it will take your audience (unfamiliar with your product/service) four to five times longer than yourself; even longer if you are the one creating the Hands-On-Lab.

Provide a "solution" for developers to examine against, so that those who get stuck have someplace to go to get more information and/or working code that they can compare against their own. Many Hands-On-Labs are stored as a series of branches in a public GitHub repository, allowing developers to use tooling with which they are familiar, and in turn allows them to switch between branches (or view the branch online at the GitHub website) if they get stuck.

***Consequences***: Hands-On-Labs are often a good pairing to [Guides](#guides): the Guide explores a particular concept, then the Hands-On-Labs reinforce that concept with code.

HOLs should take a developer unfamiliar with your product/service anywhere from one day to one week to complete--any shorter and they aren't complex enough, and any longer and developers won't finish them.

Make sure the steps aren't too high-level or too low-level. "Build a database" is probably too high-level and vague; "Click this button and then type 'foo-bar-quux' into the name field" is probably too low-level and insulting to the developers' intelligence. Calibrated the instructions to your target persona's experience level as a developer, and verify that by asking developers of that level to try them.

Hands-On-Labs are often conducted alongside or as part of a [Workshop](#workshop); in an in-person event, the difference between the two is often the presence (Workshop) or absence (Hands-On-Labs) of presentations introducing the topics and/or an instructor making themselves available for questions during the exercise. Most Hands-On-Labs are self-directed, self-paced activities, done individually (although generally nothing prevents pairing or "mob programming" if desired).

***Variants***:

* **Certification.** One way to help customers self-identify (and silently promote your brand) as being experts in your product/service is to offer up a formal, branded certificate that offers your company's endorsement of the customer's skillset once the customer has completed one or more of the Hands-on-Labs successfully. If your product/service is broad enough or deep enough, offer several different certifications, each with an associated set of Hands-On-Labs that developers must go through (successfully) to claim.


<div id="live-playground" /><hr/>
#### Live Playground
*Code*

A live, executable environment in which customers can explore the product/service without having to go through the steps of installing/configuring it themselves.

***Also Known As***: Sandbox; "Try" site

***Problem***: Developers want to "get their hands dirty" on your product/service, but aren't installing it (if it runs locally) or aren't creating accounts (if it is cloud-hosted) to explore it further. You want to reduce the barrier-to-entry as far as possible, so that there is no reason they cannot start "playing" with your product/service as quickly as possible.

***Context***: Your product/service may have a complex installation process, requiring several distributed system services all configured to find each other, or there is a large amount of configuration to consider. Or your product/service may hae a large install footprint, and require significant amounts of time to download and install.

***Solution***: Create a website/domain that is a "sandbox" in which a developer can explore the product/service directly, without any commitment on their part.

***Consequences***: Operating a Live Playground will most likely require some commitment from your Operations staff, either in the form of direct Site Reliability Engineering support or direct Engineering support. At the very least, you will probably need some sort of budget for the hosting, as well as whatever up-front cost building out the Live Playground might require. This also implies some amount of maintenance, such as keeping the Live Playground up to date with whatever the v.Current version is.

The Live Playground makes an excellent basis for conducting [Workshops](#workshop), and often provides a convenient backdrop for [Tutorials](#tutorial) and [Guides](#guides). You might even show screenshots from the Live Playground for the [Reference Documentation](#reference-documentation).

Some customers may actually find the restrictions of the Live Playground still sufficient for their needs, at least through a prototyping stage, and that means there is a possibility that a customer could "go live" with the Live Playground as their production service/environment. Your company may have strong reactions to this idea, so make sure the ramifications are carefully thought out: this may be the "freemium" tier that your company offers, for example. If this is undesirable, then consider your options to persuade or force customers out of doing this: put Legal text in a frequent reminder to customers that this is not to be used for production purposes, or wipe out the Live Playground on a periodic basis (which will help with abuse, mentioned below), or throttle the Live Playground in some severe way that would dampen its ability to serve in any production capacity to anything but a prototype.

Sadly, making any resource available for free over the Internet--even if it is just comments on a webpage--is target for rampant abuse by malicious or immature actors. Ensure that if your live playground is accessible without some kind of gated entry (account login), you have procedures in place to safeguard it or at the very least reboot/wipe clean the environment periodically. Otherwise you could end up hosting content that be embarrassing, damaging, or illegal.

***Variants***:

* **Docker install.** The Live Playground will often be slower than executing something locally because of Internet latency and bandwidth restrictions. For some products/services, this will be undesirable, and/or developers sometimes simply prefer to "have it locally" so that they can experiment while in places with little or no network connectivity. (This may be much more necessary for those who work in highly-secure or network-isolated environments that do not or cannot have a regular Internet connection.) By providing a version of your product/service that can be installed locally via Docker, you give developers a chance to one-line-install your product/service, explore it for a while, and then one-line-delete it without having to do any additional configuration cleanup. NOTE: Docker installs are copying software down to the developer's machine, so if your product/service contains proprietary/closed-source code, you increase the ease by which malicious actors can obtain your binaries for reverse-engineering.


<div id="live-streaming" /><hr/>
#### Live Streaming
*Code, Social, Budget*

***Also Known As***: Twitch. Vimeo.

***Problem***: You want your DevRel team to get more "face time" (a high degree of interactivity) with customers in a coding-related activity but without them having to travel to conferences. You'd like them to do something that has a high degree of Reach, but [Webinars](#webinar) or recorded [YouTube videos](#youtube) are too one-way to generate the interactivity you'd like.

***Context***: Developers often like seeing the people behind or around a particular technology--more than one company has found some significant value in having a "face" to their brand, creating something of a "developer rock star" that draws a crowd during events (physical or online). Doing so requires developers to be able to see the individual on a regular basis, and feel like there is some kind of emotional connection to them, which usually implies a high degree of interaction. 

This high degree of interactin is often more easily facilitated by choosing a setting that is more informal than formal; developers feel more comfortable approaching someone at a [User Group](#user-group-network) meeting than approching the speaker after a [Conference](#conference-session).

It is also (contrary to most popular beliefs) endearing to developers to see people they respect struggle with certain situations or problems; it makes the observed individual seem more human (and therefore more approachable). It can also be instructive to see how other developers approach problems while still struggling with a solution, rather than seeing the "finished product" that usually appears in a [Sample/Example](#sample-example)

***Solution***: Use on of the "live streaming" platforms (Twitch, Vimeo, YouTube) to capture informal, longer-form video. Live streaming is similar in tooling to the [Webinar](#webinar), but the "vibe" is very different--where webinars are more formal presentation-like affairs, often intended to be one-way (with some interactivity in the form of questions from the audience), live streaming often is much more *ad hoc*, with streamers frequently seemingly doing nothing more than "turning on the camera and starting to code something interesting".

Topics for the live stream can range widely; some live-streamers have no agenda other than "I'm going to code something today that I've never built before" to show participants their process when building, including mistakes, while other live-streamers have a more focused agenda.

***Consequences***: Interactivity in a Live Stream is often very high, as the various streaming platforms allow for comments, as well as "likes" and other emoji-fueled effects to appear on the screen during the stream. Streamers will often take their efforts in different directions based on the commentary and reactions from participants, including suggestions on what to do next, how to solve a particular problem, or even collaborate to solve a bug or other issue. (Note that most streaming platforms only allow the streamer to display their video and audio, so all commentary from participants is done through chat messages to the stream as a whole.)

Because of the nature of displaying both the streamer's screen and the streamer's video simultaneously or side-by-side, streaming requires some investment into equipment and a good Internet connection. This usually means it is difficult to do anywhere except in "the studio" (sually the streamer's home or work office), and will thus conflict with travel schedules somewhat. (Some streamers have worked to make their streaming setups portable so that they can stream from hotels while on the road, but this is yet somewhat rare, at least as of this writing.)

Recordings of the live-stream often don't need much by way of editing (although it should be reviewed before publication, in case there is a violation of the company's code-of-conduct to avoid legal liability), but do need to be stored someplace publicly accessible. [YouTube](#youtube) is a common place to store these, for the same reasons it is useful to store [Podcasts](#podcast).

Keep in mind that the live-stream is, as the name implies, live, and participants on the stream may turn out to be malicious individuals with goals that differ from yours (and, more importantly, are a violation of your code of conduct or not emblematic of the image your company wants to present). The live-streamer will need to be ready to handle those situations, moderating and/or removing those individuals as needed.

Your company may also have certain concerns around the potential liabilities of live-streaming and the potential dangers of an "open mic:, so you may want or need to run the idea past Legal beforehand.

***Variants***:


<div id="newsletter" /><hr/>
#### Newsletter
*Writing*

Recurring (monthly) emailed newsletter sent to opted-in customers. Include links to other artifacts (articles, samples/examples, etc). Works well in conjunction with [Social Media](#social-media).

***Also Known As***: Zine

***Problem***: Customers are always surprised to hear of news about the product/service over social media and not from the company itself. You want to find ways to give them better opportunities to hear the news directly from the company, without coming across as "spammy" or "in your face", which could turn customers off.

***Context***: Developers often want to know about new features, but they want to know about them on their own time, and not have the news forced on them.

***Solution***: Create a periodic newsletter that is emailed to an opt-in list of customers and/or other developers, consisting of a mix of technical articles about your product/service, news about your product/service, and wider news about the technical domain your product/service is in. (For example, if your product/service is a financial services service/API, then periodically share major news about the larger financial services cloud space.)

***Consequences***: Keeping the rhythm of the newsletter going is crucial, and managing the pipeline of content is a major task. Consider hiring a technical writer to assist with the creation of articles and news, and/or a copyeditor to help with proofreading and "tone" of the articles. In addition, consider hiring an editor to oversee the newsletter full-time, including the process of acquiring new content for the pipeline. Also, start with a period that is far enough apart to allow for steady publication (every other month or quarterly is not unusual as a starting point) until you have enough content for six months' worth of publication, and only then "compress" the period down (quarterly to twice-quarterly, then monthly, then twice-monthly, then weekly, and so on). Regardless of how much content you have, don't go faster than your editorial process can handle.

Finding that content on a regular basis can be difficult, particularly if your DevRel team is occupied with other tasks. Look to other engineers within the company who are interested in growing their individual brands (and make sure to provide them with "bylines"--author credit--on any piece they write), as well as to your [Ambassadors](#ambassadors). Many of the articles written here could be repurposed into (or from) other [Articles](#articles), but make sure to check with the third-party publisher for any concerns of exclusivity--many publishers want to be the only source of original content for some period of time before allowing re-publication.

Keep in mind that commitments to publication from employees at your company other than your DevRel team are likely to be secondary commitments (when compared to their "day jobs"), and be prepared for deadlines to be missed. You might be able to get other managers to help their employees keep to their commitments, but remember that they usually have differing goals than your team does, so be flexible.

Newsletters are an excellent way to advertise upcoming [Conference Sessions](#conference-sessions), as well as to announce any particularly relevant [Samples/Examples](#sample-example) that relate to the news or articles included in this newsletter. (For this reason, even if you hire an editor, consider strongly having one of your Dev Advocates do a technical-review pass on each newsletter and suggest relevant items.) Make sure to reference your newsletters from your [Social Media](#social-media), [Live Streaming](#live-streaming), and/or [Podcast](#podcast), and vice versa. 

As you build out your [User Group Network](#user-group-network), consider offering opportunities for each user group to put an "advertisement" into a newsletter, as a way of increasing user group attendance, particularly those in major cities. 

***Variants***:


<div id="office-hours" /><hr/>
#### Office Hours
*Social*

***Also Known As***: 

***Problem***: Customers often run into problems that are hard to capture as a standalone [Sample/Example](#sample-example) or in a written format for a bug report for [Tech Support](#technical-support) or a [Forum](#forums). In many cases, they don't have any idea what's going on because the product/service is complex, intimidating, or running in the cloud. The customer doesn't even know how to begin to describe the problem, making it difficult for them to take advantage of some of the other high-reach resources that are available.

***Context***: This kind of "I have no idea where to start" problem demands a high degree of interactivity from the customer: questions lead to answers that in turn generate more questions before the nature of the problem is even remotely understood. Additionally, you want to be able to see the customer's environment more closely, because often debugging a problem can be something entirely enmeshed in their environment (misconfigured installation, PATH conflicts, "DLL/JAR/Assembly Hell" issues, and so on).

***Solution***: Provide an "office hours" (similar in concept to what college professors offer students in their classes): a period of time during which customers can "drop in" without scheduling anything ahead of time and use the time for whatever purpose they choose. They can ask questions, do a [Code Review](#code-review), do a quick [Check-In](#customer-check-in), or (most often) work on something [Technical Support](#technical-support).

***Consequences***: Office hours are time-consuming, and can often seem like a waste of time if nobody attends. (This is true for university professors, too!) It will be particularly sparse when first getting started, as it is not a common tactic used by a number of teams or companies. Advertise it frequently (on your [Social Media](#social-media), in your [Newsletter](#newsletter), and/or maybe from your [Reference Documentation](#reference-documentation)), and give it a quarter or two, minimum, before drawing significant conclusions.

Consider recording office hours, both for opportunities for reuse as well as for your own internal improvement purposes (such as evidence of customers asking for particular features or finding particular features). If you do this, however, make sure you are in compliance with legal requirements around recording--some places require only to notify participants that they are being recorded, others require consent (which can be captured with a web form before entering into the Zoom/Teams/Discord/whatever video chat). Also be up-front about the use of the recording; if you intend to use it in any public capacity, absolutely make that explicitly clear to the participants.

Office hours are often a great tool combined with [Live Streaming](#live-streaming), and in fact either can be a nice segue into doing the other--office hours can give suggestions on what to live-stream, for example. Keep in mind that Live Streaming tooling prioritizes high-reach more than interactivity, however, so the two are not entirely interchangeable.

Consider capturing any significant code built during office hours as a [Gist](#gist), or if the code is much bigger, as a [Sample/Example](#sample-example). Make sure, if you do this, to get the customer's OK, on the off-chance that they are discussing something with you that they consider a secret or competitive advantage. (Legally, there may be no liability, but the last thing you want is to ruin a potential partnership or end a relationship because you gossiped about a new feature the customer hasn't announced yet. However, it wouldn't hurt to talk with Legal to make sure there's no liability!)

***Variants***:


<div id="podcast" /><hr />
#### Podcast
*Social*

***Also Known As***: Vidcast

***Problem***: You want to improve the feeling of "connection" to your customers, and provide a more "human" face to your product/service, company, or team, but in a relatively high-reach manner.

***Context***: Reading a website has all the "human-ness" of staring at a billboard or reading a brochure, and often offers the viewer nothing in the way of culture or engagement. The phrase "putting a face to the name" (and, for that matter, even just knowing the name!) is a common one that indicates that the more humans can see other humans, the more we begin to feel a degree of connection or empathy to the company, team, or even the product/service itself.

***Solution***: Create a series of recordings (audio-only or audio/video) in which one or more members of your DevRel team host a variety of different individuals for an interactive conversation about one or more particular topics relevant to your product/service, your customers' concerns, or the larger technical domain in which your product/service exists.

The conversation can be formal or informal, but keep in mind that the formality of the conversation will have a great deal of impact on how the viewers/listeners perceive the culture of the company. If, for example, the desire is to project a very formal and corporate-friendly culture (so as to be more attractive to more formal corporate environments, like financial services firms), then having a more scripted format helps present that. This may come as a "turn-off" to smaller, scrappier-culture companies (as in, startups), however, so a more informal, free-wheeling conversation can help project that image instead.

***Consequences***: The choice of "audio" or "audio and video" is a complex one, and one that will depend on a variety of factors. Audio-only is easier to capture, but video provides another dimension of capture, particularly with guests who are animated when they speak. Video does require greater bandwidth, however, both at time of capture and when being viewed, and keep in mind that many podcast consumers do so while doing other activities (driving to work, for example) which preclude being able to watch what's happening on-screen. Video is also more complex to edit. If in doubt, consider doing audio-only at first, and if your audience starts agitating for video, or if there are reasons to support it (such as screen-sharing during the podcast).

Finding guest participants will be a significant time commitment. While there are many, many people in the technology industry who are excellent podcast guests, you will want to find people who are somehow relevant to your product/service, and are willing to be a "friendly guest" (as in, someone that isn't a competitor or isn't going to subtly bad-mouth your product/service) on the show. You are not interested in "cross-examination" of a "hostile witness" on your podcast, you are interested in providing content that is both interesting and entertaining. (Leave the "shock jock" radio DJ antics to the radio.)

Recording a podcast/vidcast requires not only the time to record, but also time to collate (certain recording tools will record locally on each participant's machine, then the localized audio and/or video streams are combined into one finished format), edit, potentially convert to different formats, upload/store the finished stream someplace publicly accessible, as well as write "advertising copy" to notify interested customers and/or other developers in the content.

Some podcasts are scheduled and held live (usually over a video chat platform) so as to facilitate open Q&A from audiene members, and/or to allow for targeted questions from a certain user community. Doing so requires choosing a time, however, and that will often make live consumption uncomfortable for two-thirds of the timezones in the world. Noon PST, for example, which is easily accessible to individuals residing in North or South America, will be late-night in Europe and middle-of-the-night or pre-dawn in Asia. If your audience is global, consider varying the scheduled time for live participation to allow for participants from other regions. (Also, consider the guests' own timezone!)

Another consideration around live podcasts is that of potential mistakes or liability from what is spoken; many guests, particularly if they represent large companies, will want to make sure there is an opportunity to edit out any accidental reference to topics that large company does not want discussed on your podcast. You will also want to weigh the opportunity to edit the podcast to ensure it follows your company's code of conduct policies and/or meets your desired projected image against the increased interactivity of a live recording.

Podcast platforms also typically have some form of notification system in place, in which interested individuals can subscribe to receive notifications (and sometimes automatic download) of new episodes. This can also help draw more interested parties to your content, since most of these platforms have the ability to categorize ("tag") your podcast to certain kinds of audiences, or with certain keywords, or as being similar to other podcasts, and so on. The platform can then suggest your podcast to those who consume similar content. 

[YouTube](#youtube) is a common place to host and share podcasts, which provides the potential for extensive reach. However, YouTube has come under criticism in recent years for its suggestion algorithms, often leading viewers to content that may not be in keeping with your company's image or culture. Pay careful attention to any feedback your customers provide around any concerns or unpleasant experiences there.

Podcasts also are a great segue into or from [Live Streaming](#live-streaming); live-streams can find topical material from conversations had from a podcast, but podcast conversations can also be inspired from experiences has from a live-stream.

***Variants***:



<div id="product-development" /><hr/>
#### Product/Service Development
*Code*

DevRel works on integration endpoints (a la APIs) for connecting or extending the core product/service.

***Also Known As***: Extensions; Providers

***Problem***: Certain aspects of the product/service are not easily accessible (or accessible at all) to the community, and the company has deemed it necessary that they should be. Engineering arguably should be focused on providing this, but can't due to constraints (time, budget, bandwidth, etc).

***Context***: Ideally, many of the extensions or integrations discussed can and should be written by third parties outside the company, in order to avoid the maintenance burden that would come with developing them "in-house". But for whatever reason, third parties haven't built those extensions or integrations, either because they lack access (the product/service is tucked behind the firewall and the code is not public), knowledge (they do not know the integration or extension points exist, or how to use them), or rationale (they do not have reason to build them).

***Solution***: Have the DevRel team take time to build the integration or one (or more) extensions.

***Consequences***: If the integration is connected to something internal that must remain internal (such as internal services or databases), chances are that maintenance of this integration will need to be continued and upheld by the DevRel team until such time that it can be handed off to Engineering to own. (And it should be handed off!) Note that [Technical Support](#technical-support) will be needed on it, so the sooner it can be "folded in" to the larger product/service offering, the better, particularly as customers make more and more use of it.

If the integration or extension is built as part of a customer or partner deal, 

***Variants***:

* **API Gateway**. For larger companies with silo'ed internal services that have little-to-zero commonality or standardization to their endpoint description or implementation, it sometimes falls to the DevRel team to build a single-point-of-access for customers to integrate against, providing a standardization layer before "farming out" the API call elsewhere into the collection of internal services. Often this Gateway is built to be accessible over HTTP, although any distributed protocol could work: HTTP, gRPC, GraphQL, or a messaging tool. In these cases, DevRel is taking on more of an Engineering role, because until the Gateway can be re-homed into an Engineering org, DevRel will need to treat the Gateway with all the rigor and discipline that any Engineering product would demand: on-call support, bug triage, version (and revision) management, and so on.


<div id="reference-documentation" /><hr/>
#### Reference Documentation
*Code, Writing*

Precise documentation about the API, interfaces, classes, or whatever makes up the "surface area" of the product/service with which developers interact.

***Also Known As***: 

***Problem***: Customers using your product/service will need to know all the possible configuration, parameters, types and effects that your product/service uses or depends on. While they could crawl through the source code to figure out the implications and ramifications (assuming your product/service is open source), doing so is extremely labor-intensive and always subject to change with each passing revision or pull request.

***Context***: Customers will want this information to be handy, searchable, and in some cases integrated with as many of their developer tools as possible; at a minimum, it will need to be something that can be linked publicly, so that it can be referenced from [Forum](#forums), [Articles](#article), and [Blog Posts](#blog-post).

Developers need comprehensive information that is the "final word" on what your product/service does, aside from running the code. If your product/service is not open-source or is cloud-hosted, this will be the only way customers will know how your product/service behaves without painful and time-consuming experimentation/trial-and-error.

***Solution***: Create a set of documentation that is publicly accessible, possibly derived from the codebase itself, that is comprehensive and complete. Reference documentation should focus on the "what" of every publicly-accessible aspect of your product/service.

***Consequences***: Reference documentation is often a large undertaking, and will require a great deal of time and energy to create, update, and maintain. Keep in mind that automatically-generated documentation can only go so far, and will be dependent on the developers' willingness to document the code extensively. (For example, the `javadoc` documentation-generation tool can build documentation from the names and structure of Java classes and methods, but cannot infer anything beyond the names.)

Where reference documentation focuses on the "what" of your product/service, consider using [Guides](#guides) to explain the "why" or the "how", as appropriate.

Consider having a third party review your reference documentation, and file issues or bug reports against insufficient documentation or documentation that doesn't tell developers anything further than the name of the thing in question.

Consider open-sourcing your documentation, such as hosting the documentation as a GitHub project, such that others outside your company has access. This will allow others (such as [Ambassadors](#ambassadors)) to find incorrect or incomplete elements of the documentation and submit changes or pull requests to correct it.

***Variants***:

* **Knowledge Base** Often, after a product/service has been out for a while and has gathered a fair amount of experience in its [Technical Support](#technical-support), it's easy to find patterns of questions and problems that customers are having. The larger the customer base, the quicker those patterns will emerge. In an effort to try and provide a high-reach/low-interactivity customer support option, put together (and continue to update and curate) a formalized collection of questions or topics into a website or queryable database, called the knowledge base, and make it available online. (In many respects, StackOverflow is a community-curated knowledge base for programming.)


<div id="sample-example" /><hr/>
#### Sample/Example
*Code*

Fully-executable code but single-focused for third-party developers to use as a learning exercise.

***Also Known As***: Demo

***Problem***: You want to show developers how to use your product/service, but there are enough details and/or need for precision that human language isn't sufficient to get the point across. You want developers to be able to see how to use your product/service from code.

***Context***: The product/service is one that is callable or usable from code, and is one that developers will use from code often. You want the code to be visible to as many developers (customers or otherwise) as possible, maximizing its reach.

***Solution***: Write code that illustrates a particular aspect or point or element of your product/service. Keep it as simple as possible--leaving out validation, security, edge-case handling, and so on--so as to focus primarily on the single core idea that your sample/example is looking to solve. Place that code someplace widely accesible (such as GitHub, your [Guides](#guides) or [Reference Documentation](#reference-documentation), or your [Forums](#forums)) so that developers can discover the code as they learn more about your product/service.

***Consequences***: The sample/example needs to be small enough to illustrate a single point, only, or you run the risk of developers being overwhelmed with too many details and losing track of what's going on. For this reason, while samples/examples are executable, they typically do exactly one thing and nothing more.

Note that developers are fond of taking samples/examples and using them "as is" for their own work, changing only those elements which are necessary to get it working inside their own applications. This often means that if the sample/example contains no validation or security, then the developer will also often leave out validation or security. Make sure Legal drafts a disclaimer for all sample/example code reminding developers that this code is *not* production-ready.

***Variants***:

* **Exploration Tests.** Code that is written in the style of unit tests and making use of unit test runners, but intended to explore or provide examples of how to use your product/service, rather than testing all of the inputs (as [Tests](#tests) are intended to do). Exploration tests will be smaller (since they rarely need to be exhaustive), and often more coarse-grained (because many will include multiple steps, something frowned upon in most unit tests). Note that exploration tests are also useful as new versions of the product/service are close to release, to verify that no accidental breaking changes are introduced.

* **Gallery.** **"Kitchen Sink" Demo**. You want to provide customers with a wide range of samples/examples, but you also want them to be able to see what each looks from the user perspective and don't want developers to have to build each sliver of a feature in order to see it. By gathering all of the samples/examples into a single executable application, where each sample/example is its own selectable option within the Gallery, you keep the sample/example code isolated enough to allow customers to easily focus in on the single sample/example, while still keeping it to a single executable application.

* **Reference application.** A reference app is one that is intended to be more of a complete/comprehensive demonstration of the product/service, solving a (often fictitious) problem or providing capabilities to a (fictitious) company. Here the code can do many of the things that are left out of samples/examples--such as validation and security--because the reference application is more about how all the parts fit together, rather than just examining any single part. In fact, in many cases, the reference application is one that has too many parts, and is over-engineered to have more features or capabilities than is strictly needed for the problem described.


<div id="sdk" /><hr/>
#### SDK
*Code*

Library of code intended to be used "as-is" as either the sole means or a helpful abstraction (layer on top of HTTP APIs) when using the company's software.

***Also Known As***:

***Problem***: Your product/service is an API, using HTTP as its primary form of communication with customer code, but like all HTTP APIs, it is loosely-typed and can accept a wide range of values for each HTTP request, many of which will yield errors or incorrect results. Getting the requests correct is often an exercise in frustration and time as developers struggle to ensure they are passing the right data in the right places.

***Context***: Developers, particularly those working with statically-typed languages (Java, C#, Kotlin, Swift, and so on), are accustomed to using tools that generate errors at compile-time, rather than waiting until runtime to discover that things aren't working. Additionally, it takes time and multiple lines of code to marshal the parameters into something HTTP can transport, and then to unmarshal the response back into the native data types of the language, including handling any errors indicated by the return value. If the API is called frequently throughout the customer's code, this all representa additional code that customers must debug and maintain for the length of the project.

Additionally, when exploring a new product/service, developers experimenting with the product/service want (dare say need) the quickest way to get started with the product/service, in order to be able to ascertain if it is of use or how to use it.

Because of its loosely-coupled nature, working with HTTP from code requires more attention to detail than using native constructs (classes, functions, modules, whatever the language uses as first-class citizens), adding to the learning overhead.

***Solution***: Even though the API (HTTP-based or otherwise) technically is accessible from any language that speaks HTTP (which is to say, all of them), provide an SDK that encapsulates the details of making those HTTP calls into something that is language- or platform-friendly.

***Consequences***: This SDK can be open-sourced, adding to the company's open-source profile, which for some companies will also be a gentle introduction to doing more open-source work in general. This also provides the company an opportunity to explore how to use open-source development practices more fully without taking undue risk with the code or processes around the product/service.

***Variants***:


<div id="social-media" /><hr/>
#### Social Media
*Social, Writing*

Typically used for light customer contact and announcements.

***Also Known As***: Facebook Groups, Twitter, Mastodon, LinkedIN

***Problem***: Keeping developers' attention is never easy, considering all the different tools and technologies that vie for their attention. You want your product/service to be "top of mind" to them, even if they've already purchased it or adopted it, because greater adoption means more feedback and (potentially) more activity and community. Therefore you want to keep a moderate degree of interactivity with your customers (and potential customers) with a wide reach.

***Context***: While you could always make use of a [Newsletter](#newsletter), many developers already receive too much email in their inbox, and refuse to add to the pile, even for tools they use every day. It's possible, with enough budget, to purchase billboards and highway signs, but these are fairly low-"hit"-rate options, since there's no guarantee that developers will drive past them or even recognize them when they do.

***Solution***: Make use of the various Internet social media platforms that developers already use to notify them of [Conference Sessions](#conference-session), to come visit the [Booth](#booth) at an upcoming event, interesting [blog posts](#blog-post), [Sponsorships](#sponsorship), published [Articles](#article), the official welcome to your new [Ambassadors](#ambassadors), and so on. Use the posts as opportunities to draw some greater interactivity by following all of the current social media suggestions, like asking open-ended questions and generous re-posting of related responses, particularly from your customers.

***Consequences***: Deliberately choose your target social media platforms. No one social media platform is without its issues: Facebook/Meta groups and Twitter have historically been popular, but recent shifts in public perception of their corporate leadership have led large numbers of developers away from using those platforms. (Some even look down on those who continue to use them.) Instagram and TikTok are more popular with younger generations, but each has run into its own particular brand of difficulty. LinkedIn is often ignored by developers until they are looking for a job. And so on. Keep in mind that each has its own demographics and its own "culture", and choose those which most closely match that of your target persona and your company's brand and culture. Legal should be consulted around any corporate concerns or restrictions around posts.

Note that it is extremely likely (and desirable!) that individuals on the DevRel team will have their own, personal, Social Media accounts. Resist the temptation to ask the DevRel team to "be" the social media for the company, and instead create "corporate" social media accounts on each social media platform of interest. 

Remember that much, if not most, of the goal of social media is interactivity, which means responding to others' social media commentary and comemnts as much as posting your own. While the DevRel team can certainly add "checking the feed" to their list of responsibilities, it will feel much more responsive if this is a part- or full-time commitment on the part of somebody within the DevRel team. They do not need to be a full Developer Advocate; in fact, it can often be a nice "half step" for a junior/associate DevRel team member to take on managing the social media community. Content (posts, etc) can be created by others, then "pipelined" for release (just as with [blog posts](#blog-post)).

Follow (and amplify) the posts of those the DevRel team (and the company as a whole) interact with: partners, [Ambassadors](#ambassadors), the [User Group Network](#user-group-network), and [Sponsored Organizations](#sponsorship). In particular make sure to draw attention to the DevRel team's activities such as [Articles](#article), [Conference sessions](#conference-session), [Webinars](#webinar), [Hackathons](#hackathon), any [Books](#book), and so on.

Keep in mind that many developers find a more "tongue-in-cheek" tone to corporate social media more attractive than formalism, so look for ways to "have a little fun" with the account without losing sight of the purpose (interactivity).

If your Social Media activities are successful, your customers will begin to rely on the channel as a way to contact the company, possibly even bypassing other (more formal) communication channels. This can allow for a greater "organic" level of communication, but might also lead your customers to bypass those channels (such as those for [Technical Support](#technical-support), for example) in favor of the more informal world of social media. You will need to work ahead of time with the other teams inside your company to decide how you will "feed" messages from social media into their respective processes--for example, if a customer Tweets and claims to have found a bug, how will that Tweet be turned into a ticketed bug report?

***Variants***:


<div id="sponsorship" /><hr/>
#### Sponsorship
*Budget, Social*

Putting money into an organization's hands in exchange for visible branding to those who attend that organization's events or website.

***Also Known As***: Conferences; User Groups; Technology Advocacy Groups (Java User Groups, IASA, INETA, etc)

***Problem***: Your company needs some brand recognition among the potential customer base (as identified by a target persona).

***Context***: The company wants to be seen as being active, and supportive, in the targeted developer community, without taking on too much in the way of time commitment or ownership.

***Solution***: Provide some money to an organization that is holding some kind of in-person event that will draw attendees from a community that meets the target persona.

***Consequences***: Sponsorship requires budget, and will likely require somebody from the DevRel team to act as liaison between the event and your Legal and Accounting teams. Accounting will want an invoice to pay against (and information about who they are paying, addresses, etc), and Legal will likely want to review any agreements to be signed. This can take longer than you expect, particularly if the event or group is new to your company and they want to see some due diligence beforehand.

Make sure your [Social Media](#social-media) points out the sponsorship--this brings some additional attention to the organization/event and creates a more symbiotic relationship between the organization and the company.

Note that conference sponsorship does not prevent or assume [having a booth](#booth); where sponsorship flexes on Reach, the [Booth](#booth) focuses on interactivity.

***Variants***:

* **Ambassador Sponsorship.** At times your team will find it difficult to be present at an event or user group, either because you lack the bandwidth or the event is simply not a high enough priority in your planning to justify the time. In these situations, it can be helpful to present the opportunity to one of your [Ambassadors](#ambassadors): by covering their travel and expenses ("T&E") to go speak at the event, you help build their brand while at the same time bringing an expert to that group without sending one of your own people. NOTE: When building a [User Group Network](#user-group-network), consider this a minimal level of support necessary to get the group(s) bootstrapped and running.


<div id="swag" /><hr/>
#### Swag
*Budget*

Create and give away company- or product/service-branded gifts that developers find interesting, useful, and/or amusing.

***Also Known As***: T-shirts; Fidget Spinners; Flash drives; Flying Monkeys

***Problem***: You want developers to remember your company and/or your product/service long after contact, ideally in a positive manner.

***Context***: Constantly sending a developer communication, particularly if it is not initiated by the developer, is quick to "turn them off" to your company and/or product/service. Developers are also often excited by novelty (sometimes childishly so), and will often share their experiences with a novelty item found at a conference across social media for some period of time.

***Solution***: Provide a giveaway item--either a novelty item or something that has some level of utility to the developer in their daily life--that has the company or product/service logo branded on it, and hand them out (or ship them) to developers who express interest.

***Consequences***: Swag is almost always present any any [Booth](#booth). It is also not uncommon to see swag being given away at [Conference sessions](#conference-session), sometimes even with some kind of small "contest" or "test" attached to it. ("Answer a question and win a free T-shirt!" is one way to artificially boost Q-and-A/participation in a session.)

Swag is often obtained by purchasing through one of the many "swag vendors" who are accomplished at putting logos and/or messages on standardized items. Pens/pencils, notebooks of all shapes and sizes, USB flash drives, T-shirts, sweatshirt/hoodies, all are usually easy to obtain by going through the vendors' website and providing the appropriate shipping destination and a credit card. Larger companies may even have internal processes for obtaining swag, rather than dealing with an external vendor directly.

Novelty swag can sometimes backfire and create negative branding, particularly if it accidentally annoys a developer group or creates issues for conference organizers. T-shirts, for example, have long been handed out in men's sizes, which often alienates women; for any swag item, make sure to get a diverse set of opinions on it before committing to something.

***Variants***:

*("Flying Monkeys" comes from the year when Xamarin gave away a combination monkey/slingshot swag gift. They had a built-in elastic pull strap, and when let go, they would soar into the air and let fly a recorded monkey scream. Quite popular. By the end of the conference, monkeys were being shot at each other all over the vendor floor, screaming their monkey scream with every fling. Which may have made their popularity plummet very, very quickly--it depended on who you asked.)*


<div id="technical-support" /><hr/>
#### Technical Support
*Code, Writing, Social*

Accepting bug reports, triaging the bug, developing a fix or workaround, and communicating that back to the bug-reporter. The actual intake of the bug can come from a variety of sources (forums, email, etc).

***Also Known As***:

***Problem***: Customers using your product/service are inevitably going to find issues (or what they think are issues), and as the connection between developers and your company, you will be a first point of contact they will use to communicate with your company when they are stuck or believe they have found a bug or issue. Your customer is running into issues of one form or another with your product/service: Either it is not doing something it should, or it is doing something it shouldn't, or at least is behaving in a manner that is unexpected. It may be as simple as simply being "down", and they cannot correct the problem themselves.

***Context***: Formal technical support teams often have a formalized process by which they triage and handle (or escalate) technical support requests (tickets), in order to help that team focus on fixing the biggest-impact smallest-effort-required bugs. Each tech support team triages their tickets in a different manner, according to their policies and OKRs, and anyone looking for ways to circumvent this process often earns the wrath of the senior management of the technical support team.

Depending on the nature of your product/service, the technical support team may not be well qualified to handle developer technical support requests; for example, if your product/service is consumer-facing (like a cloud-based accounting system or an online gaming platform), the technical support team will likely be much more focused on working with end-user consumers, and not your developer-customers.

***Solution***: Dedicate some portion of your team's bandwidth to acting as a first-tier technical support team, either handling the issue entirely or passing it on internally to others better able to track the problem down. Continue to act as the point-of-contact for the customer, taking ownership of the communication and acting as their advocate in meetings about the issue. Ensure that they receive an answer (even if it is one they don't care for or want to hear).

If the product/service is geared towards end-user consumers, you may need to create an informal (or formal) developer tech support team to support those folks directly.

***Consequences***: Any form of contact with your team can be the entry point to an informal technical support request: feedback on an [Article](#article), one of your [Ambassadors](#ambassadors) having an issue themselves, [Forums](#forums), [Social Media](#social-media), even somebody walking up to you at a [Conference Session](#conference-session) are all prime candidates for a customer's opening line, "Do you have a moment? I've run into something weird, and I could use your help...." Developer technical support is often more intricate and complex than end-user technical support, since software development is often more subtle and more "open-ended" than what users are capable of doing. This means that developer technical support is often a more time-intensive task (on a per-ticket basis), and it requires personnel who are at least somewhat proficient at writing code. If the company currently does not have a developer technical support team, your team will need to step into that role, and own any developer technical support requests that come in. This is an enormous time commitment if your product/service becomes at all popular, so while your DevRel team members may be able to serve in this role for a time, you will quickly reach a point where your available bandwidth is exceeded and a dedicated developer technical support team will need to be hired. (This team can be either a part of DevRel or a part of Engineering--there's solid arguments for both.)

Having the DevRel team involved at some level in developer technical support can help generate additional feedback about the product/service, and in particular the places where either the documentation needs to be improved (perhaps the [Guides](#guides) need to have deeper details about a complex topic) or fixed (perhaps the [Reference Documentation](#reference-documentation) doesn't accurately reflect how the product/service works) or extended (perhaps a new [Sample/Example](#sample-example) helps demonstrate how to avoid a common bug).

***Variants***:


<div id="tests" /><hr/>
#### Tests
*Code*

Unit or integration tests written to prove a particular hypothesis about the code (such as that it works, or that it integrates well, or so on). Often used as an artifact for developers to learn from--see also *Samples/Examples*.

***Also Known As***:

***Problem***: 

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="training" /><hr/>
#### Training
*Presentation, Code, Budget*

Formal classes in a lecture-lab style format. External-direction = training about the product/service, sometimes sold (income), often provided as part of a partnership deal. Internal-direction = training about the product/service *or* topics designed to improve the company's engineering teams.

***Also Known As***:

***Problem***: Your product/service is complex enough, or feature-rich enough, that there is concern that developers will not be able to learn how to use it from written documentation or presentations. Perhaps there are complex concepts involved, or new concepts that developers have not seen before, or perhaps the configuration of the product/service is complicated due to a high level of dependency or interaction between configuration settings. In some cases, just getting started can be complicated enough to merit concern.

***Context***:

***Solution***: Provide training classes, ranging in length from half-day (four hours) to full weeks (40 hours or more) in which an expert in your product/service provides a presentation describing some part of the complexity, 

***Consequences***:

***Variants***:


<div id="tutorial" /><hr/>
#### Tutorial
*Writing, Code*

Either written or video content (or both) that takes a developer through a series of steps to accomplish some useful task, often related to the product/service.

***Also Known As***:

***Problem***: Your product/service is complex, with a large number of possible ways to get started, or large feature set. Developers find it difficult to get started, and/or make use of features. You might have [Reference Documentation](#reference-documentation) or [Guides](#guides), but these are not sufficient to get developers using your product/service or certain features of the product/service.

***Context***: Getting developers started is not a one-time exercise. Any developer that wants to learn your product/service is going to be coming at it "brand new", and it is irrelevant how long your product/service has been around--every developer is new to your product/service the first time they begin exploring it. Therefore, it is important that whatever solution you use to help them has a long longevity to it, and is easily reusable.

Developers are accustomed to being able to "do" rather than just "sit and listen". Psychological studies are mixed on whether different people have different "learning styles", but in general the adage "tell me and I forget; show me and I might remember; have me do and I remember" seems to hold for many if not most developers.

Every single developer will need to go through learning how to use your product/service (particularly as the number of features increase), so unless the company's business model assumes or relies on a small customer base (or a large DevRel team!), this must be a high-reach activity.

***Solution***: Create a tutorial that takes a developer from a well-defined "point A" to a well-defined "point B", with step-by-step instructions (and code) that developers can exercise and run for themselves. The steps taken should be concrete, clear, and comprehensive, so that developers understand what they are doing and why they are doing it.

In order to minimize the amount of work a developer must go through to get started with a tutorial, consider providing a [Live Playground](#live-playground) for developers to use.

***Consequences***: Unless your product/service is particularly small or has a small developer-facing "surface area", just one tutorial will not be enough. It is very likely that with each new feature developed in the product/service, a new tutorial showing how to use that feature will be useful if not necessary. New tutorials will be needed as new features are released.

Tutorials will also need to be updated regularly as the product/service modifies some of its existing features or functionality. The more tutorials, the more time and effort will be required to keep them up to date. This is a useful activity for the more junior members of the DevRel team (to help them get practice debugging against your product/service as well as help them learn the product/service more comprehensively).

Because it is difficult to predict ahead of time where developers will get stuck, consider providing the "answers" (completed tutorial) as a [Sample/Example](#sample-example) for developers to consult.

It is common to use material from a tutorial for a [Workshop](#workshop) at a conference, providing some in-person lecture in front of the hands-on work, rather than relying on prose. Similar results can be achieved by combining a [Webinar](#webinar) with a tutorial, creating greater reach but sacrificing some interactivity.

If there is a large number of tutorials, and there is demand for a higher-interactivity approach, tutorials can be combined with in-person (or virtual) lectures and turned into [Training](#training). 

***Variants***:


<div id="user-group-network" /><hr/>
#### User Group Network
*Social, Budget*

Own/organize one or more user grounps around the company or product/service.

***Also Known As***: INETA

***Problem***: Your product/service is out and available, and has some popularity, but there doesn't feel like there is much "community" around it: It's difficult to identify individuals who are using it as opposed to those who just examine it. It feels like there are people out there who could benefit from finding one another and gathering periodically to discuss it, but the community remains entirely online.

***Context***: You want to increase the interactivity and reach simultaneously, but conferences are too rarely-occurring to meet regular interactivity goals. (Most conferences run once or twice a year, and you're looking for monthly interaction.) Additionally, you want to improve the interactivity *between* the members of the community ("side-to-side"), not just between your company and customers ("top-down"). No existing user group community or network exists. You have significant budget, and significant organizational bandwidth.

***Solution***: Create, sponsor, and organize one (or more) user groups in geographic regions (most often large cities) that gather individuals who are interested in the company or product/service for discussions and camraderie. Use a tool like Meetup.com to organize and advertise. Find or provide venue space. Find or provide speakers. Provide swag. Connect Ambassaders to UGs. After some period of time (years, most likely), look to hand off the administration of each group to a local leader within each group.

***Consequences***: The creation of a User Group network is no small undertaking--it will require significant investment in time, money, and bandwidth. The larger the network desired, the more people required to organize, and it may be beneficial to have company employees somewhat local to each region in which the network is being created, at least to timezone/continental levels. (Encourage those employees to regularly attend the user group meetings to maximize interactivity and connection.)

User groups love [Swag](#swag). And pizza. *(Or other easily-delivered food options; consider breaking away from the mold and providing Chinese food, just to be different. Anything that can be served "family style" is a good candidate.)*

At some point, the User Groups will need to be supported organically, or they will die off over time. Chances are strong that some will in certain areas anyway, no matter how much support your company puts into them. From the start, look to identify individuals within each region who are willing and able to handle the organization and administration of the user group; many such individuals are often willing to do so, so long as there is some level of financial and marketing support from the company.

User groups are a fantastic way to identify [Ambassadors](#ambassadors) within the community.

***Variants***:

* **Guilds.** **Centers-of-Excellence.** When focused internally, DevRel can often organize internal user groups the same way it does external user groups, for much the same purpose: to provide a space in which the community of like-minded individuals can gather, share information, and mutually benefit from the conversation and support. In earlier business terminology, this was often called a "center of excellence", but the term fell out of use when it didn't turn out to be the panacea businesses expected it to be; more recently, the term "guilds" has come more to the fore. Resist temptations to make these organizational units (divisions, teams, etc), instead preferring to keep them informal, open to anyone, and cross-organization--doing so will often encourage others who aren't currently working in that space to attend a meeting or two "just to see what it's all about" and create better communication between different roles within the company.


<div id="webinar" /><hr/>
#### Webinar
*Presentation*

A scheduled one-way presentation done over video-conferencing software, typically over the Internet and publicly accessible. Typically more formal than a YouTube or LiveStream exercise.

***Also Known As***:

***Problem***:

***Solution***:

***Context***: You want the presentation to be more formal and "professional", similar to what might be seen in a more formal setting.

***Consequences***:

***Variants***:


<div id="workshop" /><hr/>
#### Workshop
*Presentation, Code*

A guided set of steps taking a developer through a non-trivial task or set of tasks to accomplish some larger learning objective. Conference workshops. Open meeting/video workshops? 

***Also Known As***:

***Problem***:

***Solution***:

***Context***:

***Consequences***:

***Variants***:


<div id="youtube" /><hr/>
#### YouTube
*Presentation*

A video or series of videos (in a channel) on YouTube.

***Also Known As***:

***Problem***: You want to have a closely-collected group of video content easily accessible to your customers, but with some curation and high "reach" thanks to search engines.

***Context***: Video content is hard to effectively search--search engines have yet to reach the level of sophistication necessary to pick out spoken words or identify the contents of images present in the video to be picked up. Any search engine result is generally either tied to metadata about the video, or keyed perhaps to the content of any caption or comments on the video.

Additionally, hosting video is not always easy, particularly if there is a desire to retain ownership of the video itself. Simply putting a video file on a web server makes it accessible to the world, but it also makes it vulnerable to "right-click, download", allowing visitors to your website to capture the video for their own purposes (benign or otherwise) and reducing their "stickiness"--their desire or need to remain on your website.

***Solution***: Take any videos you create or capture and post them to YouTube, ideally captured as part of a YouTube channel tied to your company and/or product/service. Provide informative captions, and make sure to link to other videos that directly relate to (or are talked about within) your video.

***Consequences***: YouTube has a couple of recommended practices regarding videos uploaded to their site, including creating a unique thumbnail, creating descriptions that match search engine keywords that you'd like to trigger a link to your video, including relevant tags, and choosing the right category for your videos. If you want to make it easily consumable by customers (who don't always have time to watch a long video), consider breaking the video up into smaller, linked, videos, or separate the one video into chapters.

Channels imply a continuous stream of content, and encourage viewers to "subscribe", thus receiving notifications when new videos are posted. The other side of this subscription, however, is an unwritten commitment on the part of the video publisher (that is to say, you) to continue to publish new content every so often. Consider making it clear when subscribers can expect new content ("Thanks for watching, everybody, and stay tuned for next week's installment, when we...."), and then fulfill that promise.

YouTube channels also often have extensive threaded comments, and failing to engage with commenters can often make your channel look either stale or aloof. Consider dedicating some time from your team to respond and answer those comments (perhaps as part of their larger [Social Media](#social-media) duties), posting links to [Samples/Examples](#sample-example) or [Gists](#gist) for larger code samples if necessary.

[Blog posts](#blog-post) and [Social Media](#social-media) can also be used to draw attention to new content on the YouTube channel, increasing your draw. Additionally, [Newsletters](#newsletter) can be also used to draw those more interested in video content to your YouTube channel, and vice versa. Do not, however, automatically sign up YouTube subscribers to your newsletter, or vice versa--developers always need to opt-in to whatever subscription you are offering, or you risk turning them off to your product/service and company entirely.

YouTube channels can attract advertising and/or sponsors, but in general your emphasis should be on finding like-minded or friendly partners who are willing and interested in cross-linking between your various reach-based efforts (video or otherwise).

***Variants***: YouTube is arguably a Variant of [Webinar](#webinar) and/or [Live Streaming](#live-streaming), as well as a tool for recording [Office Hours](#office-hours) and making them available to others, so in many ways this could be a Variant of each of those patterns. In fact, the main reason this is a standalone pattern is because of YouTube's versatility, in that it can be used for a variety of these activities and all can be gathered under the same YouTube channel.


<div id="glossary" /><hr />
## Glossary

Within the realm of Developer Relations, I find that agreement on the definition of some terms brings clarity to the discussion. I proffer these definitions for the purpose of this pattern language:

* ***Community***: The collection of developers who are outside the DevRel team. This is often synonymous with "customer" (below), but collective, while "customer" is generally thought to be more individual. A community is often centered around the product/service, but there may be sub-communities or other filtering criteria, such as by tech stack or platform; an API product/service may have a Java community, a .NET community, a Python community, each of which have different interests and outlook.

* ***Company***: Who the DevRel team works for and represents. Basically, if you're on the DevRel team, this is "us".

* ***Customer***: Anybody outside the company, whether they are a paying entity or not. DevRel teams will often want to segment this further (between open-source customers and paying customers, for example) in order to draw certain distinctions, but for the majority of these patterns it's sufficient to simply call anybody outside the company a customer. Note that based on the Direction (below) of the activity, the "customer" could very well be another team or developers inside the same company, so some nuance and flexibility in this definition is going to be needed. Basically, if you're on the DevRel team, this is everybody that's "not us".

* ***Direction***: DevRel should be a circular exercise: DevRel should be talking to both those developers inside the company ("internal") as well as those outside of it ("external"). This means the usual activities of bringing development discussions to developers that might be customers of the company's product, but also bringing feedback from those developers on the outside back into the company for further discussion and/or examination. Many companies are also building DevRel teams to be entirely internal-facing, supporting their developers in a variety of the ways that traditionally have been externally-facing (such as owning the continuing education efforts to grow the internal developers).

* ***Interactivity***: This is the fidelity of communication--how "conversational" is the exercise? This in many cases is in inverse proportion to Reach, but not always. The blog post doesn't really allow for great conversation (yes, you can open up comments on the blog, but we all know what happens when you do, and it's not pretty), whereas a workshop really requires a high degree of interactivity with the attendees. The blog post author doesn't learn much from their audience when posting the blog--the workshop facilitator, however, can learn all kinds of things from the attendees via the questions they ask, the problems they run into, the questions they don't ask, and so on.
    Note that contrary to popular belief, higher interactivity is not always desirable--many  highly-interactive activities consume team bandwidth, and as a result the greater tha number of highly-interactive activities you want to do, the larger the team you will need to do them. For companies like Microsoft or Google with hundreds of employees in their DevRel organizations, this may be feasible; for most companies running a DevRel team of five or even a department of twenty, this is not sustainable for any length of time.

* **Partners**: Partners are third-party entities that employ (or are) customers in their own right, but have a much deeper relationship with the company than most customers. This may be because the two (the DevRel team's company and the other entity) have product/services that are complementary to one another, one is a part of the other's supply chain, or because the two have entered into a mutually-beneficial deal.

* ***Product/Service***: What the DevRel team is looking to talk about. This can be a tool (such as an IDE or database), a library or set of libraries, a web service accessed over HTTP (commonly called an "API", "Web API" or "HTTP API"), some other kind of service (anything that ends with "-as-a-service" is a strong candidate), and so on. It need not be a formal artifact that is "sold"--open source projects around/about which the company sells services would be referred here as "product/service". Note that the company may have many product/services available, and a single DevRel team may support all of them, a few of them, or only one of them, but the distinction between one product/service or many product/services is largely irrelevant to the pattern catalog below.

* ***Reach***: How "far" does this activity go? How many people can see it and/or consume it? Those things done over the Internet tend to have a large reach (particularly if any artifact produced by the activity is someplace where Google can find it and pop it up during search results), whereas those things done in person (such as the hands-on workshop) will have very short reach, since participation requires physical presence. For example, the blog post can echo across the entire world within minutes, and even across time itself--certain blog posts just keep getting rediscovered by new readers. (Thanks, Google!) This contrasts with an in-person workshop done at a conference event, even if the workshop has a thousand people in it. In other words, the blog post can reach millions (and even more, long after its publication!), while the workshop only a thousand (and once over, can never go higher).
