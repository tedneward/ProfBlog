title=On Knowledge
date=2012-11-29
type=post
tags=conferences, development processes, industry, philosophy, psychology
status=published
description=In which I discuss the three kinds of knowledge.
~~~~~~

Back during the Bush-Jr Administration, Donald Rumsfeld drew quite a bit of fire for his discussion of knowledge, in which he said (loosely paraphrasing) "There are three kinds of knowledge: what you know you know, what you know you don't know, and what you don't know you don't know". Lots of Americans, particularly those who were not kindly disposed towards "Rummy" in the first place, took this to be canonical Washington doublespeak, and berated him for it.

I actually think that was one of the few things Rumsfeld said that was worth listening to, and I have a slight amendment to the statement; but first, let's level-set and make sure we're all on the same page about what those first three categories mean, in real life, with a few assumptions along the way to simplify the discussion (as best we can, anyway):

* **What you know you know.** This is the category of information that the individual in question has studied to some level of depth: for a student of International Relations (as I was), this would be the various classes that they took and received (presumably) a passing grade in. For you, the reader of my blog, that would probably be some programming language and/or platform. This is knowledge that you have, in some depth, at a degree that most people would consider "factually accurate".

* **What you know you don't know.** This is the category of information that the individual in question has heard about, but has never studied to any level or degree: for the student of International Relations, this might be the subject of biochemistry or electrical engineering. For you, the reader of my blog, it might be certain languages that you've heard of, perhaps through this blog (Erlang, F#, Scala, Clojure, Haskell, etc) or data-storage systems (Cassandra, CouchDB, Riak, Redis, etc) that you've never investigated or even sat through a lecture about. This is knowledge that you realize you don't have.

* **What you don't know you don't know.** This is the category of information that the individual in question has never even heard about, and so therefore, by definition, has not only the lack of knowledge of the subject, but lacks the realization that they lack the knowledge of the subject. For the student of International Relations, this might be phrenology or Schrodinger's Cat. For you, the reader of my blog, it might be languages like Dylan, Crack, Brainf*ck, Ook, or Shakespeare (which I'm guessing is going to trigger a few Google searches) or platforms like BeOS (if you're in your early 20's now), AmigaOS (if you're in your early 30's now) or database tools/platforms/environments like Pick or Paradox. This is knowledge that you didn't realize you don't have (but, paradoxically, now that you know you don't have it, it moves into the "know you don't know" category).

Typically, this discussion comes up in my "Pragmatic Architecture" talk, because an architect needs to have a very clear realization of what technologies and/or platforms are in which of those three categories, and (IMHO) push as many of them from category #3 (don't know that you don't know) into category #2 (know you don't know) or, ideally, category #1 (know you know). Note that category #1 doesn't mean that you are the world's foremost expert on the thing, but you have some working knowledge of the thing in question--I don't consider myself to be an expert on Cassandra, for example, but I know enough that I can talk reasonably intelligently to it, and I know where I can get more in the way of details if that becomes important, so therefore I peg it in category #1.

But what if I'm wrong?

See, here's where I think there's a new level of knowledge, and it's one I think every software developer needs to admit exists, at least for various things in their own mind:

* **What you think you know.** (Or, perhaps, another variant of "What you don't know that you don't know.") This is knowledge that you believe, in your heart of hearts, you have about a given subject, and it is flat-out incorrect and wrong.

Be honest with yourself: we've all met somebody in this industry who claims to have knowledge/expertise on a subject, and damn if they can't talk a good game. They genuinely believe, in fact, that they know the subject in question, and speak with the confidence and assurance that comes with that belief. (I'm assuming that the speaker in question isn't trying to deliberately deceive anyone, which may, in some cases, be a naive and/or false assumption, but I'm leaving that aside for now.) But, after a while, it becomes apparent, either to themselves or to the others around them, that the knowledge they have is either incorrect, out of date, out of context, or some combination of all three.

As much as "what you don't know you don't know" information is dangerous, "what you think you know" information is far, far more so, particularly because until you demonstrate to yourself that your information is actually correct, you're a danger and a liability to anyone who listens to you. Without regularly challenging yourself to some form of external review/challenge, you'll never exactly know whether what you know is real, or just made up from your head.

This is why, at every turn, your assumption should be that any information you have is some or all incorrect until proven otherwise. Find out **why** you know something--what combination of facts/data lead you to believe that this is the case?--and you will quickly begin to discover whether that knowledge is real, or just some kind of elaborate self-deception.

