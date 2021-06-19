title=Revisiting Rotor
date=2016-10-13
type=post
tags=csharp, fsharp, c++, clr, windows, macos, native, architecture
status=published
description=In which I reminisce about being a tangential part of the Rotor project, a decade-and-a-half prior.
~~~~~~
**tl;dr** As part of preparing for a workshop next week in Poland, I've been diving back into the CLR source code---which takes me back to my old friend, Rotor.

<!--more-->

For those of you who came to the CLR late, back in 2002 Microsoft offered up an open-source version of the CLR called the Shared Source CLI. ("CLI", for those who don't know, is the official ECMA Specification describing the virtual machine that .NET uses as its runtime. The "CLR" is the commercial name for Microsoft's implementation of the Common Language Infrastructure specification.) I can still remember the feeling of shock and awe when I heard that Microsoft was actually going to release the source---albeit with some of the core parts simplified for easier research purposes---to what it considered its flagship technology for the coming decade. Wow.

And then I got to write a book on it. Double wow.

And then Microsoft decided to pay me to follow up on the first edition with a second edition, which they would give away for free. Which, by the way, you can get [here](../../files/SSCLI2.pdf).

Triple wow.

But I want to call out something I wrote [eight years ago](http://blogs.tedneward.com/post/sscli-20-internals/), in the Prologue to the second edition:

> "[T]he book also marks a turning point, as well: with the release of the FCL source to the wider world of the development community and the lack of significant changes to the execution engine since v2, the Rotor distribution has effectively been "cut loose" by its original creators, to stand on its own within the community, as every open source project must do at some point. This is not a cause for alarm or concern—-the Mono project continues full force, and Microsoft‘s growing comfort with the open-source community leads to the distinct possibility that the commercial CLR source will, one day, stand where Rotor once stood."

It's probably bad form to smirk as hard as I am right now. But I'm still doing it.

Thank you, David Stutz, for blazing the trail that Rotor could go down, and in doing so start the avalanche that would eventually become Microsoft's engagement in the larger world of open source. We in the Microsoft community owe you a pretty big debt.
