title=Scala reactions
date=2006-03-02
type=post
tags=jvm, java, j2ee, c++, ruby, xml services, scala
status=published
description=In which I offer up some reactions to Scala.
~~~~~~

Apparently, I touched a nerve; predictably, people started counting the keystrokes and missing my point. 

<!--more-->

For example, Mark Blomsma wrote:

<blockquote>
Looks to me like you're comparing apples and pears. C# does not force you to use accessors. The following is already a lot closer to Scala.

```csharp
public class Person
{
	public string firstName; public string lastName; public Person spouse;

	public Person(string fn, string ln, Person s)
	{
		firstName = fn; lastName = ln; spouse = s;<br>
	}

	public Person(string fn, string ln) : this(gn, ln, null) { }

	public string Introduction()
	{
		return "Hi, my name is " + firstName + " " + lastName + (spouse != null ?
			" and this is my spouse, " + spouse.firstName + " " + spouse.lastName + "." : ".");
	}
}
```

This is only 356 keystrokes, compared to 287 for Scala. Now in Scala the default accessor for classes and members seems to be public, if this were not the case then you'd need 323 keystrokes in Scala. Only a very minor difference. And definately not enough to make a case that Scala is more efficient for a developer.

Another consideration if you start talking keystrokes is that the tooling suddenly becomes a factor. With C# and VS2005 I only type 'prop,tab,tab' and then the type and name info. Skipping quite some keystrokes.
</blockquote>

Mark, with all due respect, I gotta admit to believing that you're doing the apples-to-pears comparison here, at least with your definition of the Person class in C#. The Scala implementation does NOT define a public field, but accessor methods, thus preserving encapsulation in the same way that the property methods do in C# and Java and C++. The thing is, Scala just realizes that 80% of those methods are always coded the same way, so it assumes a default implementation when it sees that syntax. (Ruby does the same thing.)</p>

All that sort of misses the point, though: the purpose of the comparison was not to count keystrokes, per se, but to look at the <i>expressiveness</i> of the language and how concisely the language can express a concept without requiring a great deal of scaffolding. C, for example, could always be used to build object-oriented systems... but you had a lot of work to do on your own to do it. As a result, a huge amount of complexity was spent in manaing the relationships between "classes" by hand (by tracking pointer relationships and so on). C++ solved a lot of that by baking those concepts in as a first-class concept, thus reducing the surface area requirment in the programmer's mind devoted to "plumbing", and making room for more business-level complexity. Java did the same to C++ by introducing GC and other VM-level support, and so on. Scala and Ruby (and other hybrid and/or dynamic languages) are now seeking to do the same to Java and .NET.

The question of tooling is an interesting one, though: is a language just the language by itself, or the language plus the tools that support it? Is Lisp still Lisp if you take Emacs out of the equation? Or is Smalltalk interesting without the Smalltalk environment and/or browser? Can we separate the two? Should we? That's a question to which I don't have an easy answer.
 