title=Reference Documentation
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Reference Documentation DevRel activity pattern.
~~~~~~
*Code, Writing*

Precise documentation about the API, interfaces, classes, or whatever makes up the "surface area" of the product/service with which developers interact.

***Also Known As***: 

***Problem***: Customers using your product/service will need to know all the possible configuration, parameters, types and effects that your product/service uses or depends on. While they could crawl through the source code to figure out the implications and ramifications (assuming your product/service is open source), doing so is extremely labor-intensive and always subject to change with each passing revision or pull request.

***Context***: Customers will want this information to be handy, searchable, and in some cases integrated with as many of their developer tools as possible; at a minimum, it will need to be something that can be linked publicly, so that it can be referenced from [Forum](#forums), [Articles](#article), and [Blog Posts](#blog-post).

Developers need comprehensive information that is the "final word" on what your product/service does, aside from running the code. If your product/service is not open-source or is cloud-hosted, this will be the only way customers will know how your product/service behaves without painful and time-consuming experimentation/trial-and-error.

***Solution***: Create a set of documentation that is publicly accessible, possibly derived from the codebase itself, that is comprehensive and complete. Reference documentation should focus on the "what" of every publicly-accessible aspect of your product/service.

***Consequences***: Reference documentation is often a large undertaking, and will require a great deal of time and energy to create, update, and maintain. Keep in mind that automatically-generated documentation can only go so far, and will be dependent on the developers' willingness to document the code extensively. (For example, the `javadoc` documentation-generation tool can build documentation from the names and structure of Java classes and methods, but cannot infer anything beyond the names.)

Where reference documentation focuses on the "what" of your product/service, consider using [Guides](#guides) to explain the "why" or the "how", as appropriate.

Consider having a third party review your reference documentation, and file issues or bug reports against insufficient documentation or documentation that doesn't tell developers anything further than the name of the thing in question.

Consider open-sourcing your documentation, such as hosting the documentation as a GitHub project, such that others outside your company has access. This will allow others (such as [Ambassadors](#ambassadors)) to find incorrect or incomplete elements of the documentation and submit changes or pull requests to correct it.

***Variants***:

* **Knowledge Base** Often, after a product/service has been out for a while and has gathered a fair amount of experience in its [Technical Support](#technical-support), it's easy to find patterns of questions and problems that customers are having. The larger the customer base, the quicker those patterns will emerge. In an effort to try and provide a high-reach/low-interactivity customer support option, put together (and continue to update and curate) a formalized collection of questions or topics into a website or queryable database, called the knowledge base, and make it available online. (In many respects, StackOverflow is a community-curated knowledge base for programming.)
