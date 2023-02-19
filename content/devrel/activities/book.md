title=Book
date=2023-02-20
type=page
tags=devrel, patterns
status=published
description=The Book DevRel activity pattern.
~~~~~~
*Writing, Code*

A written piece that covers a large subject expansively, usually published through one of the "name" publishers (Addison-Wesley, O'Reilly, Manning, and others in the tech sector), although not always; some books can be self-published, or may even remain entirely internal to the company. (Example: Microsoft maintained internal documentation called "The Book of the Runtime" with detailed descriptions of how the CLR worked before .NET Core was open-sourced and that material made available publicly.) Books typically run 150 to 400 pages in length, though shorter ones on more-focused topics are often popular as well.

***Also Known As***: Handbook; Playbook; Manual; E-Book

***Problem***: Your product/service is a complex (or deceptively complex--simple to start but complicated beyond the basics) subject and customers are overwhelmed with the options and features listed in your [Reference Documentation](reference-documentation.html). They are looking for something more comprehensive than a [Guide](guide.html) or [Article](article.html), with broader scope and depth. You need to get a vast amount of information out into customer (and potential customer) hands. 

***Context***: The material is relatively stable (requiring little updates due to changes), and the principal aim is to educate and/or explain, with little interactivity or feedback required or needed.

In some cases, the material is complex enough that supporting code samples, in line with the prose, are provided, and need to be larger than a "snippet" in order to get a complex concept across. (For example, explaining the concept of "middleware" in an HTTP stack usually requires demonstrating several files and separate and distinct "middleware agents" to get the concept across.) This means that it may be too complex to get across in a single [Article](article.html) or [Blog post](blog-post.html), and spread it across multiples of either will break the flow of understanding for the reader.

***Solution***: Identify one or two people on the DevRel team who are comfortable with long-form writing, and have them write material to form a book. (Alternatively, the material can come together from a variety of sources, such as internal engineers, but then the one or two people will be editors, rather than authors, bringing all the material together to feel like it is written in one style, and ensuring material does not substantively overlap.) This book can either be self-published (often in electronic form only) by the company, or published through an established publisher for greater reach.

***Consequences***: The cost of writing a book is extremely high to the author, often requiring a full-time effort for many months, leaving zero bandwidth to participate in many of the other activities. The author's brand recognition and credibility will improve after the book's publication, however, and often open doors for the author and the company due solely to its existence.

Books are often written using GitBook.

Customer commitment to consuming a book is non-trivial, as most books require days to read, even without any other distraction, and most will require weeks or months given a typical day and commitments. The content must be worth the investment, or the reputation will be negative rather than positive. For this reason, books should be reviewed by subject-matter-experts to ensure its accuracy, and the book should be written to have some "longevity" beyond the current product/service release.

Books written by the DevRel team act as a much broader and deeper [Guide](guide.html) and can go into depth and detail that is often not possible otherwise.

Books written by [Ambassadors](ambassadors.html) instead of the DevRel team members can be very beneficial to both company and Ambassador; the Ambassador improves their own branding within the community (which is good for them), and the company sees deeper technical content distributed to the community without requiring a large time investment from their DevRel team or internal engineers. Usually the DevRel team and/or internal engineers will need (and want!) to be a part of the editing team, however, to ensure that the material is correct and/or in line with the company's messaging and future plans.

Books are popular as [Swag](swag.html). Book excerpts can be used as [Articles](article.html) and/or [Blog posts](blog-post.html). Books are also highly eye-catching and credibility-building when displayed at the [Booth](booth.html) and/or used in [Customer Pre-Sale Meetings](customer-pre-sale.html), particularly if written by somebody on the DevRel team.
