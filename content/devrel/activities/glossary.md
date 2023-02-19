title=Developer Relations Activities Glossary
date=2023-02-20
type=page
tags=devrel, patterns
status=published
description=The glossary to the DevRel activity pattern language.
~~~~~~

Within the realm of Developer Relations, and in particular this pattern language, I find that agreement on the definition of some terms brings clarity to the discussion. I proffer these definitions:

<div id="community" />
### Community
The collection of developers who are outside the DevRel team. This is often synonymous with ["customer"](#customer) , but collective, while "customer" is generally thought to be more individual. A community is often centered around the [product/service](#productservice), but there may be sub-communities or other filtering criteria, such as by tech stack or platform; an API product/service may have a Java community, a .NET community, a Python community, each of which have different interests and outlook.

<div id="company" />
### Company
Who the DevRel team works for and represents. Basically, if you're on the DevRel team, this is the larger company around "us".

<div id="customer" />
### Customer
Anybody outside the [company](#company), whether they are a paying entity or not. DevRel teams will often want to segment this further (between open-source customers and paying customers, for example) in order to draw certain distinctions, but for the majority of these patterns it's sufficient to simply call anybody outside the company a customer. Note that based on the Direction (below) of the activity, the "customer" could very well be another team or developers inside the same company, so some nuance and flexibility in this definition is going to be needed. Basically, if you're on the DevRel team, this is everybody that's "not us" but is using our [product/service](#productservice). (Sometimes it helps to draw a distinction between "developers" as "all developers in the world" and "customers" as "those developers using our product/service".)

<div id="direction" />
### Direction
DevRel should be a circular exercise: DevRel should be talking to both those developers inside the company ("internal") as well as those outside of it ("external"). This means the usual activities of bringing development discussions to developers that might be customers of the company's product, but also bringing feedback from those developers on the outside back into the company for further discussion and/or examination. Many companies are also building DevRel teams to be entirely internal-facing, supporting their developers in a variety of the ways that traditionally have been externally-facing (such as owning the continuing education efforts to grow the internal developers).

<div id="interactivity" />
### Interactivity
This is the fidelity of communication--how "conversational" is the exercise? This in many cases is in inverse proportion to Reach, but not always. The blog post doesn't really allow for great conversation (yes, you can open up comments on the blog, but we all know what happens when you do, and it's not pretty), whereas a workshop really requires a high degree of interactivity with the attendees. The blog post author doesn't learn much from their audience when posting the blog--the workshop facilitator, however, can learn all kinds of things from the attendees via the questions they ask, the problems they run into, the questions they don't ask, and so on.

Note that contrary to popular belief, higher interactivity is not always desirable--many  highly-interactive activities consume team bandwidth, and as a result the greater tha number of highly-interactive activities you want to do, the larger the team you will need to do them. For companies like Microsoft or Google with hundreds of employees in their DevRel organizations, this may be feasible; for most companies running a DevRel team of five or even a department of twenty, this is not sustainable for any length of time.

<div id="partners" />
### Partners
Partners are third-party entities that employ (or are) customers in their own right, but have a much deeper relationship with the company than most customers. This may be because the two (the DevRel team's company and the other entity) have product/services that are complementary to one another, one is a part of the other's supply chain, or because the two have entered into a mutually-beneficial deal.

<div id="productservice" />
### Product/Service
What the DevRel team is looking to talk about. This can be a tool (such as an IDE or database), a library or set of libraries, a web service accessed over HTTP (commonly called an "API", "Web API" or "HTTP API"), some other kind of service (anything that ends with "-as-a-service" is a strong candidate), and so on. It need not be a formal artifact that is "sold"--open source projects around/about which the company sells services would be referred here as "product/service". Note that the company may have many product/services available, and a single DevRel team may support all of them, a few of them, or only one of them, but the distinction between one product/service or many product/services is largely irrelevant to the pattern catalog below.

<div id="reach" />
### Reach
How "far" does this activity go? How many people can see it and/or consume it? Those things done over the Internet tend to have a large reach (particularly if any artifact produced by the activity is someplace where Google can find it and pop it up during search results), whereas those things done in person (such as the hands-on workshop) will have very short reach, since participation requires physical presence. For example, the blog post can echo across the entire world within minutes, and even across time itself--certain blog posts just keep getting rediscovered by new readers. (Thanks, Google!) This contrasts with an in-person workshop done at a conference event, even if the workshop has a thousand people in it. In other words, the blog post can reach millions (and even more, long after its publication!), while the workshop only a thousand (and once over, can never go higher).
