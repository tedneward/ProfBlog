title=Things I Think I Think... Agents and (Visual) FoxPro
date=2026-4-28
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=draft
description=Mulling out loud (and defending) why I think coding agents are giving us benefits similar to that of FoxPro.
~~~~~~

More than a quarter-century ago, a software development tool was quite popular and useful in building applications that could be developed, released, sold, and maintained, all by a single person. I speak, of course, of FoxPro (later Visual FoxPro after it was acquired by Microsoft), but the same could be said equally of Visual Basic (v3 through v6) or PowerBuilder or any of a dozen other "4GL" kinds of tools. Today's "coding agents" potentially deliver unto us a similar kind of capability.

<!--more-->

See, the beauty of these 4GL-ish [^1] tools was that they boosted the productivity of the single developer by creating a set of abstractions over the common platform of the time (that is, Windows). Each could build a user interface (windows, buttons, scrollbars, etc), each had durable storage (that is, relational or even non-relational tables), each had a reasonably useful "default" architecture (data binding from the window to the back-end table), and each was able to deploy reasonably easily. A single developer could, if they chose, sit down, scope out a problem, code it up, and put it on another machine within a timeframe that was measured in weeks (or months if it was really complicated).

As a C++/Windows developer (and later Java) during that same timeframe, building something similar often was a much more onerous task. We had greater access to the underlying platform, to be sure--all of the Windows API was ours to invoke, we had dozens if not hundreds of C/C++ libraries we could build off of, and our frameworks (MFC, OWL) certainly helped take some of the heavy lifting off of our shoulders--but for speed of execution/delivery, nothing ever really beat out the rapid delivery of somebody's favorite 4GL.

Oh, we'd argue about it, for sure. I distinctly remember during my days at DevelopMentor when we C++ guys "battled" (all good-naturedly, of course) the VB guys about which platform was better. One guy likened it to playing golf: The C++ golfer, upon declaration that he was about to shoot 18 holes, would immediately begin by obtaining foam, wood, and metal, so that he could fashion his own set of golf clubs, meticulously tuned to the course he was about to play. He might observe the VB golfers out already on the course, each of them with their two-club golf set (consisting of a 3-iron and a putter, for reasons that remain obscure), and mutter to himself, "Just wait until I get out there, they won't stand a *chance* against me!" while milling the 2.5-iron's club head so that it slopes *just so* (for the third time, the previous two having been a little too steep or a little too curved).

We laughed.

But the analogy here to the LLM-based coding agent feels pretty strong: Where we C++ developers had a high degree of control[^2] over the code we were writing, at least when compared to VB, today's "hand-tuned" option is to write the Python or Ruby or other code, well, by hand, as opposed to letting an agent spew it out for you. Just as many VB developers didn't really understand what was happening "under the hood" of their favorite language, though, the developer who simply relies on the coding agent is going to run into problems when they need to know what's happening "down below".

Although....

Quite honestly, I think the analogy isn't quite perfect, comparing VB to coding-agent-generated code. In many respects, it's much closer to the much more obscure "C++-targeted code transpiler" that was briefly "a thing" for about eighteen months or so. You see, these tools allowed you the same kind of drag-and-drop, table-backed development experience that VB or FP or Delphi offered, with the added benefit that what you were building turned into C++ code! This was touted as a feature, because it (a) made integration with other C++ code and libraries easier, (b) yielded the kind of performance that C++ code could offer, and (c) allowed you to peek under the hood and see all that comforting C++ code! Heck, (d) you could stop using the builder and just go straight to the IDE and edit the C++ code like it was a typical hand-authored C++ project.

Except....

Even here the analogy is missing one aspect, and that's the non-deterministic nature of the LLM-based coding agent. Yes, in theory, with a tight enough specification and a low-enough temperature (or consistent random seed, I guess), you could get an agent to generate the same code consistently for the same prompt, but it seems doubtful that that's going to be the norm. A given agent could, perhaps, ship with a fine-tuned model with those randomness factors turned low (or off), but right now the trend seems to be shipping the harness with "plug-in models", which would mean the coding agent user would either have to build a new model with the new parameters (a la Ollama Modelfile) or fine-tune one.

And let's not forget, by the way, that [which language you use matters](https://dev.to/mame/which-programming-language-is-best-for-claude-code-508a) when using a coding agent--the dynamic languages seem to work better with Claude Code, for example. Other agents might turn in different results, but so far we don't seem to have enough experience to judge apples to apples. My point being, in comparison with thirty years ago, the language coming out *behind* the tool may matter more than it did in the past, when the "Basic vs Pascal" debate between VB developers and Delphi developers was basically shoved off to the side because on that axis the C++ developers would jump up and claim victory [^3].

> **NOTE:** In every one of these debates, there were always two more people present: One Smalltalker, who would insist that theirs was the OG tool that all those other 4GLs were desperately trying to copy, unsuccessfully, they would add, and the one Lisper, who would insist that everybody was wrong and it was all about building abstractions upon abstractions upon abstractions.... Turns out they were both right, but hey, who's keeping score?

I think we're going to find, particularly as we go down the path of coding agents and specification-driven development, that ***the coding agent is more akin to the VB development surface than anything we've had since 1998/99,*** which of course was when the Web debuted and made all those desktop applications "obsolete". Nothing in the "Web Era" since has given us that single-developer kind of vibe--building an app even as far back as 2000 meant one team building out the HTML (and later JS and CSS), another team building out the database schema, a third building the "middleware" (servlets, HttpHandlers, session beans, whatever your platform called them), and a dedicated support team to keeping it all up and running on the server(s).

Which then, interestingly enough, leads us to the next question: ***What happens to all the teams of developers currently inside the modern corporate enterprise?***

This is where things, I think, take one of two possible paths:

1. ***The Innovation Center.*** Any company that sees its IT as a source of innovation and value will immediately start looking at ways to magnify the impact of a single developer. Projects might be converted (don't ask me how, we're not there yet I don't think) to this new form of agent-based single-developer "owner" of the code, and the team members either taking on whole segments of the system alone, or the team as a whole owning a *much* larger chunk of the code each. This will, of course, lead to a number of developers now being free to take on new projects, which now enables the company to pursue all of those projects that were sidelined or shelved until that day "when we have a team available". Heck,

2. ***The Cost Center.*** And, of course, any company that sees its IT as a cost center will immediately look to cut costs, by keeping the amount of IT productivity stable, but still expecting more productivity per developer, thus slashing any "extraneous" developers that aren't needed to meet the original productivity numbers. This is, by the way, where I expect most companies to go, because a lot of companies see their IT as cost centers rather than innovation centers, and will comfortably squat in this belief (all the way up until one or more of their competitors roar past them at the speed of sound).

But this all also implies an interesting *third* path:

3. ***The Renaissance.*** Yup. When Italy suddenly was flush with cash thanks to its position as the main trade broker between Europe and East Asia, as well as its invention of double-entry accounting, and thanks to the recent fall of Constantinople and the waning of Church power and influence, a massive social movement dedicated to exploring what was known before the Dark Ages (particularly all things Greek and Roman) as well as a sudden excitement for the burgeoning investigation of science. Individuals, backed by patrons, suddenly found they had time and resources to do some very interesting things (like [paint](https://en.wikipedia.org/wiki/Renaissance_art), [read](https://en.wikipedia.org/wiki/Printing_press), or [explore flying machines](https://en.wikipedia.org/wiki/Science_in_the_Renaissance) ). If we think of agents as being that same kind of "execution lubricant"--that is, something that makes execution that was formally difficult, easy--***we can reasonably expect that we are about to experience a surge in creative new applications and ideas***. (Including, perhaps, games!)

---

[^1]: I don't really want to get into a hot debate about what qualifies as a 4GL. I'm using VB and (V)FP as the canonical exemplars of the genre, and if you feel like getting into a debate about what qualifies as a 4GL, you are free to do so on LinkedIN or somewhere. Maybe Reddit. Or Quora. Or, better yet, your own blog.

[^2]: Meanwhile, if you're still one of those programmers who used to argue with us "high-level" C++ developers because "nothing beats the performance and control of hand-crafted assembly language!".... I'm just not quite sure what to tell you at this point.

[^3]: And yeah, we ignored that one Assembly guy in the back of the room.
