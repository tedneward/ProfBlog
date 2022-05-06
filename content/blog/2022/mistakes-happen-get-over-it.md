title=Speaking Tips: Mistakes happen; get over it
date=2022-05-05
type=post
tags=industry, speaking tips
status=published
description=When speaking, you will screw up.
~~~~~~

I can't say how many times I've talked to new speakers who watch speakers and are *amazed* at how effortless their flawless presentations seem to go. Folks, part of the reason they go that smoothly is because they're practiced, but part of it is also that the speaker is often ready for the mistake to happen.

<!--more-->

A long time ago, when I was but a wee speaker learning the Art of the Technical Talk from the DevelopMentor Grand Master of Speakers ([Ron Sumida](https://www.linkedin.com/in/ron-sumida-06a3824/)), one of the things he told me was that "Everything that happens in that room, happens because you intended it that way." If a demo fails, you intended it that way, because you wanted to give the room a chance to see the failure, and then you intended to show them how to recover from it. If a slide is in the wrong order, it's because you wanted to get that point across before moving on to a different point. If water starts pouring out of the ceiling....

Yeah, that really happened to me once. While teaching a DevelopMentor open-enrollment class at the corporate office down in LA, one day I'm in the middle of class, just turned around to start doing a demo when water starts pouring out of the ceiling--literally *through* one of the ceiling tiles--like somebody had just turned on a faucet right above us.

That was *not* intended.

I ran out of the room, grabbed one of the fisherman-buckets in the lobby in which we kept snacks, dumped out the snacks, ran back to the room, and put it under the pouring water. Not a perfect solution, but it allowed me to deal with the problem temporarily, then get the class back on track. This time, to the soothing sounds of water rushing by.

Another time, I was doing a talk at Devoxx (back when it was still called "Javapolis") in Antwerp, and it was not going well. It was supposed to be a talk on the various ways that Microsoft Office and JavaEE (then called J2EE) could work togther (and you'd be surprised at how many different ways they could--it was pretty seamless), and just about every demo was bombing for one reason or another. I'd even carefully put all the demo code into a VMWare VM, so that it would be isolated from any other changes or environment updates on my laptop, but just one demo after another wasn't working. And it was odd--certain files were truncated in weird positions. Finally, in a fit of exasperation, I said, "OK, folks, let's try one more demo, and then if that doesn't work, I'm just going to surrender my laptop to the Demo Gods and go the rest of the way without demos."

And that's when the VM blue-screened in front of everybody.

Did I mention that Javapolis/Devoxx is held in a movie theater? You have **never** seen a blue screen of death until you've seen it on the big screen.

Fully expecting to get hammered in evals, I was surprised when I heard that I was actually doing quite well. I ran across one of the attendees from that talk later in the conference, and I flat-out asked him, "What did you think of my talk?"

"Oh, I loved it, I thought it was great!"

I was flabbergasted. "If you don't mind me asking, why? Why did you think it was great? Every single demo bombed!"

"Oh, but you never let it stop you. I believe you when you say the demo is supposed to work, so when it didn't, and you just kept going, it was great!"

I don't know if that attendee could see the shaft of enlightenment settle from the clouds above (Javapolis was still a smoking event back then, and there was always a thick haze of cigarette smoke near the ceiling in the hall), but in that moment, I truly understood Ron's precept.

It's not that you intended the demo to bomb, or the water to start pouring out of the ceiling.

It's that this is your room, and ***you are in full control of this presentation***. It's really about your confidence in your knowledge, your skills, and your talk coming through: "I am fully ready to deal with whatever may come, and I will guarantee you that nothing will derail us from me taking you on this journey with me."

Not even a tornado warning, drunk co-presenter, or gastrointestinal difficulties. (All of which have happened to me, by the way.)

Everybody who has ever attended a tech talk has seen a demo bomb. Your demo failing is not anything new to them. It's really not. (What, you think you're special, that your demo is somehow better or more amazing than anybody else's demo? It's just a demo, fercryinoutloud!) And your demo is not the centerpoint of your talk, and it will fail in ways you could never have predicted. And that's OK.

But what if your demo is the *one thing* they were hoping to see? Hardly likely, but let's even assume that it is: You think those attendees whose career hangs on seeing your demo working aren't able to come up to you later and ask, "Do you mind if we try that demo again, I'd love to see it working" and sit with you at a table working through it if they cared that much? (Ironically, the only time that's happened to me is after that very same Javapolis presentation, which was when we discovered that my VM's virtual disk had corrupted. Fortunately I had a copy of the VM on another external hard drive, so it was easy to spin that one up and show the demo off as it was meant to be seen. They went away happy, and I went away educated.)

The key thing is, if you do live code demos, you need to be comfortable with two things:

1. **Be ready to debug on the fly.** You will forget a semicolon, you will misspell the name of the method you need to apply, you will forget that the file you're trying to load is one directory up or down from where you're looking to load it from, you will make mistakes. Most of them will be simple, stupid, and fixable. And frankly, there's value in showing attendees how to debug the very same kinds of mistakes that they're going to make when they get home and try to repeat your demo. But you have to be comfortable debugging on the fly. Even then....
2. **Be willing to abandon the demo.** Sometimes, it's just not going to happen. It's more subtle than you thought, it's trickier than you thought, or worse yet the version of the library you're using silently upgraded without you realizing it, and now they're looking for a differently-named method or the file is in a different place. Sometimes, it's just going to take more time than you've got to debug.
    And in that moment, you have a choice--stay focused on the room, abandon the demo (my usual choice of words is, "Do you believe me that this is *supposed* to work?" which usually draws a chuckle or two), and move on with your talk. Or, you can stay focused on YOU, and your need to get this demo to work, and abandon the rest of the talk.

Remember, the audience is here to hear a story. They don't need your demo to hear the story. The demo is there to help them visualize and see the story play out in front of their eyes--but it's not the story as a whole, and if they have to use their imagination a little, that's not a terrible thing.

Mistakes will happen. Get over it. Fast.

**PostScript.** If you really don't want to deal with failing demos, try the "Milli-Vanilli" pattern from *Presentation Patterns*: record a video of the demo on your machine, and embed the video in your presentation and play it during your talk. That way you can talk about what you're doing in the video while it's playing, and you don't have to try and split your brain coding and talking at the same time. Of course, never discount the possibility that the video could fail during your talk... at which point you look at the audience and say, "Do you believe me when I tell you that this video was *supposed* to work...?"
