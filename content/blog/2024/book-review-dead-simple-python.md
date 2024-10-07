title=Book Review: Dead Simple Python
date=2024-9-11
type=post
tags=book, python, book review
status=published
description=A review of the book.
~~~~~~
I bought a copy of the book "Dead Simple Python", by Jason C McDonald, and I have to say, this is my new go-to book for book recommendations on learning Python.

<!--more-->

For starters, this is *not* a pocket-sized book; weighing in at just under 700 pages (including both front and back matter), this sucker is quite possibly a deadly weapon in the right hands. That, to me, is a reflection of the Python ecosystem: rich, deep, and easily the equivalent of any of the other mainstream ecosystems out there (Java, .NET, Javascript, and so on). To try and cover Python by only covering the syntax would be doing the reader a disservice every bit as much as it would be do teach Java or C# without going over the standard libraries (`java.util`, `System.IO`, etc). Considering that much of the Python experience is heavily influenced by Guido's "Batteries Included" approach to the language, covering more than just the language seems an excellent choice.

It also reflects the goal of the book, which McDonald highlights very early on in the Introduction in the section "Who Is This Book For?": "If you are already familiar with another programming language and now wish to learn Python for the first time without slogging through beginner-oriented courses, this book is for you." McDonald has done the thing I frequently find authors fail to do with their books: Establish the target persona, and ruthlessly avoid anything that doesn't meet that target persona's needs. The professional programmer, who already knows about inheritance, classes, and flow control, doesn't need examples showing the concept of an `if` statement, they just need to see the syntax and any semantics that might be different from what they're used to. (And Python does have a few of those--I've never seen a language that has allows an "else" clause attached to a "while" loop before. Or "for" loops. Wild.)

McDonald's goal is also not just to teach the cold hard facts of syntax, but also the "Python way", which the community has captured in the Zen of Python, an official document that captures the essence of how good citizens of the Python community should think about things. McDonald frequently references the Zen, and liberally quotes from other books (which is a practice that I think is highly admirable--too many books seem to pretend that there is no other book out there but their own), which I find helps the new-to-Python reader know where to go in the larger community to see and feel more about how Python approaches things.

But if you're from No Starch Press reading this review, one quibble: The back of the book proudly proclaims "I Lie Flat!" and that the book won't "snap shut"; frankly, that's not true. As I write this, I have the book open to the "Brief Contents" page, requiring me to carefully balance the book's back half against the laptop screen so that I can use two hands to type while being able to read the contents to replicate the list in the post below. It's probably not the fault of the binding--after all, 700 pages is pretty heavy to hold open by itself anywhere before page 250 or after page 450--but it does like to smile innocently back at me while I glare at the back of the book because it just *whoomped* closed while I was trying to read the code while typing it in. Maybe just drop the logo.

## Contents 

As I said before, DSP is a hefty tome, and covers a wide variety of topics: 

***Part I: The Python Environment***

**Chapter 1: The Python Philosophy**

Nice little read of how Python thinks about things.

**Chapter 2: Your Workbench**

This is your classic "Getting Started" section, describing all the different ways Python and its associated tools can be installed and used.

**Chapter 3: Syntax Crash Course**

It doesn't cover all the permutations--each of the various subjects get deeper coverage later--but it does get you the basics of Python's scripting syntax, such as variables, looping and conditionals, how to use objects, that sort of thing. In theory, if you had to suddenly support a Python script and had never looked at the language, you could probably use this as your "I only have time to read one chapter" candidate.

**Chapter 4: Project Structure and Imports**

Chapter 4's location struck me as odd at first; I wasn't really expecting a lecture on how to arrange the files in my project this early in the book. After reading it, though, I can see why it's here--so much of Python is reliant on conventions, and Python in particular really stresses things "be done a certain way" to work best. Getting that into a reader's head as early as possible is probably a good idea here.

***Part II: Essential Structures***

**Chapter 5: Variables and Types**

**Chapter 6: Functions and Lambdas**

**Chapter 7: Objects and Classes**

**Chapter 8: Errors and Exceptions**

These four chapters are your "deep dive" into the semantics of each subject.

***Part III: Data and Flow***

**Chapter 9: Collections and Iteration**

**Chapter 10: Generators and Comprehensions**

**Chapter 11: Text IO and Context Managers**

**Chapter 12: Binary and Serialization**

Chapter 10 I kinda wanted to be inside Part II, since I think of these in the same vein as lambdas, but it's not unreasonable that they appear here, after collections and iterators have been covered. Still, it feels a little out of place compared to the rest in here. (I also suspect that there's a balancing act at work here--each Part has four chapters, with exception of Part IV, which has five.)

