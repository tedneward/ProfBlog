+++
date = "2010-02-14T03:41:34.1129092-08:00"
draft = false
title = "Don't Fear the dynamic/VARIANT/Reaper...."
aliases = [
	"/2010/02/14/Dont+Fear+The+Dynamicvariantreaper.aspx"
]
categories = [
	".NET","C#","C++","F#","Industry","Java/J2EE","Languages","Parrot","Python","Ruby","Scala","Visual Basic","WCF"
]
concepts = ["Industry", "Languages"]
languages = ["C#", "C++", "F#", "Python", "Ruby", "Scala", "Visual Basic"]
platforms = [".NET", "Java/J2EE", "Parrot"]
 
+++
<p>A couple of days ago, a buddy of mine, Scott Hanselman, wrote <a href="http://www.hanselman.com/blog/BackToBasicsC4MethodOverloadingAndDynamicTypes.aspx" target="_blank">a nice little intro to the &quot;dynamic&quot; type in C# 4.0</a>. In particular, I like (though don't necessarily 100% agree with) his one-sentence summation of dynamic as <em>&quot;There's no way for you or I to know the type of this now, compiler, so let's hope that the runtime figures it out.&quot;</em> It's an interesting characterization, but my disagreement with his characterization is not the point here, at least not of this particular blog entry.</p>  <p>I've been waiting for it for a while, ever since C# 4 was announced, and sure enough, here we go: Scott's blog is the victim of the <em>Static-Typing Fundamentalist</em>, the bearded and grizzled veteran of the Static/Dynamic Code Wars, come out to proclaim the sins of dynamic programming, the evils of those who use(d) it, and why C#/C++/Java was so much better than Visual Basic/Ruby/Python/whatever. Be careful of these creatures. They rival Al-Qaeda in their ferocity and zeal, Fox News in their attention to detail and evidence, and George Bush in their pronouncements of gloom and doom for the future if we don't <em>act now and eliminate this evil</em>.</p>  <p>Allow me to quote (liberally) from <a href="http://robert-seder.myopenid.com/" target="_blank">Rob</a>'s <a href="http://www.hanselman.com/blog/CommentView.aspx?guid=FC406BB6-2218-4481-A6BA-CD1E12994D74" target="_blank">comment on Scott's blog</a>, and comment in turn as we go:</p>  <blockquote>   <p>It's such a shame that you promote this stuff. You should've seen the horrific devastation that &quot;Variant&quot; caused in the old VB days. Variant single-handedly create job security for so many people since the late 90's, because of the horrible, horrible, horrible things that developers did with that ridiculous, 12-byte data type!</p> </blockquote>  <p>I just love it when people make comments like &quot;horrific devastation&quot;. Nothing like a little hyperbole to liven things up! I mean, it didn't cause exceptions, it didn't make code hard to read, it didn't make it tricky for developers to modify and refactor safely, it leveled cities! burned forests! slaughtered kittens! and even worse, it was <em>12 bytes in size!</em></p>  <p>Never mind the fact that Visual Basic developers frequently churned out apps twice, three, five times faster than their C++ cousins did. (I know this—I was one of those C++ developers, and routinely mocked the VB guys across the hall for their crappy language and code.... until they built an app in a few days that I tried to build at home in C++ and gave up after two weeks. And all the damn thing did was basic dialogs-and-data kinds of stuff, too.)</p>  <blockquote>   <p>This weak-typing with late-binding is just such a bad idea. I know you'll say &quot;But wait, these are powerful tools that skilled developers can leverage!&quot; - and maybe so, but 98% of the people that truly use these sorts of techniques out in the real world, are unskilled developers making a mess of software all across this great land, because the compiler is so forgiving. </p> </blockquote>  <p>Ah, the &quot;All Developers (Except Me) Are Idiots&quot; argument. I love this one—the hubris involved here is just too precious for words. I have no doubt that the author of this post, being (of course) the classically-trained object-oriented developer and therefore too smart/disciplined/experienced/whatever to fall into such a ridiculous temptation as to use dynamic typing, would never use this feature except in the Most Dire of Emergencies, but his fellow programmers, all of them being <em>much</em> less disciplined/smart/trained/whatever than he is, will fall for the temptation and write code that levels cities! burns forests! kills kittens! and worse, uses 12 bytes! (Oh, wait, it's only 3 bytes, because dynamic is just a placeholder for an object reference, and all object references are 3 bytes in the CLR. Or at least they used to be—I admit, I haven't checked in CLR 4.) Those poor souls, they won't have any hope! There they'll be, staring at Visual Studio, wanting <em>desperately</em> to do the Right Thing, and that evil little programmer devil on their shoulder (probably wearing a T-shirt that says, &quot;P3rl is l33t&quot; or something equally blasphemous) will whisper, &quot;You know, if you just make it a dynamic, you can get the compiler to shut up and you can go home early....&quot;</p>  <p>Oh, right—sorry, I forgot. That devil will whisper, &quot;You know, if you write this code in Visual Basic .NET, you can make the entire codebase Option Strict Off and Option Explicit Off, make the compiler shut up and you can go home early....&quot; Hell, they've been whispering <em>that</em> bit of subversion since 2001. And ye Gods! The leveled cities! burned forests! cute little kitten bodies! all over the place! It's fortunate that we C# developers have kept all those Visual Basic developers on the straight-and-narrow path of <strike>true salvation</strike> static typing.</p>  <blockquote>   <p>This is a huge step backwards for C#, in my opinion - and creates the same scenario VB always did - where it is so forgiving, that it allows developers to write horrible code and you won't so much as see a compiler warning!! I've always tauted that C# was better, simply because it gave the developer &quot;tough love&quot;, and forced him/her to be better coder and to &quot;make good choices&quot;! :-)</p> </blockquote>  <p>Ah, yes, the C# compiler and its &quot;tough love&quot;. The &quot;prefer compile errors over runtime errors&quot; argument, vis-a-vis Scott Meyers' &quot;Effective C++&quot; circa 1994 or so. It's vastly preferable to see errors early, before the big demo in front of the VP/President/potential customer. (Anybody who disagrees with this obviously hasn't had a demo fail in front of a VP/President/potential customer.) How fortunate that the C# compiler catches all these ugly errors at compile-time, like</p>  <div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">   <div style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">     <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum1">   1:</span> <span style="color: #0000ff">static</span> <span style="color: #0000ff">void</span> DoSomething()</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum2">   2:</span> {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum3">   3:</span>     List&lt;<span style="color: #0000ff">object</span>&gt; intList = <span style="color: #0000ff">new</span> List&lt;<span style="color: #0000ff">object</span>&gt;();</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum4">   4:</span>     intList.Add(5);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum5">   5:</span>     <span style="color: #0000ff">string</span> s = (<span style="color: #0000ff">string</span>) intList[0];</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum6">   6:</span>     Console.WriteLine(s);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum7">   7:</span> }</pre>
<!--CRLF--></div>
</div>

<p>... because boy, that would be <em>embarrassing</em> if it didn't. I mean, can you imagine the horror other disciplined/smart/experienced developers would feel if a lenient compiler actually allowed code like this:</p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <div style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">
    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum1">   1:</span> <span style="color: #0000ff">class</span> Point</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum2">   2:</span> {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum3">   3:</span>     <span style="color: #0000ff">internal</span> <span style="color: #0000ff">int</span> x;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum4">   4:</span>     <span style="color: #0000ff">internal</span> <span style="color: #0000ff">int</span> y;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum5">   5:</span>     <span style="color: #0000ff">public</span> Point(<span style="color: #0000ff">int</span> x, <span style="color: #0000ff">int</span> y)</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum6">   6:</span>     {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum7">   7:</span>         x = x;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum8">   8:</span>         y = y;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum9">   9:</span>     }</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum10">  10:</span> }</pre>
<!--CRLF--></div>
</div>

<p>or this:</p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <div style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">
    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum1">   1:</span> <span style="color: #0000ff">class</span> Point</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum2">   2:</span> {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum3">   3:</span>     <span style="color: #0000ff">internal</span> <span style="color: #0000ff">int</span> x;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum4">   4:</span>     <span style="color: #0000ff">internal</span> <span style="color: #0000ff">int</span> y;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum5">   5:</span>     <span style="color: #0000ff">public</span> Point(<span style="color: #0000ff">int</span> x, <span style="color: #0000ff">int</span> y)</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum6">   6:</span>     {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum7">   7:</span>         <span style="color: #0000ff">this</span>.x = x;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum8">   8:</span>         <span style="color: #0000ff">this</span>.y = y;</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum9">   9:</span>     }</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum10">  10:</span>     <span style="color: #0000ff">public</span> <span style="color: #0000ff">override</span> <span style="color: #0000ff">string</span> ToString()</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum11">  11:</span>     {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum12">  12:</span>         <span style="color: #0000ff">return</span> String.Format(<span style="color: #006080">&quot;({0},{1})&quot;</span>, x, y);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum13">  13:</span>     }</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum14">  14:</span> }</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum15">  15:</span> <span style="color: #0000ff">static</span> <span style="color: #0000ff">void</span> DoSomething()</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum16">  16:</span> {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum17">  17:</span>     Point pt = <span style="color: #0000ff">new</span> Point(12, 12);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum18">  18:</span>     pt.GetType()</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum19">  19:</span>         .GetField(<span style="color: #006080">&quot;x&quot;</span>, BindingFlags.Instance | </pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum20">  20:</span>             BindingFlags.NonPublic)</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum21">  21:</span>         .SetValue(pt, 24);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum22">  22:</span>     Console.WriteLine(pt);</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum23">  23:</span> }</pre>
<!--CRLF--></div>
</div>

<p>to compile? Cities! Forests! Kittens! Thank <em>God</em> C# isn't that kind of lustfully promiscuous... I mean, &quot;lenient&quot;... compiler!</p>

<p>(Now if only we could tout blog comment engines with spellcheck....)</p>

<blockquote>
  <p>Specific to this blog post, if you are doing somewhere where you can't even quantify what the data type that is coming back? Guess waht, you've got yourself a bad design. </p>
</blockquote>

<p>Wow. There's just no arguing with that one. I mean, knowing the actual type on which the method is being dispatched is such a <em>huge</em> part of the C# development experience:</p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <div style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">
    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum1">   1:</span> <span style="color: #0000ff">static</span> <span style="color: #0000ff">void</span> DoSomething()</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum2">   2:</span> {</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum3">   3:</span>     List&lt;Point&gt; ptList = <span style="color: #0000ff">new</span> List&lt;Point&gt;();</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum4">   4:</span>     ptList.Add(<span style="color: #0000ff">new</span> Point(12, 12));</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum5">   5:</span>     <span style="color: #0000ff">object</span> o = ptList[0];</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum6">   6:</span>     Console.WriteLine(o.ToString());</pre>
<!--CRLF-->

    <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px"><span style="color: #606060" id="lnum7">   7:</span> }</pre>
<!--CRLF--></div>
</div>

<p>Gah. Just the <em>thought</em> of not knowing the concrete type on which the method is being dispatched gives me the heebie-jeebies.</p>

<blockquote>
  <p>Just because the framework allows you use weak-typing and late-binding, doesn't mean you should - nor should you endorse it's use, in my opinion. </p>
</blockquote>

<p>Somebody better tell all those users of NHibernate, NUnit, Spring.NET, MEF and all those other Reflection-based tools... including WinForms, ASP.NET, WPF, Workflow and WCF, come to think about it... that they're using frameworks that clearly were designed by idiots. (The <em>gall</em> of those people.)</p>

<blockquote>
  <p>I'm just saying, it's a shame that popular &quot;nerd celebrities&quot; like you (and I mean zero offense by that!) - endorse all this loosey-goosey typing. I say that becuase I've never seen a single case where weak typing or late binding: A) made a design better or B) where it didn't make the component or application worse, because it was a looser design.</p>
</blockquote>

<p>I'm so glad you were here to set Scott and me straight, Rob. Because otherwise, we might actually get something done. God <em>forbid</em>.</p>

<p>Little tidbits of thought for those who are still thinking about this one.</p>

<ul>
  <li><a href="http://olabini.com/blog/2008/06/fractal-programming/" target="_blank">Ola Bini describes the application of the right language at the right level of the stack</a> as a three-layer pyramid.</li>

  <li>Any C# or Java developer who's not writing unit tests to test their code &quot;because the compiler will catch all those errors&quot; and provide &quot;tough love&quot; needs to be fired. <em>Immediately.</em> I cannot conceive of a situation where unit tests can be passed over in favor of static typing in a professionally-responsible development project. (Oh, don't mis-read that, I can see lots of situations where unit tests aren't necessary. But not on code that's going to reach Production.)</li>

  <li>The argument for the degree of static typing in C# or Java is completely indefensible compared to what statically-typed type-inferenced languages like Haskell, F# or Scala provide. And their syntax frequently looks like &quot;let x = [ 1; 2; 3; 4; ]&quot;, which isn't all that far off from what a dynamically-typed language looks like, despite very very different things happening under the compiler's hood. Until you, the Statically-Typed Fundamentalist, have written code in a Haskell/ML-derived language, you have no right arguing the merits of static typing. (In fact, that's probably also true if you've never written code in Ruby, Python, or PowerShell, either.)</li>

  <li>There's lots more arguments the Static-Typing Fundamentalist can throw, by the way. I'm disappointed Rob never mentioned performance, for one—that's a classic line of attack, too. Never mind the fact that most of those guys are still looping down and doing other silly micro-optimizations because that's way C++ taught them to do it....</li>

  <li>Oh, and <em>never ever</em> show the Static Typing Fundamentalist an XML document and using something like XPath to extract data from it. They inevitably fall into XML Schema and the &quot;if we just write the schema flexibly enough&quot; and.... The last time I did that.... I still visit his gravesite, all these years later, and it still hurts, losing him that way.</li>

  <li>Java guys argued against dynamic typing for years, too... until they tried Groovy and JRuby and Clojure. Now.... not so much.</li>
</ul>

<p>Peace out.</p>
 
