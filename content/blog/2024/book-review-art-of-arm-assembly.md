title=Book Review: Art of ARM Assembly (Vol 1)
date=2024-9-23
type=post
tags=book, assembly, arm, book review
status=published
description=A review of the book.
~~~~~~
No Starch Press sent me an early-access e-copy drop of the book "The Art of ARM Assembly (Volume 1)", by Randell Hyde, an author whose previous books on x86 assembly are on my shelf, and I'm enthusiastically suggesting you go buy a copy when it comes out.

<!--more-->

For close to two decades now, I've been telling developers (experts to neophytes) that you need to know "one level below the level at which you work". Knowing how your Java class turns into JVM bytecode, or how that .NET assembly looks like on disk, is often the difference between knowledge and ignorance. How does the *yield return* keyword work in C#? How did Java do inner classes before adopting nested-access classes in JDK 11 (or 12 or 15 or whenever the hell nested-access was introduced)? Being able to crack open the compiled binary, look at the disassembled output, and have at least a rough idea of what's going on, is a huge skill that every developer must have.

And since the move to ARM-based processors in iOS (and later Android and later my MacBookPro machine and now even some Windows machines), I've been unable to do that.

Kotlin/Android? Compiles down to bytecode before turning into native instructions; Java or C# on my M3 MacBookPro? Yeah, I kinda just trust the JITter, but... The truth is, I'd been holding off on learning ARM mostly because I didn't have a guide I trusted to lead me past the thorny parts. I've looked at a few ARM assembly books, but always put them back on the shelf because I just... I dunno... didn't feel like the author was going to find the right mix of "teaching" to go along with the tech.

(In fairness, I haven't mastered x64 yet, either, mostly because it often seems like it's "close enough" to x86 that I can muddle my way through. That said, I have Hyde's x64 book, or at least Volume 1 of it, and it's on my list to read once I get through ARM.)

Now, though, I feel like I flew to Nepal, walked out of the airport intending to find a random Sherpa to guide me up the mountain, and ran into an old friend who also happens to be incredibly experienced at guiding people up Everest.

As with any early-access drop, it's important to *caveat* that it's possible that the final product you end up with in your hands will differ from what I'm seeing as I read/write this... but considering we are talking about a thousand-plus page book here, I really, really, *really* doubt Hyde's going to rewrite much except to correct mistakes/typos.

## Physical

Well, I only have an e-reader (PDF) copy to work from, but did I mention the thing is a *thousand* pages? Throwing the printed copy of this at somebody is going to qualify as "Assault with a Deadly Weapon" in thirty-three states! (In Texas, of course, everyone will expect you to have a copy mounted on a rifle rack in your pickup truck.)

But it's not like this is a lightweight subject, either--assembly language is notorious for its requirements around attention to detail to function correctly. So it seems entirely reasonable to assume that if you're new to ARM, then you probably need to understand some of the hardware that drives the assembly language, since the two are going to be pretty tightly joined at the hip. On top of that, Hyde doesn't really seem to want to assume much about his target audience's skill level other than "At minimum, this book assumes that you have some experience in a language such as Pascal (or Delphi), Java, Swift, Rust, BASIC, Python, or any other imperative or object-oriented programming language." It's a pretty broad range, but more importantly, notice that none of the aforementioned languages have much experience (or reason for it) with the lower-level details. (Back in *my* day, we learned C! And pointers! And we ***liked*** it!)

By the way, it's important to note that Hyde is no stranger to the subject. As he states in the Introduction, "This book is a sister volume to The Art of 64-Bit Assembly Language, which was, itself, a rewrite of The Art of Assembly Language Programming (AoA). AoA was a project I began way back in 1989 as a tool for teaching 80x86 (x86) assembly-language programming to students at California State Polytechnic University, Pomona, and the University of California, Riverside." 35 years, and dude's just been cranking one assembly language book out after another. (If I remember correctly, he also did a MASM Bible thirty or so years ago, which was one of the go-to books back in the day, too.) This is what I mean about "seasoned guide"--not only is Hyde an expert on the subject, he knows how he wants to get the material across to his audience/students, and he has a ton of experience doing so.

