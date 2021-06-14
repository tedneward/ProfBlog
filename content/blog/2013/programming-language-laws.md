+++
date = "2013-03-19T18:32:43.8131967-07:00"
draft = false
title = "Programming language \"laws\""
aliases = [
	"/2013/03/20/Programming+Language+Laws.aspx"
]
categories = [
	".NET","Android","C#","C++","Conferences","Development Processes","F#","Industry","Java/J2EE","Languages","LLVM","Objective-C","Parrot","Personal","Python","Ruby","Scala","Visual Basic","WCF","Windows"
]
concepts = ["Development Processes", "Industry", "Languages"]
languages = ["C#", "C++", "F#", "Python", "Ruby", "Scala", "Visual Basic"]
platforms = [".NET", "Java/J2EE", "LLVM", "Parrot", "Windows"]
 
+++
<p>As is pretty typical for that site, Lambda the Ultimate has <a href="http://lambda-the-ultimate.org/node/4698">a great discussion</a> on some insights that the creators of Mozart and Oz have come to, regarding the design of programming languages; I repeat the post here for convenience:
<blockquote>
Now that we are close to releasing Mozart 2 (a complete redesign of the Mozart system), I have been thinking about how best to summarize the lessons we learned about programming paradigms in CTM. Here are five "laws" that summarize these lessons:

<ol>
<li>A well-designed program uses the right concepts, and the paradigm follows from the concepts that are used. [Paradigms are epiphenomena]</li>
<li>A paradigm with more concepts than another is not better or worse, just different. [Paradigm paradox]</li>
<li>Each problem has a best paradigm in which to program it; a paradigm with less concepts makes the program more complicated and a paradigm with more concepts makes reasoning more complicated. [Best paradigm principle]</li>
<li>If a program is complicated for reasons unrelated to the problem being solved, then a new concept should be added to the paradigm. [Creative extension principle]</li>
<li>A program's interface should depend only on its externally visible functionality, not on the paradigm used to implement it. [Model independence principle]</li>
</ol>
Here a "paradigm" is defined as a formal system that defines how computations are done and that leads to a set of techniques for programming and reasoning about programs. Some commonly used paradigms are called functional programming, object-oriented programming, and logic programming. The term "best paradigm" can have different meanings depending on the ultimate goal of the programming project; it usually refers to a paradigm that maximizes some combination of good properties such as clarity, provability, maintainability, efficiency, and extensibility. I am curious to see what the LtU community thinks of these laws and their formulation.
</blockquote>
This just so neatly calls out to me, based on my own very brief and very informal investigation into multi-paradigm programming (based on James Coplien's work from C++ from a decade-plus ago). I think they really have something interesting here.
</p>
 
