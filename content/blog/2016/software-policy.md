title=Clausewitz on Policy (Software Craftsmanship)
date=2016-01-06
type=post
tags=industry, management, strategy, philosophy, psychology
status=published
description=In which I talk about the lessons that could be learned from the Parse shutdown.
~~~~~~
As many readers know, I didn't spend my collegiate years studying algorithms; instead, I obtained my degree from [UCDavis in International Relations](http://admissions.ucdavis.edu/majors/major_view.cfm?major=lire) with an emphasis on military strategy and history. That meant a tremendous amount of study in history, pyschology, a little philosophy, and military affairs.

<!--more-->

One of the great books on strategy, [Strategy](http://www.amazon.com/Strategy-Meridian-B-Liddell-Hart/dp/0452010713/ref=sr_1_1), written shortly after the end of World War Two, was widely considered to be Hart's best work on the subject, though he had plenty to say before the book's publication; the great German general Guderian was quoted as having studied Hart prior to the war's outbreak. He's a pretty easy read, too, by the way, as historians and military advisory goes.

Recently (for a variety of reasons) I picked it back up again. The first 75% of the book is about war throughout history, as a means of establishing Hart's backdrop for the theory that he advocates in the latter quarter of the book. The closer he gets to WW2, the more detailed his analysis and history, so it's not really a comprehensive study of military history by a long shot, but it's still more than most students of American education have ever received.

The last quarter, though, is where he expounds on "The Theory of Strategy", and in the opening paragraphs, he makes a very salient point about war, strategy, and one of its finest writers (Clausewitz) and how a misinterpretation of writing can lead to all kinds of problems.

> Let us first be clear as to what is strategy. Clausewitz, in his monumental work, *On War*, defined it as 'the art of the employment of battles as a means to gain the object of war. In other words strategy forms the plan of the war, maps out the proposed course of the different campaigns which compose the war, and regulates the battles to be fought in each.'

> One defect of this definition is that intrudes on the sphere of policy, or the higher conduct of the war, which must necessarily be the responsibility of the government and not of the military leaders it employs as its agents in the executive control of operations. Another defect is that it narrows the meaning of 'strategy' to the pure utilization of battle, thus conveying the idea that battle is the only means to the strategical end. It was an easy step for Clausewitz's less profound disciples to confuse the means with the end, and to reach the conclusion that in war every other consideration should be subordinated to the aim of fighting a decisive battle. (*Strategy*, p. 319)

It's been a while since I read Hart, but as soon as I read it, my mind did a double-take. Substitute "information technology strategy" for "policy", "software project" for "war", "sprints" for "battles", "executive team" for "government", "software craftsmen" for "military leaders". 

> Let us first be clear as to what is strategy. Clausewitz, in his monumental work, *On Software Projects*, defined it as 'the art of the employment of battles as a means to gain the object of a software project. In other words strategy forms the plan of the software project, maps out the proposed course of the different campaigns which compose the software project, and regulates the sprints to be fought in each.'

> One defect of this definition is that intrudes on the sphere of information technology strategy, or the higher conduct of the software project, which must necessarily be the responsibility of the executive team and not of the software craftsmen it employs as its agents in the executive control of operations. Another defect is that it narrows the meaning of 'IT strategy' to the pure utilization of sprints, thus conveying the idea that sprints are the only means to the IT strategical end. It was an easy step for Clausewitz's less profound disciples to confuse the means with the end, and to reach the conclusion that in war every other consideration should be subordinated to the aim of fighting a decisive sprint. (*Strategy*, p. 319)

Get where I'm going with this? The construction of software is simply a tool--and not, by any stretch, the *only* tool--by which a company can achieve its ends. Yes, bespoke software is often a powerful and useful tool for doing so, but so is a US Army Mobile Division. Sometimes, "sending in the troops" is an appropriate tool for use in a political situation, and sometimes, you have to hold back and try something else.

Similarly, not all IT effort is around custom software development. There can be much utility in a small shell script that accomplishes a goal as there is in an "enterprise-scale" software project that comes complete with unit tests, continuous integration, and automated deployment.

Certainly, the analogy isn't perfect--the insertion of a small SEAL team behind enemy territory requires a metric crap-ton of planning in the same way that loading up the US 5th Infantry and shipping them off to Korea requires. But, relatively speaking, it's a lot easier to dispatch SEAL Team Six to a hotspot to engage in a sharp, focused mission, than to dispatch even just one US regiment; the logistics are simply night-and-day different.

During the [Korean war](http://www.history.com/topics/korean-war), Gen MacArthur was vehement and loud that the US Army, after its incredibly successful amphibious landing at Inch'on. MacArthur very clearly wanted to prosecute the war deep into Chinese territory, since that was the only way to win the war, and claimed that refusing to engage in this wider war was "appeasement".

> As President Truman looked for a way to prevent war with the Chinese, MacArthur did all he could to provoke it. Finally, in March 1951, he sent a letter to Joseph Martin, a House Republican leader who shared MacArthur’s support for declaring all-out war on China–and who could be counted upon to leak the letter to the press. “There is,” MacArthur wrote, “no substitute for victory” against international communism.

> For Truman, this letter was the last straw. On April 11, the president fired the general for insubordination.

This is an important moment in American history; there was serious concern that MacArthur would return home and stage a *coup d'etat*, seeking to replace Truman and secure his "no substitute". Instead, MacArthur did what any professional does: he accepted the termination as Truman's right, and delivered one of the most moving speeches in American history.

The point here was that MacArthur was one of Clausewitz's "less profound disciples": he failed to understand that Truman's policy was NOT to seek a wider war with the communists, since that meant potentially taking on both China and the USSR, with a nation that had just emerged from a half-dozen years of armed conflict around the world, with not much in the way of allied support to do so. It would very likely have proven to be conclusively a massive disaster.

There were very good reasons Truman and his Adminstration had that policy in place; MacArthur, however, sought to be the craftsman at his profession, and demanded that "if we're going to do this, we're going to do it *right*".

Again, I laud and applaud the goals of the Software Craftsmanship movement, with its emphasis on quality and focus on "doing the right thing". But then some of its leadership says things like ["Always remember that you, as a software developer, are also a stakeholder. You have a stake that you need to safeguard."](https://twitter.com/unclebobmartin/status/684778768196612098)

I'm sorry, but no. You are not a stakeholder. You may have a vested interest, but those are different terms. You do not own the software you are creating. You are producing this for the use of people who are not you. You will walk away from this at some point, and never worry about this again. A stakeholder, on the other hand, according to [Dictionary.com](http://dictionary.reference.com/browse/stakeholder), is "the holder of the stakes of a wager".

Unless that is your money you're paying yourself with, you are not a stakeholder.

Now, I'm pretty sure the Craftsmanship movement is going to jump on the second definition there, "a person or group that has an investment, share, or interest in something, as a business or industry", and key in on that word "interest", and say "We have an interest! That's OUR blood, sweat and tears, and that gives us an investment into it!"

And by that definition, every person who works as a janitor in the Trump Towers has an investment in the building. So therefore they can sell off their share of that investment, right?

Sorry, your blood, sweat, and tears were paid for. Your employer, your client, whomever it was that paid you to write this thing, *they* have the investment, not you.

You may have a sense of professional pride, and that's a good thing.

But never conflate your professional pride with what it means to be the actual stakeholder in the project.

