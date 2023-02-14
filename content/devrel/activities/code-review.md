title=Code Review
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Code Review DevRel activity pattern.
~~~~~~
*Code, Writing*

***Also Known As***: Engineering Deep-Dive; "Let's Get Eyes On It"

***Problem***: You have customers that are using the product/service, but they are running into issues (or at least claim they are running into issues) that they cannot resolve themselves. This could either be threatening their future engagement with the product/service, creating a bad brand experience that could harm the product/service's reputation within the community, or jeopardizing a partnership agreement with a partner. In some cases, the customer may be asserting that they have found an unreported bug and are seeking confirmation/validation. In other cases, it may be a performance or scalability issue.

***Context***: The customer/partner's code is complex and longer than can be consumed via an email or a posted question in [Forums](forums.html). Alternatively, the code is closed-source, and the customer is not able to (or interested in) share the code with anyone else.

***Solution***: Set up a meeting with one or more participants from the DevRel team and the customer. During this meeting, the DevRel team walks through the code with the customer, hopefully spotting the issue, bug, or misunderstanding in the customer's code.

***Consequences***: Customers may not show appreciation if/when the code is corrected (nobody likes to cry for help only to find out it was a problem in their head or on their side of the table), but in general customers are more appreciative when they can get past their problems than when they cannot.

Exposing DevRel teams to places where customers are having problems with the code becomes valuable feedback that can be communicated internally to Engineering, and lead to changes in either the [Guides](guide.html), the [Reference Documentation](reference-documentation.html), or sometimes the product itself. In some cases, if the issue appears often enough, it may warrant creation of [Blog posts](blog-post.html) with accompanying [Samples](sample-example.html), creation of a [extension or integration](productservice-development.html), and/or trigger a refactoring of the [SDK](sdk.html).

***Variants***:

* **Internal code review.** In some cases, it can be helpful to the DevRel team to better understand the product/service if they are used as reviewers of the code that make up the product/service (if it is not open-sourced already). While the DevRel team may not find any bugs or issues, the act of walking through the code can help Engineers think through some edge cases that might not be already covered, and the DevRel team will gain greater insight into how the product/service works "under the hood". 
