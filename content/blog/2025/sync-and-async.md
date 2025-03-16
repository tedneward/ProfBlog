title=Synchronous Work, Asynchronous Work
date=2025-3-15
type=post
tags=management, engineering
status=published
description=We often talk about teams working "remote" or "in office", but leaving the discussion at that level misses some critical points of analysis--namely, that the real distinction is between "synchronous" and "asynchronous" work.
~~~~~~

**tl;dr** Over the last two years, we've seen a dramatic policy debate playing out on the feeds of LinkedIn: "WFH (Work From Home) vs RTO (Return to Office)". Nearly everyone has an opinion, and many (if not most) of them are held strongly. Some are held based on data, some on personal preference, and many are based on personal experience. Nearly all of them, however, focus on the wrong part of the debate: it's not really about "WFH vs RTO", but about "async vs sync".

<!--more-->

<script type="module">
    import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
    mermaid.initialize({ startOnLoad: true });
</script>

Over the last five years, we've seen a remarkable transition/cycle in "work", thanks to the COVID-19 pandemic.

### Everybody go home! Don't come back! (But keep working!)
When the pandemic lockdown was imposed, nearly every company on the face of the planet "went remote", doing everything they could to enable their employees to work from home, partly out of a desire to keep their employees, but primarily out of a desire to keep the company going. And for the two-plus years of lockdown, it actually worked out remarkably well--certainly, some jobs were heavily affected since they couldn't be done remotely (looking at you, every assembly-line job ever), but overall, for our industry, the shift was relatively smooth and painless. We discovered that Zoom/Teams/Slack/Discord and other tools could be used with great effect, though not without pain, and software was written, tested, deployed, and debugged.

