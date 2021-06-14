+++
date = "2009-03-29T05:18:12.0720106-07:00"
draft = false
title = "Laziness in Scala"
aliases = [
	"/2009/03/29/Laziness+In+Scala.aspx"
]
categories = [
	".NET","C#","F#","Java/J2EE","Languages","Scala","Visual Basic"
]
concepts = ["Languages"]
languages = ["C#", "F#", "Scala", "Visual Basic"]
platforms = [".NET", "Java/J2EE"]
 
+++
<p>While playing around with a recent research-oriented project for myself (more on that later), I discovered something that I haven't seen mentioned anywhere in the Scala universe before. (OK, not really--as you'll see towards the end of this piece, it really is documented, but allow me my brief delusions of grandeur as I write this. They'll get deflated quickly enough.) </p>  <p>So the core of the thing was a stack-oriented execution engine; essentially I'm processing commands delivered in a postfix manner. Since some of these commands are relational operators, it's important that there be two things to relationally operate on the execution stack, after which I want to evaluate the relational operation and push its result (1 if true, 0 if false) back on the stack; this is pretty easily done via the following: </p>  <div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">   <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">def compareOp(op : (Int, Int) =&gt; Boolean) =<br />{<br />  checkStack(2)<br />  val v1 = (execStack.pop()).asInstanceOf[Int]<br />  val v2 = (execStack.pop()).asInstanceOf[Int]<br />  val vr = op(v1, v2)<br />  execStack.push(<span style="color: #0000ff">if</span> (vr) 1 <span style="color: #0000ff">else</span> 0)<br />} <br /></pre>

  <br /></div>

<p>where &quot;execStack&quot; is a mutable.Stack[Any] held in an enclosing function. </p>

<p>Interestingly enough, however, when I wrote this the first time, I wrote it like this, which is a very different sequence of operations: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">def compareOp(op : (Int, Int) =&gt; Boolean) =<br />{<br />    checkStack(2)<br />    def v1 = (execStack.pop()).asInstanceOf[Int]<br />    def v2 = (execStack.pop()).asInstanceOf[Int]<br />    def vr = op(v1, v2)<br />    execStack.push(<span style="color: #0000ff">if</span> (vr) 1 <span style="color: #0000ff">else</span> 0)<br />}</pre>

  <br /></div>

<p>See the difference? Subtle, is it not? But the actual code is significantly different, something that's more easily seen with a much simpler (and standalone) example: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        def v1 = (stack.pop()).asInstanceOf[Int]<br />        def v2 = (stack.pop()).asInstanceOf[Int]<br />        def vr = v1 + v2<br />        System.<span style="color: #0000ff">out</span>.println(vr)<br />    }<br />} </pre>

  <br /></div>

<p>When run, the console prints out &quot;36&quot;, as we'd well expect. </p>

<p>But suppose we want to look at those values of v1 and v2 along the way, perhaps as part of a logging operation, or perhaps because you're just screwing around with some ideas in your head and you don't want to bother to fire up an IDE with Scala support in it. So you decide to spit those values to a console: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        def v1 = (stack.pop()).asInstanceOf[Int]<br />        def v2 = (stack.pop()).asInstanceOf[Int]<br />        System.<span style="color: #0000ff">out</span>.println(v1)<br />        System.<span style="color: #0000ff">out</span>.println(v2)<br />        def vr = v1 + v2<br />        System.<span style="color: #0000ff">out</span>.println(vr)<br />    }<br />} </pre>

  <br /></div>

<p>And then something *very* different happens; you get &quot;24&quot;, &quot;12&quot;, and then a NoSuchElementException. </p>

<p>If you're like me the first time I ran into this, your first reaction is, &quot;Eh?&quot;. Actually, if you're like me, when you're programming, your profanity filters are probaby at an ebb, so your first reaction is &quot;WTF?!?&quot;, said with great gusto and emphasis. Which has a tendency to get some strange looks when you're at a Denny's doing your research, I will admit. Particularly when it's at 3 AM in the morning. And the bar crowd is in full alcoholic haze and slightly nervous about the long-haired, goatee-sporting guy in his headphones, wearing his black leather jacket and swearing like a drunken sailor at his laptop. But I digress. </p>

