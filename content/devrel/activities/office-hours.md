title=Office Hours
date=2023-02-20
type=page
tags=devrel, patterns
status=published
description=The Office Hours DevRel activity pattern.
~~~~~~
*Social*

***Also Known As***: 

***Problem***: Customers often run into problems that are hard to capture as a standalone [Sample/Example](sample-example.html) or in a written format for a bug report for [Tech Support](technical-support.html) or a [Forum](forums.html). In many cases, they don't have any idea what's going on because the product/service is complex, intimidating, or running in the cloud. The customer doesn't even know how to begin to describe the problem, making it difficult for them to take advantage of some of the other high-reach resources that are available.

***Context***: This kind of "I have no idea where to start" problem demands a high degree of interactivity from the customer: questions lead to answers that in turn generate more questions before the nature of the problem is even remotely understood. Additionally, you want to be able to see the customer's environment more closely, because often debugging a problem can be something entirely enmeshed in their environment (misconfigured installation, PATH conflicts, "DLL/JAR/Assembly Hell" issues, and so on).

***Solution***: Provide an "office hours" (similar in concept to what college professors offer students in their classes): a period of time during which customers can "drop in" without scheduling anything ahead of time and use the time for whatever purpose they choose. They can ask questions, do a [Code Review](code-review.html), do a quick [Customer Check-In](customer-checkin.html), or (most often) work on something [Technical Support](technical-support.html).

***Consequences***: Office hours are time-consuming, and can often seem like a waste of time if nobody attends. (This is true for university professors, too!) It will be particularly sparse when first getting started, as it is not a common tactic used by a number of teams or companies. Advertise it frequently (on your [Social Media](social-media.html), in your [Newsletter](newsletter.html), and/or maybe from your [Reference Documentation](reference-documentation.html)), and give it a quarter or two, minimum, before drawing significant conclusions.

Consider recording office hours, both for opportunities for reuse as well as for your own internal improvement purposes (such as evidence of customers asking for particular features or finding particular features). If you do this, however, make sure you are in compliance with legal requirements around recording--some places require only to notify participants that they are being recorded, others require consent (which can be captured with a web form before entering into the Zoom/Teams/Discord/whatever video chat). Also be up-front about the use of the recording; if you intend to use it in any public capacity, absolutely make that explicitly clear to the participants.

Office hours are often a great tool combined with [Live Streaming](live-streaming.html), and in fact either can be a nice segue into doing the other--office hours can give suggestions on what to live-stream, for example. Keep in mind that Live Streaming tooling prioritizes high-reach more than interactivity, however, so the two are not entirely interchangeable.

Consider capturing any significant code built during office hours as a [Gist](gist.html), or if the code is much bigger, as a [Sample/Example](sample-example.html). Make sure, if you do this, to get the customer's OK, on the off-chance that they are discussing something with you that they consider a secret or competitive advantage. (Legally, there may be no liability, but the last thing you want is to ruin a potential partnership or end a relationship because you gossiped about a new feature the customer hasn't announced yet. However, it wouldn't hurt to talk with Legal to make sure there's no liability!)

***Variants***:
