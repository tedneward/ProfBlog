title=Own, Collaborate, Inform
date=2023-09-04
type=post
tags=industry, management, teams
status=published
description=Good fences make good neighbors.
~~~~~~

*tl;dr* While having some conversations with a client, we got to talking about teams, processes, and how to partition work. I realized, as I was talking, that while RACI is a reasonable way of thinking about such things, it's a little complicated, and I prefer a slightly simpler model: OCI.

<!--more-->

For those who aren't familiar with RACI, it's an acronym that stands for "Responsible, Accountable, Consulted, Informed", also known as a "Responsibility Area Matrix" in some circles. The idea is that for a given process or area of work (dare I say "value stream"), you line the individuals or the teams involved in a column on the left-hand-side, then across the top you create columns labeled "Responsible", "Accountable", "Consulted" and "Informed".

As you go through the different teams, or the different steps in a process, you examine the "players" in the left-most column, and determine whether they are responsible, accountable, consulted, or informed about the work being done. In essence, we are figuring out the degree of involvement around a given process or work, as part of coming to an understanding around who is doing what. (But not necessarily when--that adds a whole new dimension to the problem.)

> More thorough explanations can be found on [Usemotion](https://www.usemotion.com/blog/raci-chart) and [Asana](https://asana.com/resources/raci-chart).

My issue comes with some of the separation of the columns; specifically, I think it allows for too much overlap and conflates some concepts. Consider the eplanation of each of the four terms from the Usemotion blog (linked above):

>**Responsible** These are the individuals, pairs, or groups who do the work to complete the task or deliverable. Each task should have at least one responsible person.
>
>**Accountable** These are the individuals, pairs, or groups who delegate and review a team’s work. They are typically in a leadership or management role and ensure that the responsible person or team knows their expectations and completes the work on time. Each task should have only one “Accountable” person.
>
>**Consulted** These individuals provide input and feedback on the work being done. They have a stake in the outcome because it could affect their current or future work. Not every task needs a consulted person, but the project manager should consider all possible stakeholders when creating the RACI chart.
>
>**Informed** These are the individuals or groups that need to be kept up-to-date on the progress of a project but don’t need to be consulted for decision-making. They might include the heads or directors of teams or the senior leadership in a company.

But... who "owns" the thing?

### Goals, Microservices, RACI, oh my
One of the things I've discovered in my time managing teams and consulting to executives is that teams (and people within teams) function best when they have clear, distinct goals. Ideally, that should be a singlular noun: goal. When the team or the individual knows what they're doing such that it can describe it in a single sentence (without being a runon!), you have a much clearer sense of who's doing what.

In short, this is called "ownership", and it's a large part of what the whole microservices architectural model was trying to drive towards, what Amazon now refers to as a team being "single-threaded": they own their inputs, they own their outputs, they own the maintenance, the whole nine yards. "No shared anything" is another way of referring to it. It has nothing to do with the size of the service, or the team, but whether they have a clear sense of what they work on.

(By the way, that doesn't line up well to the use of single-function microservices at all well, does it? That's because the first use of the term "microservice" is more about organizational design, whereas the single-function AWS Lambda or Azure Function is more about distributed system design, and we need to stop pretending that the two are synonymous.)

### The Case
Suppose you have two teams, each supporting their own service, and both make use of a shared database. Let's call the first team the "Sales Microservice" team and the second team the "Marketing Microservice" team. Clearly both will have need of much of the same data--Sales will need customer information (to know where to ship the product, for example), and Marketing will need customer information (to know if the customer has bought into the latest iteration of our bright and shiny product or not).

The data people in the back of the room are already starting to squirm uncomfortably, because they can see all sorts of opportunities for violations of data integrity: if we *don't* put this customer information into a shared database, there's all kinds of opportunities for trouble. "If the customer moves, we might send the product to the wrong place!", they'll whimper, "Or we'll send them a coupon for 25% off the thing they just bought. So many ways to embarrass ourselves, we just have to have the database shared between these two teams."

Fair enough. But who owns it?

"Nobody owns it," they respond, "It's a shared database." 

OK, but who makes sure it's still running? Who's paying for the rack or the cloud or whatever hardware and software we're using to make use of this database? Because somebody is going to do those pesky maintenance things, right?

The heads are starting to turn, and they're beginning to realize where this is going. (Actually, if they're data professionals, they already know the right answer: The dedicated Database Group owns it!) For any given hardware or software "thing" inside the company, somebody has to own it, or it's going to fall apart eventually.