<p>What is Scala doing here? </p>

<p>Turns out this is exactly as the language designers intended, but it's subtle. (Or maybe it's just subtle to me at 3AM when I'm pumped full of caffeine.) </p>

<p>Let's take this a different way: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        def v1 = (stack.pop()).asInstanceOf[Int]<br />        def v2 = (stack.pop()).asInstanceOf[Int]<br />        System.<span style="color: #0000ff">out</span>.println(stack)<br />    }<br />} </pre>

  <br /></div>

<p>When run, the console prints &quot;Stack(12, 24)&quot;, which *really* starts to play with your mind when you're a little short on sleep and a little high on Diet Coke. At first glance, it looks like Scala is broken somehow--after all, those &quot;pop&quot; operations are supposed to modify the Stack against which they're operating, just as the push()es do. So why is the stack convinced that it still holds the values of 12 and 24? </p>

<p>Because Scala hasn't actually executed those pop()s yet. </p>

<p>The &quot;def&quot; keyword, it turns out, isn't what I wanted here--what I wanted (and in retrospect it’s painfully obvious) was a &quot;val&quot;, instead, in order to force the execution of those statements and capture the value into a local value (an immutable local variable). The &quot;def&quot; keyword, instead, creates a function binding that waits for formal execution before evaluating. So that when I previously said </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        def v1 = (stack.pop()).asInstanceOf[Int]<br />        def v2 = (stack.pop()).asInstanceOf[Int]<br />        def vr = v1 + v2<br />        System.<span style="color: #0000ff">out</span>.println(vr)<br />    }<br />} </pre>

  <br /></div>

<p>… what in fact I was saying was this: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        def v1 = (stack.pop()).asInstanceOf[Int]<br />        def v2 = (stack.pop()).asInstanceOf[Int]<br />        System.<span style="color: #0000ff">out</span>.println(v1 + v2)<br />    }<br />} </pre>

  <br /></div>

<p>… which is the same as: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        System.<span style="color: #0000ff">out</span>.println((stack.pop()).asInstanceOf[Int] + (stack.pop()).asInstanceOf[Int])<br />    }<br />} </pre>

  <br /></div>

<p>… which, when we look back at my most recent &quot;debugging&quot; version of the code, substituting the &quot;def&quot;ed versions of v1 and v2 (and vr) where they're used, makes the reason for the NoSuchElementException become entirely more clear: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def main(args : Array[String]) =<br />    {<br />        import scala.collection.mutable.Stack<br />        var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />        stack.push(12)<br />        stack.push(24)<br />        System.<span style="color: #0000ff">out</span>.println((stack.pop()).asInstanceOf[Int])<br />        System.<span style="color: #0000ff">out</span>.println((stack.pop()).asInstanceOf[Int])<br />        System.<span style="color: #0000ff">out</span>.println((stack.pop()).asInstanceOf[Int] + (stack.pop()).asInstanceOf[Int])<br />    }<br />} </pre>

  <br /></div>

<p>Now, normally, this would probably set off all kinds of alarm bells in your head, but the reaction that went off in mine was &quot;COOL!&quot;, the reasons for which revolve around the concept of &quot;laziness&quot;; in a functional language, we frequently don't want to evaluate the results right away, instead preferring to defer their execution until actually requiring it. In fact, many functional languages—such as Haskell—take laziness to new heights, baking it directly into the language definition and assuming laziness everywhere, so much so that you have to take special steps to avoid it. There’s a variety of reasons why this is advantageous, but I’ll leave those discussions to the Haskellians of the world, like Matt Podwysocki and Simon Peyton-Jones.</p>

<p>From a Scalist’s perspective, laziness is still a useful tool to have in your toolbox. Suppose you have a really powerful function that calculates PI to a ridiculous number of decimal places. In Java, you might be tempted to do something like this: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">class</span> MyMath<br />{<br />  <span style="color: #0000ff">public</span> <span style="color: #0000ff">static</span> final <span style="color: #0000ff">double</span> PI = calculatePiToARidiculousNumberOfPlaces();<br />  <span style="color: #0000ff">private</span> <span style="color: #0000ff">static</span> <span style="color: #0000ff">double</span> calculatePiToARidiculousNumberOfPlaces()<br />  {<br />    <span style="color: #008000">// implementation left to the reader's imagination</span><br />    <span style="color: #008000">// imagine it being &quot;really cool&quot;</span><br />  }<br />} </pre>

  <br /></div>

<p>The problem with this is that if that method takes any length of time to execute, it's being done during class initialization during its ClassLoading phase, and aside from introducing a window of time where the class *could* be used before that initialization is finished (it's subtle, it's not going to happen very often, but it can, according to older versions of the JVM Spec), the problem is that the time required to do that initialization is paid for *regardless of whether you use PI*. In other words, the classic Stroustrup-ian &quot;Don't pay for it if you don't use it&quot; principle is being completely tossed aside.</p>

<p>In Scala, using the &quot;def&quot; keyword here, aside from avoiding the need for the additional decorators, completely eliminates this cost--people won't need the value of PI until it becomes used: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def PI = calculatePiToARidiculousNumberOfPlaces()<br />    def calculatePiToARidiculousNumberOfPlaces() =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Calculating PI&quot;</span>)<br />        3 + 0.14<br />    }<br />    def main(args : Array[String]) =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Entering main&quot;</span>)<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;PI = &quot;</span> + PI)<br />    }<br />} </pre>

  <br /></div>

<p>(In fact, you'd probably just write it without the calculating method definition, since it's easier that way, but bear with me.) </p>

<p>When you run this, of course, we see PI being calculated after main()'s been entered, thus proving that PI is being calculated only on demand, not ahead of time, as a public-static-final-constant would be. </p>

<p>The problem with this approach is, you end up calculating PI on <em>each</em> access: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    def PI = calculatePiToARidiculousNumberOfPlaces()<br />    def calculatePiToARidiculousNumberOfPlaces() =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Calculating PI&quot;</span>)<br />        3 + 0.14<br />    }<br />    def main(args : Array[String]) =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Entering main&quot;</span>)<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;PI = &quot;</span> + PI)<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;PI = &quot;</span> + PI)<br />            <span style="color: #008000">// prints twice! Not good!</span><br />    }<br />} </pre>

  <br /></div>

<p>Which sort of defeats the advantage of lazy evaluation. </p>

<p>This got me wondering--in F#, we have lazy as a baked-in concept (sort of), such that when I write </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">#light<br />let sixty = lazy (30 + 30)<br />System.Console.WriteLine(sixty) </pre>

  <br /></div>

<p>What I see on the console is not 60, but a Lazy&lt;T&gt; type instance, which effectively defers execution until it's Force() method is invoked (among other scenarios). This means I can write things like </p>

<p>let reallyBigList = lazy ([1..1000000000000] |&gt; complexCalculation |&gt; anotherComplexCalcuation) </p>

<p>without fear of blowing the stack or heap apart, since laziness means the list won't actually be calculated until it's forced; we can see this from the following (from the F# interactive console): </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">&gt; let sixtyWithSideEffect = lazy (printfn <span style="color: #006080">&quot;Hello world&quot;</span>; 30+30);;<br />val sixtyWithSideEffect: Lazy&lt;<span style="color: #0000ff">int</span>&gt;<br />&gt; sixtyWithSideEffect.Force();;<br />Hello world<br />val it : <span style="color: #0000ff">int</span> = 60<br />&gt; sixtyWithSideEffect.Force();;<br />val it : <span style="color: #0000ff">int</span> = 60 </pre>

  <br /></div>

<p>(Examples taken from the excellent <em>Expert F#</em> by Syme/Granicz/Cisternino; highly recommended, if a touch out-of-date to the current language definition. I expect Chris Smith’s <em>Programming F#</em>, from O’Reilly, to correct that before too long.)</p>

<p>It would be nice if something similar were doable in Scala. Of course, once I start looking for it, it makes itself visible, in the wonderful Venners/Odersky/Spoon book, <em>Programming In Scala</em>, p. 444: </p>

<blockquote>
  <p>You can use pre-initialized fields to simulate precisely the initialization behavior 
    <br />of class constructor arguments. Sometimes, however, you might prefer 

    <br />to let the system itself sort out how things should be initialized. This can 

    <br />be achieved by making your val definitions lazy. If you prefix a val definition 

    <br />with a lazy modifier, the initializing expression on the right-hand side 

    <br />will only be evaluated the first time the val is used. </p>

  <p>[...] </p>

  <p>This is similar to the situation where x is defined as a parameterless 
    <br />method, using a def. However, unlike a def a lazy val is never evaluated 

    <br />more than once. In fact, after the first evaluation of a lazy val the result of the 

    <br />evaluation is stored, to be reused when the same val is used subsequently. </p>
</blockquote>

<p>Perfect! The key, then, is to define PI like so: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">object</span> App<br />{<br />    lazy val PI = calculatePiToARidiculousNumberOfPlaces()<br />    def calculatePiToARidiculousNumberOfPlaces() =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Calculating PI&quot;</span>)<br />        3 + 0.14<br />    }<br />    def main(args : Array[String]) =<br />    {<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;Entering main&quot;</span>)<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;PI = &quot;</span> + PI)<br />        System.<span style="color: #0000ff">out</span>.println(<span style="color: #006080">&quot;PI = &quot;</span> + PI)<br />            <span style="color: #008000">// prints once! Awesome!</span><br />    }<br />} </pre>

  <br /></div>

<p>That means, if I apply it to my Stack example from before, I should get the same deferred-execution properties of the &quot;def&quot;-based version ... </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">def main(args : Array[String]) =<br />{<br />    import scala.collection.mutable.Stack<br />    var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />    stack.push(12)<br />    stack.push(24)<br />    lazy val v1 = (stack.pop()).asInstanceOf[Int]<br />    lazy val v2 = (stack.pop()).asInstanceOf[Int]<br />    System.<span style="color: #0000ff">out</span>.println(stack)<br />        <span style="color: #008000">// prints out &quot;Stack(12,24)</span><br />} </pre>

  <br /></div>

<p>... but if I go back to the version that blows up because the stack is empty, using lazy val works exactly the way I would want it to: </p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet">def main(args : Array[String]) =<br />{<br />    import scala.collection.mutable.Stack<br />    var stack : Stack[Any] = <span style="color: #0000ff">new</span> Stack()<br />    stack.push(12)<br />    stack.push(24)<br />    lazy val v1 = (stack.pop()).asInstanceOf[Int]<br />    lazy val v2 = (stack.pop()).asInstanceOf[Int]<br />    System.<span style="color: #0000ff">out</span>.println(v1)<br />    System.<span style="color: #0000ff">out</span>.println(v2)<br />    lazy val vr = v1 + v2<br />    System.<span style="color: #0000ff">out</span>.println(vr)<br />        <span style="color: #008000">// prints 12, 24, then 36</span><br />        <span style="color: #008000">// and no exception!</span><br />} </pre>

  <br /></div>

<p>Nice. </p>

<p>So, it turns out that my accidental use of &quot;def&quot; inside the compareOp function behaves exactly the way the language designers wanted it to, which is not surprising, and that Scala provides nifty abilities to defer processing or extraction of values until called for.</p>

<p>Curiously, the two languages differ in how laziness is implemented; in F#, the lazy modifier defines the type to be a Lazy&lt;T&gt; instance, an ordinary type that we can pass around from F# to C# and back again as necessary (in much the same way that C# defined nullable types to be instances of Nullable&lt;T&gt; under the hood). We can see that from the interactive console output above, and from the fact that we call Force() on the instance to evaluate its value. </p>

<p>In Scala, however, there is no corresponding Lazy[T] type; instead, the PI() method is defined to determine whether or not the value has already been evaluated:</p>

<div style="border-bottom: silver 1px solid; border-left: silver 1px solid; padding-bottom: 4px; line-height: 12pt; background-color: #f4f4f4; margin: 20px 0px 10px; padding-left: 4px; width: 97.5%; padding-right: 4px; font-family: &#39;Courier New&#39;, courier, monospace; max-height: 200px; font-size: 8pt; overflow: auto; border-top: silver 1px solid; cursor: text; border-right: silver 1px solid; padding-top: 4px" id="codeSnippetWrapper">
  <pre style="border-bottom-style: none; padding-bottom: 0px; line-height: 12pt; border-right-style: none; background-color: #f4f4f4; margin: 0em; padding-left: 0px; width: 100%; padding-right: 0px; font-family: &#39;Courier New&#39;, courier, monospace; border-top-style: none; color: black; font-size: 8pt; border-left-style: none; overflow: visible; padding-top: 0px" id="codeSnippet"><span style="color: #0000ff">public</span> <span style="color: #0000ff">double</span> PI();<br />  Code:<br />   0:   aload_0<br />   1:   getfield        #135; <span style="color: #008000">//Field bitmap$0:I</span><br />   4:   iconst_1<br />   5:   iand<br />   6:   iconst_0<br />   7:   if_icmpne       48<br />   10:  aload_0<br />   11:  dup<br />   12:  astore_1<br />   13:  monitorenter<br />   14:  aload_0<br />   15:  getfield        #135; <span style="color: #008000">//Field bitmap$0:I</span><br />   18:  iconst_1<br />   19:  iand<br />   20:  iconst_0<br />   21:  if_icmpne       42<br />   24:  aload_0<br />   25:  aload_0<br />   26:  invokevirtual   #137; <span style="color: #008000">//Method calculatePiToARidiculousNumberOfPlaces:()D</span><br />   29:  putfield        #139; <span style="color: #008000">//Field PI:D</span><br />   32:  aload_0<br />   33:  aload_0<br />   34:  getfield        #135; <span style="color: #008000">//Field bitmap$0:I</span><br />   37:  iconst_1<br />   38:  ior<br />   39:  putfield        #135; <span style="color: #008000">//Field bitmap$0:I</span><br />   42:  getstatic       #145; <span style="color: #008000">//Field scala/runtime/BoxedUnit.UNIT:Lscala/runtime/BoxedUnit;</span><br />   45:  pop<br />   46:  aload_1<br />   47:  monitorexit<br />   48:  aload_0<br />   49:  getfield        #139; <span style="color: #008000">//Field PI:D</span><br />   52:  dreturn<br />   53:  aload_1<br />   54:  monitorexit<br />   55:  athrow<br />  Exception table:<br />   from   to  target type<br />    14    48    53   any</pre>

  <br /></div>

<p>If you look carefully at the bytecode, the implementation of PI is checking a bitmask field (!) to determine if the first bit is flipped (!) to know whether or not the value is held in the local field PI, and if not, calculate it and store it there. This means that Java developers will just need to call PI() over and over again, rather than have to know that the instance is actually a Lazy[T] on which they need to call Value or Force (such as one would from C# in the F# case). Frankly, I don’t know at this point which approach I prefer, but I’m slightly leaning towards the Scala version for now. (If only Java supported properties, then the syntax “MyMath.PI” would look like a constant, act lazily, and everything would be great.)</p>

<p>(It strikes me that the F# developer looking to write something C#-accessible need only tuck the Lazy&lt;T&gt; instance behind a property accessor and the problem goes away, by the way; it would just be nicer to not have to do anything special on either side, to have my laziness and Force() it, too. Pipe dream, perhaps.)</p>

<p>In retrospect, I could wish that Scala weren't *quite* so subtle in its treatment of &quot;def&quot; vs &quot;val&quot;, but now that I'm aware of it, it'll (hopefully) not bite me quite so subtly in the sensitive spots of my anatomy again.</p>

<p>And any experience in which you learn something is a good one, right?</p>
 
