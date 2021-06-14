title=Dynamic languages, type systems, and self-modifying systems
date=2005-10-18
type=post
tags=clr, javaee, j2ee, ruby
status=published
description=In which I talk about the power of dynamic languages and runtimes.
~~~~~~

Stu Halloway [has responded](http://www.relevancellc.com/blogs/?p=69) to [my earlier post](http://blogs.tedneward.com/2005/10/05/More+On+The+Dynamic+Language+Wave+But+Leave+The+Poor+Vendors+Alone.aspx) about dynamic languages, and Stu refines his argument. Still wrong, but at least now it's refined. :-)

<!--more-->

Stu writes that we're "talking past one another", and in particular notes that...

> The criticial point is that these abstractions are implemented in the language itself. Developers can (and do!) modify these core abstractions to work in different ways.

... where "these abstractions" are referring to "inheritance, encapsulation, delegation", etc, from my post.

Where Stu, I think, is being fallacious with this is that he presumes a bit much with respect to at least a few of these languages; in particular Ruby has <EM>some</EM> facility for self-modification and language evolution, but still relies on a core set of principles that are implemented in native code inside the Ruby interpreter. Ditto for Smalltalk, ditto for Python, and even for Lisp, the poster child for dynamic languages. (In all fairness, Stu does admit this--in a backhanded sort of way--when he notes that "The rules for adding new methods to existing classes aren’t (for the most part) in the core of ruby — they are implemented in Ruby source code.")

What Stu's point *does* raise, however, is still the valid point that languages offer a continuum of self-modification and/or evolution, and that languages like Ruby, Smalltalk, Python or Lisp clearly come in on the "more" end of that continuum as opposed to languages like C# or Java or C++. And this plays into his later comment when he states, "It’s all about control. With a vendor-oriented language like C#, core abstractions are much more firmly controlled by the language vendor. Conversely, developer-oriented langauges like Python leave more of these choices to the developer (although they tend to provide reasonable defaults). So, again, who do you trust?"

There's two points I want to raise here. One is technical, the other political/cultural.

First, the technical: dynamic languages may choose to expose <EM>more</EM> meta-control over the language, but there's nothing inherent in the dynamic language that requires it, nor is there anything in a static language that prevents it. Languages/tools like Shigeru Chiba's <A href="http://www.csg.is.titech.ac.jp/~chiba/openc++.html">OpenC++</A> or <A href="http://www.csg.is.titech.ac.jp/~chiba/javassist/">Javassist</A>, or <A href="http://www.csg.is.titech.ac.jp/openjava/">Michiaki Tatsubori's OpenJava</A> clearly demonstrates that we can have a great deal of flexibility in how the language looks without losing the benefits of statically-typed environments. So to attribute this meta-linguistic capability exclusively to dynamic languages is a fallacy.

Secondly is the cultural issue: is the idea of granting meta-linguistic power (known as meta-object protocol, or MOP) to a language a good thing? Stu asserts that it is: "My concern is who controls the abstractions. Developer-oriented languages (like Scheme) give a lot of control (and responsibility) to developers. Vendor-oriented languages (like Java) leave that control more firmly in the hands of the vendor." So in whose hands are these abilities to change the language best placed?

*deep breath* I don't trust developers. There, I've said it.

I say this not because I think developers are all 5-year-olds who need to be carefully watched and monitored and chastised gently when they actually run with scissors, but because in some cases, we don't necessarily know what we're doing when we start adopting certain features or ideas. Here's an example of what I mean: about eight years ago, when servlets were new and Reflection was still a Brand New Topic amongst developers, I read an article on building a servlet-based system that was touted as "dynamic" and "powerful": in essence, the servlet would look for a query parameter in the request URL and Reflect for&nbsp;that method name on the servlet and/or alternate class, and execute it.

This is a Good Thing?!? Incredibly dynamic, granted, but given the overhead and performance implications (not to mention security concerns), I can't see this as a great way to build scalable, dynamic systems.

Gregor Kiczales, the inventor of AspectJ and long-time CLOS wonk--so you know he has experience on both sides of this fence--told me once that one of the greatest flaws of CLOS (I don't know if he used the word "flaw", per se, but that was my takeaway) was that it allowed developers too much power. Developers writing CLOS systems apparently had this tendency to do too many wild-and-crazy things that ultimately (in his view) led to a number of write-only CLOS codebases. AspectJ was deliberately constrained to prevent these sorts of things, and whether or not he's succeeded in that remains to be seen--many long-time O-O advocates still see AspectJ as "an evil hacking language", despite those constraints.

I see the same concern every time a developer starts talking about doing bytecode manipulation at load-time--just because you *can* doesn't mean you *should*. In this respect, I trust the guys who've been down this road before much more so than developers who are just coming to this and are starting to flex their new-found freedom and will (undoubtedly) start building systems that exercise this power.

In the end, Stu's right, in that he and I share a lot of common ground--<A href="http://www.develop.com">working together</A> for four years has a tendency to do that to you. And I won't even suggest that he's "wrong" so much as that he and I simply disagree on how much meta-control should be baked into a language, dynamic or otherwise.