And let's not get started on what happens when the Sales team wants to break a column or a field or a table or a document up into smaller parts, but Marketing doesn't see the need. One way to solve this, of course, is to put the shared database into the Database Group, and now each team has to bring their requests for modification to the Database Group, who will schedule the modifications to happen, please be sure to allow up to 4 to 6 weeks for us to process your request, and make sure your business case has been approved by the VP of Database Engineering ahead of time, who will need to schedule time with both the VPs of Marketing and Sales as part of the vetting process....

Yeah, now we see why shared databases aren't quite as popular as they once were. We may have traded one problem off for another, but that's a different discussion for another day. Let's try this again: Sales and Marketing each need customer information.

#### Enter RACI
Traditionally, this is where the business consulting excitedly jumps into the room and starts waving Excel spreadsheets around: "We can do a RACI exercise and figure out who is in which column!" The theory being, of course, that once we've established who is Responsible and who is Accountable, we'll have some clear indications about who is going to do what or decide what.

Except....

Have you ever been accountable for something that you weren't responsible for? As in, your work/outcome/bonus depended on the work that somebody else was doing? This is the classic definition of stress, and in general it works against the notion of "autonomy", a critical aspect to creating a dynamic and viable team. Consider Asana's description of these two roles:

>**Responsible.** This person is directly in charge of the work. There should only ever be one Responsible role per task so you know who to go to with questions or updates. If a task has more than one Responsible person, you can lose clarity and cause confusion. Instead, aim to add additional collaborators as some of the other RACI roles, which can have more than one person.

>**Accountable.** The Accountable person is responsible for overseeing overall task completion, though they may not be the person actually doing the work. There are two ways to assign an Accountable role. Sometimes, the Accountable is the project manager (or even the Responsible, though in that case the person is taking on two different roles during the task workflow). In these cases, the Accountable is responsible for making sure all of the work gets done. In other cases, the Accountable is a senior leader or executive who is responsible for approving the work before it’s considered complete. Like the Responsible role, there should only ever be one Accountable.

I mean, would you want to be the project manager in this scenario? You're Accountable for the work done, but not being Responsible means you're not doing the work, you're just checking up on everybody who's doing the work. And if that Accountable individual is a manager, you have a recipe for micromanagement in a coffee cup.

This does not strike me as a great state of affairs.

#### Enter OCI
I think the original terms of Responsible and Accountable felt intuitive to the folks who first started using the RACI diagram, but as we've gotten more familiar with autonomous and self-organizing teams, particularly in the view of how we like to organize development teams around microservice architectures, I think we need to revamp the acronym a little. Thus do I present the OCI diagram: Owner, Collaborator, Informed.

***Owner.*** If you own the thing, you own the thing: You are responsible for it, you are accountable to it, and any buck having to do with the thing stops with you. This is your baby, and you get all the credit and all the blame for it. No questions, no exceptions.

This is, remember, what the microservice approach was after in the first place: single-threaded. If I own it, I can make changes to it, because if it blows up, it's on me.

But we rarely exist in a vacuum, which is why we have....

