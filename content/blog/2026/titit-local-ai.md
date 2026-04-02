title=Things I Think I Think... Preferring Local OSS LLMs
date=2026-4-1
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=published
description=Mulling out loud (and defending) why I think local-hosted LLMs are better than the cloud-hosted ones.
~~~~~~

While spending some time inside the company Slack, I mentioned that I wanted to try a particular tool but using locally-hosted LLMs rather than cloud-hosted ones. The response was basically "LULZ y would u want to do that" and not only was I a little surprised at the response, I realized I felt a strong desire to explain why, in a format more suited to a blog post than a Slack message.

<!--more-->

*(This is a part of my series of blog posts in which I muse out loud about the "things I think I think". I find that writing out my thoughts helps me reecognize, categorize, and summarize them. If you find value in them, dear reader, I am happy, but keep in mind I am not really writing these to persuade or educate; in fact, it's fair to say I'm not really writing them for you at all.)*

#### Local-first LLMs

First, a quick clarification: When I talk about executing my AI infrastructure locally, as opposed to using the stuff in the cloud, I'm generally referring to a stack that leans heavily into the open-source community, for the basic reason that locally-hosted commercial options are just nonexistent. I'm not sure if this will change any time soon, but I actually don't see any reason why it would--after all, we've essentially moved from a world where, 40 years ago, you bought a copy of Office and installed it locally onto your machine to today, where the commercial options are all cloud-hosted, and only open-source options (a la Libre Office) are available for local install. I suspect this has a lot to do with software piracy and the whole "how do I force people's local installs to behave differently whether or not they have given me money" and license keys and that whole thing--it's just a lot easier to not bother and host the commercial stuff online. I don't see that changing now, "soon", or even "ever".

The other component to this, of course, is the hardware--you really need a hefty GPU card (or cards) in your machine to run an LLM that's on par with running one of the LLMs in the cloud. For the record, my gaming rig on my desk hosts an NVidia FeForce RTX 4090, which isn't all that bad considering it's at least a year old. It's not going to win any competitions against a Cray, of course, but it definitely will run LLMs much better than your average ChromeBook, that's for sure.

And, for almost everything I'm seeing in the LLM-based software stack, there's been some pretty fast congregation around the Anthropic API set, it seems. [Ollama](https://ollama.com/), for example, can mimic Anthropic API to allow Claude Code to use it (instead of their native servers) by setting some local environment variables:

```
export ANTHROPIC_AUTH_TOKEN=ollama
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11434
```

... and then launching Claude with an Ollama model, a la `claude --model qwen3.5`. Or, Ollama can handle a bunch of this detail for you, and you just run `ollama launch claude` and it'll work out the rest.

### Why

There's four main points that come to mind when I think on this topic:

* The Fallacies of Distributed Computing
* The Economics of 2020s AI Companies
* The Security of Hermitude
* The Ease of The Return
* The Clarity of Self-Hosting

#### The Fallacies of Distributed Computing

At 11:49am GMT on March 2, 2026, the unthinkable happened: Anthropic servers went down, and as a result, Claude Code was down. The [world noticed](https://mashable.com/article/claude-down-ai-anthropic-outage), in large part because not only did productivity numbers go way down, but Solitaire scores went way up [^1]. 

What many people learned--again, the hard way--is that Claude Code, like many systems, [is a distributed system](https://www.adventureppc.com/blog/claude-code-down-in-2026-complete-status-guide-error-fixes-what-to-do-during-outages), and as such it will always be held hostage to the Fallacies of Distributed Computing:

1. The network is reliable;
2. Latency is zero;
3. Bandwidth is infinite;
4. The network is secure;
5. Topology doesn't change;
6. There is one administrator;
7. Transport cost is zero; and
8. The network is homogeneous.

Again, these are eight assumptions that every distributed system developer makes at some point in their life, and any one of these assumptions usually ends up creating painful scenarios when the assumption is proven false, as they always are. Yes, networks have gotten better than they were twenty, or even ten, years ago, but they're still fallible, and that still doesn't prevent any of the other seven from creating problems.

It's tempting to take the position of, "Well it doesn't happen that often, and besides, we even have WiFi on airplanes at 40,000 feet in the air, so..." but that essentially ducks responsibility for dealing with failure modes that can and often do happen at the most awkward times. When the Internet was young, we built systems that were essentially crippled if the network wasn't present, and over time [developed](https://martin.kleppmann.com/papers/local-first.pdf) [approaches](https://www.heavybit.com/library/article/local-first-development) to try and compensate for that. Then, of course, the mobile devices came along, and while we got excited about having actual CPU and storage available to us on the device (most of which we put towards games), we quickly got back to building applications that couldn't run when there was no network, only to make the same realization that we really still needed to have a good fallback plan in the event the network wasn't available.

Now, as we see companies building more and more "AI-powered"/"agentic" applications, we discover pretty quickly which ones are essentially wrappers around calls to the OpenAI or Anthropic AI models running in the cloud. Keep in mind, if you're doing this, you're not just basing your uptime on the uptime that OpenAI or Anthropic can manage--you're also basing your uptime on the uptime of their Internet provider, the cloud host they're running in, the telecom backbones between you and them, your local Internet provider, and even the uptime of your local Internet. (Looking at you, [Comcast](https://www.trustpilot.com/review/www.comcast.net)!) The point is, distributed systems are inherently more fragile than local ones.

Which then leads me towards "If we can host the LLM model locally, then there's one less distribution link over which failures can bring the system to its knees." This is, I think, going to be even more important in the months and years to come, because frankly having a single point of failure, no matter how much we protect against that failure, is almost always a bad idea [^2].

Not to mention it'll cost a whole lot less, which brings me to my next point.

#### The Economics of "AI" Companies

In a nutshell, I'm absolutely convinceed the current marketplace of AI companies is a bubble, and I'm absolutely convinced that the bubble is going to pop. It doesn't mean that OpenAI or Anthropic, or even Microsoft or Google or Amazon or Oracle, will go bankrupt. But that bubble popping is definitely going to have a massive ripple effect throughout the rest of the industry, and a whole lotta money that's been propping up some ridiculously unsustainable business assumptions is going to go up in smoke.

I defer the in-depth discussion of why I think this to [Ed Zitron](https://www.wheresyoured.at/); if you want a deep take on his latest thinking (as of this writing), check out [The Subprime AI Crisis Is Here](https://www.wheresyoured.at/the-subprime-ai-crisis-is-here/). There is just no way I could explain it better than he does, but I will warn you: If you want to argue with him, you'd better have at least a Bachelors in Economics or Finance, because he is not just hand-waving over the details. 

The [first](https://openai.com/index/testing-ads-in-chatgpt/) [cracks](https://help.ads.microsoft.com/#apex/ads/en/60343/0) are showing, by the way, and the only reason Anthropic hasn't openly floated the idea of ads in Claude is because they just recently and very aggressively [mocked ChatGPT for it](https://www.theverge.com/ai-artificial-intelligence/873686/anthropic-claude-ai-ad-free-super-bowl-advert-chatgpt), which means they've locked themselves out of that option for at least seven days (which is how long it [takes us as a society to forget about stuff](https://www.vuelio.com/uk/blog/how-long-does-a-news-story-last/); check out https://www.newslifespan.com/ if you want to see more).

But the crux of the situation is this:

* Any company involved in "AI" right now is spending way more than it's making.
* The gap is being made up by venture capital funding (or more creative accounting schemes).
* Venture capital funding and creative accounting are not indefinitely sustainable.

... which then leads us to the inescapable conclusion that either (a) the companies involved in "AI" are going to have to find ways to make their income exceed their expenditures, which means any dependents will also see their costs raise, which eventually finds its way to the consumers who are accustomed to getting everything for free, or (b) the whole system flies apart when the venture capital lubrication runs out. Or (c) some combination of (a) and (b), which will still cause a pretty major ripple of Bad Stuff (TM) to wash across the industry.

All of which will be safe-harbored by those who are thinking about local-first LLM-hosted stacks.

#### The Security of Hermitude

Actually there's a third (er, fourth?) possibility that can generate cash for the AI companies, one which most SaaS companies have proven is entirely too tempting to ignore: (d) We sell your data to the highest bidder.

Are you OK with each and every one of your conversations with ChatGPT suddenly being analyzed and sold off to advertisers who will now pepper you with ads for all those things you thought you were sharing with ChatGPT in confidence? Considering how many people use ChatGPT as [marriage counselors](https://medium.com/the-point-of-view/we-fired-our-therapist-and-asked-chatgpt-to-fix-our-marriage-5da684ffec09) and [mental health experts](https://www.cnn.com/2025/11/06/us/openai-chatgpt-suicide-lawsuit-invs-vis).... I'm not sure I'd be comfortable with that.

On a more corporate scale, though, if your company is currently baking Claude or other agents into the center of your decision-making or dashboarding process, you're essentially now trusting that at no point will all of that data flowing in and out of the LLM ("tokens", remember) will at no point be considered the ["new oil"](https://www.economist.com/leaders/2017/05/06/the-worlds-most-valuable-resource-is-no-longer-oil-but-data) and sold to the highest bidder. And don't get me wrong! Anthropic would never consider doing that, just like Google will always be the company that adheres to its ["Do No Evil"](https://en.wikipedia.org/wiki/Don%27t_be_evil) motto that it told us over and over again was at the core of their corporate culture [^3] .

#### The Ease of the Return

And if it turns out that absolutely none of the scenarios I'm imagining--not only do AI companies figure out how to make one USD of income cover ten USD of expenses, forever, but the Internet suddenly becomes a bastion of reliability and physics-defying performance--then it's actually a pretty simple switch over to using the cloud-based stuff. 

#### The Clarity of Self-Hosting

Most of all, though, when you have to build your own stack, you learn things. Figuring out how to get Ollama going, figuring out which models I want hosted locally, figuring out how to get [OpenWebUI](https://openwebui.com/) or Claude or [OpenCode](https://opencode.ai/) or VSCode or [n8n](https://docs.ollama.com/integrations/n8n) or [marimo](https://docs.ollama.com/integrations/marimo) to work with it, figuring out the key differences between Ollama and [vLLM](https://vllm.ai/) or [LlamaCpp](https://github.com/ggml-org/llama.cpp), all of these things are inherently educational and powerful ways to understand how all this shit works.

Because truthfully, that's really where the real power rests: Knowing how to put these pieces together, so that now you can see all the wires and the data flows and what it looks like at rest and so on. Assuming that software developers are still going to be relevant and necessary even if we write less code (which suggests we're going to be moving into more architect-type roles than "code monkey" roles of the past), somebody still has to know how to wire it all up in such a way that it matches the company's goals and interests and concerns.

And I want to be one of those "sombody"s.

[^1]: Actually, does anybody besides me still play Solitaire? What is it you kids use these days? Minesweeper? Grand Theft Auto? Something on your Steam deck? *shakes fist at clouds*

[^2]: Which also explains why I'm 150% a fan of government-sponsored space exploration and research. The sooner we can reduce our dependency on Earth-centric life, the more robust our species becomes in the face of potential dangers. But that's another topic for another day (and probably a few single-malt Scotches, to boot). If you want those thoughts early, catch me at a conference, plunk your quarter in the jukebox (i.e., buy me a Macallan, double, neat), and be prepared to listen through the whole playlist.

[^3]: [Until it wasn't](https://www.the-independent.com/tech/google-dont-be-evil-code-conduct-removed-alphabet-a8361276.html).
