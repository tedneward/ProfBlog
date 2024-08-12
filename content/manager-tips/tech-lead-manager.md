title=The Tech-Lead Manager
date=2024-06-15
type=page
tags=management, antipatterns
status=published
description=Many companies make the same sorts of mistakes with their managers, over and over again. If they were software designs, we'd call them antipatterns. One of them is to make your tech lead a manager.
~~~~~~

"Avi is having problems getting the team following his technical design decisions, so let's make him the manager of the team. That way he can put some weight behind his decisions and make sure they follow them." While it's always tempting to take the tech lead of the project and put them into a management role, it almost always backfires, as it now puts a huge additional burden (that of managing people!) onto an individual who's likely already running out of hours in the day, particularly if they're squarely in the critical path for feature development.

<!-- more -->

***Context:*** 

Deadlock among teams is a frustrating thing. Because many companies often practice the anti-pattern of [unanimous consensus decision-making](./consensus.html), getting a team past the decision-making stage of its early design and architecture can often feel like one of Twelve Labors of Hercules.

Then, in a flash of inspiration, an upper-level executive gets the idea that, in order to circumvent the problem, they can promote someone into a role of "Tech Lead", which will (in theory) allow that individual the opportunity to make decisions by *fiat*, utilizing the authority vested in the position to overrule the others and break the logjam.

***Consequences:***

Once promoted, the Tech Lead often finds several second-order effects kick in:

* **Resentment.** If the Tech Lead does, in fact, make use of their authority to make the decisions and break the logjam, it often breeds resentment from the other people in the group, particularly if the newly-minted Tech Lead does not have the people skills to offer some compromise in other areas (which can lead to some design-by-committee results). What's worse, if that newly-minted Tech Lead isn't particularly diplomatic, they may actually revel in their new-found authority, further hastening the buildup of resentment and growing dysfunction within the team.

* **Poor management of the team.** If the Tech Lead was promoted in order to break the logjam, it's highly likely this individual wasn't on any kind of fast-track into a management role to begin with, and it is equally likely that they are not particularly "human-minded" and familiar with the roles and responsibilities of managing a team. The careers of the other team members are likely to suffer from neglect as the necessary support for growth from their manager is lacking and/or inferior.

* **Poor decisions.** By promoting the Tech Lead, implicitly the company is weakening the future decisions of that Tech Lead from that point forward--because a manager has many responsibilities that take time away from the time to do research and experimentation in order to make solid technology decisions, the Tech Lead is now in the worst possible position, that of making decisions unilaterally while simultaneously having less and less time/energy to make sure their decisions are good (or at least defensible) ones.

***Variants:*** 

* **The Architect Manager:** At some point, an architect gets frustrated if the team doesn't follow the guidance and "standards" they've created, and start to demand some kind of enforcement authority. The natural next step, of course, is to promote them (often into the CTO role) so that they have some modicum of authority to "enforce the architecture" but without any real clear guidance as to how, when, or with what kinds of corrective action available. (Think about it for a second: Is the company really ready to fire an otherwise-productive senior engineer just because they refuse to use the architect's naming conventions? Or suggested designs?) Considering that architecture in any company larger than 10 people is likely to be its own full-time job anyway, promoting the architect into a management role is only going to create the same pressure on the Architect Manager as the others in this antipattern.

***Mitigation:***

**If you work for the Tech Lead.** 

**If you are the Tech Lead.** Do you want to stay? That's really the question. If you're like many technologists who suddenly found themselves in a position of authority, you're entirely unsure if you want to remain a manager. You've heard such horror stories, but gosh, the power to tell people what to do is awfully addictive sometimes, particularly when they just aren't as smart as you.... Do yourself a favor: If you're a manager because of the perks it gives *you*, instead of allowing you to be in a position where you can help your *team* get better as a whole, go back to IC work.

* **Embrace "servant leadership".** The concept of servant leadership is that the leader is there to do whatever it takes to get the team to rise to its full potential, even if that means sweeping the floors and taking out the trash. If you come to work in the morning and have no idea what you need to be doing for the team, consider simply asking them: "What can I do to help you all get your work done?" And then do that.

* **Eschew technical decisions.** Yes, you were made the Tech Lead, but that doesn't mean that every decision has to be yours. In fact, you should probably reserve your decision-making authority to "special cases", such as when the team has deadlocked (again) and you need to break the tie, or when the team is completely and utterly lost as to what to do. This may mean you don't get to make technical decisions for months if not years. Good! Your job is to help the team get better, not exercise (and showcase) your technical abilities.

**If the Tech Lead works for you.** If you put the Tech Lead into this position, it's on you to make sure you support them and help them get out of it.

* **Determine if they want to manage, or engineer.** Given that it's nigh-impossible to do both well, your first task is to determine which "way" they want to go. If they want to get back to IC work, then look for a suitable replacement to lead the team, and when that replacement is ready, slide them into place. However, you *cannot* simply demote the Tech Lead back to engineer--no one will want to take a lesser title, lower salary, and/or fewer career options! Most likely you'll need to create some kind of parallel-IC track (distinguished engineers, technical fellows, chief scientists, whatever), where an IC employee can be in a salary band comparable to your management structure, so that there's no loss of compensation, benefits, or prestige.

* **Help with the management.** Assuming they want to remain as the manager, start providing some 



