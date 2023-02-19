title=Sample/Example
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Sample/Example DevRel activity pattern.
~~~~~~
*Code*

Fully-executable code but single-focused for third-party developers to use as a learning exercise.

***Also Known As***: Demo

***Problem***: You want to show developers how to use your product/service, but there are enough details and/or need for precision that human language isn't sufficient to get the point across. You want developers to be able to see how to use your product/service from code.

***Context***: The product/service is one that is callable or usable from code, and is one that developers will use from code often. You want the code to be visible to as many developers (customers or otherwise) as possible, maximizing its reach.

***Solution***: Write code that illustrates a particular aspect or point or element of your product/service. Keep it as simple as possible--leaving out validation, security, edge-case handling, and so on--so as to focus primarily on the single core idea that your sample/example is looking to solve. Place that code someplace widely accesible (such as GitHub, your [Guides](guide.html) or [Reference Documentation](reference-documentation.html), or your [Forums](forums.html)) so that developers can discover the code as they learn more about your product/service.

***Consequences***: The sample/example needs to be small enough to illustrate a single point, only, or you run the risk of developers being overwhelmed with too many details and losing track of what's going on. For this reason, while samples/examples are executable, they typically do exactly one thing and nothing more.

Note that developers are fond of taking samples/examples and using them "as is" for their own work, changing only those elements which are necessary to get it working inside their own applications. This often means that if the sample/example contains no validation or security, then the developer will also often leave out validation or security. Make sure Legal drafts a disclaimer for all sample/example code reminding developers that this code is *not* production-ready.

***Variants***:

* **Gallery.** **"Kitchen Sink" Demo**. You want to provide customers with a wide range of samples/examples, but you also want them to be able to see what each looks from the user perspective and don't want developers to have to build each sliver of a feature in order to see it. By gathering all of the samples/examples into a single executable application, where each sample/example is its own selectable option within the Gallery, you keep the sample/example code isolated enough to allow customers to easily focus in on the single sample/example, while still keeping it to a single executable application.

* **Reference application.** A reference app is one that is intended to be more of a complete/comprehensive demonstration of the product/service, solving a (often fictitious) problem or providing capabilities to a (fictitious) company. Here the code can do many of the things that are left out of samples/examples--such as validation and security--because the reference application is more about how all the parts fit together, rather than just examining any single part. In fact, in many cases, the reference application is one that has too many parts, and is over-engineered to have more features or capabilities than is strictly needed for the problem described.
