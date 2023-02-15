title=Tests
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Tests DevRel activity pattern.
~~~~~~
*Code*

Unit or integration tests written to prove a particular hypothesis about the code (such as that it works, or that it integrates well, or so on). Often used as an artifact for developers to learn from--see also *Samples/Examples*.

***Also Known As***:

***Problem***: You want to provide examples of how to use your product/service, but your bandwidth is tight and/or you don't have the time or budget to produce [Reference Documentation](reference-documentation.html) or [Samples](sample-example.html) for each and every endpoint, configuration setting, or feature of your product/service.

***Context***: Developers are code-consuming and -friendly creatures, often placing faith in code above and beyond what they read in prose. 

***Solution***: Build and open-source a comprehensive set of tests against the public API of your product/service, and document it such that developers can find and examine the tests that are relevant to the particular problem or issue they might have.

***Consequences***: Tests should, first and foremost, be geared towards testing the product/service, and in many cases this can get in the way of the effort of answering developers' questions or getting a concept across. You run the risk of tests not serving their intended purpose if you modify the tests in order to serve as better documentation.

Depending on the nature of your product/service's tests, some of the information in tests may not be something you want to call attention to publicly, particularly parts of the tests that deal with security. Additionally, opening up the tests to the public potentially also reveals other things about the product/service that your company may not be comfortable with, such as the comprehensiveness of the tests. In these cases, consider writing exploration tests instead.

Additionally, tests for your product/service can and should be written by Engineering, and if the Engineering team is not 

While tests can provide a comprehensive set of inputs and expected outputs/behaviors, it cannot explain the conceptual model behind the product/service or the "why" of a particular feature. Thus, while tests may serve as a nice parallel to [Reference Documentation](reference-documentation.html), it does not work well as a replacement for a [Guide](guide.html) or [Article](article.html). If the tests are available publicly, consider hyperlinking to specific tests from other places (such as [Blog Posts](blog-post.html)) to reinforce certain details or to highlight more comprehensive possibilities.

***Variants***:

* **Exploration Tests.** Code that is written in the style of unit tests and making use of unit test runners, but intended to explore or provide examples of how to use your product/service, rather than testing all of the inputs (as [Tests](tests.html) are intended to do). Exploration tests will be smaller (since they rarely need to be exhaustive), and often more coarse-grained (because many will include multiple steps, something frowned upon in most unit tests). Note that exploration tests are also useful as new versions of the product/service are close to release, to verify that no accidental breaking changes are introduced.
