title=Research: "Skills"
date=2026-5-31
type=post
tags=thinking, ai, llm, coding agent, code
status=draft
description=Diving into a semi-scientific study of the impact had by using "SKILL" files specific to programming languages or frameworks.
~~~~~~

Once you're past the whole "prompt engineering" part of interacting with your LLM, people start talking a lot about the various "SKILL" files that supposedly figure out how to teach the LLM everything it needs to know about... whatever. A company I worked for had a huge investment into a collection of skills files used by the company's Marketing department to help interact with their Claude (Desktop/Code/whatever), and I was curious to explore the idea further.

<!--more-->

There's a couple of interesting factoids that layer into this investigation that I think bear calling out explicitly:

* When talking about programming languages, ***many of the LLMs being produced today (2026) are trained on many of the mainstream programming languages.*** I don't need any external assistance to the model to have it write C#, Java, or C++, for example. So having specific SKILL.md files for the language basics (grammar, etc) seems like an unnecessary repetition of what's already layered into the neural network. Frameworks, however, may or may not be already present within the training corpus, so it seems reasonable to assume that a model may do well on "raw" language code, but flail badly on something that's not considered "core" to the platform. For C#, for example, it's probably reasonable to assume the model knows how to use ASP.NET, since that comes "out of the box" with any .NET installation, but something like Akka.NET would probably not be present, and therefore a reasonable candidate for a skill.
* ***Skills apparently don't come for free.*** Many "best practices" discussions of skills mention keeping them relatively small and tight, since the LLM reading a skill consumes more of those precious tokens in the context window. (I'm running locally so I can afford to max out the context window to whatever size I'd like, up to the limitations the local tools I'm using allow, anyway.)
* ***I'm assuming skills are hand-curated.*** It doesn't make sense to me that there would be any gain from asking an LLM to create a skill and pipe that directly into the model again. If the agent already had the skill, it'll already be inside the trained model; if it doesn't have the skill, then the output really shouldn't be trusted. So while the agent might be able to spit out an empty template, the meat of the skill is something the human needs to have eyeballs on.

# The Experiment
... is available in source form [on GitHub](https://github.com/tedneward/Research-Skills), if you care to try it yourself.

## Problem statement
I want to know if I should be curating my SKILL.md files as carefully as I once did code. Should I be treating them like deep wells of domain-specific knowledge, so that all I know and understand about a development topic (say, Java) appears inside a "java/SKILL.md" file (possibly broken into smaller Markdown files but all referenced from the singular "SKILL" file)? Should I instead break my Java knowledge down into individual disparate skills, a la `java-collections`, `java-reflection`, `java-concurrency`, and so on? Will it actually make much of a difference to a recently-trained (2026) LLM?

## Hypothesis
My working hypothesis is that it would actually be better to have smaller, more singular skills, on the grounds that it would allow the tool to be more fine-grained about its skill usage.

In fact, I think my working hypothesis is that the best skill file, for programming languages anyway, is something that looks and feels like a cross between a company's "coding conventions" document and an ["Effective"-style book](https://www.amazon.com/Effective-Specific-Improve-Programs-Designs/dp/0321334876) [^1]. These strike me as roughly the right level of abstraction, from what I've been seeing.

In terms of granularity, I think the SKILL.md file can be broken out into pieces to facilitate easier modularity, perhaps, but overall I think the skill file's contents should be kept relatively short, targeting "under 500 lines and 5,000 tokens" (which I interpret to mean words, since those are easier to count). The [AgentSkills Specification 'best practices' doc]() says that "When a skill legitimately needs more content, move detailed reference material to separate files in references/ or similar directories. The key is telling the agent when to load each file. 'Read references/api-errors.md if the API returns a non-200 status code' is more useful than a generic 'see references/ for details.' This lets the agent load context on demand rather than up front, which is how progressive disclosure is designed to work."

## Procedure
Let's see how well the model knows how to write C# code with and without skills. **NOTE:** It would be an interesting, but longer, experiment to test different programming languages, as a way of seeing how well a model might deal with other mainstream-but-different languages like Python or Ruby, less-mainstream languages like Dart or Swift, or older languages like Pascal or C. The real interesting test would be with a language that really hasn't got much attention at all, like Ballerina or Jolie. Those will each need to be separate phases, though, because it'll require four variations on skill files for each language evaluated.

The thing I'm looking to vary here is the quality and/or depth and/or even presence of skills, so we'll standardize on a single model (qwen3.6 seems to be a recent and strong model to use for coding), running inside Ollama on my desktop (running an NVidia GeForce 4090 w/26GB on board) from within the OpenCode coding agent harness. I'll have multiple project directories, each one with a different set of skills installed in an OpenCode-directed project-specific location. Then I'll run OpenCode over each directory with the exact same prompt.

Tests:

1. Basically no skills whatsoever, so that'll just be OpenCode, the model, and whatever knowledge was baked into the model at the time of its creation [^2].
2. A very short and simple SKILL.md file inside of the project directory.
3. A much longer and deeper SKILL.md file, going into greater detail but still staying within the single SKILL.md file range.
4. A series of individual SKILL.md files, covering specific topics within the C# language space, like concurrency or collections or reflection.
5. Let's also try a slightly different version of "no skills", which is to say, skills that aren't relevant. I'm curious to see if the model pulls on them for any reason.

For the actual project, I'm going to reach back to one of my UW classes, and have the coding agent generate a server implementation of the [TicTacToe Protocol](https://github.com/tedneward/INFO314-TicTacToeRFC/), which I'll copy into the top-level directory for easy reference (though I may edit slightly to remove reference to the class itself--in an early run on this, the agent picked up that this was a class assignment, and I don't want it behaving differently because of that). The interesting part of using this specification is that (a) it's relatively simple to understand, (b) there's zero copyright concerns, since I created it and put it into CC-licensed state, and most of all, (c) my students reported that there was a bug in the spec and at least one place where the specification was ambiguous--it'll be interesting to see how the agents handle this [^3].

## Results


---

[^1]: By the way, Scott, if you're out there and you read this, thanks again for every word you wrote in all of those books, and thanks for [letting me play for a while inside your "Effective" playground](https://www.amazon.com/Effective-Enterprise-Java-Ted-Neward/dp/0321130006/ref=sr_1_1). Loved being a part of your series.

[^2]: Going to have a fairly short leash with this one, though; in some simple exercises outside of this test, apparently models really struggle with understanding the current (.NET 10) tooling. The OpenCode/glm-4.7-flash pairing I'd been using on another experiment has spent much of the night (on my 96GB M4 MacBookPro) flailing with messages like "It seems the .slnx file is appearing but not the .sln file. This is strange. Let me force it and then add the projects. ..." To be fair, the .slnx format is new in .NET, so for the test I may have to use .NET 8, where (when) .sln was the standard, but this already speaks to skills. This may need to be a Phase 2 kind of test.

[^3]: Of course, if that ambiguity or bug turns out to be too difficult a hill to climb, I'll have to re-run the experiment, but it should be an interesting effort nevertheless.
