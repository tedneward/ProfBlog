title=Product/Service Development
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Product Development DevRel activity pattern.
~~~~~~
*Code*

DevRel works on integration endpoints (a la APIs) for connecting or extending the core product/service.

***Also Known As***: Extensions; Providers

***Problem***: Certain aspects of the product/service are not easily accessible (or accessible at all) to the community, and the company has deemed it necessary that they should be. Engineering arguably should be focused on providing this, but can't due to constraints (time, budget, bandwidth, etc).

***Context***: Ideally, many of the extensions or integrations discussed can and should be written by third parties outside the company, in order to avoid the maintenance burden that would come with developing them "in-house". But for whatever reason, third parties haven't built those extensions or integrations, either because they lack access (the product/service is tucked behind the firewall and the code is not public), knowledge (they do not know the integration or extension points exist, or how to use them), or rationale (they do not have reason to build them).

***Solution***: Have the DevRel team take time to build the integration or one (or more) extensions.

***Consequences***: If the integration is connected to something internal that must remain internal (such as internal services or databases), chances are that maintenance of this integration will need to be continued and upheld by the DevRel team until such time that it can be handed off to Engineering to own. (And it should be handed off!) Note that [Technical Support](technical-support.html) will be needed on it, so the sooner it can be "folded in" to the larger product/service offering, the better, particularly as customers make more and more use of it.

If the integration or extension is built as part of a customer or partner deal, 

***Variants***:

* **API Gateway**. For larger companies with silo'ed internal services that have little-to-zero commonality or standardization to their endpoint description or implementation, it sometimes falls to the DevRel team to build a single-point-of-access for customers to integrate against, providing a standardization layer before "farming out" the API call elsewhere into the collection of internal services. Often this Gateway is built to be accessible over HTTP, although any distributed protocol could work: HTTP, gRPC, GraphQL, or a messaging tool. In these cases, DevRel is taking on more of an Engineering role, because until the Gateway can be re-homed into an Engineering org, DevRel will need to treat the Gateway with all the rigor and discipline that any Engineering product would demand: on-call support, bug triage, version (and revision) management, and so on.
