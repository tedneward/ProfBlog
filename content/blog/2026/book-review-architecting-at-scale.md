title=Book Review: Architecting at Scale
date=2026-11-24
type=post
tags=book, book review, software architecture
status=published
description=A review of the book.
~~~~~~
I was given a copy of the book *Architecting at Scale* by Imran Siddique, and took the opportunity to sit down and read through it. The subtitle to the book reads as "A Practical Guide to Large-Scale System Design: From Monolith to AI-Native, Beyond Scaling Servers", and it uses an implicit "story" following the growth of a startup ShopFlow as it looks to scale.

<!--more-->

Disclaimers: I was provided a PDF by the publisher in exchange for the promise of a review. The publisher had no input into the review itself, and I have had no contact with the author.

As I frequently do with a book review, let's begin with the "physical" of the book: It's broken into 17 chapters, and clocks in at just under 600 pages (front and back matter included). This puts it on the upper end of the weight scale, but one of those chapters (17) is "Unlock Your Exclusive Benefits" and consists entirely of QR codes and instructions on how to navigate the Packt website.

Which actually brings me to my first criticism of the book: It feels more like a collection of lengthy blog posts than a book, at least at the surface. Each chapter ends with either a QR code to join an electronic newsletter, or a QR code to get the book's PDF version ("and more!"). I certainly understand that a publisher wants to be able to take chapters and repurpose them as standalone articles, and in those situations you want the chapter to truly be able to stand alone, complete with the QR codes and so on, but... *sigh* It just takes me (the reader) out of my flow to hit the ad at the end of the chapter.

The other noticeable thing about the book almost immediately is that the book doesn't start from some kind of "top-down" approach to architecture, exploring different features in the abstract, but instead follows the fictitious parable of ShopFlow, a startup that's growing beyond its initial MVP implementation. Each chapter begins with a telemetry snapshot of the system, explores what's going on/wrong, and then gets deeper into the solution as the meat of the chapter.

The chapter breakdown (aside from the last one) is a pretty decent flow:

1. The Scalability Mindset - When and Why to Scale
2. Core Principles of Scalable Architecture
3. Security-First and Compliance-First Architecture
4. Scaling the Global Delivery Layer - Edge, CDNs, and Beyond
5. Scaling the Modern Web Application – State, Performance, and Micro-Frontends
6. Architecting Scalable Services – Decomposition and API Design
7. Scaling Service Infrastructure – Resilience, Mesh, and Compute
8. Event-Driven Scaling – Decoupling with Messaging
9. Caching Strategies – Faster and Cheaper Scaling 
10. Scaling Data and Databases – Storage, Queries, and Beyond
11. Observability – Seeing and Understanding Your System 
12. Resilience and High Availability – Designing for Failure 
13. Performance Tuning and Capacity Planning 
14. Cost Optimization and Efficiency (FinOps)
15. AI-First Architecture: Pragmatism Over Hype 
16. Continuous Experimentation and the Future-Proof System

Throughout each of the chapters, the author makes strong use of LLM-powered coding agent chats, asking the agent to do various investigatory steps, a la

> "Act as a Site Reliability Engineer. I am pasting a sample of my Nginx access logs and my MySQL slow query log below. Analyze the timestamps to find correlations. Specifically, identify if the p99 latency spikes in the web layer correlate with specific LOCK_WAIT_TIMEOUT events in the database layer. Output the top 3 SQL queries responsible for the contention."

... which the text then follows with "The AI would likely confirm that the LIKE %query% search pattern is causing full table scans, which lock the database threads. This confirms that the underlying logic is flawed, and we need a strategy to address it." (pp 7, 8, Chapter 1). On the one end, it's great to see this kind of practical tool usage, particularly since so many readers (in 2026) are still figuring out "the hard way" how to make use of the coding agent tools beyond vibe-coded approaches. On the other hand, though, this would've been a great opportunity for a developer-architect to learn how to run a query analyzer and learn what a full table scan looks like and why it represents the bottleneck or high-latency query that needs fixing. To be fair, we may be entering a world in which a developer-architect doesn't *need* to know how to recognize the query analysis directly, where we simply allow coding agent tools to do that for us, but across my career we've had numerous profiling tools that all claimed that they could find hotspots like this for two or three decades now, and it still seems like having that knowledge in your noggin helps to identify *when* the profiling tool is needed.

