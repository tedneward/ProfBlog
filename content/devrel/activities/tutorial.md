title=Tutorial
date=2023-02-20
type=page
tags=devrel, patterns
status=published
description=The Tutorial DevRel activity pattern.
~~~~~~
*Writing, Code*

***Also Known As***:

***Problem***: Your product/service is complex, with a large number of possible ways to get started, or large feature set. Developers find it difficult to get started, and/or make use of features. You might have [Reference Documentation](reference-documentation.html) or one or more [Guides](guide.html), but these are not sufficient to get developers using your product/service or certain features of the product/service.

***Context***: Getting developers started is not a one-time exercise. Any developer that wants to learn your product/service is going to be coming at it "brand new", and it is irrelevant how long your product/service has been around--every developer is new to your product/service the first time they begin exploring it. Therefore, it is important that whatever solution you use to help them has a long longevity to it, and is easily reusable.

Developers are accustomed to being able to "do" rather than just "sit and listen". Psychological studies are mixed on whether different people have different "learning styles", but in general the adage "tell me and I forget; show me and I might remember; have me do and I remember" seems to hold for many if not most developers.

Every single developer will need to go through learning how to use your product/service (particularly as the number of features increase), so unless the company's business model assumes or relies on a small customer base (or a large DevRel team!), this must be a high-reach activity.

***Solution***: Create a tutorial that takes a developer from a well-defined "point A" to a well-defined "point B", with step-by-step instructions (and code) that developers can exercise and run for themselves. The steps taken should be concrete, clear, and comprehensive, so that developers understand what they are doing and why they are doing it.

In order to minimize the amount of work a developer must go through to get started with a tutorial, consider providing a [Live Playground](#live-playground) for developers to use.

***Consequences***: Unless your product/service is particularly small or has a small developer-facing "surface area", just one tutorial will not be enough. It is very likely that with each new feature developed in the product/service, a new tutorial showing how to use that feature will be useful if not necessary. New tutorials will be needed as new features are released.

Tutorials will also need to be updated regularly as the product/service modifies some of its existing features or functionality. The more tutorials, the more time and effort will be required to keep them up to date. This is a useful activity for the more junior members of the DevRel team (to help them get practice debugging against your product/service as well as help them learn the product/service more comprehensively).

Because it is difficult to predict ahead of time where developers will get stuck, consider providing the "answers" (completed tutorial) as a [Sample/Example](#sample-example) for developers to consult.

It is common to use material from a tutorial for a [Workshop](workshop.html) at a conference, providing some in-person lecture in front of the hands-on work, rather than relying on prose. Similar results can be achieved by combining a [Webinar](webinar.html) with a tutorial, creating greater reach but sacrificing some interactivity.

If there is a large number of tutorials, and there is demand for a higher-interactivity approach, tutorials can be combined with in-person (or virtual) lectures and turned into [Training](training.html). 

***Variants***:
