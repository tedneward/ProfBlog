+++
date = "2005-08-22T03:31:19.5527760-07:00"
draft = false
title = "Book Review: Pragmatic Project Automation"
aliases = [
	"/2005/08/22/Book+Review+Pragmatic+Project+Automation.aspx"
]
categories = [
	"Reading",".NET","Java/J2EE"
]
concepts = ["Reading"]
languages = []
platforms = [".NET", "Java/J2EE"]
 
+++
<p>A bit late, but I realized after I posted the Recommended Reading List that I forgot to add Mike Clark's <i>Pragmatic Project Automation</i>, a great resource for ideas on how to automate various parts of your build cycle... and, more importantly, why this is such a necessary step. Although nominally a Java book, there's really nothing in here that couldn't also be adopted to a .NET environment, particularly now that $g(NAnt) and $g(MSBuild) are prevalent in .NET development shops all over the planet.</p>

<p>Most importantly, Mike indirectly points out a great lesson when he uses $g(Groovy) to script $g(Ant) builds: that you don't have to stick with just the tools that are given to you. Automation can take place in a variety of ways, and scripting languages (like Groovy, or Ruby, or Python...) are a great way to drive lower-level tools like Ant. <a href="http://www.relevancellc.com/blogs" target="_blank">Stu Halloway</a> has begun talking about the same concept when he discusses "Unit Testing with Jython" at the $NFJS shows. Coming from the .NET space? Then think about $g(IronPython), or even the JScript implementation that comes out of the box with Visual Studio.</p>

<p>All in all, a highly-recommended read.</p>
 
