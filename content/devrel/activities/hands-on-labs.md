title=Hands-On Labs
date=2023-02-20
type=page
tags=devrel, patterns
status=published
description=The Hands-On Labs DevRel activity pattern.
~~~~~~
*Code*

Focus is entirely on the writing of code; sometimes a sequence of steps for a developer to do unguided or with minimal ahead-of-time instructions or lectures.

***Also Known As***: Codelabs; Homework

***Problem***: You want developers to get some "practice time" in using your product/service, but getting started and/or figuring out how to accomplish certain larger multi-step tasks can be difficult for developers to figure out on their own. 

***Context***: Sometimes the product/service is complex enough that self-directed exercise is difficult for developers. The product/service might also be one that has subtle nuances that won't be obvious to developers until they have seen it "in action" or worked their way through a particular problem or set of problems. Or you may find from your [Customer Check-ins](customer-checkin.html) or [Customer Pre-Sale meetings](customer-pre-sale.html) (or from your [Tech Support](technical-support.html) metrics) that a particular aspect of your product/service is tricky for developers to understand, or are mis-using regularly. It's clear customers don't understand your product/service well enough.

***Solution***: Some developers prefer to "learn by doing", so provide them with a coding challenge that takes a non-trivial amount of work to complete, along with documentation that provides "steps" for developers to follow to complete the challenge. (Challenges here don't necessarily mean "puzzles" or "riddles"--the classic "To-Do List" example application posted by some front-end frameworks is a good example of a Hands-On-Lab possibility.)

Walk developers through a series of smaller exercises to accomplish the larger task. Ideally each such "step" should take someone familiar with the material no more than an hour (at most!) to complete. Assume that it will take your audience (unfamiliar with your product/service) four to five times longer than yourself; even longer if you are the one creating the Hands-On-Lab.

Provide a "solution" for developers to examine against, so that those who get stuck have someplace to go to get more information and/or working code that they can compare against their own. Many Hands-On-Labs are stored as a series of branches in a public GitHub repository, allowing developers to use tooling with which they are familiar, and in turn allows them to switch between branches (or view the branch online at the GitHub website) if they get stuck.

***Consequences***: Hands-On-Labs are often a good pairing to a [Guide](guide.html): the Guide explores a particular concept, then the Hands-On-Labs reinforce that concept with code.

HOLs should take a developer unfamiliar with your product/service anywhere from one day to one week to complete--any shorter and they aren't complex enough, and any longer and developers won't finish them.

Make sure the steps aren't too high-level or too low-level. "Build a database" is probably too high-level and vague; "Click this button and then type 'foo-bar-quux' into the name field" is probably too low-level and insulting to the developers' intelligence. Calibrate the instructions to your target persona's experience level as a developer, and verify that by asking developers of that level to try them.

Hands-On-Labs are often conducted alongside or as part of a [Workshop](workshop.html); in an in-person event, the difference between the two is often the presence (Workshop) or absence (Hands-On-Labs) of presentations introducing the topics and/or an instructor making themselves available for questions during the exercise. Most Hands-On-Labs are self-directed, self-paced activities, done individually (although generally nothing prevents pairing or "mob programming" if desired).

***Variants***:

* **Certification.** One way to help customers self-identify (and silently promote your brand) as being experts in your product/service is to offer up a formal, branded certificate that offers your company's endorsement of the customer's skillset once the customer has completed one or more of the Hands-on-Labs successfully. If your product/service is broad enough or deep enough, offer several different certifications, each with an associated set of Hands-On-Labs that developers must go through (successfully) to claim.
