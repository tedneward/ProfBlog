title=Leveling Up 'DDD'
date=2012-03-02
type=post
tags=languages, design
status=published
description=In which I talk a bit about DDD and how to improve on it.
~~~~~~

Eric Evans, a number of years ago, wrote a book on “Domain Driven Design”. Around the same time, Martin Fowler coined the “Rich Domain Model” pattern.

<!--more-->

Ever since then, people have been going bat-shit nutso over building these large domain object models, then twisting and contorting them in all these various ways to make them work across different contexts—-across tiers, for example, and into databases, and so on. It created a cottage industry of infrastructure tools, toolkits, libraries and frameworks, all designed somehow to make your objects less twisted and more usable and less tightly-coupled to infrastructure (I’ll pause for a moment to let you think about the absurdity of that—infrastructure designed to reduce coupling to other infrastructure—before we go on), and so on.

All the time, though, we were shying away from really taking the plunge, and thinking about domain entities in domain terms.

<a href="http://jessitron.blogspot.com/2012/03/strong-typing-in-java-religious.html" target="_blank">Jessica Kerr nails it, on the head</a>. Her post is in the context of Java (with, ironically, some F# thrown in for clarity), but the fact is, the Java parts could’ve been written in C# or C++ and the discussion would be the exact same.

To think about building domain objects, if you are really looking to build a domain model, means to think beyond the implementation language you’re building them in. That means you have to stop thinking in terms of “Strings” and “ints”, but in terms of “FirstName” and “Age” types. Ironically, Java is ill-suited as a language to support this. C# is not great about this, but it is easier than Java. C++, ironically, may be best suited for this, given the ease with which we can set up “aliased” types, via either the typedef or even the lowly preprocessor macro (though it hurts me to say that).

I disagree with her when she says that it’s a problem that FirstName can’t inherit from String—-frankly, I hold the position that having FirstName inherit from String would be putting too much implementation detail into FirstName then, and would hurt FirstName’s chances for evolution and enhancement—-but the rest of the post is so spot-on, it’s scary.

And the really ironic thing? I remember having this conversation nearly twenty years ago, in the context of C++ at the time.

Want another mind-warping discussion around DDD and how to think about domain objects correctly? Read Allen Holub’s “<a href="http://www.javaworld.com/javaworld/jw-09-2003/jw-0905-toolbox.html" target="_blank">Getters and Setters Considered Harmful</a>” article of nine (!) years ago.

Read those two entries, think on them for a bit, then give it a whirl in your own projects. Or as a research spike. I think you’ll start to find a lot of that infrastructure code starting to drop away and become unnecessary. And that will let you get back to the essence of objects, and level up your DDD.

(Unfortunately, I don’t know what leveled-up DDD is called. DDD++, maybe?)
 
