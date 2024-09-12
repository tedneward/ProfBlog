title=Book Review: Strange Code
date=2024-9-12
type=post
tags=book, javascript, book review
status=published
description=A review of the book.
~~~~~~
No Starch Press sent me a copy of the book "Strange Code", by Ronald T Kneusel, and honestly, they had me at "esolangs". But more than that, the book opines on reasons why studying programming languages, including their esoteric kin, is a useful and productive endeavor.

<!--more-->

First off, let's get something out of the way right now: Being the huge fan of programming languages that I am, I am almost *always* a fan of a book that talks about how to build a programming language. This one not only talks about some of the concepts involved in doing that, *and* shows how to build two custom languages (Filska and Firefly), *AND* talks about a few popular esoteric languages and how they warp your brain in a good way, it takes the unusual step (in Part II) of examining some languages that Kneusel describes as "atypical", which makes them unknown to most developers, which have some interesting and useful properties. His coverage of CLIPS, alone, is worth the price of admission here.

Secondly, I love this book because Kneusel's history so closely parallels my own:

> My first exposure to programming came in the summer of 1980. It involved an Apple II+ computer. As principal of the lo­cal high school, my father was able to bring it home for us to play with over the summer.

In my case, my parents spent my father's Christmas bonus to buy an Apple II+ in 1979.

> The Apple II+ included a version of unstructured BASIC in ROM called Applesoft. As far as BASIC programming languages go, it was somewhat limited. However, it opened a new world to me, and I ran with it, writing small program after small program as I explored what the Apple II+ was and could do. It could ask questions, interpret answers, calculate formulas, plot pictures, and make sounds. And all of that power was at the tips of my 14-­year-­old fingers.

My fingers were a little bit younger than his, but the excitement was the same. Dad showed us a game program, "Little Brick Out" (basically one of those early "pong but you're knocking bricks out" games) and then he showed us the Applesoft BASIC code that powered the game, and frankly, I was hooked.

> Of course, I wanted one of these godlike machines for my own. My fa­ther, likely thinking it would put me off, told my younger brother, Bob, and me we could have one if we learned how to program it. Challenge accepted!

In my case, Dad was learning Applesoft BASIC, and worked out a barter deal with the computer shop whereby he taught public classes on the language, in exchange for hardware and software purchases. We went from the base unit by itself (hooked up to a tape recorder and a small color TV) to a green-screen monitor (soooo much easier on the eyes) and first one, then *two* floppy drives. I asked for--and got--a joystick for my birthday. But more importantly, Dad let me tag along and follow him to the store when he taught the classes, and although it was hard for me to pay attention during the class, the idea of programming was laid into my genetic structure early.

You can already see where this is going--Kneusel's history and my own are so similar I could've been his brother. I taught myself BASIC and (a little) 6502 assembly, as he did, but couldn't get to Pascal because we didn't have the necessary CP/M card to run it. (Which *sucked* because I really wanted to learn how to program something like Wizardry, which was my game addiction on that machine for many years.) I wouldn't get to Pascal until high school, when a friend "loaned" me his copy of Turbo Pascal 5.5 for my PC, and then later Turbo C/C++. But I digress--my point is, this book feels like "coming home" for me.

## Contents

The book is a respectable 450+ pages (including front and back matter), so this is no "I can read it in the bathroom in a week" kind of book. This is rich, meaty, hearty fare that will require any programmer reader to spend some serious cycles to ingest and absorb.

More importantly, Kneusel lays out the intent of the book right in the first chapter: "The pur­pose of this book is:

* "To give you a sense of where programming languages came from and provide some context for the languages we use today and the structures they contain.
* "To explain some of the essential elements of programming lan­guages, so you become familiar with terms like Turing machine and Turing complete.
* "To expand your thinking about what a programming language can be and how it can express thought and process in creative and el­ egant ways. We’ll do this by exploring various programming lan­guages ranging from the unusual to the downright bizarre.
* "To have fun! We’ll create our own programming languages, and see how we can use them to implement some algorithms. We’ll even put one on a small computer for standalone projects (the BBC micro:bit)."

Clearly, this is not a beginning programmer's book, but fortunately, it also doesn't require the reader to have a postdoctoral degree in Computer Science, either. The book states, "If you are a student, you’ll hopefully see that programming can be more than what you may perceive it to be based on your introductory programming courses, as necessary as they are. If you’re a hobbyist, you’re likely already somewhat familiar with esolangs and are looking to feed your passion." but as I read it, it really felt more that this was for the professional developer who is looking to understand what's going on inside and/or below the languages they use, and to grok the "why" of certain languages. I don't know if the student has the necessary perspective to get that, and while the hobbyist might get something out of this, it's hard for me to say--I left "hobbyist" status behind when I took that first programming job fifteen years after getting that Apple II+.

The book uses Python as its implementation language (where it needs to provide implementation), which is a reasonable choice, given Python's popularity.

***Part I: On Programming Languages***

**Chapter 1: A Cherry-Picked Review of Programming Languages** 

It's a lovely little bit of history and archaeology (Kneusel calls it paleontology, likening different language eras to different eras of dinosaurs), but there is one nit: he references the website  http://www.info.univ­angers.fr/~gh/hilapr/langlist/langlist.htm, which unfortunately in my Chrome browser doesn't render. I have to assume the website did render at one point (it appears to be an https/http issue), but it does take a bit of the wind out of the reader's sails to get excited about seeing more languages and being presented with a blank screen.

His coverage of the foundational languages (FORTRAN, Lisp, COBOL) and the "Ur-Languages" (Algol, APL, BASIC, PL/I, Logo, Simula, Pascal, Prolog, Smalltalk, and Standard ML) is pretty decent, though in my opinion he clearly has the most fun showing off the last three (Prolog, Smalltalk, and SML). Those are very different ways of thinking about code, and all three are still wildly relevant today. (As a matter of fact, any of those could be used to build a modern web application, which is hard to say about Logo!)

**Chapter 2: The Essentials of Programming Languages**

It's a very basic treatise of what makes up a programming language. If you've taken a language survey course as part of a CS program, there's little to nothing new here; if you've never explored this space, it's a pretty reasonable introduction (and a lightweight one at that) to the topic. (I do love that he uses an Apple II+ BASIC program and its representation as the example, though, instead of something more modern.) He shows off UCSD Pascal p-code, the ancient predecessor to Java/JVM bytecode and .NET CIL, which for some will be the first time seeing something like that. (Matter of fact, now I want to find a reference doc on the UCSD p-code opcode set.) He covers most of the popular categorizations of programming languages (static and dynamically typed, the core data structures like arrays, lists, etc, and so on), but it's mostly a concept-heavy chapter that readers could probably skip and come back to if they aren't as interested in the broad categories of programming. (That said, you risk not having some of the definitions in your head as you move to later chapters--*caveat emptor*.)

**Chapter 3: Turing Machines and Turing Completeness**

This chapter feels a little bit like a digression from the main point; yes, it's helpful to discuss what a "Turing-complete language" means, but I'm not sure that we really needed this deep a dive or to explore a Python implementation of one. It's definitely the heaviest "academic" chapter in the book, and readers who are new to the material may want to come back to this one.

Then again, I've always been a little less interested in the theory and math around languages, so this may just not be a chapter for me.

***Part II: Atypical Programming Languages***

**Chapter 4: Forth**

Forth is an entirely stack-centric language, which feels like something of a waste... until you learn that most virtual machines (the JVM, the .NET runtime, and others) are all stack-based virtual machines. Learning Forth gets you a leg up on understanding how those machines can do all their wonderful things entirely in terms of an execution stack.

