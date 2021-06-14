+++
date = "2008-02-18T04:22:11.5499013-08:00"
draft = false
title = "Why we need both static and dynamic in the same language"
aliases = [
	"/2008/02/18/Why+We+Need+Both+Static+And+Dynamic+In+The+Same+Language.aspx"
]
categories = [
	
]
concepts = []
languages = []
platforms = []
 
+++
<p>Stu <a href="http://www.relevancellc.com/2008/2/12/how-should-metaclass-work">demonstrates</a> one of the basic problems with an all-dynamic language: "I just spent an hour figuring out why some carefully-tested code went no-op after adding RSpec to a project." As much as I berate Stu at times (both in person and in blog), the fact is, I deeply respect and admire his programming skill, and if he can lose an hour to something that (I submit for your consideration) could have been caught by a static analysis tool fairly easily, then clearly that was a wasted hour of Stu's life. Worse, the problem is not yet solved, since now he has to make a hard choice about which definition to use, or else find a way to hack around the two definitions and create a third. Or perhaps something even uglier than this....</p> <p>And this presumes that all developers using Ruby will have Stu's skill and his sense of responsibility when coming up with the solution. Asking that of all programmers across the globe is simply too much.</p> <p>But clearly we cannot simply abandon the power of the dynamic language, either. <a href="http://www.relevancellc.com/2008/2/11/why-they-fear-the-meta">Quoting again from the same source</a>, Stu points out the very reason why dynamic languages are so powerful: "Once you start treating code as data, the elegance of your code is dependent on your skill. You cannot hide behind the limitations of your programming language anymore, because there aren't any."</p> <p>What's a language designer left to do?</p> <p>Choose both, of course.</p> <p>The more I think about it, the more I think <a href="http://cobra-language.com/">Cobra</a> (and other languages) has it right: a programming language should have <em>both</em> static and dynamic features within it, simultaneously. This is the first "modern" language I've seen come along that espouses the "static when you can, dynamic when you want" principle as a first-class concept. Even at that, I imagine that there's much more that could be done than what Cobra espouses. Imagine combining the power of Scala's type inferencing system with the flexibility of a Groovy or Ruby.</p> <p>Shivers.</p>
 
