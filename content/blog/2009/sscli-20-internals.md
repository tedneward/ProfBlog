title=SSCLI 2.0 Internals
date=2009-05-26
type=post
tags=clr, sscli, virtual machines, reading, writing, languages, csharp, fsharp
status=published
description=Making available my copy of the draft of the SSCLI 2.0 Essentials book.
~~~~~~

Joel's weblog appears to be down, so in response to some emails I've posted my draft copy of *SSCLI 2.0 Internals*.

<!--more--> 

You can find it <a href="../../files/SSCLI2.pdf" target="_blank">here</a>. I think it's the same PDF that Joel had on his weblog, but I haven't made absolutely certain of the fact. :-/

If you've not checked out the first version of SSCLI Internals, it's cool-—the second edition is basically everything that the first edition is, plus a new chapter on Generics (and how they changed the internals of the CLR to reflect generics all the way through the system), so you're good. And if you're not sure where to get the codebase for Rotor 2.0 (the SSCLI), well, <a href="http://www.microsoft.com/downloads/details.aspx?FamilyId=8C09FD61-3F26-4555-AE17-3121B4F51D4D&amp;displaylang=en" target="_blank">here</a>, I'll make it easy for you. ;-)

Gotta say, this is almost without question my favorite book to have written. Just wish Microsoft would've kept Rotor up with the successive CLR releases (3.5 SP 1 and now the forthcoming 4.0). Maybe, if I can find that wishing ring....
 
**UPDATE (2016):** By the way, back in 2008 I wrote:

> "[T]he book also marks a turning point, as well: with the release of the FCL source to the wider world of the development community and the lack of significant changes to the execution engine since v2, the Rotor distribution has effectively been "cut loose" by its original creators, to stand on its own within the community, as every open source project must do at some point. This is not a cause for alarm or concern—-the Mono project continues full force, and Microsoft‘s growing comfort with the open-source community leads to the distinct possibility that the commercial CLR source will, one day, stand where Rotor once stood."

Can I call it, or can I call it?

**UPDATE (2021):** In case anyone was curious, yes, I've looked at the CoreCLR source code, and yes, most of the SSCLI Essentials text remains accurate. Some areas have changed for sure, but the overall "meat" of the text remains useful.
