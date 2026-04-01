title=Things I Think I Think... About Touching Code
date=2026-3-31
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=published
description=Mulling out loud whether developers will ever stop working with code directly.
~~~~~~

It's been suggested that, as a natural consequence of the coding agent evolution, as coding agent adoption rises, the amount of time developers will spend working directly with code will either quickly or slowly approach zero. Despite some reasonable analogies that would suggest it, I don't agree, because of the nature of how LLMs work and what we expect out of code.

<!--more-->

*(This is a part of my series of blog posts in which I muse out loud about the "things I think I think". I find that writing out my thoughts helps me reecognize, categorize, and summarize them. If you find value in them, dear reader, I am happy, but keep in mind I am not really writing these to persuade or educate; in fact, it's fair to say I'm not really writing them for you at all.)*

While I was in [Las Vegas for VSLive!](https://www.newardassociates.com/events/2026/vslive-vegas.html) two weeks ago, I got into some conversations with some of the other speakers, many of whom I've known for several decades. As most would expect, talk turned to the subject of "AI" and coding agent tools, and how they're changing the way we work. Or not. Or replacing us. Or not. Or trying to replace us and failing miserably. Or not.

Yeah, it was a pretty lively Speaker Room, no question about that. We've all known each other too long to be drawn into "fights", per se, but we definitely have our opinions, and while I agreed with some, I definitely disagreed with others. One of those places where I strongly disagree is with the opinion that "In time, developers will never see the C#/Java/Python/whatever, because the coding agent will take care of it all."

The analogy frequently cited here is that of the compiler. Back in the day when "developer" meant "writing assembly code by hand", the introduction of "high-level languages" like Pascal and C [^heehee] generated a lot of pushback from developers who swore that they could generate far better code by hand than the compiler could. And, in all fairness, they often could! In fact, I would argue that anyone who has the 10,000 hours required to be an "expert" in the subject could, probably, come up with more efficient/optimized assembly output than the compiler would.

It's just... going to take them a while to do so. And meanwhile, the modern C/C++ compiler is processing dozens, if not hundreds, of C files simultaneously and making sure all of them are correct and "bound well" (meaning, names and signatures match). The compiler can do a million things in the time it takes me as a human to do one of them.

Coding agent can generate code... well, maybe not a million times faster than a human, but at least on par with the human. Even if the agent never gets faster than the human, we can spin up more agents much more easily than we can spin up more humans. Development team scaling problem, solved!

Except...

Look, as I write this, I've got Claude running in a terminal, trying (for the third time) to code up a Tic-Tac-Toe game in .NET 10 and Avalonia. Specifically, it's an experiment to see how well [OpenSpec](https://github.com/Fission-AI/OpenSpec) works as a means to drive a coding agent (I've been using OpenCode and just now turned to see how Claude would do) in specification-driven development, both to test the system as well as to get some reps in on how to use this approach to building software. [^1]

The first two times did not go well.

In all fairness, I believe I understand why--I think the LLM ran out of context window in one case, and in the other I wasn't using the tool properly--but in both cases, the agent very confidently told me "I have implemented all of your features! It all works and runs great!" even though in another terminal window, doing the `dotnet run` thing sometimes wouldn't even build, much less run, and when it did run, it either lacked the very functionality I told it to build (for some reason, it just could not figure out how to display a dialog when a game was won or tied), it did something different than I told it to do (it added a "New Game" button to the main window, not something I asked for), or in one frustrating span of a couple of hours, it simply displayed no main window at all.

Being the developer that I am, and being the "I want to understand what's happening here" kind of developer I am, I cracked a peek into the generated code--in one case, it had laid out the scaffolding for creating the 3x3 grid of buttons to use as the game board... but hadn't actually created the buttons. Instead, it had a helpful comment, `// We will want to create the buttons later but for now focus on the core implementation`, which is a helpful comment, if a bit misguided. I mean, I was asking it to build the GUI in this spec, what "core implementation" was it thinking it was working on if not the implementation of the GUI?

*(As I write this, I keep having to go back to the Claude terminal window to answer "Do you want to make this edit to tasks.md"? even though every time I answer "Yes, allow all edits during this session". Even though the Claude terminal window very clearly reads "accept edits on".)*

Thing is, the nature of an LLM is by definition one of probability, not deterministic output. An LLM is a neural network of tokens--at its simplest, a billions-large collection of [Markov chains](https://en.wikipedia.org/wiki/Markov_chain)--and the coding agent is using that to "guess" what the next (several (hundred)) token(s) will be. We can use weights to adjust the degree to which the LLM randomizes the next element in the chain, but because the chain has probability at the heart of it...

... LLMs are, by nature, nondeterministic. 

This means that every time we run the coding agent and ask it to generate code, it will, by default, choose something that's either a little (or a lot) different from the next time we run it, or the time after that, or the time after that. In fact, one of the books I'm tech-editing even goes so far as to suggest that developers using a coding agent should "just try again" if the first result generated isn't up to snuff [^2].

Nondeterminism is not something we're really "OK" with in code [^3]. If I can't trust the compiler to take my source and produce something consistently out of it, then a whole lot of our other infrastructure falls apart. For example, if one build passes all the tests, but the next one doesn't, even though nothing in the source (specification) has changed, is the thought process here that "We'll just keep deploying until we have one that works?" That seems awfully risky, particularly as the size of the things we're specifying grows.

Here's what I mean by that: If a given agent has only a 0.01% chance of producing an erroroneous line of code per line of code, then in a 100-line program, it's a pretty good bet (99%!) that whatever the agent produces will work. But most software systems are much larger than 100 lines. Some reach to 10,000 lines, at which point probability states that you're going to get an error somewhere. Once we go to 100,000 lines, or even a million lines, though, now you have multiple errors cropping up, and the chances that you will get a "clean" build that you can deploy to production is essentially nil.

BUT, that doesn't mean that the agent isn't useful in generating the code, IF you have people who can go in and smooth out the five or ten or a hundred places where the errors are occurring. Doing this, though, means having humans in on the action and knowing what's being written well enough such that they can wade into a particular place in the code, understand enough of what's going on to diagnose the problem, fix it, and extract themselves. Developer, meet code.

In a lot of ways, this is actually reminiscient of what we've always known about code: You'll write it once, but read it a hundred or more times. Which was always the argument for why code should be formatted a certain way, designed a certain way, variables named a certain way, and so on. ***Minimizing the cognitive load to understand a section of code was always a high priority for human-authored code.*** One would think we would want to carry that forward into the coding-agent era, particularly since in this new world I will be wading into code that, by definition, I've never seen before.

Another speaker in the room pointed out the very true fact that just as coding agents are nondeterministic, so are humans. "We seem OK with humans writing code, and they're not producing the same thing each time, why should we care about what the coding agent cranks out?" Which, again, I'm not opposed to the coding agent to (a) go away or (b) be useless. The more common/mainstream the thing you're asking the agent to code up, the more likely the agent will do so with some level of success.

But it won't generate the code the same way given the same inputs, and that's deeply worrisome. Forget the regulatory requirements that many business (health, financial, e-commerce, etc) labor under, let's just consider the engineering infrastructural parts of the discussion. If I can't be certain that "spec" will yield "implementation" that will ensure it's using database connection pools, parameterized database queries, sanitized inputs, and so on, then either I can't trust agent-generated code at all and need to throw the idea/tool away (which would not endear me to the accountants or the board), or I need to always "have a human in the loop" to make sure that the resulting output is correct.

> SIDE NOTE: Interestingly enough, the lack of determinism in humans was what spawned the now-ubiquitous use of unit tests to ensure that the code does what it claims it does. As techniques for achieving its stated goal go, automated testing is a really powerful one on the list. Perhaps part of the trick is to have a spec that is well-defined enough (using, dare I say, maybe, a DSL or even programming language?) that the coding agent can code up unit tests out of the spec. Or, perhaps, the trick is to have the developers write the unit tests that the coding agent must respect and pass without modification before it can declare victory. That can help--but at the cost of developers writing code again, and what's worse, writing the part of the code that historically they've never enjoyed writing. I'm not sure this is a "win" for anybody.

***Axiom:*** **Developers will always need to be able to read and write high-level language code.** The language may be C#, Java, Python, or even C/C++, but they'll need to know how to work well within them.

**Corollary:** *The amount of code we write vs read will remain consistent, or tip a little bit more towards 'read'.* Yes, the agents can generate code way faster than humans can, no argument. But theoretically, the agent will get commonly-written code right more often, and warrant less human scrutiny on those parts, so the relative balance between "read" and "write" will remain roughly constant.

***Remaining open question(s):***

* Will we need the same number of developers (proportionally speaking) as we used three years ago? Probably not, but it's hard to say for sure. Going into and coming out of COVID was such a market-muddling event, it skewed lots of things in very extreme ways, making it a little unreasonable to draw as a "norm" to which we will return. That said, though, the Internet disruption of thirty years ago vastly accelerated the demand for developers, so that's a reasonable inference as well.

[^1]: I should mention, because it might be relevant, I chose Tic-Tac-Toe primarily because it should be something that agents can understand pretty quickly and easily, and so therefore I'm minimizing the variables involved in the experiment. Also, just for the record, as I have [documented elsewhere](/blog/2026/titit-local-ai), I prefer running local LLMs rather than cloud-hosted ones.

[^2]: Something about how now the context window incorporates the failed effort and the LLM can learn from that and produce a better result.

[^3]: Interestingly enough, one of the other speakers in the room piped up with, "The C# compiler is non-deterministic, you know." Which floored me--the very nature of a compiler is to be deterministic, what the hell? Marcel even pointed out that the C# compiler provides a `Deterministic` option in the project file, a la `<Deterministic>true</Deterministic>`. Now, Marcel is usually nowhere close to being full of shit, so I assumed he was right that the option existed, but WTH is it turning off? Google is your friend here: ["By default, the C# compiler produces non-deterministic output. The resulting assembly includes elements like a timestamp and a randomly generated Module Version ID (MVID), which cause the binary content to differ across compilations even if the source code is identical."](https://www.google.com/search?q=C%23+compiler+nondeterministic) Which... yeah, that's not really non-determinism, but sure, you get points for pointing out something I didn't know. Next round's on me, buddy.

[^heehee]: I find it just incredibly tickling to think that the language that was designed to be a "portable assembly language" was, in its day, considered "high level". Don't get me wrong, it totally is, compared to every assembly language I've ever laid eyes on, but considering how people today grumble and compain about C++, much less C.... *hee, hee*
