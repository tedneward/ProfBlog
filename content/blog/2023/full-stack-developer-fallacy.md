title=The Full-Stack Developer Fallacy
date=2023-01-19
type=post
tags=management
status=published
description=Why the search for the "full stack developer" is a mistake based on a misnomer.
~~~~~~

**tl;dr** Lots of companies are spending exorbitant amounts of time trying to track down and hire "full stack" developers, and finding them difficult to find. This is probably because there is no such thing, and reveals a deep weakness in the hiring manager's thinking.

<!--more-->

## Definition

As we begin, let's start with a working definition of the "full-stack developer" (or FSD, for short). Tossing this into Google yields (for me) the top result of:

> "Full stack technology refers to the entire depth of a computer system application, and full stack developers straddle two separate web development domains: the front end and the back end.
> "The front end includes everything that a client, or site viewer, can see and interact with. By contrast, the back end refers to all the servers, databases, and other internal architecture that drives the application; usually, the end-user never interacts with this realm directly. 
> "The easiest way to put the full stack into perspective is to imagine a restaurant. The front end encompasses the well-decorated, comfortable seating areas where visitors enjoy their food. The kitchen and pantry make up the “back end” and are typically hidden away from the customer’s view. Chefs (developers) gather permanently stored materials from the pantry (the database) and perform operations on it in the kitchen (the server), and then serve up fully-prepared meals (information) to the user. 
> "Front end developers work to optimize the visible parts of an application for web browsers and mobile devices. Front end platforms are usually built with HTML, CSS, and JavaScript; however, they can also be made via pre-packaged code libraries or content management systems like WordPress. Back end developers, in contrast, refine the software code that communicates with servers, databases, or other proprietary software that conveys information to front end interfaces. 
> "Those knowledgeable in both front end and back end are called full stack developers, meaning they are well versed in both disciplines."
> (from https://bootcamp.learn.utoronto.ca/blog/what-is-a-full-stack-developer/# )

... which seems a reasonable working definition. However, I would argue that for most companies, particularly those trying to find FSDs for microservices-based teams, there's a few more disciplines left out of the above definition:

* Testing: Writing unit- and integration tests.
* Database: Defining and maintaining databases, including schema and data migrations.
* Deployment: Familiarity with tools like Docker, Kubernetes, Istio, and the other services and products that are used to deploy the service/application.
* InfoSec: JWTs, OAuth, OpenID, and other tools of the trade to keep malicious-intent individuals at bay.

... which is in addition to the original two disciplines (front-end/presentation, and back-end/distribution), each of which is arguably made up of other disciplines (front-end usually requires some degree of UI/UX design, and back-end often requires familiarity with distributed systems principles).

(By the way, we're also not really taking into account that a *web*-based FSD is likely to need a different set of skills than a *mobile* FSD. Some areas, like the back-end, might share many of the same skills, but the closer you get to the front-end, the more likely divergence is going to occur.)

Which, if you're thinking about it, is a relatively astounding amount of stuff for any single person to have stored away in their head, much less accessible at any given point in the day.

## Jacks-of-All-Trades

The intent here is to hire people who are "jacks of all trades", meaning they know a little about a lot of things.

Historically, recruiters have talked about different "shaped" people: 

* *"I"-shaped people*, who have a great deal of knowledge in a very narrow range of topics (think about the developer who knows everything there is to know about a particular database, but nothing about HTML, CSS, Javascript, or even other databases),
* *"_"-shaped people*, who are the original jacks-of-all-trades, with much breadth but little depth, and
* *"T"-shaped people*, who have some depth in a small number of topics, but then a little breadth in more topics.

It may sound like the FSD is a "_"-shaped person, with wide breadth, except that often recruiters are looking for significant depth to go along with all that breadth. "Candidates must have 10 years HTML, 12 years CSS, 27 years with Istio, ..." and so on. In essence, the goal for the FSD-candidate search is to find "box"-shaped people, who have width breadth *and* wide depth.

That... just isn't going to happen. Not naturally, anyway.

Any developer who's been in the industry for more than a few years generally will have their experience skewed in some particular direction down one (possibly two) of those above disciplines. Some will really like database and back-end systems (that's me, honestly), while others will find front-end and testing interesting.

(Note that I'm picking these combinations somewhat at random--I've met people whose happy place was any combination of the two, including front-end and InfoSec.)

If we take the Malcolm Gladwell measurement of "expertise" as being 10,000 hours in any particular area, and we assume a working year of 2,000 hours each (50 weeks at 40 hours each week), that's *five years* to achieve expert status in that field. Now, if we assume that you work full-time in one discipline, having depth in all five disciplines means that *you aren't a qualified full-stack developer for 25 years.*

And, of course, nothing will change during that time to invalidate what you learned two expertises ago.

## Hiring Manager Fail

How did we get here? There's a few theories, but my personal one is that it's a failure on the part of the hiring manager. A *huge* failure.

Look at it this way: Imagine you're running a team building a mobile application. Your team currently consists of the following six people, each of whom has distinctly different skills (all of which your team is using):

* Alfred: HTML/CSS, Selenium testing
* Betty: HTML/CSS/Javascript, OAuth/OpenID
* Cassandra: Postgres, OpenAPI, Spring
* David: Postgres, Azure/AWS, Docker
* Esther: Docker, Javascript, JWTs
* Francisco: Kubernetes, Istio, AWS

Now imagine that your boss comes to you and (given the current climate as I write this) demands that you lay one of these people off. Which do you choose? Anyone you let go is going to leave a huge hole that might be partially plugged by one of the others on the team, but not completely. You *might* be able to send the rest to some training classes or online training videos to learn what is now no longer covered on your team, but that's going to take time, and while they're learning you're still vulnerable there, and that assumes that others on the team *want* to learn whatever it is you're missing.

Now, let's look at it if you have a team of FSDs:

* Amanda: Full-stack
* Bob: Full-stack
* Charlie: Full-stack
* Denise: Full-stack
* Evan: Full-stack
* Freida: Full-stack

Well! Now when the request comes down from above, you don't have to play jigsaw puzzles with the team--you pick the one that's either the most expensive or the most junior (or is on a PIP or is the biggest pain in your--), and *voila*, problem solved. Or, if one of them chooses to leave, again, you just put out a request to Recruiting to hire another one of those FSDs, and you're back to full strength!

What's more, when the team is doing on-call rotation, each team member has the same skill set coverage, so that there's no "fallback" or "chain" that needs to be followed depending on what went wrong; in the first team, if Betty got paged because of an escalation having to do with the Postgres database, she lacks that skill, and somehow we need to get either Cassandra or David on the line, even though they're not on call this sprint. *Bleah.*

So, from a hiring manager's perspective, the FSD approach makes their life much, much easier.

And frankly, that's weak management--the manager's job *isn't* to make their own life easier, their job is to make the *team's* life easier. Yes, it's going to be a pain to juggle responsibilities and/or get team members cross-trained in other areas so we always have a "principal" and "secondary" expert on any tool or library or technology the team uses. Yes, when one of them leaves, you're going to have to lean on the other(s) to help fill the gap, and do more training to get yourself back to a "principal"/"secondary" expert within the team.

But when those people leave, now finding somebody who has one or maybe two disciplines under their belt means the candidate hiring process goes from "years" to "months". Plus, it simply acknowledges the reality that nobody is a "box-shaped" individual, no matter what their resume states.

***Don't try to hire full-stack people; build full-stack teams.***
