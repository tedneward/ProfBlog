+++
date = "2006-03-02T22:41:16.6422800-08:00"
draft = false
title = "Scala reactions"
aliases = [
	"/2006/03/03/Scala+Reactions.aspx"
]
categories = [
	"Java/J2EE",".NET","C++","Ruby","XML Services"
]
concepts = ["XML Services"]
languages = ["C++", "Ruby"]
platforms = ["Java/J2EE", ".NET"]
 
+++
<p>Apparently, I touched a nerve with that last post; predictably, people started counting the keystrokes and missing my point. For example, Mark Blomsma wrote:
<blockquote>
<font face="Courier New" size=2>Looks to me like you're comparing apples and pears.<br>
<br>
C# does not force you to use accessors. The following is already a lot closer to Scala.<br>
<br>
public class Person<br>
{<br>
public string firstName; public string lastName; public Person spouse;<br>
<br>
public Person(string fn, string ln, Person s)<br>
{<br>
firstName = fn; lastName = ln; spouse = s;<br>
}<br>
<br>
public Person(string fn, string ln) : this(gn, ln, null) { }<br>
<br>
public string Introduction()<br>
{<br>
return "Hi, my name is " + firstName + " " + lastName +<br>
(spouse != null ?<br>
" and this is my spouse, " + spouse.firstName + " " + spouse.lastName + "." :<br>
".");<br>
}<br>
}<br>
<br>
This is only 356 keystrokes, compared to 287 for Scala. Now in Scala the default accessor for classes and members seems to be public, if this were not the case then you'd need 323 keystrokes in Scala.<br>
Only a very minor difference. And definately not enough to make a case that Scala is more efficient for a developer.<br>
<br>
Another consideration if you start talking keystrokes is that the tooling suddenly becomes a factor. With C# and VS2005 I only type 'prop,tab,tab' and then the type and name info. Skipping quite some keystrokes.</font>
</blockquote>
Mark, with all due respect, I gotta admit to believing that you're doing the apples-to-pears comparison here, at least with your definition of the Person class in C#. The Scala implementation does NOT define a public field, but accessor methods, thus preserving encapsulation in the same way that the property methods do in C# and Java and C++. The thing is, Scala just realizes that 80% of those methods are always coded the same way, so it assumes a default implementation when it sees that syntax. (Ruby does the same thing.)</p>

<p>All that sort of misses the point, though: the purpose of the comparison was not to count keystrokes, per se, but to look at the <i>expressiveness</i> of the language and how concisely the language can express a concept without requiring a great deal of scaffolding. C, for example, could always be used to build object-oriented systems... but you had a lot of work to do on your own to do it. As a result, a huge amount of complexity was spent in manaing the relationships between "classes" by hand (by tracking pointer relationships and so on). C++ solved a lot of that by baking those concepts in as a first-class concept, thus reducing the surface area requirment in the programmer's mind devoted to "plumbing", and making room for more business-level complexity. Java did the same to C++ by introducing GC and other VM-level support, and so on. Scala and Ruby (and other hybrid and/or dynamic languages) are now seeking to do the same to Java and .NET.</p>

<p>The question of tooling is an interesting one, though: is a language just the language by itself, or the language plus the tools that support it? Is Lisp still Lisp if you take Emacs out of the equation? Or is Smalltalk interesting without the Smalltalk environment and/or browser? Can we separate the two? Should we? That's a question to which I don't have an easy answer.</p>
 