> Personal story: I was working for Rocket Mortgage at the time, and in the span of a week, the company went from the traditional "We expect all our employees to be physically present in our corporate office" (in Detroit, Michigan) the previous week to "We are monitoring the situation closely" on Monday to "Take your laptops home" (some of which hadn't left their laptop dock literally since the employee started working for the company one, three, or even ten-plus years earlier) by Friday. The Rocket IT team scrambled--successfully--to make sure that every single laptop could VPN in to the company network over a span of five days, and for the most part, the shift from "office" to "remote" was complete, at least at the technology level.

During the lockdown, loads of new social rules were quickly hammered out and then renegotiated as necessary. "Camera on" vs "camera off" became a nation-wide talking point for teams. Instituting a five-minute break between meetings for people to get up and take a bio break--even when there'd never been a perception of a need to do that with back-to-back meetings in different physical buildings--became a corporate policy. Suddenly, pets were welcomed "into" the (virtual) meetings.

And the world just laughed when we remembered the video of [a small girl joining her dad's BBC news report from home](https://www.youtube.com/watch?v=Mh4f9AYRCZY), because suddenly that was all of us, particularly those with kids. Suddenly, *every* day was "take your kid to work day"!

> Another personal note: Running the "Technology Culture" team at Rocket at the time, I was front-and-center on figuring out what the new "remote office" culture could/should be for the folks in technology. Not all the policies we created "stuck", and some definitely got adjusted as we stumbled along, but for the most part, it was a pretty successful culture shift. By the time I left, most of them had become habitual rather than enforced.

But more germane to this essay, several [studies](https://www.apollotechnical.com/working-from-home-productivity-statistics/) documented that WFH led to greater productivity. By 2022, the world seemed poised to enter the "next phase" of work, where all thanks to ubiquitous Internet access and telecommunication applications, all of us (or at least a significant number of us) would be working from home.

### Everybody come back! No, seriously!
Then, as the lockdown eased up, companies started to push back on the WFH approach, as we began to see the "missing parts" of working together physically in the same place. The toll of being "trapped" in one's domicile began to weigh more and more heavily on people, and even the most introverted of employees found their mental health took a hit from the lack of casual social contact. Businesses local to the office(s) found their revenue was highly tied to people being in the office, and many cities began a campaign to entice people back to the downtown areas to help get those downtown businesses back on their feet or on a more solid footing.

Recognizing that *some* time together in the same place/time is better than none, many companies began to explore "hybrid" options wherein an employee spends some percentage of their time in the office, the rest working from home. Some policies sought to give their employees flexibility in the matter, others lay down core numbers (3 days here, 2 days there) by fiat. Meanwhile, some academic [studies](https://www.forbes.com/sites/benjaminlaker/2023/08/02/working-from-home-leads-to-decreased-productivity-research-suggests/) suggested that there might be objective reasons working from an office was more productive, though most critics of those studies quickly pointed out flaws in the study or in the lack of peer review (which, to be fair, was also true of the pro-WFH studies, too).

By 2023 and 2024, "return to office" mandates became more common, none more severe than Amazon's "everybody is back in the office five days a week" policy (re)introduced in late 2024. While some employees welcomed the return, many also balked, particularly since there seemed no credible reason for it. That in turn led corporate conspiracy theorists claimed it was because corporate building leases had to be justified, or that this was a filter designed to get people to "quiet quit" or as a test of loyalty.

### My own thoughts
Though weighing in with my own thoughts on the debate isn't the point of this essay, there's still an inherent elephant in the room that needs to be addressed. If you don't care to hear my opinions, feel free to skip this section, but for those who are curious, let me lay down a few things that are facts, assumptions, or statements that I take to be axioms:

* **Fact: You will never get everybody under one roof.** Let's face it, companies of any size larger than a startup are global affairs. You might have a good chunk of your people in one place, but there will always be salespeople out on the road, DevRel advocates at conferences, and the CEO (and CTO and others) out schmoozing at cocktail parties in posh places like Paris or San Jose. The bare-metal idea that "We all need to get into the same room" is kinda ludicrous even on the very surface of it. You *might* be able to get everybody into one of your office campuses, but everybody in the same building? For some companies, there is no building big enough.
* **Fact: We have no standardized metric for "productivity".** Seriously. The various academic studies are all over the map on this, measuring anything from "time spent on the laptop" to "keystrokes recorded" to "amount of work submitted". In some cases, the studies abandoned any objective notion of "productivity" in favor of "preference", which is remarkably un-scientific: I may *prefer* something that is less productive, and I may *prefer* things that are more productive, but my preferences are really a terrible measurement when considering options (with one exception, and that's--literally--employee contentment). Until we can get some kind of objective measurement of "productivity", we often end up arguing past each other as we each cite studies that seem to defend our intuition going into the debate.
* **Axiom: It is absolutely possible to lead a team or a department well while doing so remotely.** I've done it--I built a team-of-teams literally from nothing at the start of the pandemic to a department of 30 people all entirely remotely, and it was one of the closest groups I think I've ever been a part of. Many of the people in that group are still in touch with me and each other, five years (and several job-hops) later. (Odd note: Some of the people I hired, I *still* haven't actually met in person yet.) More to the point, many companies have operated entirely remotely and been wildly successful at it, and many others report hybrid success. Even if we allow for a certain amount of "That company was going to succeed regardless of--or even in spite of--their management", there's still too large a number of successes to write off their success as entirely irrelevant to their management style. 
* **Axiom: Running a team remotely is a skill.** It takes a very different mindset and a different set of tools. Some managers are prepared to work with those tools, some aren't. Most (all) can learn them, so it seems to me that some just choose not to.
* **Axiom: Talent exists everywhere.** With the growth of online learning (and the two-century-old societal trend of a "mobile workforce"), no longer is the best talent exclusive to the big cities.
* **Axiom: Temand for software exists everywhere.** Sometimes, the company lives in [Warsaw, Indiana](https://en.wikipedia.org/wiki/Warsaw,_Indiana) (home to a software company, I'm serious, they [do crop insurance](https://silveuscropins.com/technology/)).
* **Axiom: Much communication is single-directional.** Not every meeting is about soliciting feedback or exchanging ideas; sometimes executives just want to tell you stuff, and sometimes (much more rarely) they want you to tell them stuff.
* **Axiom: Relationships deepen with physical, in-person time.** There is still no substitute for the experience of breaking bread together. I doubt there ever will be. If you want to get to know somebody better, on a personal, connected level, you have to have an overlapping proximate spot on the space-time continuum.
* **Assumption: Some work happens more smoothly together, while some work happens more smoothly alone.** Doing a brainstorm on a software design is still best done clustered around a whiteboard--I haven't found any online tool that's anywhere near as smooth as taking over a conference room with whiteboards, sticky notes, and pens. Sitting at your computer writing code, however, is definitely something that is best done without others around, unless you're pairing (which is actually quite doable--if not arguably better--over Zoom/Teams/etc).
* **Opinion: Ad-hoc conversations are, still, difficult to enable remotely.** Others can't overhear what two people on the team are discussing, and those sorts of overheard conversations are sometimes what leads to incredibly deep insights. Even the simple chair-swivel-"Hey can I bother you" kinds of conversations are difficult to replicate remotely. Some companies experimented with Discord or Teams, giving each individual their own "room"/private channel that was open to everyone except when the individual was in a "don't bother me" mode, making it trivial to "knock"/"ping" another individual to have the ad-hoc conversation, but it doesn't seem to have taken off as a standard practice.
* **Opinion: Coming all the way in to the office to put on headphones and be in Zoom meetings is ridiculous.** (That one kinda just doesn't need explanation, I don't think.)

### Analysis
If it's not clear by now, I ride the fence a little here, but only a little--I think WFH is a powerful tool/option, and frankly, I think a great deal of software development work can/should be done from home in order to obtain the lack-of-overhead (that is to say, commute time and costs) that WFH enables. I also think that several acts of software development benefit from being in person, and that it's useful for team members to spend time in one another's presence as a bonding activity. All together, I suppose it plants me firmly in the "hybrid" part of the spectrum, which is pretty consistent for me dating back to before the pandemic--long before COVID, when working (sometimes locally, sometimes remotely) as an independent consultant, I often looked to go (flying out if necessary) to the company/client to have periodic meetings in person, for all the reasons I just cited. But I also found that trying to work every day in the office was distracting and often counterproductive.

Meanwhile, the debate rages on, probably continuing to do so for the remainder of this decade, if not longer. What I find most tragic about the whole discussion, though, is my belief that most of the debate is over the wrong thing: *it isn't about **where you do the work**, it's about **how the work gets done**.* In particular, differentiating between synchronous and asynchronous work, and attaching the right kind of each to a particular problem, helps eliminate much of the ambiguity as to which (WFH or RTO) is more "productive" and allows teams to maximize their use of each.

### Sync vs async work
Realistically, the sync-vs-async work is much like the sync-vs-async execution model; certain things lend themselves well to synchronous collaborative execution, and other things are highly independent and therefore can be executed asynchronously. I use the term "synchronous" here to mean "you and I have to chat with one another to get the work done", and "asynchronous" to mean "I can charge forward without needing any additional input". These are probably not entirely rock-solid definitions--I'm still fleshing some of this out in my head as I write it--but it works well enough for the moment.

It may be best to explain this with a series of examples:

* **Writing code: Asynchronous.** Generally we think of writing code as a solitary activity, at least among the generation of developers I grew up among. Just you, your keyboard, your mouse (as rarely as possible), your IDE, and whatever specs or stories you have in front of you that need doing. Crank up the music, time to get into the ZONE.

* **Pairing on code: Synchronous.** And yet, when you pair on some code, you need to both be "present" (literally or figuratively) at the same time, utilizing a high-bandwidth form of communication between you (e.g., the tiny amount of physical space between you so you can talk to one another, or a real-time video connection, or even a phone call while staring at a screen-share).

* **Code review: Depends.** There's certain forms of code review where I sit in front of my machine, taking notes as I go over the code, and then there's code reviews where we collectively sit around and discuss it amongst each other. This is probably one of those two-step activities, where the first step is asynchronous (I study the code) and the second is synchronous (we discuss our respective "takes" on the review and next steps).

* **Architecture or design brainstorm: Depends.** There's clearly value in several of us gathered around a whiteboard, each with a pen and eraser and scribbling things in a real-time caffeine-fueled frenzy, but there's also significant value in sitting in a quiet room by oneself, musing and sketching and doing individual thinking-and-processing-and-ideating. This is probably going to be something that will land differently with different people, but it's safe to assume, I think, that there's likely an iterative async/sync/async/sync cycle here: Ruminate on something for a while on your own, then bring it to the table with others to review/dissect/dissent, then take the pieces back into the quiet room for a while more, then bring it back to the table, *ad nauseam*.

* **Debugging: Asynchronous.** Except, can't be overstated, so often the best debugger in the world is another person! I've frequently told students that if you're stuck for 20 minutes, walk away from the screen then try again, but if you're stuck for two hours, try explaining the problem to another person, because just the act of explaining it will catalyze parts of your thinking and give you new ideas to try or insights to explore.

* **Discovering requirements/stories: Synchronous.** Meeting with customers and/or product folks and/or business owners and/or anybody else who has a stake in what the final product looks like is usually a back-and-forth sort of exercise, requiring high-fidelity communication and often physical props. This is probably the poster child of "in person" kinds of work; even doing this over a meeting technology (Teams, Zoom, Meet, etc) can be awkward in places.

Going through this leaves us with a growing conclusion that I think holds pretty well: **Sync and async are not binary, but a continuum.** The various technologies that we have make sync vs async somewhat relative. Back in the day before electronic communication (even email), sync meant "We are physically gathered together" and async meant "We are physically apart". The invention of postal mail ("snail mail") meant that communication between async nodes was possible albeit slow. The telegraph made the async connection loops faster, but we don't really get to a "physically remote sync" status until the advent of the telephone. And so on--as the mechanics of communication get faster, we get higher fidelity exchange of information. Note that in some scenarios, however, such as a book, a large amount of communication can happen, but only in a single direction, which creates a low-synchronous/high-fidelity combination (and one that is pretty rare, and often highly time-consuming).

This begins to turn the "sync/async" picture into a two-axis graph of "sychronicity" (how strongly do we have to be in sync with one another) and fidelity (how strongly can we convey ideas to each other). Taking a rough first pass at this, we get something like this:

<pre class="mermaid">
quadrantChart
    title What We Do and How We Do It
    x-axis Low Synchronicity --> High synchronicity
    y-axis Low Fidelity --> High Fidelity
    Code review:::work: [0.45, 0.5]
    Code:::work: [0.1, 0.2]
    Pairing:::work: [0.85, 0.85]
    Brainstorming:::work: [0.95, 0.95]
    Documentation:::work: [0.3, 0.8]
    Snail mail:::mechanic: [0.1, 0.1]
    Email:::mechanic: [0.2, 0.2]
    Prose:::mechanic: [0.1, 0.8]
    Meeting, software:::mechanic: [0.8, 0.8]
    Meeting, physical:::mechanic: [0.9, 0.9]
    "Chat (Zoom, etc)":::mechanic: [0.65, 0.5]
    SMS:::mechanic: [0.4, 0.4]
    classDef work radius: 5, stroke-color: #310085
    classDef mechanic radius: 30, color: #00ff33, stroke-color: #10f0f0
</pre>

The upshot? For those activities which are high-sync/high-fidelity, we probably want to be in the office together; for those which are low-sync/low-fidelity, we probably can (and want) to be WFH (or rather, "working from anywhere"). The other two (low-sync/high-fidelity and high-sync/low-fidelity)? Either they're one-offs, or they're just not a thing for us. 

(*Caveat:* This is a first pass, thinking-out-loud sort of graph, so maybe it doesn't fit, but I've found it useful to think this way when thinking about this topic. Use as starting point for your own thinking, or discard it entirely, if you wish.)

