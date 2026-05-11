title=Things I Think I Think... about Coding Agents and IDEs
date=2026-5-11
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=published
description=Mulling out loud (and defending) why I think coding agents are here to stay, just as IDEs came to be as well.
~~~~~~

This is another one of those "old developer guy" posts, because approximately a quarter-century ago, a new kind of tool was emerging in the developer ecosphere that generated a similar kind of "angst" to what we're seeing today, and that's the low and humble "wizard". Remember those? These were the step-by-step dialogs that asked a series of questions of the developer who'd fired up a new project, and based on those answers generated a bunch of the scaffolding code for you at the start of your project. Or sometimes, even, if the wizard was smart enough, during other phases of your project too.

<!--more-->

Every hard-core saddle-worn grizzled C++ developer I knew hated them. "They're just going to create a ton of code that I'm going to have to learn and study anyway." Or "The code they generate is garbage, it'd be faster for me to rewrite the whole thing by hand." Or my personal favorite, "We have a great framework that can do so much more than what those wizards can possibly create, why on earth would I choose to use them when I can just write my app by hand using my framework?" Seriously, by the way, I mean it quite literally when I say that last one was my favorite--I used it as my primary weapon to argue for Borland C++'s Object Windows Library (OWL) against the wizard-generated MFC code that Visual C++ chose to churn out. Writing an app by hand with MFC was nigh-on impossible; you needed the wizards to help get the "macro magic" right for wiring up an MFC app. OWL needed no such help, though candor compels the admission that it benefited from the odd wizard-assisted effort every now and then.

The larger point is, there was a time....

Not to be replaced or supplanted, of course, by the *second* time tools came around and threatened to make developers "obsolete" around the same time. I refer, of course, to the "drag-and-drop" movement of the VB era, wherein building application was going to be so easy "even managers can do it!" [^1]

But none of these compares to the *real* time when tooling emerged to replace the developers' and their hard-earned, time-honored knowledge earned "the hard way", by which of course I refer to the emergence of the IDE itself in tools like Turbo Pascal and Turbo C++, back when "real" developers were all doing the editing, building, debugging, and profiling entirely by hand in a variety of different command-line tools. No way would a "real" developer be caught dead using "windows" on their character-mode terminal, no way. It was `vi` or nothing. Er, sorry, I meant `emacs`. `vim`. OK, whatever editor you chose to use, you used that editor, then shelled out to a terminal prompt and built it by hand. I mean with `make`. I mean.... Gah! Forget the details, just stick with the point, "real" developers just use the tools we have, because the tools we have are all the tools we will ever need!

I mean, do I really need to follow up on the part that I think I think here? ***Coding agents are here to stay.*** Love them or hate them, they've already proven that they have too much utility to throw away entirely. Do I think we have them tuned and mastered to the point where we know how best to use them? Not even close--we're still discovering a whole slew of new things about them and how to use them, and every time somebody releases a new tool or tosses out a new blog post showing off something interesting, all the silt on the ocean's floor gets kicked up again and nobody can see more than an inch or two--at most--in front of their face. It's going to take a while.

But in the meantime, I think it important for developers to sit down and figure out for themselves what their relationship is to their coding agent of choice. Pick a coding agent, pick a few models that seem to work well for you (particularly if you want to do as I do, and [try to run everything locally](./titit-local-ai.html), since their size is going to matter to you *a lot* when you're running them on your hardware at home), and start trying a few experiments of your own. 

---

[^1]: Honest to God, that was an actual Marketing slogan for VB back in the day.