In the book's defense (so to speak), immediately after the above prompt example, the author starts a new section entitled "Identifying the Tipping Point", in which he immediately asks, "How did we know we hit the wall?" and describes the specific signals from the telemetry that suggests that said point has been reached. He also points out "Toil" as a metric; "If your senior engineers are spending >50% of their time on manual intervention, you have crossed the tipping point." I might disagree on the number, but not the metric itself--it's obviously not something you're going to get from the logs, but any decent team lead or architect should be able to get that from regular standups.

The author also has some good insights. In the same chapter, he points out "Scaling by subtraction" in which he asks, "Before we provision a larger database to absorb the connection saturation ... we first ask the cheaper question: how much of this load can we simply remove?" Too much of architect's knee-jerk response is "additive"--add more servers, add a caching layer, add a microservice, *et al*. It feeds the architect's fetish for complexity, so it feels like the right choice all the time, and I love the fact that the author here calls out the subtractive option(s).

Speaking of calling out, I also love the fact that the author calls out the "cargo culting" that frequently goes on in our industry, which he calls "Avoiding 'the Netflix envy trap' (Resume-Driven Development)":

> An engineer reads a blog post about how Netflix uses GraphQL federation or how Uber uses a custom Service Mesh. They think, "If I build ShopFlow with these tools, I can put them on my resume." ... The "Boring Technology" Rule states: When choosing a tech stack for scale, choose the technology that gives you the least number of "unknown unknowns." ... We follow the 'Innovation Token' philosophy. We have a limited budget for 'weird' technology. If we spend a token on a complex AI model, we must use boring technology (MySQL, Node.js) everywhere else to balance the risk.

Love it love it love it. (FWIW, I first heard the concept of what the author calls the "Innovation Token" philosophy expressed as a "Complexity Budget", but the basic concept holds, I think, across a variety of nuance.)

Not everything is perfect, and this book falls under that umbrella of "everything"; criticisms I might suggest include:

* The title. Lee Atchison has a book that's almost identical in title, *Architecting for Scale* (O'Reilly), and as one might expect from the title, it covers a lot of the same material. I get that it's cool to have the whole "scale" thing as a part of the title--since that's what a lot of architects see as the Holy Grail of architecture--but I suspect there's a lot of titles that would've been syntactically different and semantically more on target for this book (since this book actually argues against naive reach-for-scale in many of its chapters). Granted, the two books are more than a decade apart in publication dates, but why take on potential confusion if you don't have to?

* The author's prose sometimes reads very LLM-ish, which could be either the heavy use of LLM tools to write the prose, or a more traditional copyeditor that's bringing the prose in line with that "professional neutral" style that the world's LLMs were trained on. I don't think the book is an "LLM slop" title, by any stretch, but there's particular phrases that might trigger the LLM-sensitive crowd.

* On some pages, the "Note" callouts outweigh the actual prose, which feels a little like the author (or the copyeditor) couldn't quite figure out what this page was supposed to be describing. Callouts are supposed to be a little like footnotes, in that they convey an idea that isn't central to the prose but could be seen as useful; if the page is entirely callouts, what's the central concept being communicated on this page?

* The book is littered with "Architect's Prompts" across all the chapters, and I kinda wish the author had gathered them up into a single comprehensive list somewhere, maybe one of those "inside the front or back cover" sorts of diagrams, like the *Pragmatic Programmer* or the original *Design Patterns* books did. These are useful prompts, and it'd be a pain to have to flip through the book to find the one I'm thinking of when I'm trying to prompt the tool(s).

* I also wish the book had a good Bibliography. The author clearly has stood on the shoulders of giants, and whenever that's the case, I always like to know what sources they used to get to where they are now. (*Caveat:* There is a "References" section at the end of some chapters, but I really would've liked to see these pulled together into its own chapter or section, particularly to cover the topic holistically, rather than just in the context of that chapter.) There's "Other Books You May Enjoy", but it's essentially an advert for other Packt books--I don't begrudge the publisher their hook for more sales, but I really would've better appreciated the Bibliography instead-of or at least in-addition-to the ad.

Overall, this seems a solid book, maybe even a great gift for the architect on your gift list who already owns all the classics of architecture. The telemetry-driven path through scaling up the stalking-horse startup is a nice touch, though it does mean that sometimes the material is presented in a bit of a chaotic order compared to other books. There are some really bad architecture books out there, but this is not one of them.
