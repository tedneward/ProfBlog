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

Deadlock among teams is a frustrating thing. Because many companies often practice the anti-pattern of [unanimous consensus decision-making](./consensus.md), getting a team past the decision-making stage of its early design and architecture can often feel like one of Twelve Labors of Hercules.

Then, in a flash of inspiration, an upper-level executive gets the idea that, in order to circumvent the problem, they can promote someone into a role of "Tech Lead", which will (in theory) allow that individual the opportunity to make decisions by *fiat*, utilizing the authority vested in the position to overrule the others and break the logjam.

***Consequences:***

Once promoted, the Tech Lead often finds several second-order effects kick in:

* **Resentment.** If the Tech Lead does, in fact, make use of their authority to make the decisions and break the logjam, it often breeds resentment from the other people in the group, particularly if the newly-minted Tech Lead does not have the people skills to offer some compromise in other areas (which can lead to some design-by-committee results). What's worse, if that newly-minted Tech Lead isn't particularly diplomatic, they may actually revel in their new-found authority, further hastening the buildup of resentment and growing dysfunction within the team.

* **Poor management of the team.** If the Tech Lead was promoted in order to break the logjam, it's highly likely this individual wasn't on any kind of fast-track into a management role to begin with, and it is equally likely that they are not particularly "human-minded" and familiar with the roles and responsibilities of managing a team. The careers of the other team members are likely to suffer from neglect as the necessary support for growth from their manager is lacking and/or inferior.

* **Poor decisions.** By promoting the Tech Lead, implicitly the company is weakening the future decisions of that Tech Lead from that point forward--because a manager has many responsibilities that take time away from the time to do research and experimentation in order to make solid technology decisions, the Tech Lead is now in the worst possible position, that of making decisions unilaterally while simultaneously having less and less time/energy to make sure their decisions are good (or at least defensible) ones.

***Variants:*** 

* **The Architect Manager:** At some point, an architect gets frustrated if the team doesn't follow the guidance and "standards" they've created, and start to demand some kind of enforcement authority. The natural next step, of course, is to promote them (often into the CTO role) so that they have some modicum of authority to "enforce the architecture" but without any real clear guidance as to how, when, or with what kinds of corrective action available. (Think about it for a second: Is the company really ready to fire an otherwise-productive senior engineer just because they refuse to use the architect's naming conventions? Or suggested designs?) Considering that architecture in any company larger than 10 people is likely to be its own full-time job anyway, promoting the architect into a management role is only going to create the same pressure on the Architect Manager as the others in this antipattern.

***Mitigation:***
