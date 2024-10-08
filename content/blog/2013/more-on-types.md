title=More on Types
date=2013-05-01
type=post
tags=industry, development processes, languages, reading
status=published
description=In which I explore type systems a little bit more, in response to feedback.
~~~~~~

With my most recent blog post, some of you were a little less than impressed with the idea of using types.

<!--more-->

One reader, in particular, suggested that:
> Your encapsulating type aliases don't... encapsulate :|

Actually, it kinda does. But not in the way you described.

> `using X = qualified.type;` merely introduces an alias, and will consequently (a) not prevent assignment of a FirstName to a LastName (b) not even be detectible as such from CLI metadata (i.e. using reflection).

This is true—-the `using` statement only introduces an alias, in much the same way that C++’s “typedef” does. It’s not perfect, by any real means. Which is why the much *better* approach would be to introduce an actual type for Name, rather than just an alias--the alias is just a starting point.

> Also, the alias is lexically scoped, and doesn't actually _declare a public name_ (so, it would need to be redeclared in all 'client' compilation units. (This won't be done, of course, because the clients would have no clue about this and happily be passing `System.String` as ever). The same goes for C++ typedefs, or, indeed C++11 template aliases (`using FirstName = std::string;` and `using LastName = std::string;`). You'd be better off using `BOOST_STRONG_TYPEDEF` (or a roll-your-own version of this thing that is basically a CRTP pattern with some inherited constructors. When your compiler has the latter feature, you could probably do without an evil MACRO).

All of which is also true. Frankly, the “using” statement is a temporary stopgap, simply a placeholder designed to say, “In time, this will be replaced with a full-fledged type.”

And even more to the point, he fails to point out that my “Age” class from my example doesn’t really encapsulate the fact that Age is, fundamentally, an “int” under the covers—-because Age possesses type conversion operators to convert it into an int on demand (hence the “implicit” in that operator declaration), it’s pretty easy to get it back to straight “int”-land. Were I not so concerned with brevity, I’d have created a type that allowed for addition on it, though frankly I probably would forbid subtraction, and most certainly multiplication and division. (What does multiplying an Age mean, really?)

See, in truth, I cheated, because I know that the first reaction most O-O developers will have is, “Are you crazy? That’s tons more work—-just use the int!” Which, is fair, wrong, and an old argument-—the C guys said the same thing about these “object” things, and how much work it was compared to just declaring a data structure and writing a few procedures to manipulate them. Creating a full-fledged type for each domain—-or each fraction of a domain—-seems... heavy.

Truthfully, this is <strong>much</strong> easier to do in F#. And in Scala. And in a number of different languages. Unfortunately, in C#, Java, and even C++ (and frankly, I don’t think the use of an “evil MACRO” is unwarranted, if it doesn’t promote bad things). The fact that “doing it right” in those languages means “doing a ton of work to get it right” is exactly why nobody does it—and suffers the commensurate loss of encapsulation and integrity in their domain model.

Another poster pointed out that there is a <em>much</em> better series on this at <a href="http://www.fsharpforfunandprofit.com">http://www.fsharpforfunandprofit.com</a>. In particular, check out the series on <a href="http://fsharpforfunandprofit.com/series/designing-with-types.html">&quot;Designing with Types&quot;</a>—-it expresses everything I wanted to say, albeit in F# (where I was trying, somewhat unsuccessfully, to example-code it in C#). By the way, I suspect that almost every linguistic feature he uses would translate pretty easily/smoothly over to Scala (or possibly Clojure) as well.

Another poster pointed out that doing this type-driven design (TDD, anyone?) would create some serious havoc with your persistence. Cry me a river, and then go use a persistence model that fits an object-oriented and type-oriented paradigm. Like, I dunno, an <a href="http://www.db4o.com">object database</a>. Particularly considering that you shouldn’t want to expose your database schema to anyone outside the project anyway, if you’re concerned about code being tightly coupled. (As in, any other code outside this project—like a reporting engine or an ETL process—that accesses your database directly now is tied to that schema, and is therefore a tight-coupling restriction on evolving your schema.)

Achieving good encapsulation isn’t a matter of trying to hide the methods being used—it’s (partly) a matter of allowing the type system to carry a significant percentage of the cognitive load, so that you don’t have to. Which, when you think on it, is kinda what objects and strongly-typed type systems are supposed to do, isn’t it?
 