(True story, I have a professional colleague/friend from 20 years back who is a huge Forth nut, and is constantly threatening to write a book on Forth--Lionel, if you're reading this, you should totally write it, and No Starch Press might even print it!)

**Chapter 5: SNOBOL**

"SNOBOL is a text pattern matching lan­ guage developed in the 1960s. Modern pro­grammers might find its syntax quaint, and maybe even a tad frustrating, but I suspect the power of the language will shine through in the end as we explore its features, some of which are still with us in modern languages like Python." With these words, Kneusel opens the chapter on SNOBOL (“StriNg Oriented and symBOlic Language”), and with a philosophy of "All the world's a string", SNOBOL is off and running. Which, if you think about it, is quite true--almost all the data we hand back and forth across network lines are strings (usually shoved into JSON or XML).

Lest you think this is purely an exercise in trying to shoehorn old languages into modern conversations, take a hard look at the part of this chapter entitled, "Machine Learning with SNOBOL": "the goal of this section is to build a complete SNOBOL ap­plication to classify datasets using a simple machine learning technique--a *nearest neighbor* classifier."

**Chapter 6: CLIPS**

This is one of my favorites; I discovered CLIPS when I was looking at logic languages, and in particular when I discovered the Java flavor of CLIPS, called JESS (Java Expert System Shell). (Sadly, JESS development seems to have stalled since 2006.) If you've ever spent any time exploring the world of "expert systems" or "rules engines", you owe it to yourself to read this chapter. (By the way, CLIPS has bindings for both Java and .NET, so the material in this chapter is actually directly applicable to your day job, if you're in either of those platforms.) In many respects CLIPS occupies the same space as Prolog, but the syntax is in some ways a little easier to parse, and there's less emphasis around "the cut" (a Prolog-ism). That said, the syntax is essentially Lisp, so if you're not a fan of parentheses....

***Part III: Esoteric Programming Languages***

**Chapter 7: The ABCs of ABCs**

**Chapter 8: FRACTRAN**

**Chapter 9: Piet**

**Chapter 10: Brainfuck**

**Chapter 11: Befunge**

These are all esoteric programming languages, selected because (a) esolangs are fun, (b) esolangs take some of programming's most cherished traditions and turn them upside-down or do away with them completely, leaving you to think whether you wanted to or not, and (c) no seriously esolangs are fun! Kneusel takes each esolang, explains them, discusses why it holds interest, then shows how to implement them in Python (and sometimes another language as well).

(By the way, if your religious upbringing makes it hard to pronounce the language discussed in Chapter 10, it's also commonly called "BF", which should be easier for the "fuck"-challenged.)

Oh, and just because it's fun to toss this off as the last comment in this section, the following is a legal Befunge program:

```
<v"How now brown cow?"0
 >:v
^,_91+,@
```

***PART IV: Homegrown Esolangs***

**Chapter 12: Filska**

**Chapter 13: Using Filska**

**Chapter 14: Firefly**

**Chapter 15: Using Firefly**

Filska and Firefly are Kneusel's new contributions to the field, and they're both... interesting. Filska asks, "what is it like to program in a language where each subprogram can manipulate only a single memory location?", while Firefly holds that "A Firefly program is a series of single­character instructions that either move the firefly around the grid, set the way its luminous trail acts, or make the firefly sing a note." While they sound somewhat frivolous on the surface, Chapters 13 and 15 show how to build some pretty interesting non-trivial things using each language, and each one definitely qualifies as "makes you think" fodder.

**Chapter 16: Going Further**

This is more of a "Miscellaneous" chapter, in which Kneusel lists a few more esolangs, and then provides some resources around programming languages, including a number of solid books (many of which I've also found useful over the years).

## Thoughts

As you probably could guess, I love this book. That said, this book is probably going to be on my list of "Books you should read when you have a bunch of free time (which for most people is 'never')". It's not that the writing is poor; Kneusel is clearly no neophyte author, as his bio states: "He is the author of Practical Deep Learning: A Python­Based Introduction (No Starch Press, 2021), Math for Deep Learning: What You Need to Know to Understand Neural Networks (No Starch Press, 2021), Numbers and Computers (Springer, 2017), and Random Numbers and Computers (Springer, 2018)." It's much more due to the fact that this is just a space where too few programmers really choose to congregate.

In many respects, going down this path is the same as going down the path of building your own database, or your own RPC stack, or your own Javascript SPA framework. The knowledge gained here is foundational, and will help programmers with all sorts of different kinds of applications, but will also run the risk of feeling too abstract and removed from the problems of the day. (I say this because I've taught workshops at conferences on how to build your own bytecode virtual machine, and those were some of the evaluation comments I got as feedback.)

Frankly, I love the book, and I think every programmer should read it. Candor compels me, however, to point out that what readers learn from this book is subtle, philosophical in nature, and hard to articulate to others until you've turned it over in your head a few times. I personally think it makes you a better developer, but you'll need to have at least a little interest in the subject of programming languages to start.

*Disclaimer: No Starch Press sent me a review copy of the book; no other compensation was provided.*



