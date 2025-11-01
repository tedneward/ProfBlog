title=Introducing Linguis
date=2025-10-11
type=post
tags=engineering, languages
status=published
description=In which I introduce the experimental language Linguis, a first attempt at thinking about polyglot language design.
~~~~~~

**tl;dr** Linguis, available for examination and/or forking, is a language designed to explore the axis of, "How much can we tweak the front-end of the language, in this case the parser, so that people of different nationalities can write code in the syntax of their choice?" Available at https://github.com/tedneward/Linguis for perusal, though it's only at a 0.1 now.

<!--more-->

It's been an interesting 2025 so far, and with two-plus months left, I realized that aside from the new book coming out, I haven't really worked on any of the things [I want to build](https://blogs.newardassociates.com/blog/2023/what-i-want-to-build.html). Thus, time to get one of the "little ones" off the list: A language with differing input syntax over the exact same AST.

As I mention in the project's [README](https://github.com/tedneward/Linguis/blob/main/README.md):

> Programming languages have, almost since their inception, assumed a fixed syntax that is rooted in English for its keywords, with relatively few exceptions. Pascal has PROGRAM, FUNCTION, VAR, and so on. C has if/else, for, while. Even homoiconic languages like Lisp use English nouns for its forms.

> When I was in college, though, I took a trip to visit some friends in Belgium, and they had a French computer there--complete with its own version of French BASIC, where all the keywords were in--you guessed it--French. It took me a hot second to map the keywords I knew to their French equivalents, and definitely made reading the code an extra level harder.

> Now, in 2025, we still see most of our popular programming languages based on English keywords, which makes me wonder: Why? Don't get me wrong, as a native English speaker, I am happy that my native tongue is the default lingua franca for the programming industry, but in an era where we have literally gigs of RAM to throw at a problem, why are we continually enforcing English as a necessary prerequisite for programming?

> Thus, Linguis: A programming language (procedural, since this is a POC) whose keywords are "pluggable" and in several sets, so that those of non-native English speaking descent can program in their mother tongue.

For example, somebody writing English syntax might write:

```
name = input("Hello, what is your name?")
println("Hello " + name + " it is nice to meet you")
```

But somebody writing this from a French perspective might prefer:

```
name = saisir("Hello, what is your name?")
imprimernl("Hello " + name + " it is nice to meet you")
```

... where *saisir* is the French translation of "input" and *imprimer* is likewise for "print". (I tacked on the "nl"--*nouvelle ligne*--to make it the parallel to println.) Notice that the literal strings don't change, nor do the identifiers, since those aren't directly interacting with the compiler, but it would be pretty easy to imagine how the French student would write the earlier English program:

```
nom = saisir("Bonjour, quel est ton nom?")
imprimernl("Bonjour " + nom + " c'est agréable de vous rencontrer")
```

Part of the experiment here, as already being seen in the fragment above, is that the source code will need to be in full Unicode-capable streams, so that the different languages can each have their native characters represented faithfully. (Imagine what, for example, the above would need to look like for Arabic, Hebrew, or even Klingon.)

Currently, as I write this, only the AST itself, built in Python, is in the repository. The tests execute AST constructs (although to be more accurate they're "intermediate executable" tree nodes, not really "abstract syntax" nodes) directly at the moment, and it supports basic procedural constructs--variable declarations, simple scoped name-value bindings, if/while/for flow control constructs, and function definitions and calls, that sort of thing. It's definitely *not* a sophisticated language, but it's not intended to be--the sophistication, such as it is, will come at the parser level, not the semantic or execution level.

Next steps at this point are to introduce the first parser (and the core interface/abstraction for doing so without being tied to what that parser is) and a main "driver" that will take a `.ling` file from the command-line, parse, and execute it. Then a second syntax, and maybe a third. (I'm planning English, French, and German, in that order, since I know those languages well, reasonably well, and passably okay, in that order). Once I've got three, I'll probably quit while I'm ahead and move on to something else, but this should keep me entertained through the end of 2025, anyway.

Naturally, if you feel like tossing in a hand, particularly if you want to take a crack at introducing a new syntax, it's a public repo for a reason. :-)

But, otherwise, thanks for reading!

**UPDATE 31 Oct 2025:** Linguis is getting closer to "done" for the US-English keyword set! Basic scalar types (booleans, ints, floating-point, strings) are in place, along with the core maths (+, -, *, /. %. ^) and comparison (==, !=, <, >, <=, =>) operators. I've also discarded my custom AST in favor of going straight to the Python AST objects--for the US-English parser, for example, the parse returns a Python `ast.Module` object suitable for compilation and execution. (Yes, compilation--Python is an interpreted language, but the method call to turn the source into an executable code object is called `compile`.) I'm working to add lists and function defintions/calls, fix some of the missing pieces (unary negation, the boolean operators, etc), and then pivot to implementing the second parser... Pig Latin!