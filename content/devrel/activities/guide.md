title=Guide
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Guide DevRel activity pattern.
~~~~~~
*Writing, Code*

Written docs that take more of a "concept"-based approach to the product/service; not reference docs. Each guide covers some particular aspect/insight/explanation about the product/service (such as a feature).

***Also Known As***:

***Problem***: Developers need more than just the description of an API call or the acceptable values for parameters to that call--they need to build a mental model of how the product/service works, particularly "on the inside", where they lack visibility. 

***Context***: [Reference documentation](reference-documentation.html) is more tactical in nature, rather than conceptual, and developers at some point are going to ask questions like, "How does this work?" or "Why is it when I call A, then B, I get a different result than when I call B, then A?"

Customers will often need to understand the concepts behind the product/service in order to be able to understand its nuance, particularly when compared against competitors, or when measured up against something that might be a competitor (but actually isn't).

This is particularly apparent if the product/service is relatively novel or innovative in its space, as customers will not have much (if any) experience with the novelty or new concepts from other products or services they've used before.

***Solution***: Write one or more sets of longer-form prose pieces that each tackle the important concepts of the product/service. While precise details aren't necessary, there should be enough information in each one that a developer can build a mental model of how the product/service works "under the hood". For example, if the product/service stores data, some discussion of how the data is stored, how the data is queried, and when/how/if that data is encrypted "at rest" are necessary to give the developer a clear picture in their minds on how to approach using the data store.

Write these docs in a crisp, concise style, devoid of "tone" as much as possible. This is not the place to let the company culture fly or to weigh in with controversial technology opinions (except those that are baked in to the central concept of the product/service; it would be reasonable for a cloud service to weigh in on the advantages of running in the cloud, for example).

Certain guides will be specific to particular domains; popular guide topics include security, performance, scalability, accessibility, observability/monitoring, and reliability (backups), though many more are possible depending on the details and nuance of the product/service.

***Consequences***: Guides will often be the first set of documentation that developers will read when they begin their serious journey to understanding your product/service, and should therefore be something *very* carefully curated and edited. Consider using professional editing services and/or personnel to help ensure the writing is clear, consistent, and easily consumable.

Guides should link to the [Reference Documentation](reference-documentation.html) liberally, relying on the reference docs to describe all of the different permutations and possibilities. This leaves the Guides to focus on the more commonly-used aspects of the product/service, and as a result stay streamlined and more easily consumable.

As the product/service becomes more widely used internationally, consider hiring translation services to create native-tongue transations of the guides into languages that represent your customer population; if you find that your product/service has a singificant user base growing in Eastern Europe, for example, consider a Polish or Czech translation.

Recognize that in many cases, the ability for an individual in your community to make the transition to [Ambassador](ambassadors.html) lies in the ability to consume conceptual documentation about your product/service and then utilize that knowledge in [Forums](forums.html) and to create [Conference Sessions](conference-session.html) and [Articles](article.html). Provide opportunities for your Ambassadors to collaborate on the authoring and editing of these documents, perhaps even before they become publicly available.

A [Book](book.html) often covers the same material covered in Guides, but usually takes a more "high-level" approach to describing the contents, stretching across topics in ways that Guides typically don't. Books also often don't go into quite the depth of detail that Guides do, and look to be shorter than the full collection of your Guide(s).

***Variants***:
