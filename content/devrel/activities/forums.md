title=Forums
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Forums DevRel activity pattern.
~~~~~~
*Social, Writing*

Easily-accessible places online where customers can post questions and receive answers from both company employees and the surrounding community.

***Also Known As***: Support Forums; Bulletin Boards

***Problem***: Customers want to have a place in which to obtain answers without having to schedule conversations, comb through documentation, or read through lots of tests--in essence, they want to be able to post a question and get an answer (or a confirmation of what they think is a bug).

***Context***: Customers often want to do this Q-and-A style interaction asynchronously, with the ability to write code to support their question and/or see code in the answer. Customers also like helping other customers who are in similar situations--which helps build a sense of community around the product/service. However, they want some reasonable reassurance that the answers they are receiving are from "people who know", so that they do not have to wade through incorrect or incomplete or untested answers. 

***Solution***: One solution is for the company to host a forums system on the company's domain umbrella (see [Apple Developer Forums](https://developer.apple.com/forums/) for an example), in which customers can post questions and receive answers from employees or other customers. Another solution is to make use of a third-party-hosted forum system, like Stack Overflow or Reddit, by creating a "channel" or a "tag" by which questions from the community on the product/service can be easily identified. In either case, the DevRel team commits to being a visible presence on the forums, directly answering questions and/or visibly taking questions or issues internally and promising an answer within a reasonable period of time.

***Consequences***: Hosting forums requires a commitment to moderation, or the company runs the risk of creating a hostile environment that will alienate customers.

Additionally, hosting forums can have the benefit of being accessible to both internal employees as well as external customers, allowing for a degree of interaction without creating opportunities for customers to bypass traditional company information channels. (Customers having direct access to internal software engineers, by having their email address for example, can often have the negative side-effect of customers using those engineers for tech support purposes, distracting them from their other duties and/or creating issues for the [Tech Support](technical-support.html) team.)

Forums make for an easy way to identify potential [Ambassadors](ambassadors.html) from the community. Forums can also suggest [Samples/Examples](sample-example.html), enhancements to [Guides](guide.html) or [Reference Documentation](reference-documentation.html), or even [extensions or providers](product-development.html) for future development.

***Variants***: 

* **Wiki**. A wiki is essentially a forum, with the caveat that the roles are flexible--where traditional forums focus on question-followed-by-answer-and-discussion, a wiki is more free-form and allows for more collaborative interaction.

* **Stack Overflow**. **Reddit**. Stack is essentially a third-party-hosted forum, with the benefit of already being in existence. Stack also has gained a reputation of being intimidating to some users. Note that Stack also owns the content posted, and thus can moderate posts and remove them, leading to potential loss of information the company would prefer to keep around. To address concerns of incorrect information, Stack created the concept of "reputation", allowing readers to be able to filter better answers from worse. Reddit allows for long threaded conversations, with much discussion, but there is little code and often even less moderation. Both are extremely popular.

* **Developer Portals**. The traditional developer portal is often more than just forums--for example, it often aggregates links to developer-centric downloads like [SDKs](sdk.html) or [Samples/Examples](sample-example.html). However, much of the "stickiness" of the portal is its ability to capture developer attention via the question-and-answer forums.

* **GitHub Issues**. **Jira**. Forums are a natural mechanism to act as intake for [Technical Support](technical-support.html), and most GitHub-hosted projects have an "Issues" page in which customers can file questions that are either answered (and closed) or then used as bug reports that are referenced from pull requests during [Code Reviews](code-review.html). Jira serves a similar purpose, but usually Jira is behind a company firewall rather than being publicly accessible.