Lastly, this is officially Volume 1 of a planned two-volume set; on his website, Hyde notes, "The Art of ARM Assembly Language is actually going to be part of a two volume set. [Volume 2] will cover 32-bit ARM assembly language programming on 32-bit versions of Pi OS and on embedded ARM Cortex-M CPUs (such as Arduino/Teensy and Raspberry Pi Pico). Look forward to it sometime in late 2026." --[Source](https://artofarm.randallhyde.com/)

## Contents

Hyde doesn't waste much time getting started right from the start, and the start here begins with the Introduction, where he recounts a brief history of ARM and then rationales for learning ARM and 64-bit ARM, respectively. In many other books, you can breeze past the Introduction/Chapter 0 without losing much, but honestly, I'd recommend you take the time to go through it--there's a lot of new products, terminology, and ideas in here that it really should be thought of as the first chapter of content. (Although, to be fair, arrays in assembly start at 0, just like in C, so maybe this is the first chapter!)

Hyde is also extremely straightforward and up-front about some of the decisions he makes in the book and why; for example, he doesn't cover Microsoft's toolchain, even though ARM is now running in Surface books. The reason? "In theory, it should be possible to apply the information in this book to ARM-based Windows machines (such as the Surface Laptop Copilot+). Unfortunately, Microsoft’s software development tools, particularly its assembler, is based on the original ARM assembly syntax defined by Arm (the company), not Gas *[The GNU Assembler, which he explained a few paragraphs earlier --TKN]*. While Microsoft’s *armasm64* is a better tool in many respects (as it uses standard ARM assembly language syntax), everyone else uses Gas syntax. The machine instructions are more or less the same between the two sets of assemblers, but the other statements (known as assembler directives or pseudo-opcodes) are completely different. Therefore, example programs written in Gas will not assemble under armasm64, and vice versa. Since trying to present both syntax forms in example programs would be just as confusing as trying to teach 32- and 64-bit programming simultaneously, I stick to Gas syntax in my examples." I don't like that we're using the (Hyde's opinion) suboptimal tool, since he thinks *armasm64* is the better tool, but I can respect the decision. More importantly, thanks, Hyde, for sharing the insight and the rationale--I can accept a decision like this much more easily when I know the reason for it.

Here's the TOC, and I am in no way going to go through each chapter; in fact, I'll just go over Chapter 1 (which is about as far as I've gotten, in any depth, because I want to go through and code along with the book) in any detail.

***PART I: MACHINE ORGANIZATION***

**Chapter 1: Hello, World of Assembly Language**

Remember when I said that Hyde starts running from the jump? He opens this chapter with some example assembly code that--literally--does nothing, as a way to explain some initial details. Linux and macOS, for example, treat names slightly differently, so he takes a moment to walk us through that. He shows the commands for assembling, linking, and running the example do-nothing program, then promptly demonstrates that the C/C++ toolchain will actually serve as a nice umbrella to do all that in a much simpler command-line. In a nice touch to show he's not in denial about what people want to learn assembly for, though, he immediately turns around and shows how to build a simple C++ program that calls that do-nothing assembly code. Fear not--he assumes readers have little to no experience with C/C++, and shows "just enough" to get the point across.

Once that's done, though, he covers some of the hardware basics about the ARM processor(s), and goes through some of the basics of how CPU and memory work at a low level. In some ways, this feels a little overkill--after all, he's clearly not assuming we are novice programmers, just new to assembly language--but at the same time, it's not so much overkill that the reader familiar with the idea can't just turn the page early.

He then goes over four or so ARM instructions (`ldr`, `str`, `adr`, and `adrp`), and their syntax and semantics. Almost immediately, we run into a problem--macOS and Linux don't like using absolute memory addresses, and require relative ones. (I can sort of understand this, since it offers the OS a bit more flexibility where to map a given module inside of a process space--but that's about the extent of what I think I know there.) So Hyde has some macros that effectively hide the difference; I kinda wish he didn't, so that I as the reader could be forced to understand the problem a bit more, but for a book that's looking to teach ARM, and not Linux/ARM or macOS/ARM, this seems reasonable.

More instructions are covered in some detail, though most behave as one would expect similar instructions from other assembly languages to behave.

Then, in Sections 1.9 and 1.10, Hyde discusses the ARM ABI (Application Binary Interface) and how to write ARM assembly to call C functions (most notably for I/O, a la *printf*). He ends Chapter 1 with a "Hello World" that mixes compilation with C and the ARM assembler, giving us a nice springboard from which to explore more ARM instructions in further chapters. Then, at the end of this (and I think every) chapter, he has a few "Test Yourself" questions to test your comprehension of the reading--these sorts of things are not my favorite, since I think they don't really serve the purpose they're intended to. 

(With a book, so much of the experience is self-directed, I'd much rather see some suggestions on how to take the code we covered in the chapter and modify it in various ways--like, for example, "The *printf* function takes a variadic number of parameters to go along with the format string, so write a mixed-mode program that prints "Hello, %s, you are %d years old today!" where name and age are passed as parameters along with the format string." That forces(?) me to go and write that program, which builds on what I'm typing in, rather than testing my ability to go back and re-read a page in the book.)

Keep in mind, Chapter 1 spans 40-something pages (p3 to 44), and it's dense the entire way. Quite honestly, having read the chapter, I'm still going to go back and re-read/explore the chapter, this time typing (or, more likely, cutting-and-pasting from the PDF at least some of) the code he lays out in here, because I'm not going to learn ARM just by reading the book. Like most languages, it really needs to be experienced, not just observed.

Chapter 2: Data Representation and Operations
Chapter 3: Memory Access and Organization
Chapter 4: Constants, Variables, and Data Types

***PART II: BASIC ASSEMBLY LANGUAGE***

Chapter 5: Procedures
Chapter 6: Arithmetic
Chapter 7: Low-Level Control Structures

***PART III: ADVANCED ASSEMBLY LANGUAGE***

Chapter 8: Advanced Arithmetic
Chapter 9: Numeric Conversion
Chapter 10: Table Lookups
Chapter 11: Neon and SIMD Programming
Chapter 12: Bit Manipulation
Chapter 13: Macros and the Gas Compile-Time Language
Chapter 14: String Operations
Chapter 15: Managing Complex Projects
Chapter 16: Stand-Alone Assembly Language Programs

***PART IV: REFERENCE MANUAL***

Appendix A: The ASCII Character Set
Appendix B: Glossary
Appendix C: Installing and Using Gas
Appendix D: The Bash Shell Interpreter
Appendix E: Some Useful C Language Functions
Appendix F: Answers to Questions

I suppose if the book were going to lose some weight somewhere, the appendices could be trimmed down--does anyone really need (or want) a reference to the ASCII character set in a book, when Google is just six (or ten) keystrokes (or a single "New Tab" in an existing browser window) away? The Glossary is needed, for sure, and the "Answers to Questions" (did I mention he sprinkles little exam-like tests-for-understanding throughout the text?) are necessary, but "Installing and Using Gas" I would've expected in Chapter 1 or the Introduction, and I dunno if a primer on using Bash is all that relevant here, particularly since it covers the truly basic commands (pwd, ls, cd, mkdir, date, and so on). Frankly, a quick primer on Makefiles would probably have been a better use of the pages, if you ask me. 

(Such a primer is discussed in Chapter 15, apparently, and Hyde has a note why shell scripts vs Makefiles: "If you have experience developing software by using the command line, you may wonder why I haven’t built the examples with a makefile. I discuss makefiles further in Chapter 15, but I’ve chosen not to use them here for a couple of reasons: (1) If you don’t already know the Make language, I’d prefer to put off teaching that until you’ve mastered a little more assembly language. (2) Using Make would mean writing a separate makefile for each example program. However, the build shell script this section describes works for nearly all the example programs in this book." I'm not sure I agree, but again, he has his reasons, and his explanation satisfies me that it's not a decision made lightly.)

Aside from the Glossary and Answers, though, some hidden gold lies in the "Some Useful C Language Functions"; these are quick definition and description of some of the most common functions in the world, the C standard library. And before you accuse me of being wishy-washy ("you don't want a Bash primer, but a C stdlib primer is OK?"), remember that Hyde is expecting the reader to be familiar with other languages, many of which have a string intrinsic or built-in type, and therefore those developers may not realize that C required us to work with strings "the hard way",as pointers to byte arrays that signaled termination with a NULL. (Back in *my* day, we just used pointers! And we liked it!)

## Thoughts

As you probably could guess, I love this book. That said, this book is probably going to be on my list of "Books you should read when you have a bunch of free time (which for most people is 'never')". It's not that the writing is poor; Hyde has been here before, and knows what to include and how to present it. It's much more due to the fact that this is not top of my day job's requirements, and it's a lot to wade through.

In many respects, going down this path is the same as going down the path of building your own database, or your own RPC stack, or your own Javascript SPA framework. The knowledge gained here is foundational, and will help programmers with all sorts of different kinds of applications, but will also run the risk of feeling too abstract and removed from the problems of the day. (I say this because I've taught workshops at conferences on how to build your own bytecode virtual machine, and those were some of the evaluation comments I got as feedback.)

To wrap up: I love the book, and I think every programmer should read it. Candor compels me, however, to point out that what readers learn from this book is subtle, philosophical in nature, and hard to articulate to others until you've turned it over in your head a few times. I personally think it makes you a better developer, but you'll need to have at least a little interest in the subject of programming languages to start.

Meanwhile, I'm eagerly awaiting the physical copy of the book when it comes out, although I do feel kinda bad for the delivery driver who has to bring it to my front porch--it will not be easy getting down the path to my front door with a forklift....

*Disclaimer: No Starch Press sent me a review copy of the book; no other compensation was provided.*



