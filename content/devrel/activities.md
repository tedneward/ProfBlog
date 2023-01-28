title=Developer Relations Activities
date=2023-01-24
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

* ***Building Blocks***: from my [earlier ontology](https://blogs.newardassociates.com/blog/2023/devrel-activity-ontology.html): *Code*, *Presentation*, *Social*, *Writing*. Often a given activity will be made out of two or more of these simultaneously, in a rough order of criticality; for example, a *Code, Writing* pattern will be better assigned to somebody who has stronger code skills, while a *Writing, Code* pattern will probably yield better results to somebody who has strong writing skills. (Ideally anybody would have strong skills in both, or all of the above, but then we get into the [Full-Stack Developer Fallacy](https://blogs.newardassociates.com/blog/2023/full-stack-developer-fallacy.html), this time for Developer Advocates.)

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

[Ambassadors](#ambassors) | [Article](#article) | [Blog Post](#blog-post) | [Book](#book) | [Booth](#booth) | [Code Review](#code-review) | [Conference](#conference) | [Conference Session](#conference-session) | [Customer Check-In](#customer-checkin) | [Customer Meeting (Pre-Sale)](#customer-pre-sale) | [Forums](#forums) | [Gist](#gist) | [Guide](#guide) | [Hackathon](#hackathon) | [Hands-on Labs](#hands-on-labs) | [Live Playground](#live-playground) | [Live Streaming](#live-streaming) | [Newsletter](#newsletter) | [Product/Service Development](#product-development) | [Reference Documentation](#reference-documentation) | [Sample/Example](#sample-example) | [SDK](#sdk) | [Social Media](#social-media) | [Sponsorship](#sponsorship) | [Swag](#swag) | [Technical Support](#technical-support) | [Tests](#tests) | [Training](#training) | [Tutorial](#tutorial) | [User Group Network](#user-group-network) | [Webinar](#webinar) | [White Paper](#white-paper) | [Workshop](#workshop) | [YouTube](#youtube)


<div id="ambassadors" /><hr/>
#### Ambassadors
*Social*

***Also Known As***: Champions; MVPs; Experts; Heroes; Internal allies(?)

***Problem***: You want to extend the reach of your efforts, beyond its current form, and in particular have a stronger presence in certain communities in which you currently have no representation or identity.

***Context***: Your hiring budget is limited and your team is already stretched to the limits of their bandwidth. 

***Solution***: Find people within your existing community (by examining your [Forums](#forums) or by speaking with interested parties at [your booth at conferences](#booth)) who are active, well-informed on your product/service, and eager to be more active. Create a program by which they will have certain identity ("Ambassadors", "Heroes", etc), and offer benefits to being a part of the program: provide them with [Swag](#swag); give them early access to some of your next steps and company pursuits; create "direct channels"--meetings between the Ambassadors and company executives--for feedback and news; have Ambassadors write for your [Newsletter](#newsletter); assist Ambassadors in finding [Conference Sessions](#conference-session); put them center stage at your own [Conference](#conference); assist them in the writing of a [Book](#book). Ambassadors can even be given opportunities to [blog](#blog-post) and/or contribute [samples](#sample-example) or [Reference Documentation](#reference-documentation), if the docs are managed via Git/GitHub.

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

***Consequences***: Articles will often require some amount of editing and copyediting, which are not skills the typical DevRel team holds; work with an external editing/copyediting service might be required, if the publisher doesn't provide them. Note also that the publisher will often want either exclusive ownership or shared ownership (with an exclusivity clause) that could prevent the use of the article in other scenarios, such as a [Blog post](#blog-post) or [Book](#book). Some publishers will provide a clause that allows the company to re-publish the article on their own web properties after a certain period of time has passed (1-3 momths is common), but often will not provide this unless asked. Most publishers will also look for some form of contract to be signed, which may require legal review.

Once written, the article may atrophy over time as the product/service deviates from what was written about it at the time of the article's publication; ideally, the publisher will be willing to allow for edits to the article to bring it up to date, but this will be effort that is entirely up to the company to provide. Because of this atrophy risk, articles should always be prominently dated so readers can get a sense of how "stale" the code or details described in the article are. [Blog posts](#blog-post) can also often be used to describe the changes between the article's publication and current-state, although finding ways to get the article and the blog post "connected" can be tricky.

The topic, if large enough, can often be the centerpiece of a [Conference Session](#conference-session), though typically an article will be too short to fill a 45-50 minute session, and will need expansion. 


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

Customer commitment to consuming a book is non-trivial, as most books require days to read, even without any other distraction, and most will require weeks or months given a typical day and commitments. The content must be worth the investment, or the reputation will be negative rather than positive. For this reason, books should be reviewed by subject-matter-experts to ensure its accuracy, and the book should be written to have some "longevity" beyond the current product/service release.

Books written by the DevRel team act as a much broader and deeper [Guide](#guide) and can go into depth and detail that is often not possible otherwise.

Books written by [Ambassadors](#ambassadors) instead of the DevRel team members can be very beneficial to both company and Ambassador; the Ambassador improves their own branding within the community (which is good for them), and the company sees deeper technical content distributed to the community without requiring a large time investment from their DevRel team or internal engineers. Usually the DevRel team and/or internal engineers will need (and want!) to be a part of the editing team, however, to ensure that the material is correct and/or in line with the company's messaging and future plans.

Books are popular as [Swag](#swag). Book excerpts can be used as [Articles](#article) and/or [Blog posts](#blog-post). Books are also highly eye-catching and credibility-building when displayed at the [Booth](#booth) and/or used in [Customer Pre-Sale Meetings](#customer-pre-sale-meeting), particularly if written by somebody on the DevRel team.


<div id="booth" /><hr/>
#### Booth
*Social*

***Also Known As***: Floor Presence.

***Problem***: You want to connect with developers within a certain community and have an opportunity to explain your product/service to them, ideally in the context of a conversation in which you can find out more about their issues, problems, concerns, budget, etc.

***Context***: The company wants to be present at an event that brings many people together under the umbrella of a particular identity (i.e., a tech-stack-centric conference) or region (i.e., a community event run for the immediate surrounding geographic area) or brand (i.e., a "destination" conference held in a popular city, like Las Vegas or Orlando), in order to connect with current and potential customers in a more interactive way.

***Solution***: You purchase booth space at a conference, and send a team to staff the booth during the conference's run.

***Consequences***: Participation in a conference event will often require somebody to be a point of contact for the conference; materials (such as the booth itself, printed handouts, any [Swag](#swag), and so on) will need to be shipped to the event, schedules will need to be coordinated, and so on. This is a non-trivial commitment of time and energy, particularly so as the conference gets bigger (it's a much larger commitment of time to have a booth at AWS re:Invent than at a 250-person local community conference).

Manning the booth is also a non-trivial time commitment; ideally there should never be fewer than two people at the booth while the "vendor floor" is open (typically a 12-hour timeframe), so three or four people will be needed during each day of the conference. Additionally, some sort of [Swag](#swag) to help draw initial interest to the booth is helpful, but do not be surprised when many developers stop by just for the swag.

Note that a company's booth presence does not prevent or assume the company [sponsoring](#sponsorship) the conference; where sponsorship flexes on Reach, the booth focuses on interactivity.

***Variants***:

* **Pit Crew.** If the company or the product/service doesn't directly fit the audience of the conference, but you still want a strong "presence" at the event, 


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
*Presentation, Social, Code*

Company throws its own conference. External: typically to showcase its product/service as well as those of partners. Internal: allow developers to discover what other company developers are working on, as well as formal conference sessions designed for internal developer improvement.

***Also Known As***: User Conference; TechReady; TechWeek

***Problem***: You have a large group of developers (internal or external) that you want to reach with a large amount of material that will help them use your product/service.

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

Doing a breakout session at a third-party conference.

***Also Known As***: Talk; Presentation

***Problem***: You want to dispense some 

***Context***:

***Solution***:

***Consequences***: (Event management needs.)

***Variants***:

* **User Group Session.** **Meetup Session.** A common staple of the [User Group](#user-group-network) is to have somebody from the company (or an [Ambassador](#ambassadors) come and speak to the group on some technical topic related to the product/service (more or less). The DevRel team can either help facilitate Ambassadors speaking at the group(s), or have members of the DevRel team do it directly (in which case the DevRel team will need to handle many of the logistics and expense for doing so).
    Note that because most user group sessions are more informal than other settings, expect that the presenter will spend more time with the attendees than at a conference. (It is common to go out for food and drinks after the event, or to mill in the room both before and after the talk.) 
    It is common for DevRel teams to use user group sessions as an opportunity to practice a talk before it is delivered as a [Conference Session](#conference-session). Some groups welcome this, but some resent it. If the relationship with the group is strong, ask for feedback on the talk; if it is not, treat it as a formal presentation every bit as "real" as the conference or a [Customer Meeting](#customer-meeting-pre-sale).

* **Brown Bag.** **Lunch-n-Learn.** When the direction of the activity is pointed internally, these become known as "brown bags" or "lunch-n-learns", wherein the DevRel team (or other internal employees of the company) deliver the presentation (often over the lunch hour) to other engineers within the company. These can be organized periodically (weekly or monthly), as part of an internal [Hackathon](#hackathon), or as part of the company's [internal conference](#conference) (or all of the above). If there is no formal internal training team, the DevRel team should take on the organization, logistics, and "acquisition" of speakers (internal or external) for such events; if there is a training team, DevRel can be frequent speakers, and/or help with the acquisition of speakers, and/or help with some of the logistics. Note that if internal employees are interested in speaking, DevRel should (must!) volunteer to assist that employee in the preparation and practice of delivering the presentation, since many developers are not comfortable delivering or preparing presentations.
    Note that if DevRel is scheduling these, it's often best to start with monthly events, then move to biweekly and weekly as the "pipeline" grows. Let the upcoming pipeline grow to six months' in advance before reducing the timing--for example, if you are doing monthly sessions, and you have six months' speakers/topics in the pipeline, go biweekly (thus reducing your pipeline to three months' worth) and rebuild the pipeline out to six months' worth before going weekly.


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

***Problem***:

***Context***:

***Solution***:

***Consequences***:

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

Smaller than a sample/example, designed to demonstrate a very specific snippet of code. Often entirely in conjunction with other artifacts.

***Also Known As***:

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


<div id="guides" /><hr/>
#### Guides
*Writing, Code*

Written docs that take more of a "story"-based approach to the product/service; not reference docs. Each guide covers some particular aspect or concept or insight or explanation about the product/service (such as a feature).

***Also Known As***:

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


<div id="hackathon" /><hr/>
#### Hackathon
*Code, Social*

Code-for-24/48/72-hours on whatever sounds interesting. External: often around the product/service. Internal: on whatever the company developers find interesting. DevRel can either be coaches, organizers, or both.

***Also Known As***:

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


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
*Presentation, Social*

Informal video content broadcast live. Very informal.

***Also Known As***: Twitch. Vimeo.

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


<div id="newsletter" /><hr/>
#### Newsletter
*Writing*

Recurring (monthly) emailed newsletter sent to opted-in customers. Include links to other artifacts (articles, samples/examples, etc). Works well in conjunction with [Social Media](#social-media).

***Also Known As***: Zine

***Problem***: Customers are always surprised to hear of news about the product/service over social media and not from the company itself. You want to find ways to give them better opportunities to hear the news directly from the company, without coming across as "spammy" or "in your face", which could turn customers off.

***Context***: Developers often want to know about new features, but they want to know about them on their own time, and not have the news forced on them. 

***Solution***:

***Consequences***:

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

Precise documentation about the API, interfaces, classes, or whatever makes up the "surface area" of the product/service with which developers interact.

***Also Known As***: 

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


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

Library of code intended to be used "as-is" as either the sole means or a helpful abstraction (layer on top of HTTP APIs) when using the company's software.

***Also Known As***:

***Problem***:

***Context***:

***Solution***:

***Consequences***:

***Variants***:


<div id="social-media" /><hr/>
#### Social Media

Typically used for light customer contact and announcements.

***Also Known As***: Facebook Groups, Twitter, Mastodon, LinkedIN

***Problem***: Keeping developers' attention is never easy, considering all the different tools and technologies that vie for their attention. You want your product/service to be "top of mind" to them, even if they've already purchased it or adopted it, because greater adoption means more feedback and (potentially) more activity and community. Therefore you want to keep a moderate degree of interactivity with your customers (and potential customers) with a wide reach.

***Context***: While you could always make use of a [Newsletter](#newsletter), many developers already receive too much email in their inbox, and refuse to add to the pile, even for tools they use every day. It's possible, with enough budget, to purchase billboards and highway signs, but these are fairly low-"hit"-rate options, since there's no guarantee that developers will drive past them or even recognize them when they do.

***Solution***: Make use of the various Internet social media platforms that developers already use to notify them of [Conference Sessions](#conference-session), to come visit the [Booth](#booth) at an upcoming event, interesting [blog posts](#blog-post), [Sponsorships](#sponsorship), 

***Consequences***: 

***Variants***:


<div id="sponsorship" /><hr/>
#### Sponsorship
*Social*

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


<div id="user-group-network" /><hr/>
#### User Group Network
*Social*

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


<div id="glossary" /><hr />
## Glossary

Within the realm of Developer Relations, I find that agreement on the definition of some terms brings clarity to the discussion. I proffer these definitions for the purpose of this pattern language:

* ***Community***: The collection of developers who are outside the DevRel team. This is often synonymous with "customer" (below), but collective, while "customer" is generally thought to be more individual. A community is often centered around the product/service, but there may be sub-communities or other filtering criteria, such as by tech stack or platform; an API product/service may have a Java community, a .NET community, a Python community, each of which have different interests and outlook.

* ***Company***: Who the DevRel team works for and represents. Basically, if you're on the DevRel team, this is "us".

* ***Customer***: Anybody outside the company, whether they are a paying entity or not. DevRel teams will often want to segment this further (between open-source customers and paying customers, for example) in order to draw certain distinctions, but for the majority of these patterns it's sufficient to simply call anybody outside the company a customer. Note that based on the Direction (below) of the activity, the "customer" could very well be another team or developers inside the same company, so some nuance and flexibility in this definition is going to be needed. Basically, if you're on the DevRel team, this is everybody that's "not us".

* ***Direction***: DevRel should be a circular exercise: DevRel should be talking to both those developers inside the company ("internal") as well as those outside of it ("external"). This means the usual activities of bringing development discussions to developers that might be customers of the company's product, but also bringing feedback from those developers on the outside back into the company for further discussion and/or examination. Many companies are also building DevRel teams to be entirely internal-facing, supporting their developers in a variety of the ways that traditionally have been externally-facing (such as owning the continuing education efforts to grow the internal developers).

* ***Interactivity***: This is the fidelity of communication--how "conversational" is the exercise? This in many cases is in inverse proportion to Reach, but not always. The blog post doesn't really allow for great conversation (yes, you can open up comments on the blog, but we all know what happens when you do, and it's not pretty), whereas a workshop really requires a high degree of interactivity with the attendees. The blog post author doesn't learn much from their audience when posting the blog--the workshop facilitator, however, can learn all kinds of things from the attendees via the questions they ask, the problems they run into, the questions they don't ask, and so on.

* **Partners**: Partners are third-party entities that employ (or are) customers in their own right, but have a much deeper relationship with the company than most customers. This may be because the two (the DevRel team's company and the other entity) have product/services that are complementary to one another, one is a part of the other's supply chain, or because the two have entered into a mutually-beneficial deal.

* ***Product/Service***: What the DevRel team is looking to talk about. This can be a tool (such as an IDE or database), a library or set of libraries, a web service accessed over HTTP (commonly called an "API", "Web API" or "HTTP API"), some other kind of service (anything that ends with "-as-a-service" is a strong candidate), and so on. It need not be a formal artifact that is "sold"--open source projects around/about which the company sells services would be referred here as "product/service". Note that the company may have many product/services available, and a single DevRel team may support all of them, a few of them, or only one of them, but the distinction between one product/service or many product/services is largely irrelevant to the pattern catalog below.

* ***Reach***: How "far" does this activity go? How many people can see it and/or consume it? Those things done over the Internet tend to have a large reach (particularly if any artifact produced by the activity is someplace where Google can find it and pop it up during search results), whereas those things done in person (such as the hands-on workshop) will have very short reach, since participation requires physical presence. For example, the blog post can echo across the entire world within minutes, and even across time itself--certain blog posts just keep getting rediscovered by new readers. (Thanks, Google!) This contrasts with an in-person workshop done at a conference event, even if the workshop has a thousand people in it. In other words, the blog post can reach millions (and still going!), while the workshop only a thousand (and once over, can never go higher).