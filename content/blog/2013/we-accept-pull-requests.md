+++
date = "2013-02-26T01:52:45.8190000-08:00"
draft = false
title = "\"We Accept Pull Requests\""
aliases = [
	"/2013/02/26/We+Accept+Pull+Requests.aspx"
]
categories = [
	".NET","Android","Azure","C#","C++","Conferences","Development Processes","F#","Industry","iPhone","Java/J2EE","Languages","LLVM","Mac OS","Objective-C","Python","Reading","Ruby","Scala","Security","Solaris","Visual Basic","VMWare","XML Services"
]
concepts = ["Development Processes", "Industry", "Languages", "Reading", "Security", "XML Services"]
languages = ["C#", "C++", "F#", "Python", "Ruby", "Scala", "Visual Basic"]
platforms = [".NET", "Java/J2EE", "LLVM", "Mac OS"]
 
+++
<p>There are times when the industry in which I find myself does things that I just don't understand.</p>

<p>Consider, for a moment, <a href="http://jeffhandley.com/archive/2013/02/25/The-We-accept-pull-requests-Addiction.aspx">this blog</a> by Jeff Handley, in which he essentially says that the phrase "We accept pull requests" is "cringe-inducing":
<blockquote>
Why do the words “we accept pull requests” have such a stigma?  Why were they cringe-inducing when I spoke them?  Because too many OSS projects use these words as an easy way to shut people up.  We (the collective of OSS project owners) can too easily jump to this phrase when we don’t want to do something ourselves.  If we don’t see the value in a feature, but the requester persists, we can simply utter, “We accept pull requests,” and drop it until the end of days or when a pull request is submitted, whichever comes first.  The phrase now basically means, “Buzz off!”
</blockquote>
OK, I admit that I'm somewhat removed from the OSS community--I don't have any particular dogs in that race, as the old saying goes--and the idea that "We accept pull requests" is a "Buzz off!" phrase is news to me. But I understand what Jeff is saying: a phrase has taken on a meaning of its own, and as is often the case, it's a meaning that's contrary to its stated one:
<blockquote>
At Microsoft, having open source projects that actually accept pull requests is a fairly new concept.  I work on NuGet, which is an Outercurve project that accepts contributions from Microsoft and many others.  I was the dev lead for Razor and Web Pages at the time it went open source through Microsoft Open Tech.  I collaborate with teams that work on EntityFramework, SignalR, MVC, and several other open source projects.  I spend virtually all my time thinking about projects that are open source.  Just a few years ago, this was unimaginable at Microsoft.  Sometimes I feel like it still hasn’t sunk in how awesome it is that we have gotten to where we are, and I think I’ve been trigger happy and I’ve said “We accept pull requests” too often  I typically use the phrase in jest, but I admit that I have said it when I was really thinking “Buzz off!”
</blockquote>
Honestly, I've heard the same kind of thing from the mouths of Microsoft developers during Software Development Reviews (SDRs), in the form of the phrase "Thank you for your feedback"--it's usually at the end of a fervent discussion when one of the reviewers is commenting on a feature being done (or not being done) and the team is in some kind of disagreement about the feature's relative importance or the implementation used. It's usually uttered in a manner that gives the crowd a very clear intent: "You can stop talking now, because I've stopped listening."
<blockquote>
The weekend after the MVP summit, I was still regretting having said what I said.  I wished all week I could take the words back.  And then I saw someone else fall victim.  On a highly controversial NuGet issue, the infamous Phil Haack used a similar phrase as part of a response stating that the core team probably wouldn’t be taking action on the proposed changes, but that there was nothing stopping those affected from issuing a pull request.  With my mistake still fresh in my mind, I read Phil’s words just as I’m sure everyone in the room at the MVP summit heard my own.  It sounded flippant and it had the opposite effect from what Phil intended or what I would want people thinking of the NuGet core team.  From there, the thread started turning nasty.  We were stuck arguing opinions and we were no longer discussing the actual issue and how it could be solved.
</blockquote>
As Jeff goes on to mention, I got involved in that Twitter conversation, along with a number of others, and as he says, the conversation moved on to JabbR, but without me--I bailed on it for a couple of reasons. Phil proposed a resolution to the problem, though, that seemed to satisfy at least a few folks:
<blockquote>
With that many mentions on the tweets, we ran out of characters and eventually moved into JabbR.  By the end of the conversation, we all agreed that the words “we accept pull requests” should never be used again.  Phil proposed a great phrase to use instead: “Want to take a crack at it? We’ll help.”
</blockquote>
But frankly, I don't care for this phraseology. Yes, I understand the intent--the owners of open-source projects shouldn't brush off people's suggestions about things to do with the project in the future and shouldn't reach for a handy phrase that will essentially serve the purpose of saying "Buzz off". And keeping an open ear to your community is a good thing, yes.</p>

<p>What I don't like about the new phrase is twofold. First, if people use the phrase casually enough, eventually it too will be overused and interpreted to mean "Buzz off!", just as "Thank you for your feedback" became. But secondly, where in the world did it somehow become a law that open source projects MUST implement every feature that their users suggest? This is part of the strange economics of open source--in a commercial product, if the developers stray too far away from what customers need or want, declining sales will serve as a corrective force to bring them back around (or, if they don't, bankruptcy of either the product or the company will eventually follow). But in an open-source project, there's no real visible marker to serve as that accountability and feedback--and so the project owners, those who want to try and stay in tune with their users anyway, feel a deeper responsibility to respond to user requests. And on its own, that's a good thing.</p>

<p>The part that bothers me, though, is that this new phraseology essentially implies that any open-source project has a responsibility to implement the features that its users ask for, and frankly, that's not sustainable. Open-source projects are, for the most part, maintained by volunteers, but even those that are backed by commercial firms (like Microsoft or GitHub) have finite resources--they simply cannot commit resources, even just "help", to every feature request that any user makes of them. This is why the "We accept pull requests" was always, to my mind, an acceptable response: loosely translated, to me at least, it meant, "Look, that's an interesting idea, but it either isn't on our immediate roadmap, or it takes the project in a different direction than we'd intended, or we're not even entirely sure that it's feasible or doable or easily managed or what-have-you. Why don't you take a stab at implementing it in your own fork of the code, and if you can get it to some point of implementation that you can show us, send us a copy of the code in the form of a pull request so we can take a look and see if it fits with how we see the project going." This is not an unreasonable response: if you care passionately about this feature, either because you think it should be there or because your company needs that feature to get its work done, then you have the time, energy and motivation to at least take a first pass at it and prove the concept (or, sometimes, prove to yourself that it's not such an easy request as you thought). Cultivating a sense of entitlement in your users is not a good practice--it's a step towards a completely unsustainable model that could, if not curbed, eventually lead to the death of the project as the maintainers essentially give up when faced with feature request after feature request.</p>

<p>I applaud the efforts on the part of project maintainers, particularly those at large commercial corporations involved in open source, to avoid "Buzz off" phrases. But it's not OK for project maintainers to feel like they are under a responsibility to implement any particular feature or idea suggested by a user. Some ideas are going to be good ones, some are going to be just "off the radar" of the project's core committers, and some are going to be just plain bad. You think your idea is one of those? Take a stab at it. Write the code. And if you've got it to a point where it seems to be working, then submit a pull request.</p>

<p>But please, let's not blow this out of proportion. Users need to cut the people who give them software for free some slack.</p>

<p>(<b>EDIT:</b> I accidentally referred to Jeff as "Anthony" in one place and "Andrew" in another. Not really sure how or why, but... Edited.)</p>
 