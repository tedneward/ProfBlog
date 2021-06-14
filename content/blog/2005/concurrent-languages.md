title=Book Review: Rootkits
date=2005-10-28
type=post
tags=industry, reading, review, languages
status=published
description=In which I talk about concurrent programming languages.
~~~~~~

Ever since the Seattle Code Camp, where I hosted a discussion (hardly can call it a lecture--I didn't do most of the talking this time, as it turned out) on language innovations, one of the topics that came up was the notion of concurrency, and of course Herb Sutter's "No More Free Lunch" article from DDJ from some months ago. That put a bug in my ear: what sort of languages out there support concurrency in some form, baked into the language? I've started to compile a list, but any other suggestions/references would be welcome; I'd like to keep it to "active" languages (as opposed to languages no longer under active development), but if there's a particular concurrent language that had some kind of major influence on a branch of thinking, I'd love to see it listed. And by "language" here I'm willing to be flexible--extensions to preexisting languages (a la OpenMP) are interesting in their own right. But, I'd like to keep it to *language*-level constructs, not *library*-level constructs--so C-with-POSIX, C++-with-BOOST or Java-with-java.util.concurrent aren't going to make the list, since they mostly support concurrency through the low-level mechanism of "start yer own thread". I'm interested in languages that do more than that. :-)

So far, what I've come up with includes: 

* <A href="http://research.microsoft.com/research/downloads/default.aspx" target=_blank>Cw (aka C-omega)</A>: a combination of X#/Xen and Polyphonic C#, Cw provides an interesting concept called "chords" that suggests that methods of classes "work together" in pairs to handle concurrent access.
* <A href="http://www.openmp.org" target=_blank>OpenMP</A>: an extension to FORTRAN and C++, OpenMP uses #pragmas (in C++) to declare regions of code where an OpenMP compiler can spawn off threads and provide concurrent execution. What makes this interesting is its intersection to the mainstream: Visual Studio 2005 is an OpenMP compiler, and works for both unmanaged and C++/CLI code, meaning that this may be an interesting approach to handling concurrency inside of .NET apps. I know there's more out there--fire away! Regardless of whether they compile for .NET, JVM, or unmanaged code, I'm interested in seeing what others have been exploring and/or playing around with. Academic links particularly wanted--they have a tendency to push the edge of the envelope (and some would say sanity) when it comes to areas like this. 
