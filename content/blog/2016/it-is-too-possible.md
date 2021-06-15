title=It is too possible
date=2016-06-21
type=post
tags=architecture, agile, development processes, psychology, philosophy, industry, management
status=published
description=In which I deconstruct a rather ridiculous assertion.
~~~~~~

*tl;dr* Once again I find myself in the position of needing to call BS on a blog post and deconstruct it: Yes, it is possible to be a good .NET developer, and here's why.

<!--more-->

First, as always, if you've not read the original, [check it out](http://codeofrob.com/entries/why-you-cant-be-a-good-.net-developer.html). Again, I'll be quoting from it, so you needn't remember all of it, but read it once just to get a good idea of what's there.

Now, let's deconstruct.

## Why you can't be a good .NET developer
Mr Ashton seems to be basing his argument on a couple of things:

1. Developers are leaving .NET.
2. The reason developers are leaving .NET isn't because of "self-loathing", but because they work in shops that cater to the lowest-common-denominator.
1. ... There is no third reason. Just lots of use of the perjorative word "derpy". Because that will make the point far better than any logic could.

Let's break those down:

### Developers are leaving .NET
Mr Ashton opens with:

>  The reason why people "leave" .NET is ---

This one will be hard to invalidate, because there's two forms of evidence that we can pull into play: empirical evidence, which is hard to gather objectively, and anecdotal evidence, which is easy to gather (for each of us individually, anyway), hard to refute, and yet hardly industry-indicative.

Here's what I mean. Assume that I have observed that when the door slams, people jump. As a matter of fact, I can go around and slam doors, and watch that everybody within close proximity of the door jumps. That means that, anecdotally, 100% of the population will jump when I slam the door. Yay science!

Of course, I probably should mention that none of the people being observed are deaf, and none of them have been through this particular experiment before. (As it turns out, you can get used to anything, including the noise of slamming  doors, and thus not flinch, despite what anecdotal evidence may tell you.)

But perhaps this is a tangent, becaues Mr Ashton never comes back to this point of developers leaving---he prefers instead to focus on the rationale, which is:

### Lowest-common-denominator enterprise shops
> To work in a development shop with a team is to continually cater for the lowest common denominator of that team and the vast majority of software shops using .NET have a whole lot of lowest common denominator to choose their bad development decisions for. ... It'll not happen because as long as you're working on a platform that is primarily used by derpy enterprise shops, you will continually be held back because those derpy enteprise shops are continually be held back by the derpy enterprise developers that work in the derpy enterprise shops.

In case you weren't quite clear on his position, he goes on to say:

> It isn't self loathing, it's self preservation and an eventual realisation that you can't actually progress so long as you're being held back by bad decisions made to cater for the slow and the stupid. Self loathing is just an intermediate stage that people go through while they still believe they can make an impact on the environment around them by caring and shouting into the void to enact tiny changes that help nobody.

Sounds to me like Mr Ashton has some angst he needs to work out in therapy.

Perhaps he has some strong empirical evidence to back this position? 

He cites two pieces of anecdotal evidence, and then makes some broad sweeping generalizations:

> Tangible examples? I remember well the insistence of one boss that we use TFS because some developers would find it hard to use git.

Or, perhaps, because the boss had some other good reasons not to use Git. I
can imagine a couple:

* Git often implies GitHub, which can be costly for businesses if the source needs to remain closed-source. By all means, there are alternatives to GitHub, one of my favorites being [BitBucket](http://bitbucket.com), but developers frothing at the mouth over Git often can't comprehend the idea of using it without GitHub.
* Managers often need their reports. TFS, for all of its flaws, has a better integration story in the ALM cloud than GitHub does, and management that is used to (as in, built processes around) some of these reports will find it is a non-trivial cost to move to something other than TFS.
* Why does which source control system you use matter all that much? Developers often get all worked up over this, but frankly, teams spent years working with non-distributed systems like Subversion and CVS before Git came along. As a matter of fact, unless your team spends significant amounts of time offline from the source-control server, there's a strong argument to be made that you don't need to use Git or Mercurial at all.

> I remember the steadfast committal to ASP.NET web forms because the "new concepts" in ASP.NET MVC were going to take too long for the team to become productive in. 

And that's a reasonable concern. Look, developers love to chase the bright new shiny, whatever that happens to be, and frankly they're more than willing to learn at their employers' expense at times, making mistake after mistake after mistake until they've mastered the new shiny in question---at which point they start chasing after the next new bright shiny. Quite often, these bright shiny chasedowns don't yield any practical benefit to the end-user---in fact, they achieve the exact opposite. Working with new languages, platforms, and tools often leads to more bugs in the early days, and if there's no commensurate improvement to the end users (in the long term, forget about the short term), then there's absolutely no business reason to go down this path.

I actually *agree* that WebForms is vastly inferior to MVC. My former company had a client that was heavily invested in WebForms, and refused all interest in moving to MVC, and their code was literally impossible to automate testing around because of it. As a long-term strategic decision, it was a poor one. But as a short-term tactical one, it made sense.

And that's the bigger picture: sometimes management needs to make short-term tactical decisions that aren't optimal in the long-term. Eventually, if the company has strong management, that course gets corrected. But that's not a flaw in the technology, it's a flaw in the management structure using it. I can (and have) see Java shops making the same decisions. C++ shops are hardly immune to this. Nor are COBOL shops.

The answer to this, of course, is to make sure that the team is spending some time coming up to speed on the bright shiny things that strategically are important to the company; my preference would be that they spend at least two hours a week doing some guided study around those topics. But that's another topic for another day.

> There is now this furore *[sic]* over .NET core and the new thing in the tiny 0.001% of people that care are whether they persist in using Windows or switch to more productive environments. 

Of course we assume that "more productive environments" is a shadowy reference to the Mac or a Linux environment, but frankly, I find that I'm just as productive in a Windows-based world as I am in a Mac-based world. The tools are different, and the approach is different, but there's a reason why I still make use of both environments on a regular basis.

And, by the way, .NET Core is an as-yet-unreleased environment. Trying to point to that as a failure of the .NET platform as a technology is like pointing to a half-finished supercarrier sinking. Of course it sank---it wasn't finished! Funny thing is, most half-finished environments or ships will also sink. Shall we compare the Ruby 0.9 release against the .NET 4.6 release and see which one wins, while we're at it?

> Of course @aliostad gets it right here and points out that the primary "Important Thing" should be a focus on functional programming in languages like F# and of course the reason it doesn't happen is because "it's too hard for most people in our team".

I love the unattributed quote---it's so easy to pretend that you're quoting somebody without having to actually name anybody or any particular context, thus making it hard to refute. It's "almost as if you can't really find anybody to substantiate your arguments with actual fact".

But in this particular case, I've heard it from several development managers, speaking to both F# and Scala. And I've challenged them on several occasions, to let me spend a few hours going over the concept with their team, and see what the team thinks afterwards. In each of those situations, the team has "gotten it", and although they're not functional programmers ready to embrace Haskell as the One True Programming Language (which is ludicrous anyway), they understand the core concepts and can see where and how it might be applied. Or not applied, as the case may be. (Because, quite honestly, there are a number of cases where a functional mindset doesn't really fit the problem at hand. And this is why both of those languages---F# and Scala---are actually object/function hybrid languages, and not strictly functional.)

The larger issue here, though, is that managers understand---in ways that software developers don't seem to, as Mr Ashton emblemizes---that learning new syntax and concepts and approaches takes time. Absent any formal time set aside for the team to learn those new things, that time will most often come at the expense of the project on which these developers are working. And while sometimes that means that the project will come in early (because learning the new thing helped shorten the overall release cycle), far more often than not, it means the project gets pushed back. Which leads management to a pretty inescapable conclusion:

> Project + Tool(new) = delays

Perhaps management isn't the derp here, after all.

## But why is this .NET's fault?
This the part that doesn't seem to be elucidated in Mr Ashton's rant; he cites his two anecdotal examples (only one of which is actually .NET specific; one could see the TFS/git argument taking place in a Java shop just as easily as in a .NET shop), then makes his two sweeping generalizations, but without any actual evidence that this is somehow localized to the .NET segment of the industry. News flash, Mr Ashton: This exact same argument happens in Java shops ("Why can't we use Groovy/Scala/Clojure/Kotlin?") and, as companies invest more deeply into Ruby and/or NodeJS (assuming they ever do---Ruby seems to be fading fast from the enterprise landscape, for whatever reasons), they will make the same kinds of decisions around those platforms, as well.

Because, Mr Ashton, it turns out that this isn't a question of the tool or the language, it's a question of the environment in which they are being used. And, as any "derpy" enterprise development manager knows, the bleeding edge is called the bleeding edge for a pretty good reason.

## Well, that means it's the derpy co-workers' fault
Let's be clear, fundamentally Mr Ashton's arguments really aren't with .NET, whether he realizes it or not. He's actually angry at his industry colleagues at these "derpy" enterprise shops, because (in his not-so-subtle opinion) they're the ones  that management is trying to accomodate with their "derpy" decisions. Again, just to be clear:

> It isn't self loathing, it's self preservation and an eventual realisation that you can't actually progress so long as you're being held back by bad decisions made to cater for the slow and the stupid.

It's pretty clear that Mr Ashton considers most enterprise software developers to be "slow and stupid". This is elemental logic: a manager doesn't make a decision for a team based on the consequences for just one member of the team, but on the basis of what the majority of the team has or lacks. Therefore, in Mr Ashton's view, the majority of enterprise developers are "derps" who are simply too slow and too stupid to understand the new things. What magnificent benefits could be  had, if only they would stop plodding down the lane like oxen, and instead gallavant and run through the forests, wind whipping through their hair as they leap over obstacles like the rest of the stallions do!

Except that oxen never break their ankles attempting to leap an obstacle that is too high for them. Oxen will never dump their riders on the ground because they ran under a low-hanging branch that was too low for the human on their back. And oxen will never decide on their own to simply refuse to make a particular jump because, frankly, they just don't want to. 

Roads were created to help eliminate the obstacles, and make it easier for farmers to get their goods to market where, you know, they can sell them and stuff. Which is used to buy other things, like food for the oxen. And a roof over their heads in the winter. And the brush the farmer uses to comb out the snarls in their fur. And so on.

(OK, all analogies break down eventually.)

Truth is, there's a lot of good reasons to stay to the road. Roads are something that anyone can navigate, whether oxen, stallion or simple plain ol' human. Roads also have this funny way of making it clear what is interesting in the world---if a particular town starts to grow, more people will start traveling to it, and the roads will---organically---stablize and get smoother and easier to travel. In fact, funny thing---if the road gets too much traffic on it, it will start to degrade, at which point people will step in and pave the thing. And put up signs to regulate traffic on it. And so on, each time reducing the obstacles on the road itself and making it easier to travel.

Don't be hating the "derpy" enterprise developer because they don't want to go crashing through the forests like stallions do. If you don't want to be one of those "derpy" enterprise developers, then don't be one. But considering those folks are the ones that wrote (and continue to maintain) the code that cashes your paycheck every month, maybe you'd be better off thanking them, instead of insulting them.
