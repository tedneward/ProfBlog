+++
date = "2016-01-05T23:21:51-08:00"
draft = false
title = "The Story of the Chimps (Or, Why Passwords Must Be Eight Characters)"
categories = [
  "Industry", "Psychology"
]
concepts = ["Industry"]
languages = []
platforms = []
+++

This just crossed my Facebook feed:

> Take five chimpanzees. Put them in a big cage. Suspend some bananas from the 
> roof of the cage. Provide the chimpanzees with a stepladder. BUT also add a 
> proximity detector to the bananas, so that when a chimp goes near the banana,
> water hoses are triggered and the whole cage is thoroughly soaked.
  
> Soon, the chimps learn that the bananas and the stepladder are best ignored.
  
> Now, remove one chimp, and replace it with a fresh one. That chimp knows nothing
> of the hoses. He sees the banana, notices the stepladder, and because he is a 
> smart primate, he envisions himself stepping on the stepladder to reach the 
> bananas. He then deftly grabs the stepladder... and the four other chimps spring 
> on him and beat him squarely. He soon learns to ignore the stepladder.
  
> Then, remove another chimp and replace it with a fresh one. The scenario occurs 
> again; when he grabs the stepladder, he gets mauled by the four other chimps -- 
> yes, including the previous "fresh" chimp. He has integrated the notion of 
> "thou shallt not touch the stepladder".
  
> Iterate. After some operations, you have five chimps who are ready to punch any 
> chimp who would dare touch the stepladder -- and none of them knows why.
  
> Originally, some developer, somewhere, was working on an old Unix system from 
> the previous century, which used the old DES-based "crypt", actually a password 
> hashing function derived from the DES block cipher. In that hashing function, 
> only the first eight characters of the password are used (and only the low 7 bits 
> of each character, as well). Subsequent characters are ignored. That's the banana.
  
> The Internet is full of chimpanzees.

I first heard this story from Dave Thomas ("RubyDave") at a NFJS show.

Thing of it is, it applies to soooo much more than just the passwords-must-be-eight-characters rule. Dave used it
to illustrate why "if" statements in so many languages require parentheses around the boolean condition they are
testing -- until Ruby came along, anyway. Turns out it was a parser issue with an ancient predecessor to C, and
nobody asked "why" ever since.

The unwillingness to ask "why" certain things are the way that they are -- or perhaps the "shut up and sit down" 
reaction from the rest of the dev team when the question is asked -- is what leads to situations like this.

It reminds me of another of my favorite stories:

> A young couple are just married, and the starry-eyed husband, being in a delightfully pensive mood,
> decides to simply watch his new bride fix dinner one night. As she is preparing the roast, she slices
> off about an inch from either side of the roast and throws the perfectly good meat away.
  
> A little taken aback, the husband asks, "Honey, why do you do that?"
  
> She replies, "Because it makes the roast taste better, and besides, my mother always did it that way."
  
> Intrigued, the husband calls his new mother-in-law and asks her if she does the same thing. When she
> says yes, he asks why, and she replies, "Because it makes the roast taste better, and besides, my mother
> always did it that way."
  
> Now *really* intrigued, he calls his grandmother-in-law, and asks her. When she says yes, he asks why.
  
> "Beacuse my pan is too small."
  
Sorta makes you wonder: what does your team do because "it's always been done that way"?