***Collaborators.*** In the case of a microservice or a database, this will oftne be the consumers of the thing. I own its implementation, but I have responsibilities to others, and we negotiate some kind of deal (formally or informally) around what their needs are and the degree to which I satisfy them. They're not being "consulted", which isn't always clear as to the degree of the relationship--do they get to veto an idea? do they get to weigh in on the idea? As a collaborator, it's more clar that they're involved, in some capacity, and therefore they have some say in it.

***Informed.*** Lastly, there's those folks who aren't involved, but need to know because they do some other things around it. Perhaps they consume the API provided by the service, or they kick of a new process every time this process reaches a certain step. And so on.

You can start to see how the OCI approach begins to work for both processes and software: in a customer complain scenario, when a complain comes in, a Customer Service rep often takes the complaint and passes it off to the relevant part of the company. After all, they're Responsible for that which the customer is complaining about. But if we turn this on its head a little, and ask, "Who owns this complaint?" we get to what I think is the better approach: The Customer Service Rep owns this complaint, and is both responsible and accountable for its resolution.

You might well argue that I've changed the focus of what the RACI discussion should've been, and that may be true. Half the time, though, as a philosopher, the goal is to ask the right question--and often enough, I think the right question is, "Who owns this?"

#### Good fences
One of my favorite "isms" (pithy sayings that denote or describe something I think is an important idea or philosophy) is that "Good Fences Make Good Neighbors".

When I was just starting fifth grade, we moved to one of those half-acre lots that are the definition of the sprawl in LA. One of the very first things we did was to put up a wall between ourselves and our neighbor, Reg. I had no real idea why--Reg was a nice enough guy, very pleasant and chatty (as LA neighbors go, anyway--you generally don't talk much to your neighbors in LA), and whenever a ball sailed over the wall, he was happy to either grab it (if we was outside) or leave his gate unlocked so we could go grab it.

So why the wall, I asked my Dad. "Because good fences make good neighbors", he replied. "This way it's clear which part of the property belongs to whom, and if there's a problem with the sprinkler system, for example, we can know whose system its with and who needs to fix it." But there's a small strip of lawn in the front right between the two driveways extending out to the street, and we didn't run the all all the way down that, why not? "Well...." and then he changed the subject.

Later, when I was given ("gifted", my father said proudly, as he handed off a chore to me that he hated doing) the responsibility of mowing the lawn, I was told that Reg and us traded off mowing that little strip. No formality to it, just if you were out mowing and it hadn't been mowed yet, you just took the ten minutes necessary to mow it, and figured roughly that it would all come out even between us in the end.

(Persoally, I tried to make sure I always started mowing the lawn after Reg did, so that I had that much less chore to do. Pretty petty, but hey, i was 13, and mowing the lawn in 110-degrees-F heat is not my idea of a fun time on a summer Saturday afternoon.)

When I go visit the Midwest or back East (in the US), I see all these homes with no fences between them, and I'm always curious as to who mows what between the two homeowners. I ask folks, sometimes, if I happen to know the people living there, how they know who mows what. Every time, I find that they've answered the "OCI" question in their own informal terms; they usually say something along the lines of, "Oh, I just mow to where I think the property lines are" or "Well, we kinda agreed where the dividing line was." (One friend told me everybody on the block contributes to an enterprising kid's college fund by paying him to mow everybody's lawn--which neatly answers the question of "Who owns mowing this?")

In a business setting, you ask "Who owns this" not because you're looking to start (or end) turf battles between teams; you ask because that way, if I know the ball landed in your part of the yard, I can either tell you (if I think you didn't know already) or I can trust you to toss it back over the fence (if I think you know already) when you get around to it, and vice versa. It's about making it clear where the boundaries are between our teams, so that we're each clear on who's doing what.

And sometimes, the act of going through one of these "ownership"/OCI discussions reveals that there's gaps--and that's the best kind of result, because now we have spotted a hole that we didn't know was there before, and can (imediately!) move to address it. The act of drawing the fence means checking the property lines, and every time you do that, ou discover something new about your property, your neighbors', or both.

***Good fences make good neighbors.***
