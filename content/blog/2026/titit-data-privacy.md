title=Things I Think I Think... Data Privacy
date=2026-5-1
type=post
tags=thinking, disruption, ai, llm, coding agent, code
status=published
description=Mulling out loud why I think data privacy is about to explode in importance.
~~~~~~

Over the past decade or two, companies have been rolling out data privacy policies that more or less get accepted and forgotten, similar to the way that most people roll past the EULAs that appear in every commercial installation process. With the rise of LLMs, though, and the opportunity to "fine-tune" a model based on data to create a customized model, I think suddenly companies are going to want to (and will) pay very very close attention to what a service provider can do with your data.

<!--more-->

Remember when [Google told us they were reading your mail](https://financialpost.com/technology/google-gmail-scanning-privacy)? Google claimed that "all users of email must necessarily expect that their emails will be subject to automated processing", and that the process was fully automated, "and no humans read your email". That, by the way, was a decade ago, but the practice hasn't stopped--it turns out that they're doing it to [train their AI models, too](https://www.themirror.com/tech/tech-news/gmail-users-warned-turn-common-1611458). As has been said before, "data is the new oil", and companies have been looking for places to drill for oil for quite some time.

But we've left an era where the data was just being extracted into numbers and statistics and stored in a database somewhere, and entered an era where the actual text can be visualized and "understood" by LLM models. What's more, the data can now be used to train new models to act in ways to "help" you (for whatever definition a corporate entity chooses that to mean) without your permission. Well, I mean, you do have to give permission, you have to agree to a blanket all-or-nothing statement that you must agree to if you wish to make use of the particular service. Even if that service is really more of a necessary utility of basic life in the 2020s.

Consider, for example, email. Considering how many corporations and governments have transitioned away from "snail mail" to its electronic counterpart for necessary communication with people, it's very arguably as necessary a utility for modern life as electricity, water, garbage, and postal mail ever was. Which brings us back to GMail again. For millions of people, this is the only steady email address they will ever have in their life. (Very few people ever actually spin up their own mail servers in the cloud, it turns out!)

So do individuals *really* have the option of opting out? If the privacy policy is essentially an all-or-nothing practice, and you need the service in order to... well, live... how much of a choice is there? This seems like an area ripe for consumer protection laws and pro-consumer activism, but that's a lead-up to my real point.

### What happens to that document you uploaded?
Consider, for a moment, the LLM-powered OCR that you're using as-a-service from some service provider. Consider that your company, like so many others, considers your data to be confidential and private. Now consider the privacy policy that your OCR service provider demands you accept in order to make use of that service. Have you read it carefully? Have you had your Legal team review it?

Has everybody considered what the implications are if the service provider decides one day to make use of all those documents you uploaded to them for their own purposes?

Say, for example, that service provider decides to use all those documents you gave them (and I use that word deliberately--you handed them over without any legal right to restrict what the service provider could do with them based on what was in the privacy policy) to start, say, using them as training data on a different model? Or for benchmark purposes? Or as part of their test suite?

I think that, in the very near future, there's going to be a serious falling-out with companies that don't maintain very strict data privacy policies around these services. Companies which don't go "above and beyond" to demonstrate that they adhere to a strict "verbose opt-in" policy for using customer data as part of their training sets will find themselves facing some uncomfortable questions from customers who want to make sure that the images and documents they send as part of their everyday operations aren't being used after-the-fact.

In fact, I would probably suggest CISOs start--***today***--to begin an audit of every service provider in use by their development teams, in order to understand just how much of the company's confidential data is potentially being used by third parties, and for particularly sensitive industries (financial, legal, medical, to start), require explicit signed statements from those third parties that the documents being uploaded are not being used to train AI models, along with a binding agreement that any exercise that would even remotely constitute doing so in the future will first be accompanied by an explicit request for agreement to do so. (In other words, "Swear to me you're not using them now, and swear that I'll know it if you ever start to do so.")

### "But it's all legal!"
Let me make my position here clear: I'm *not* weighing in on whether or not it's legal for service-providers to use those documents in whatever manner they see fit, for two reasons:

1. The current privacy policies are probably written to allow for such use, and
2. I am not a lawyer

... but the *perception* has always been that the data would be used for purposes that are quite some distance away from what a particular company might be concerned about. (And even then, lots of people have had concerns/objections about it already.) Perception matters almost as much or more than the legal liabilities, because while it's a ton of work for me to legally prove that you violated your legal obligation, it requires almost no work at all to drop you as a vendor and switch over to one of the (potentially) dozens of other providers, some of whom are likely willing to make those guarantees (and may even be doing so right now).

In a world where we are very likely staring an implosion within the tech industry around all these AI-based startups (and possibly the Magnificent Seven as well) and companies are going to start to seriously struggle with cash flow, the "Let's come up with a new product that does *X*"="But we'd need to train a new model"-"Oh, we can use customer data to do that, they already agreed to it" conversations in corporate meeting rooms are going to significantly accelerate in temptation. If anybody's Legal team is even remotely worried, now's the time to jump-start this conversation.

And meanwhile, if you're one of those service providers, you might want to give serious thought to putting some systemic restrictions on how your data scientists' or developers' access to customer data, and preemptively make those data privacy statements very loudly. Remove the temptation now.

Because, I think, when public opinion turns against "using my data to train your models", it's going to turn very hard, very fast, and companies that aren't on the right side of this will take some really bad PR blows, and you do not want your customers to have very good reasons to ditch your service when you're already scrambling to survive.
