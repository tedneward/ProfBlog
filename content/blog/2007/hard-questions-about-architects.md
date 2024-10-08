title=Hard Questions About Architects
date=2007-09-20
type=post
tags=development processes, architects, architecture, reading, java, j2ee, ruby, windows, xml services, clr
status=published
description=In which I answer an email about architecture and architects.
~~~~~~

I get e-mail from blog readers, and this one--literally--stopped me in my tracks as I was reading. Rather than interpret, I'll just quote (with permission) the e-mail and respond afterwards.

<!--more-->

> Hi Ted,
> I had a job interview last Friday which I wanted to share with you. It was for a “Solutions Architect” role with a large Airline here in New Zealand. I had a preliminary interview with the head Architect which went extremely well, and I was called in a few days later for an interview with the other three guys on the Architecture team.
> The second interview started off with the usual pleasantries, and then the technical grilling began with:
> **“What are the best practices that you would put in place on a project?”**
> I replied “I’ve come to realise that there is no such thing as ’Best Practice’ in architecture – everything is contextual.”
> Well, it went down like a sh*t sandwich! The young German guy who asked the question looked at me like some sort of heretic and said – “ I disagree”. I thought to myself, no damn it – I’m going to push it to see where this guys argument goes, so I said “I can take any best practice you can think of, and by changing the context, I can render that best practice a worst practice”. He didn’t like that very much, but I thought, ‘bugger him, I know I’m right’.
> He then came out with the next question “What do you do when your architectural principles are compromised”. I asked “what do you mean”, and he indicated that an application he designed recently, was found to be far too expensive to implement So he asked again ‘what would you do’?
> I replied “redesign it”. He scoffed at this answer, and reiterated “but what if the redesign was compromising your architectural principles”? So I asked “what is more important. Your principles, or achieving a business objective?”. I don’t remember exactly what his answer was, but it was along the lines of “you have to maintain a corporate standard”.
> His next attack was at extreme programming. Having seen that I had used extreme programming one of my recent projects (in addition to also using waterfall, more recently, on others), he asked “don’t you think that the very risky nature of extreme programming is at odds with it’s ability to deliver software consistently?”. This was a bit of a stunner. I indicated that, once again, it was contextual. XP is appropriate on some projects, but it is not on others. On the XP project I worked on, it was entirely appropriate. We delivered early, within budget, the client got what he wanted, and we got a few million dollars worth of work out of it. Not surprisingly, he didn’t have a lot to say to me after that.
> Having worked as a consultant for a number of years now, I have been entirely focused on adding <b>business value</b>. I was stunned to hear first hand, how divorced from the business this “architect” was. Clearly he has to maintain some sort of structure with their corporate systems, but surely each business solution should be assessed primarily in the context of it’s own business objectives.
> The interview was good in the respect that I was able to quickly establish that it wasn’t the place for me, but it did leave me with some unanswered questions:
> * How could their idea of an architect (being the policemen of corporate best practice) be so far removed from someone like myself, who aims to make case by case judgements based on pragmatism and experience?
> * Is architecture supposed to be facilitative or restrictive?
> * What relevance do architects have today? Are they just overpaid, out of touch developers?
> 
> Regards,
>  
> Shane Paterson
> Hands on Architect Type
> (for lack of a more relevant title)

Wow.

For starters, Shane, kudos to you for sticking to your guns, and for figuring out really quickly that this was clearly not a place you wanted to work--a lot of developers have a mentality that says that they need the company more than the company needs them, sort of a "job at any price" mindset. Interviews aren't supposed to be the place where candidates grovel and say whatever the company wants them to hear--an interview is supposed to be a vetting process for both sides.

But on to your questions:

*How could their idea of an architect be so far removed from someone like myself?* I can't answer this one solidly, but I can say that the definition of an architect seems to be vague and indiscriminate a term, only exceeded in opacity by the term "software" itself. For some companies I've worked for, the "architect" was as you describe yourself, someone whose hands were dirty with code, acting as technical lead, developer, sometimes-project-manager, and always focused on customer/business value as well as technical details. At other places, the architect (or "architect team") was a group of developers who had to be promoted (usually due to longevity) with no clear promotion path available to them other than management. This "architect team" then lays down "corporate standards", usually based on "industry standards", with little to no feedback as to the applicability of their standards to the problems faced by the developers underneath them. A friend of mine on the NFJS tour, Brian Sletten, tells a story of how he consulted on a project, implementing the (powerful) 1060 Netkernel toolkit at the core of the system, to resounding success. Then, on deployment, the "architecture team" took a look, pronounced the system to be incompatible with their "official standards", and *forced new development of a working product*. In other words, the fact that it worked (and could easily be turned to interoperate with their SOAP-based standard, of which there were zero existing services) was in no way going to stand as an impediment to their enforcement of the corporate standard.

*Is architecture supposed to be facilitative or restrictive?* Ah, this is a harder one to answer. In essence, both. Now, before the crowd starts getting out their torches and pitchforks to have a good old-fashioned lynching, hear me out.

Architecture is intended to be facilitative, of course, in that a good architecture should enable developers to build applications quickly and easily, without having to spend significant amounts of time re-inventing similar infrastructure across multiple projects. A good architecture will also facilitate interoperability across applications, ensure a good code quality, ensure good maintainability, provide for future extensibility, and so on. All of this, I would argue, falls under the heading of "facilitation".

But an architecture is also intended to be restrictive, in that it should channel software developers in a direction that leads to all of these successes, and away from potential decisions that would lead to prolems later. In other words, as Microsoft's CLR architect Rico Mariani put it, a good architecture should enable developers to "fall into the pit of success", where if you just (to quote the proverbial surfer) "go with the flow", you make decisions that lead to all of those good qualities we just discussed.

This is asking a lot of an architecture, granted. But that's the ideal.

*What relevance do architects have today?* Well, this is a dangerous question, in that you're asking it of one who considers himself an architect and technologist, so take this with the usual grain of salt. Are we just overpaid out-of-touch developers? God, I hope not. Fowler talks about architecture being irrelevant in an agile project, but I disagree with that notion pretty fundamentally: an architect is the captain of the ship, making the decisions that cross multiple areas of concern (navigation, engineering, and so on), taking final responsibility for the overall health of the ship and its crew (project and its members), able to step into any station to perform those duties as the need arises (write code for any part of the project should they lose a member). He has to be familiar with the problem domain,&nbsp;the technology involved, and keep an eye out on new technologies that might make the project easier or answer new customers' feature requests.

And if anybody stands up at this point and says, "Hey, wait a minute, that's a pretty tall order for anybody to fill!", then you start to get an idea of why architects do, frequently, get paid more than developers do. Having to know the business, the technology at a high and low level of detail, keeping your hands in the code, and watching the horizon for new developments in industry, is a pretty good way to burn out any free time you might have thought you'd have.

Granted, all of these answers notwithstanding, there's a large number of "architects" out there whose principal goal is to simply remain employed. To do that, they cite "best practices" established by "industry experts" as a cover for making decisions of their own, because nobody ever gets fired for choosing what industry "best practices" dictate. That's partly why I hate that term: it's a cop-out. It's basically relying on articles on popular websites and magazines to do your thinking for you. Inevitably, when somebody at a conference says the word, "Best Practice", listeners' minds turn off, their pens turn on, and they dutifully enscribe this bit of knowledge into their projects at home, *without considering the applicability to their project or corporate culture*. Nothing, not a single technology, not a single development methodology, not even a single tool, is *always* the right answer.

In the end, I think what Shane ran into was an "architect" with an agenda and an alpha-geek complex. He refused to consider somebody with a competing point of view, because God forbid somebody show him *not* to be the expert he's hoodwinked everybody else at work to think he is. Unfortunately I've run across this phenomenon too often to call it statistical error, and the only thing you can do is to do exactly what you did, Shane: get the hell out of Dodge.
 