***Part IV: Advanced Concepts***

**Chapter 13: Inheritance and Mixins**

**Chapter 14: Metaclasses and ARCs**

**Chapter 15: Introspection and Generics**

**Chapter 16: Asynchrony and Concurrency**

**Chapter 17: Threading and Parallelism**

If Chapter 10 felt like a sore thumb, then Chapter 13's place here in "Advanced Concepts" is the clown suit worn to a funeral--I have never thought of inheritance as an "advanced" concept, and I don't know that any "formally-trained" (Java, C#, C++, Smalltalk, ...) object-oriented developer would either. Personally I'd have preferred this to be in Part II, but the rest... they're definitely "advanced".

Matter of fact, unless you're seriously prepared to drop some serious mental acid and open your brain, I'd recommend passing on Part IV until you've had some time playing with the language under your belt. Don't get me wrong, this is the good stuff (and highlights just how "well put together" the Python environment is), but understanding some of this is definitely only for those who can explain the difference between contravariance and covariance in generic parameters in Java (or C# or C++ or....).

***Part V: Beyond the Code***

**Chapter 18: Packaging and Distribution**

**Chapter 19: Debugging and Logging**

**Chapter 20: Testing and Profiling**

**Chapter 21: The Parting of the Ways**

These four bring us back to practical *terra firma* again, with clear and direct discussion of each of these programming-adjacent topics that are really quite crucial to success in programming. It's also important to me that I point out that this is the first book that describes how to use `pdb`, the Python debugger. 

Let me be more transparent: this is the first book that I've ever seen even *talk* about the Python debugger--in fact, I didn't know Python *had* a debugger (at least not a console-mode debugger) until this book. Made me take a second and look at my Python installation (Homebrew, on macOS) to see if there was a launcher script, and, sure enough... nope! Nothing. So then I flip to the back of the book to that chapter, and discover that `pdb` is, like so much else in Python, a Python module that ships with the base installation. Ah! That would explain why I've not seen it before. Cost of the book justified, right there.

## Thoughts

As is probably obvious, I'm a fan of the book, and I plan on keeping it on the shelf nearby when I reach for Python as a solution to whatever problem I'm facing. There's enough reference material in here that I can see myself going to the book to look something up to refresh my memory rather than Googling it, particularly for things that are more conceptual than syntactic. The coverage is extensive but skips the trivia, and its emphasis on quoting the community and the Zen of Python helps the would-be Pythonista come up to speed on the "why of how" quickly. If you're a programmer wanting to learn Python (and you like books over videos!), this is where I'm going to send you.

If you're a data scientist or AI/ML researcher, I think there's still a lot here for you, but you may find about 50% of the book's content unnecessary--it's definitely written for those of us who would use Python to build applications. Unfortunately, it's not a matter of telling you which chapters to ignore, as they're all useful (except maybe you don't need most or all of Part IV). It's more the depth and assumptions made about how you're going to use Python that comes through in the text--as an application developer, it's in tune with what I care about, but if you're a data scientist, you may want to pivot to a different book.

If there was one criticism, I kinda wish there was a chapter or two that had a bit more of how to do the various things we want to do in Python: access a database (relational or otherwise), stand up an HTTP endpoint, that sort of thing. Wouldn't have to be much, just even a list of popular packages with one or two code snippets for a few of them, highlighting and showcasing just how mammoth and diverse the Python ecosystem is. That said, it's a nit, and definitely not something that should keep this book out of any programmer's hands.

Well done.

*While No Starch Press has sent me review copies of books before, this was not one of them; this one I bought in a bookstore after flipping through the pages.*
