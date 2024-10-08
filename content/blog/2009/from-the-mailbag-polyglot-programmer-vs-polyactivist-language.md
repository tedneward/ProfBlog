title=From the Mailbag: Polyglot Programmer vs Polyactivist Language
date=2009-03-24
type=post
tags=reading, industry, languages
status=published
description=In which I respond to some email about polyglot programming.
~~~~~~

This crossed my Inbox:

> I read your article entitled: The Polyglot Programmer. How about the thought that rather than becoming a polyglot-software engineer; pick a polyglot-language. For example, C# is borrowing techniques from functional and dynamic languages. Let the compiler designer worry about mixing features and software engineers worry about keep up with the mixture. Is this a good approach? *[From Phil, at <a href="http://greensoftwareengineer.spaces.live.com/">http://greensoftwareengineer.spaces.live.com/</a>]

<!--more-->

<p>Phil, it’s an interesting thought you’ve raised—which is the better/easier approach to take, that of incorporating the language features we want into a single language, rather than needing to learn all those different languages (and their own unique syntaxes) in order to take advantage of those features we want?

After all, we’re starting to see this taking place within a certain number of languages already, particularly C#; first, in 3.0, they introduced a number of features in support of LINQ that make C# a useful starting point for working with a functional language. Extension methods, for example, allow us to add a number of different methods to the collection classes that provide some functional capabilities (Select&lt;&gt;, GroupBy&lt;&gt;, and so on), as Matt Podwysocki demonstrates, generics contribute the type-safety that most functional languages embrace, anonymous methods and delegates provide better functions-as-first-class-constructs (including lambdas), and anonymous types make it vastly easier to return and pass tuples. And now, in 4.0, we’re getting the “dynamic” keyword, which will add support for invoking methods and properties dynamically, in the grand tradition of most dynamic languages (like Python and Ruby), and 3.0’s local variable type inference allows us to write `var x = ...`, which feels pretty dynamic (even if it’s not, under the hood).

Unfortunately, I think for the most part, the answer’s going to be, “Yes, it would be nice, if it weren’t for the fact that there are very few languages that won’t collapse underneath their own weight if they did so.”

Consider, for example, the C# language. Already, with the C# 3.0 definition, the language specification weighs in at close to a thousand pages. The additional features in 4.0 could easily push it over a thousand and possibly, with all the places where “dynamic” behavior will need to be factored into the existing specification, could push that well into the 1200 to 1300 page range. What’s the upper limit on a language’s complexity to maintain and enhance, much less for its programmers to comprehend?

(By comparison, the C++ specification, as I can best remember, didn’t weigh in at more than a thousand pages, but given that the current working draft is under password protection, and I can’t find the prior spec as a freely-available download, I can’t see if memory is correct or not.)

Or, consider the various edge cases that came up around the introduction of nullable types in C# 2.0. What started out as a fairly simple suggestion—“let’s let `T?` represent the idea that this instance of `T` could be nullable, and at runtime it’ll be a `Nullable<T>` instance behind the scenes”—turned into a pretty ugly morass of edge cases at the language level that resulted in some serious bug-fixing right up until the final ship date.

Thing is, languages that aren’t written deliberately to allow their own modification and evolution tend to fail over time. C++ was one such example, and I think both Java and C# will stand as successor examples before long.

Right now, in C# 3.0, type inference is limited entirely to local variables because the language isn’t syntactically set up to leave out type names wherever possible—the “var” token is a type placeholder, largely because the parser has to have a type first. (This is the same purpose the “dynamic” keyword seems to be playing for 4.0, though I can’t say so for certain.) In F# and Scala, this syntax is deliberately written Pascal-style, with the name first, optionally followed by a colon and the type, because the parser can see the colon and realize the type is already specified, or see no colon and realize the type should be inferred. That syntax is used consistently throughout the F# and Scala languages, and that means it’s pretty easy, lexically speaking, for the languages to recognize when type inference should kick in.

What’s more, both F# and Scala don’t really support the O-O notion of method overloading, because again, it gets confusing when trying to kick in type inference—something about too many possibilities confusing the type-inferencer. (I’m not entirely positive of this point, by the way, it’s based on some conversations I’ve had with language designers over the last few years. I could be wrong, and would love to see a language that supports both.) Instead, they force developers to be more explicit about parameters being passed—F# won’t even do implicit widening conversions, in fact, such as automatically widening ints to longs.

But both F# and Scala have a *very* interesting facility to allow definitions of methods/functions using very flexible syntactic rules, such that they look like operators or keywords built into the language; F# defines its pipeline operator ( `|>` ) in its library definitions, for example. Scala defines numerous “keywords”, like synchronized or transient, as classes in the Scala package extending “StaticAnnotation”—in other words, their syntax and behavior is defined as an annotation, rather than as a built-in part of the language. Ditto for Scala’s XML support.

Lisp, of course, was one of the first (if not *the* first) language to do this, and it’s my understanding that this has been one of the principal reasons it has survived all these years as a language—because it’s an abstraction built on top of an abstraction built on top of an abstraction, *et al*, it makes it easier to change those underlying abstractions when the context changes.

This doesn’t mean those “polyactivist” languages like C# are bad things, it just means that there’s a danger that they’ll eventually collapse from too many moving parts all trying to talk to each other at the same time. As an exercise, open the C# 3.0 spec, and start checking off all the sections that will need to be touched by the introduction of the “dynamic” keyword as a new type.

Or, to put it analagously, yes, for a lot of work, a single multifunction tool can be useful, but for a lot of other work, you want tools that are specialized to the task at hand. Let’s not minimize the usefulness of that multifunction tool, but let’s not try to use a Swiss Army knife where a jeweler’s screwdriver is really needed.

