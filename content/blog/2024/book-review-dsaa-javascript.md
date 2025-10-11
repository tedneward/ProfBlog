title=Book Review: Data Structures and Algorithms in JavaScript
date=2024-10-7
type=post
tags=book, book review, ecmascript, native
status=published
description=A review of the book.
~~~~~~
No Starch Press sent me an early access/review copy of the book "Data Structures and Algorithms in Javascript", by Federico Kereki. If there's two sentences that summarize the book, it's these two from the Introduction: "The book deals with two basic concepts in computer science: data structures and algorithms. It follows a structure similar to university curricula and adds examples taken from coding challenges and interview questions, using them to discuss the relative advantages and disadvantages of specific algorithms and data structures." In other words, it's exactly what it purports to be, and that's a good thing.

<!--more-->

tl;dr, this is a great book to read if you've never had a formal introduction to ECMAScript (which, by the way, is the formal name for the language--Javascript is the name of the Netscape implementation of the language, just as JScript is the name of the implementation that Microsoft did a while back) or to some core computer science topics. The first chapter is a great succinct summary of Javascript, and the second is an intro to functional programming, though one that is entirely tailored to Javascript, and is missing a great number of functional features (like partial application of functions or currying) which are missing from Javascript. I kinda wish the book covered a bit more of FP than just what's there, but at the same time, the book is focusing on data structures and algorithms in Javascript, and not FP in general.

Given that this was an early access/review copy, I didn't have a physical copy of the book to work with, but from the PDF, it looks like a pretty traditional No Starch Press book, 500+ pages long, and the rest of the book is pretty much a common-sense written version of a more-than-decent computer science textbook. What's also reminiscent of a textbook is the list questions at the end of each chapter, with answers at the back of the book, designed specifically to give the reader a chance to test their understanding at the end of each chapter. It's a nice touch, and although in general I'm not a huge fan of them, Kereki does a pretty good job with these, keeping them high-level enough to get the point of the TfU across while being low-level enough to have a clear goal and area of study. 

The TOC is below:

***PART I: THE BASICS***

* Chapter 1: Using JavaScript
* Chapter 2: Functional Programming in JavaScript
* Chapter 3: Abstract Data Types
* Chapter 4: Analyzing Algorithms

***PART II: ALGORITHMS***

* Chapter 5: Designing Algorithms
* Chapter 6: Sorting
* Chapter 7: Selecting
* Chapter 8: Shuffling and Sampling
* Chapter 9: Searching

***PART III: DATA STRUCTURES***

* Chapter 10: Lists 
* Chapter 11: Bags, Sets, and Maps
* Chapter 12: Binary Trees
* Chapter 13: Trees and Forests
* Chapter 14: Heaps
* Chapter 15: Extended Heaps
* Chapter 16: Digital Search Trees
* Chapter 17: Graphs
* Chapter 18: Immutability and Functional Data Structures

If anything about this book is true, it's that Kereki does an amazing job of staying 100% on task throughout the book. The first part is entirely what it says: it's all about the basics--Javascript, FP, ADTs (intro to data structures) and big-O notation (algorithms). The second part dives deeper into algorithms, and third part into data structures. 

One area that I've personally always had a bit of a problem with is understanding *persistent data structures*--that is, data structures that have the interesting property that can be updated while keeping previous versions intact, without changes. This property automatically implies that these structures are ideal for purely functional programming languages, which do not allow for side effects. [Okasaki's book](https://www.amazon.com/Purely-Functional-Data-Structures-Okasaki/dp/0521663504) is the gold standard on that, but I never really grasped what was going on there. While I can't say that I completely understand functional data structures yet, I can say that, like the great physicist, "I find that I am still clueless, but at a much higher level."

## Thoughts
I like this book! It's not going to be for everybody--it's dry in places, but it's also not trying to be anything other than what it's declaring itself to be. It's a solid discussion of some core Comp Sci principles, but done in a language that isn't normally what's used by CompSci grads. And that, in many ways, is the key strength of this book--this is not a book for Computer Science graduates, it's a book for those thousands and thousands of bootcamp graduates who were all turned away because they lacked the knowledge of Big-O notation and data structures. This book, in a nutshell, is the book that every bootcamp grad needs to read, to catch up on all the theory they missed by not taking a CS degree, but it's in a readable format and approachable style that any novice Javascripter will be able to comprehend. (Note, I don't mean "right away"--some of these are dense topics that will take time and practice to master, but at least there's no Greek symbols or confusing functional programming terminology to act as gatekeeper.)

If you're a well-practiced Javascripter who never learned the formalities, some of this will be redundant, and if you're a CS graduate who did well, you'll probably pick up a few things about Javascript. But overall, this book is a gold mine for the aforementioned bootcamp grad, and if I had had this book available to me a decade ago when I built a web app team out of fresh-from-bootcamp graduates, I'd have bought each and every single person a copy.
