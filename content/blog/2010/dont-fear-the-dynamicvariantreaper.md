title=Don't Fear the dynamic/VARIANT/Reaper...
date=2010-02-14
type=post
tags=languages, design, industry, csharp, clr, java, jvm
status=published
description=In which I examine languages and the static/dynamic typing wars we have.
~~~~~~

A couple of days ago, a buddy of mine, Scott Hanselman, wrote <a href="http://www.hanselman.com/blog/BackToBasicsC4MethodOverloadingAndDynamicTypes.aspx" target="_blank">a nice little intro to the "dynamic" type in C# 4.0</a>. In particular, I like (though don't necessarily 100% agree with) his one-sentence summation of dynamic as *"There's no way for you or I to know the type of this now, compiler, so let's hope that the runtime figures it out."* It's an interesting characterization, but my disagreement with his characterization is not the point here, at least not of this particular blog entry.

I've been waiting for it for a while, ever since C# 4 was announced, and sure enough, here we go: Scott's blog is the victim of the *Static-Typing Fundamentalist*, the bearded and grizzled veteran of the Static/Dynamic Code Wars, come out to proclaim the sins of dynamic programming, the evils of those who use(d) it, and why C#/C++/Java was so much better than Visual Basic/Ruby/Python/whatever. Be careful of these creatures. They rival Al-Qaeda in their ferocity and zeal, Fox News in their attention to detail and evidence, and George Bush in their pronouncements of gloom and doom for the future if we don't *act now and eliminate this evil*.

Allow me to quote (liberally) from <a href="http://robert-seder.myopenid.com/" target="_blank">Rob</a>'s <a href="http://www.hanselman.com/blog/CommentView.aspx?guid=FC406BB6-2218-4481-A6BA-CD1E12994D74" target="_blank">comment on Scott's blog</a>, and comment in turn as we go:  <blockquote>   It's such a shame that you promote this stuff. You should've seen the horrific devastation that "Variant" caused in the old VB days. Variant single-handedly create job security for so many people since the late 90's, because of the horrible, horrible, horrible things that developers did with that ridiculous, 12-byte data type! </blockquote>  I just love it when people make comments like "horrific devastation". Nothing like a little hyperbole to liven things up! I mean, it didn't cause exceptions, it didn't make code hard to read, it didn't make it tricky for developers to modify and refactor safely, it leveled cities! burned forests! slaughtered kittens! and even worse, it was *12 bytes in size!*

Never mind the fact that Visual Basic developers frequently churned out apps twice, three, five times faster than their C++ cousins did. (I know this—I was one of those C++ developers, and routinely mocked the VB guys across the hall for their crappy language and code.... until they built an app in a few days that I tried to build at home in C++ and gave up after two weeks. And all the damn thing did was basic dialogs-and-data kinds of stuff, too.)

> This weak-typing with late-binding is just such a bad idea. I know you'll say "But wait, these are powerful tools that skilled developers can leverage!" - and maybe so, but 98% of the people that truly use these sorts of techniques out in the real world, are unskilled developers making a mess of software all across this great land, because the compiler is so forgiving.

Ah, the "All Developers (Except Me) Are Idiots" argument. I love this one—-the hubris involved here is just too precious for words. I have no doubt that the author of this post, being (of course) the classically-trained object-oriented developer and therefore too smart/disciplined/experienced/whatever to fall into such a ridiculous temptation as to use dynamic typing, would never use this feature except in the Most Dire of Emergencies, but his fellow programmers, all of them being *much* less disciplined/smart/trained/whatever than he is, will fall for the temptation and write code that levels cities! burns forests! kills kittens! and worse, uses 12 bytes! (Oh, wait, it's only 3 bytes, because dynamic is just a placeholder for an object reference, and all object references are 3 bytes in the CLR. Or at least they used to be—-I admit, I haven't checked in CLR 4.) Those poor souls, they won't have any hope! There they'll be, staring at Visual Studio, wanting *desperately* to do the Right Thing, and that evil little programmer devil on their shoulder (probably wearing a T-shirt that says, "P3rl is l33t" or something equally blasphemous) will whisper, "You know, if you just make it a dynamic, you can get the compiler to shut up and you can go home early...."

Oh, right—-sorry, I forgot. That devil will whisper, "You know, if you write this code in Visual Basic .NET, you can make the entire codebase Option Strict Off and Option Explicit Off, make the compiler shut up and you can go home early...." Hell, they've been whispering *that* bit of subversion since 2001. And ye Gods! The leveled cities! burned forests! cute little kitten bodies! all over the place! It's fortunate that we C# developers have kept all those Visual Basic developers on the straight-and-narrow path of <strike>true salvation</strike> static typing.

> This is a huge step backwards for C#, in my opinion - and creates the same scenario VB always did - where it is so forgiving, that it allows developers to write horrible code and you won't so much as see a compiler warning!! I've always tauted that C# was better, simply because it gave the developer "tough love", and forced him/her to be better coder and to "make good choices"! :-)

Ah, yes, the C# compiler and its "tough love". The "prefer compile errors over runtime errors" argument, vis-a-vis Scott Meyers' "Effective C++" circa 1994 or so. It's vastly preferable to see errors early, before the big demo in front of the VP/President/potential customer. (Anybody who disagrees with this obviously hasn't had a demo fail in front of a VP/President/potential customer.) How fortunate that the C# compiler catches all these ugly errors at compile-time, like

```csharp
static void DoSomething()
{
    List<object> intList = new List<object>();
    intList.Add(5);
    string s = (string) intList[0];
    Console.WriteLine(s);
}
```

... because boy, that would be *embarrassing* if it didn't. I mean, can you imagine the horror other disciplined/smart/experienced developers would feel if a lenient compiler actually allowed code like this:

```csharp
class Point
{
    internal int x;
    internal int y;
    public Point(int x, int y) { x = x; y = y; }
}
```

or this:

```csharp
class Point
{
    internal int x;
    internal int y;
    public Point(int x, int y)
    {
        this.x = x;
        this.y = y;
    }
    public override string ToString()
    { return String.Format("({0},{1})", x, y); }
}

static void DoSomething()
{
    Point pt = new Point(12, 12);
    pt.GetType()
        .GetField("x", BindingFlags.Instance | BindingFlags.NonPublic)
        .SetValue(pt, 24);
    Console.WriteLine(pt);
}
```

to compile? Cities! Forests! Kittens! Thank *God* C# isn't that kind of lustfully promiscuous... I mean, "lenient"... compiler!

(Now if only we could tout blog comment engines with spellcheck....)

> Specific to this blog post, if you are doing somewhere where you can't even quantify what the data type that is coming back? Guess what, you've got yourself a bad design.

Wow. There's just no arguing with that one. I mean, knowing the actual type on which the method is being dispatched is such a *huge* part of the C# development experience:

```csharp
static void DoSomething()
{
    List<Point> ptList = new List<Point>();
    ptList.Add(new Point(12, 12));
    object o = ptList[0];
    Console.WriteLine(o.ToString());
}
```

Gah. Just the *thought* of not knowing the concrete type on which the method is being dispatched gives me the heebie-jeebies.

> Just because the framework allows you use weak-typing and late-binding, doesn't mean you should - nor should you endorse it's use, in my opinion. 

Somebody better tell all those users of NHibernate, NUnit, Spring.NET, MEF and all those other Reflection-based tools... including WinForms, ASP.NET, WPF, Workflow and WCF, come to think about it... that they're using frameworks that clearly were designed by idiots. (The *gall* of those people.)

> I'm just saying, it's a shame that popular "nerd celebrities" like you (and I mean zero offense by that!) - endorse all this loosey-goosey typing. I say that becuase I've never seen a single case where weak typing or late binding: A) made a design better or B) where it didn't make the component or application worse, because it was a looser design.

I'm so glad you were here to set Scott and me straight, Rob. Because otherwise, we might actually get something done. God *forbid*.

Little tidbits of thought for those who are still thinking about this one.

* <a href="http://olabini.com/blog/2008/06/fractal-programming/" target="_blank">Ola Bini describes the application of the right language at the right level of the stack</a> as a three-layer pyramid.

* Any C# or Java developer who's not writing unit tests to test their code "because the compiler will catch all those errors" and provide "tough love" needs to be fired. *Immediately.* I cannot conceive of a situation where unit tests can be passed over in favor of static typing in a professionally-responsible development project. (Oh, don't mis-read that, I can see lots of situations where unit tests aren't necessary. But not on code that's going to reach Production.)

* The argument for the degree of static typing in C# or Java is completely indefensible compared to what statically-typed type-inferenced languages like Haskell, F# or Scala provide. And their syntax frequently looks like `let x = [ 1; 2; 3; 4; ]`, which isn't all that far off from what a dynamically-typed language looks like, despite very very different things happening under the compiler's hood. Until you, the Statically-Typed Fundamentalist, have written code in a Haskell/ML-derived language, you have no right arguing the merits of static typing. (In fact, that's probably also true if you've never written code in Ruby, Python, or PowerShell, either.)

* There's lots more arguments the Static-Typing Fundamentalist can throw, by the way. I'm disappointed Rob never mentioned performance, for one—that's a classic line of attack, too. Never mind the fact that most of those guys are still looping down and doing other silly micro-optimizations because that's way C++ taught them to do it....

* Oh, and *never ever* show the Static Typing Fundamentalist an XML document and using something like XPath to extract data from it. They inevitably fall into XML Schema and the "if we just write the schema flexibly enough" and.... The last time I did that.... I still visit his gravesite, all these years later, and it still hurts, losing him that way.

* Java guys argued against dynamic typing for years, too... until they tried Groovy and JRuby and Clojure. Now.... not so much.

Peace out.
 
