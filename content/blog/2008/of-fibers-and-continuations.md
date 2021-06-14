+++
date = "2008-01-10T05:28:00.1120467-08:00"
draft = false
title = "Of Fibers and Continuations"
aliases = [
	"/2008/01/10/Of+Fibers+And+Continuations.aspx"
]
categories = [
	".NET","Java/J2EE","Languages","Ruby"
]
concepts = ["Languages"]
languages = ["Ruby"]
platforms = [".NET", "Java/J2EE"]
 
+++
<p><a href="http://pragdave.blogs.pragprog.com/pragdave/2007/12/pipelines-using.html">Dave explains Ruby fibers</a>, as they're called in Ruby 1.9. Now, before I get going here, let me explain my biases up front: in the Windows world, we've had fibers for near on to half-decade, I think, and they're basically programmer-managed cooperative tasks. In other words, they're much like threads before threads were managed by the operating system--you decide when to switch to a different fiber, you manage the scheduling, the fiber just gives you a data structure and some basic housekeeping. (I know I'm oversimplifying and glossing over details, but that's the core, as I remember it. It's been a while since I tried to use them.) Legend has it that fibers were introduced into the Win32 API on behalf of the SQL Server team, who need to take that kind of control over thread scheduling in order to best manage the CPU, but here's the rub: they never served much purpose otherwise.</p> <p>Frankly, nobody could figure out what to do with them. I'm beginning to wonder if it was because our languages of the time (C, C++) didn't have any real idea of freezing execution of a task at a certain point, putting it aside, then coming back to it and restoring it. In other words, the very behavior we see out of a continuation.</p> <p>In Dave's explanation, Ruby fibers take on a different meaning. According to Dave's explanation:</p> <blockquote> <p>A fiber is somewhat like a thread, except you have control over when it gets scheduled. Initially, a fiber is suspended. When you resume it, it runs the block until the block finishes, or it hits a <code>Fiber.yield</code>. This is similar to a regular block yield: it suspends the fiber and passes control back to the <code>resume</code>. Any value passed to <code>Fiber.yield</code> becomes the value returned by <code>resume</code>.</p></blockquote> <p>They sound a lot like Win32 fibers combined with Python generators, with a touch more by way of API support. (The Win32 API version was codified using C bindings, for starters, not objects.) But Dave quickly points out that fibers can become full-fledged coroutines by allowing fibers to transfer control from one to another, which is interesting, though I suspect lots of people will explore this feature and write lots of bad code as a result. Oh, well: bright shiny new toys have that effect on programmers sometimes.</p> <p>He then goes on to describe how Ruby can provide pipelines:</p> <blockquote> <p>As a starting point, let's write two fibers. One's a generator—it creates a list of even numbers. The second is a consumer. All it does it accept values from the generator and print them. We'll make the consumer stop after printing 10 numbers.  <p>&nbsp;&nbsp;&nbsp; evens = Fiber.new do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value = 0<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loop do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fiber.yield value<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; value += 2<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp; end  <p>&nbsp;&nbsp;&nbsp; consumer = Fiber.new do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10.times do<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; next_value = evens.resume<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; puts next_value<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end<br>&nbsp;&nbsp;&nbsp; end  <p>&nbsp;&nbsp;&nbsp; consumer.resume  <p>Note how we had to use resume to kick off the consumer. Technically, the consumer doesn't have to be a Fiber, but, as we'll see in a minute, making it one gives us some flexibility.</p></blockquote> <p>Ah, the classic producer-consumer example. Gotta love it. The interesting thing here, though, is that evens, prior to the call to resume, has done <em>nothing</em>. No execution has taken place. In essence, the fiber here is in <em>deferred execution</em> mode (now, <a href="http://blogs.msdn.com/charlie/archive/2007/12/09/deferred-execution.aspx">where have I heard that before</a>?), meaning nothing actually fires until asked for. It then runs until it hits the yield, essentially going to sleep again.</p> <p>Is it me, or does this smell suspiciously like continuations?</p> <p>More interesting, Dave goes on to define the consumer fiber to take the name of a source to resume, then shows how once can abstract the coupling between producer and consumer away even further by creating a filter that only allows multiples of three through the pipeline:</p> <blockquote><pre><code>    def evens
      Fiber.new do
        value = 0
        loop do
          Fiber.yield value
          value += 2
        end
      end
    end

    def multiples_of_three(source)
      Fiber.new do
        loop do
          next_value = source.resume
          Fiber.yield next_value if next_value % 3 == 0
        end
      end
    end

    def consumer(source)
      Fiber.new do
        10.times do
          next_value = source.resume
          puts next_value
        end
      end
    end

    consumer(multiples_of_three(evens)).resume
</code></pre>
<p>Running this, we get the output<pre><code>0
6
12
18
. . .
</code></pre>
<p>This is getting cool. We write little chunks of code, and then combine them to get work done. Just like a pipeline.</p></blockquote>
<p>Actually, instead of calling it a pipeline, let's call it a <em>comprehension</em> and be done with it.</p>
<p>See, Ruby apparently has discovered the joys of functional programming, something that Scala and F# have baked in from the beginning, instead of bolted on from the outside. No offense intended to the Ruby community or to Matz, but I get a little lost as to exactly what Ruby's core concepts are--it's a scripting language, it's a development language, it's a DSL platform, it's object-oriented, it's functional, it's a bird, it's a plane, it's horribly confused.</p>
<p>Dave touches on this point in one of his responses to comments:</p>
<blockquote>
<p>The thing that's interesting to me about Ruby in this context is how much is can bend into multiple paradigms. Haskell does FP way better than Ruby. Smalltalk does OO (marginally) better. But Ruby does them all, and in a way that interoperates nicely.</p></blockquote>
<p>I like a lot of Ruby's core concepts--open classes, mixins, and so on--but I'm worried that Ruby's trying to do too much, much as <a href="http://java.sun.com">another language I know and love</a> is. Frankly, this desire to accommodate the nifty feature of the moment smacks a great deal of Visual Basic, and while VB certainly has its strengths, coherent language design and consistent linguistic facilities is not one of them. It's played havoc with people who tried to maintain code in VB, and it's played hell with the people who try to maintain the VB language. One might try to argue that the Ruby maintainers are just Way Smarter than the Visual Basic maintainers, but I think that sells the VB team pretty short, having met some of them.</p>
<p>Don't get me wrong here, I think it's nifty that Ruby has come around to realize the power of atomic components doing one thing well, passing its results on into the pipeline for something else to process, and this is a large part of why PowerShell is, in my mind, the sleeper programming language of 2008/2009. Pipelines also scale very well, since they encourage immutable state, since the results of each processing step are essentially fed in from the outside and the results are passed back out to the next step in the chain--all state is passed from one step to the next, meaning I can run lots of these pipelines in parallel with no fear of deadlocks or bottlenecks, since each processing step is itself essentially state-free. This is also, in fact, a lot of how original transaction-processing systems were designed, which also scaled pretty well, at least until we got the bright idea to store mutable state in them (*cough* EJB *cough*).</p>
<p>Oh, and for what it's worth, this concept is trivial to do in F#, via the pipeline operator ( "|&gt;" ). Ditto for Scala. If you're going to think in pipelines, you may as well work with a language that has the concept baked in a little more deeply, IMHO. And before the Rubyists beat me over the head about this, Dave himself admits this is true in another comment response:</p>
<blockquote>
<p>Paolo: I don't think Ruby or Smalltalk really do functional programming to any deep level. However, both can be used to implement particular FP constructs (such as generators).</p></blockquote>
<p>And maybe, in the end, that's the important thing: recognizing what aspects of functional programming can be easily lifted into your language of choice and used to make your life simpler. Still, I'm always looking for languages that take the concepts that float in my head and let me express them as first-class constructs, not as duck-taped partial implementations thereof. I felt the same way about doing "objects" in C (back in the Win16 programming day, before C++ Windows frameworks emerged), and about doing "aspects" in Java using interception.</p>
<p>If you're going to think in a concept, you generally want a language that expresses that concept as a first-class citizen, or you'll get frustrated quickly. Ruby's fibers may be the gateway drug for developers to learn functional programming, but they're not going to get it at any deep level until they dive into Haskell or ML or one of its derivatives (Scala or F#). For example, once you see the power inherent in Scala's comprehensions, you never look at a simple for loop the same way again.</p>
<p>Oh, and Groovyists? I'm sure they could do this, but I dunno if it's worth it, given that Groovy and Scala, at some level, are fundamentally interoperable as well. (Note to self: must do a blog post about Groovy calling into Scala code, just to show it can be done. Y'all hold me to that, if you don't see it in a week or two.)</p>
<p>Meanwhile, the link between continuations and Ruby fibers (and Win32 fibers, while we're at it) still tickles at the back of my mind.... But that's a thought waiting to be explored another day.</p>
 
