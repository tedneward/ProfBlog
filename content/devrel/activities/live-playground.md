title=Live Playground
date=2023-02-28
type=page
tags=devrel, patterns
status=published
description=The Live Playground DevRel activity pattern.
~~~~~~
*Code*

A live, executable environment in which customers can explore the product/service without having to go through the steps of installing/configuring it themselves.

***Also Known As***: Sandbox; "Try" site

***Problem***: Developers want to "get their hands dirty" on your product/service, but aren't installing it (if it runs locally) or aren't creating accounts (if it is cloud-hosted) to explore it further. You want to reduce the barrier-to-entry as far as possible, so that there is no reason they cannot start "playing" with your product/service as quickly as possible.

***Context***: Your product/service may have a complex installation process, requiring several distributed system services all configured to find each other, or there is a large amount of configuration to consider. Or your product/service may hae a large install footprint, and require significant amounts of time to download and install.

***Solution***: Create a website/domain that is a "sandbox" in which a developer can explore the product/service directly, without any commitment on their part.

***Consequences***: Operating a Live Playground will most likely require some commitment from your Operations staff, either in the form of direct Site Reliability Engineering support or direct Engineering support. At the very least, you will probably need some sort of budget for the hosting, as well as whatever up-front cost building out the Live Playground might require. This also implies some amount of maintenance, such as keeping the Live Playground up to date with whatever the v.Current version is.

The Live Playground makes an excellent basis for conducting [Workshops](workshop.html), and often provides a convenient backdrop for [Tutorials](tutorial.html) and [Guides](guide.html). You might even show screenshots from the Live Playground for the [Reference Documentation](reference-documentation.html).

Some customers may actually find the restrictions of the Live Playground still sufficient for their needs, at least through a prototyping stage, and that means there is a possibility that a customer could "go live" with the Live Playground as their production service/environment. Your company may have strong reactions to this idea, so make sure the ramifications are carefully thought out: this may be the "freemium" tier that your company offers, for example. If this is undesirable, then consider your options to persuade or force customers out of doing this: put Legal text in a frequent reminder to customers that this is not to be used for production purposes, or wipe out the Live Playground on a periodic basis (which will help with abuse, mentioned below), or throttle the Live Playground in some severe way that would dampen its ability to serve in any production capacity to anything but a prototype.

Sadly, making any resource available for free over the Internet--even if it is just comments on a webpage--is target for rampant abuse by malicious or immature actors. Ensure that if your live playground is accessible without some kind of gated entry (account login), you have procedures in place to safeguard it or at the very least reboot/wipe clean the environment periodically. Otherwise you could end up hosting content that be embarrassing, damaging, or illegal.

***Variants***:

* **Docker install.** The Live Playground will often be slower than executing something locally because of Internet latency and bandwidth restrictions. For some products/services, this will be undesirable, and/or developers sometimes simply prefer to "have it locally" so that they can experiment while in places with little or no network connectivity. (This may be much more necessary for those who work in highly-secure or network-isolated environments that do not or cannot have a regular Internet connection.) By providing a version of your product/service that can be installed locally via Docker, you give developers a chance to one-line-install your product/service, explore it for a while, and then one-line-delete it without having to do any additional configuration cleanup. NOTE: Docker installs are copying software down to the developer's machine, so if your product/service contains proprietary/closed-source code, you increase the ease by which malicious actors can obtain your binaries for reverse-engineering.
