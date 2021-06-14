+++
date = "2013-01-05T01:54:53.8830068-08:00"
draft = false
title = "Review: Metaprogramming in .NET"
aliases = [
	"/2013/01/05/Review+Metaprogramming+In+Net.aspx"
]
categories = [
	".NET","C#","F#","Languages","Reading","Review","Visual Basic","Windows"
]
concepts = ["Languages", "Reading"]
languages = ["C#", "F#", "Visual Basic"]
platforms = [".NET", "Windows"]
 
+++
<p><a href="http://www.amazon.com/Metaprogramming-NET-Kevin-Hazzard/dp/1617290262/ref=sr_1_1?ie=UTF8&qid=1355425677&sr=8-1&keywords=metaprogramming+in+.net">Metaprogramming in .NET</a>, by Kevin Hazzard and Jason Bock, Manning Publications</p>

<p><b>TL;DR</b>: This is a great book (not perfect), but not an easy read for everyone, not because the writing is bad, but because the subject is a whole new level of abstraction above what most developers deal with.</p>

<p>Full disclosure: Manning Publications is a publisher I've published with before, and Kevin and Jason are both friends of mine in the .NET community. I write a column for MSDN Magazine, and metaprogramming was one of the topics in one of the series I've written ("Metaparadigmatic Programming") for the column, so this subject is not unfamiliar to me.</p>

<p>Kevin and Jason have done a great job covering a pretty diverse subject, in my opinion. Because metaprogramming is "programming about programming", it's sometimes a hard concept for people who've never really investigated it to wrap their heads around, but Kevin and Jason do a great job opening with some concepts first, then exploring .NET Reflection, which is most developers' first introduction to metaprogramming. If you can understand how Reflection is programming against code and code metadata, then you're in a good place to start exploring metaprogramming in further depth.</p>

<p>And explore it they do. From code generation with T4, CodeDOM and Reflection.Emit to code-level Expressions to low-level IL munging, they take you through a lot of the metaprogramming tools. They've also tried to include some practical places where these techniques are useful, though I do wish the examples had been a bit "larger", meaning they were integrated into the larger picture of a "real-world" system, but that's hard to do sometimes, and most readers sufficiently senior enough to read this book should be able to see how to apply them to their own problems. I also wish they'd approached generics a bit more thoroughly, since that's another metaprogrammatic technique that often doesn't get much love from developers (most of whom seem to view generics as a necessary evil, not a huge opportunity for design power), but maybe that would've been too much head-exploding for one book. Writing a LINQ provider would've been a good enhancement to the book, but again, that may have been a little too much for one book. I also wish they had put an IL overview into its own chapter, since it comes up in several chapters at once and would've been good as a reference, but there's books out there on IL, which hasn't changed much since .NET 2.0 days, so readers finding IL challenging should pick up one of those if they're finding their heads spinning a little on the IL syntax.</p>

<p>Having taken you through those techniques, though, they then take a different tack and take you through scripting languages and the Microsoft Dynamic Language Runtime (DLR), as well as into a few "alternative" languages for the CLR, which is an entirely different way of approaching metaprogrammatic techniques. Nemerle, for example, is a language that supports macros defined within the language, a technique that generally is limited to Lisps. (I admit it, Nemerle is one of my favorite CLR languages, and should be something every .NET developer plays with for at least a weekend.) They also include the first published coverage that I'm aware of on Roslyn, the Compiler-as-a-Service project under way at Microsoft, so readers intrigued by how they might use the compiler as part of their development efforts in v.Next of Visual Studio should definitely have a look.</p>

<p>Overall, the writing style is crisp, clean, not too academic but not too folksy, and entirely representative of two men I've been privileged to meet, have interesting technical conversations with, and have over to my house for dinner. Both are extremely approachable, and their text reflects this. Every .NET developer that wants to claim "senior" or "guru" level status should read this book and experiment with one or more of these techniques; these are the things that the "cool kids" in the .NET world know how to do, and if you want to hang with the best, this is the book you'll read cover to cover.</p>

<p><i>(This review was posted to Amazon at the above link on 5 Jan 2013, then copy-and-pasted here because I like posting reviews to my blog as well as to Amazon.)</i></p>
 
