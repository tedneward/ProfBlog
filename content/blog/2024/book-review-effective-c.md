title=Book Review: Effective C (2nd Ed)
date=2024-9-20
type=post
tags=book, c, native, book review
status=published
description=A review of the book.
~~~~~~
No Starch Press sent me a copy of the book "Effective C (2nd Ed)", by Robert C Seacord, and overall, it's not bad, though I don't think it lives up to the "Effective" moniker established by Scott Meyers three decades ago.

<!--more-->

Let me get one thing out of the way first: Despite the title, this is not an "Effective" book as originally coined by the master of the Effective-style books (Scott Meyers). Meyers' "Effective C++", published roughly three decades ago, set not only a high bar to hit in terms of quality and depth of technical insight, but equally so the format. When one picks up an "Effective" book, one expects to see "items" that each tackle a particular problem or concern with the language, typically written in an action-minded format. When you wrote a book in the "Effective" series, you were writing to that standard and that format.

This book does none of that.

In fact, it doesn't even seem to acknowledge the shoes it is either deliberately or accidentally stepping around in. While Meyers has been retired for a few years now, the author, the contributor and both the technical reviewers have been involved in C/C++ standardization efforts, and so most assuredly were not only aware of Scott (and his work), but were probably friends with him at some point--it's really quite surprising to me that they wouldn't have some kind of nod or acknowledgement of Scott's work(s) and some kind of explanation around the title. Maybe it's me, maybe it's the fact that Scott and I had some long conversations about defending the quality and approach of the "Effective" moniker back when I was writing "Effective Enterprise Java" in his series two decades ago, but it really strikes me as odd (and disquieting) to see this particular word choice here.

That doesn't make it a bad book, *per se*, but if you were looking for the next in the generation of mind-opening books in that series, you are not going to be happy with your purchase.

## Physical

Any book that has a winged Cthulhu/mind flayer on the cover trying to look benevolent holding out a helping hand while a glass-helmeted robot sits on its shoulder reading a book is a sign that this is a book that isn't quite sure where it wants to rest in the world, if you ask me. What's more, the endorsement quotes also generate a slightly weird feeling, as two of the four are from security professionals--which is the first indication that maybe this book isn't quite aimed at the same category as one might think.

Opening into the front matter, it's clear that Seacord and his supporting staff (contributor and reviewers) are all very smart people--they work on popular C/C++ compiler toolchains, they sit on the standards committees, and so on. There is zero doubt that these folks know what they're talking about when it comes to C. But as you read through Seacord's *bona fides* you notice that he's done a lot of things around the intersection of C and security; for example, he wrote "Secure Coding in C and C++" back in 2013. His reviewer for the second edition comes from a similar background, and you begin to get a sense that maybe this book isn't quite for the application developer.

The other thing to note is that on the front cover, it very clearly and prominently displays a banner that reads "Updated to cover C23", the 2023 version of the C programming language standard. More on that later.

As you get to the title page, however, the subtitle threw me for a leap: "Effective C / 2nd Edition / An Introduction to Professional C Programming".

And this is where my main criticism of the book comes: The book's title leads me to believe that this is going to help an existing C developer become a better one, particularly with respect to the new C23 standard; instead, the book's apparent aim is to teach the basics of the C programming language to people who've never programmed with it before, and it's very apparent when you read the "Who This Book is For" section in the Introduction that Seacord is definitely starting from zero:

> "This book is an introduction to the C language. It is written to be as accessible as possible to anyone who wants to learn C programming, without dumbing it down. In other words, we didn’t overly simplify C programming in the way many other introductory books and courses might. These overly simplified references will teach you how to compile and run code, but the code might still be wrong. Developers who learn how to program C from such sources will typically develop substandard, flawed, insecure code that will eventually need to be rewritten (often sooner than later). Hopefully, these developers will eventually benefit from senior developers in their organizations who will help them unlearn these harmful misconceptions about programming in C and help them start developing professional-quality C code. On the other hand, this book will quickly teach you how to develop correct, portable, professional-quality code; build a foundation for developing security-critical and safety-critical systems; and perhaps teach you some things that even the senior developers at your organization don’t know.

> "Effective C: An Introduction to Professional C Programming, 2nd edition, is a concise introduction to essential C language programming that will soon have you writing programs, solving problems, and building working systems. The code examples are idiomatic and straightforward. You’ll also learn about good software engineering practices for developing correct, secure C code.

> "In this book, you’ll learn about essential programming concepts in C and practice writing high-quality code with exercises for each topic."

I can't quite tell who Seacord thinks is his audience for this book. Programmers from other languages who want to learn C? System administrators who want to make the leap to programming? Hobbyists who want to learn how to program their Raspberry Pi devices to automate their doggie door? He ends the Introduction with this: "You’re about to embark on a journey from which you will emerge a newly minted but professional C developer." But honestly, I'm not sure that's a true statement, since (as we'll see in a second) the ToC is really about teaching the reader the C language, but not much of the supporting cast and ecosystem that most C developers would need to know in order to be able to operate in a professional setting.

Let's dig in a little deeper.

## Contents

At 300+ pages (including front and back matter), Effective C ("EC" for short) is no pamphlet, but it's not going to be a paperweight on your shelf, either. That isn't bad--books should be judged by their content and not their count. And, in fact, the aforementioned "Effective" books by Meyers were always on the skinny side, yet packed to the brim with good stuff.

**Chapter 1: Getting Started with C**

Almost from the first paragraph, the inconsistency of the target audience comes to bear. Seacord opens by showing the traditional "Hello World" C program, which (for convenience) I repeat here:

```
#include <stdio.h>
#include <stdlib.h>

int main() {
    puts("Hello, world!");
    return EXIT_SUCCESS;
}
```

He then follows this with a quick description of the program, starting with, "The first two lines use the #include preprocessor directive, which behaves as if you replaced it with the contents of the specified file at the exact same location."

OK, what?

If this is a neophyte's introduction to the C language, they've almost never heard of the preprocessor before, and certainly have no idea why one would want to "replace (the text) with the contents of the specified file". He does go on to describe those two files as header files, but ends that paragraph with the lines "You need to include the declarations for any library functions that you use in your program. (You’ll learn more about the appropriate use of headers in Chapter 9.)"

Let's be clear about something: If the intended reader is brand new to C, they didn't need to know what those lines do, only that you need to "#include" them in order to make use of them. If the intended reader has some familiarity with C, then the deeper explanation perhaps is merited, but then do they really need to be told what "Hello World" is doing?

This example then continues into the next section, wherein Seacord shows using "cc" to compile the code into an executable and running it. Again, if this is for neophytes, that's appropriate, but he never discusses where "cc" comes from or what might need to be installed if the command fails on the neophyte's machine. (In fact, his only suggestion if it doesn't compile is to "compare the program text from Listing 1-1 to your program and make sure they are the same." Not particularly helpful.)

This whole chapter is all over the map like this; for example, he spends two-and-a-half pages on the differences between "Implementation-defined behavior", "Unspecified behavior", "Undefined behavior", "Locale-specific behavior", and "Common extensions", which considering just four pages earlier he was introducing Hello World and the main() function, just seems weird.

**Chapter 2: Objects, Functions, and Types**

Next, we discuss *objects*, which is an odd term for a language that is very not object-oriented. I suspect the term is used in the C standard because as a generic word to describe the things that variable names point to, but in a world where "objects" are commonly associated with object-oriented languages like Java and C# (and of course C++), it seems an odd choice to fixate on that term--again without much nod to any of the ways somebody might have heard it defined differently--in an introductory text.

He then introduces the notion of functions by creating a swap function, but at first does it incorrectly (passing the integers by value) before showing how to pass the integers by reference and thus, introduce pointers. This seems an obtuse way to introduce the subject, particularly in what is intended to be an introductory text, particularly when he's spent no time really talking about what an integer is or what it represents. In fact, the introduction of variables is as follows: "When you declare a variable, you assign it a type and provide it a name, or identifier, by which the variable is referenced. Optionally, you can also initialize the variable." That's it.

To be fair, he gets into the different primitive types of the language, (booleans, characters, integers, floats, and so on) later, but even here, he's clearly writing for an audience that isn't a beginner: "The signed and unsigned integer types are used to represent integers of various widths. Each platform determines the width for each of these types, given some constraints. Each type has a minimum representable range. The types are ordered by width, guaranteeing that wider types are at least as large as narrower types. ..." (He later states that he will go into "excrutiating detail" about integer types in the next chapter, which begs the question, why not cover that material here rather than later?)

I'll cease diving into examples at this point, because I think I'm making my point clear. 

**Chapter 3: Arithmetic Types**

**Chapter 4: Expressions and Operators**

**Chapter 5: Control Flow**

**Chapter 6: Dynamically Allocated Memory**

**Chapter 7: Characters and Strings**

**Chapter 8: Input/Output**

**Chapter 9: Preprocessor**

**Chapter 10: Program Structure**

**Chapter 11: Debugging, Testing, and Analysis**



## Thoughts

Seacord ostensibly wants this to be a beginner's book, but he keeps not writing for beginners. When writing a book for beginners, the author needs to take careful steps to introduce new concepts one at a time, ignoring details of implementation unless they are necessary to understand the concept. It's not easy writing for beginners, particularly when you (the author) are steeped in the myriad of implementation details on a daily basis.

Honestly, if I were an editor at No Starch Press and Seacord were asking my advice for a 3rd edition, it would be this: Write this same book, but assume the reader knows basic C. They know what a function is, they know the basic types, they know how to compile and link simple programs. Now, take them one level deeper in all of those things. Let another book (or YouTube tutorial, or hobbyist exploration and spelunking) teach them the core basics, and you focus on explaining the "why" and "how" of the language. For example, at one point when introducing enumeration types, you state, "For portability and other reasons (Meneide and Pygott 2022), it is always better to specify the enumeration type." Why? What are those reasons? The reference to the other work is always nice, but summarize those reasons and lay them out. (Ironically, much of that chapter is at the level I would expect of the work I'm suggesting he write, and could probably be kept as-is with a few minor edits. In fact, much of the remainder of the book could probably be pivoted to this new, differently-assumed, audience without requiring much work.)

I can't say that I can recommend this book to beginners--I'd have a hard time recommending this to some of my college students, in fact, and many of them have studied Java (and after taking a class with me, Kotlin and/or Swift). The prose is quite precise in places, and Seacord clearly knows the C language, the standard, the history, and the "whys and wherefores" of C. What I'm not sure he realizes is how to write for beginners.

If you're already familiar with the basics of C, this book can seriously help you "level up" in your C knowledge, and bring you closer into the world of how the C language is "put together" and operates. If you're familiar with another C-like language, a la Java or C#, this book could probably serve as a way to get into writing C, but there may be some terminology issues that I'm not picking up on. (The "curse of knowledge" hits me just as hard as it does Seacord, which is why I generally don't write beginner-level books!)

*Disclaimer: No Starch Press sent me a review copy of the book; no other compensation was provided.*



