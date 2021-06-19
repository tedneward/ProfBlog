title=Can Dynamic Languages Scale? Yes
date=2008-01-23
type=post
tags=industry, ruby, clr, jvm, development processes, languages
status=published
description=In which I discuss dynamic languages and their abilities.
~~~~~~

The recent <a href="http://blogs.cnet.com/8301-13505_1-9847739-16.html?part=rss&amp;subj=news&amp;tag=2547-1_3-0-20">"failure" of the Chandler PIM project</a> generated the question, <a href="http://www.theserverside.com/news/thread.tss?thread_id=48180">"Can Dynamic Languages Scale?"</a> on TheServerSide, and, as is all too typical these days, it turned into a "You suck"/"No you suck" flamefest between a couple of posters to the site.

<!--more-->

I now make the perhaps vain attempt to address the question meaningfully.

### What do you mean by "scale"?
There's an implicit problem with using the word "scale" here, in that we can think of a language scaling in one of two very orthogonal directions:

* Size of project, as in lines-of-code (LOC)
* Capacity handling, as in "it needs to scale to 100,000 requests per second"

<p>Part of the problem I think that appears on the TSS thread is that the posters never really clearly delineate the differences between these two. Assembly language can scale(2), but it can't really scale(1) very well. Most people believe that C scales(2) well, but doesn't scale(1) well. C++ scores better on scale(1), and usually does well on scale(2), but you get into all that icky memory-management stuff. (Unless, of course, you're using the Boehm GC implementation, but that's another topic entirely.)

Scale(1) is a measurement of a language's ability to extend or enhance the <em>complexity budget</em> of a project. For those who've not heard the term "complexity budget", I heard it first from Mike Clark (though I can't find a citation for it via Google--if anybody's got one, holler and I'll slip it in here), he of Pragmatic Project Automation fame, and it's essentially a statement that says "Humans can only deal with a fixed amount of complexity in their heads. Therefore, every project has a fixed complexity budget, and the more you spend on infrastructure and tools, the less you have to spend on the actual business logic." In many ways, this is a reflection of the ability of a language or tool to raise the level of abstraction--when projects began to exceed the abstraction level of assembly, for example, we moved to higher-level languages like C to help hide some of the complexity and let us spend more of the project's complexity budget on the program, and not with figuring out which register needed to have the value of the interrupt to be invoked. This same argument can be seen in the argument against EJB in favor of Spring: too much of the complexity budget was spent in getting the details of the EJB beans correct, and Spring reduced that amount and gave us more room to work with. Now, this argument is at the core of the Ruby/Rails-vs-Java/JEE debate, and implicitly it's obviously there in the middle of the room in the whole discussion over Chandler.

Scale(2) is an equally important measurement, since a project that cannot handle the expected user load during peak usage times will have effectively failed just as surely as if the project had never shipped in the first place. Part of this will be reflected in not just the language used but also the tools and libraries that are part of the overall software footprint, but choice of language can obviously have a major impact here: Erlang is being tossed about as a good choice for high-scale systems because of its intrinsic Actors-based model for concurrent processing, for example.

Both of these get tossed back and forth rather carelessly during this debate, usually along the following lines:

* Pro-Java (and pro-.NET, though they haven't gotten into this particular debate so much as the Java guys have) adherents argue that a dynamic language cannot scale(1) because of the lack of type-safety commonly found in dynamic languages. Since the compiler is not there to methodically ensure that parameters obey a certain type contract, that objects are not asked to execute methods they couldn't possibly satisfy, and so on. In essence, strongly-typed languages are theorem provers, in that they take the assertion (by the programmer) that this program is type-correct, and validate that. This means less work for the programmer, as an automated tool now runs through a series of tests that the programmer doesn't have to write by hand; as one contributor to the TSS thread <a href="http://www.theserverside.com/news/thread.tss?thread_id=48180#245674">put it</a>:  

	> "With static languages like Java, we get a select subset of code tests, with 100% code coverage, every time we compile. We get those tests for "free". The price we pay for those "free" tests is static typing, which certainly has hidden costs."
	
	Note that this argument frequently derails into the world of IDE support and refactoring (as its witnessed on the TSS thread), pointing out that Eclipse and IntelliJ provide powerful automated refactoring support that is widely believed to be impossible on dynamic language platforms.  
	
* Pro-Java adherents also argue that dynamic languages cannot scale(2) as well as Java can, because those languages are built on top of their own runtimes, which are arguably vastly inferior to the engineering effort that goes into the garbage collection facilities found in the JVM Hotspot or CLR implementations.
	
* Pro-Ruby (and pro-Python, though again they're not in the frame of this argument quite so much) adherents argue that the dynamic nature of these languages means less work during the creation and maintenance of the codebase, resulting in a far fewer lines-of-code count than one would have with a more verbose language like Java, thus implicitly improving the scale(1) of a dynamic language.
	On the subject of IDE refactoring, scripting language proponents point out that the original refactoring browser was an implementation built for (and into) Smalltalk, one of the world's first dynamic languages.
	
* Pro-Ruby adherents also point out that there are plenty of web applications and web sites that scale(2) "well enough" on top of the MRV (Matz's Ruby VM?) interpreter that comes "out of the box" with Ruby, despite the widely-described fact that MRV Ruby Threads are what Java used to call "green threads", where the interpreter manages thread scheduling and management entirely on its own, effectively using one native thread underneath.

* Both sides tend to get caught up in "you don't know as much as me about this" kinds of arguments as well, essentially relying on the idea that the less you've coded in a language, the less you could possibly know about that language, and the more you've coded in a language, the more knowledgeable you must be. Both positions are fallacies: I know a great deal about D, even though I've barely written a thousand lines of code in it, because D inherits much of its feature set and linguistic expression from both Java and C++. Am I a certified expert in it? Hardly--there are likely dozens of D idioms that I don't yet know, and certainly haven't elevated to the state of intuitive use, and those will come as I write more lines of D code. But that doesn't mean I don't already have a deep understanding of how to design D programs, since it fundamentally remains, as its genealogical roots imply, an object-oriented language. Similar rationale holds for Ruby and Python and ECMAScript, as well as for languages like Haskell, ML, Prolog, Scala, F#, and so on: the more you know about "neighboring" languages on the linguistic geography, the more you know about that language in particular. If two of you are learning Ruby, and you're a Python programmer, you already have a leg up on the guy who's never left C++. Along the other end of this continuum, the programmer who's written half a million lines of C++ code and still never uses the "private" keyword is <em>not</em> an expert C++ programmer, no matter what his checkin metrics claim. (And believe me, I've met way too many of these guys, in more than just the C++ domain.)

A couple of thoughts come to mind on this whole mess.

### Just how refactorable are you?
First of all, it's a widely debatable point as to the actual refactorability of dynamic languages. On NFJS speaker panels, Dave Thomas (he of the PickAxe book) would routinely admit that not all of the refactorings currently supported in Eclipse were possible on a dynamic language platform given that type information (such as it is in a language like Ruby) isn't present until runtime. He would also take great pains to point out that simple search-and-replace across files, something any non-trivial editor supports, will do many of the same refactorings as Eclipse or IntelliJ provides, since type is no longer an issue. Having said that, however, it's relatively easy to imagine that the IDE could be actively "running" the code as it is being typed, in much the same way that Eclipse is doing constant compiles, tracking type information throughout the editing process. This is an area I personally expect the various IDE vendors will explore in depth as they look for ways to capture the dynamic language dynamic (if you'll pardon the pun) currently taking place.

### Who exactly are you for?
What sometimes gets lost in this discussion is that not all dynamic languages need be for programmers; a tremendous amount of success has been achieved by creating a core engine and surrounding it with a scripting engine that non-programmers use to exercise the engine in meaningful ways. Excel and Word do it, Quake and Unreal (along with other equally impressively-successful games) do it, UNIX shells do it, and various enterprise projects I've worked on have done it, all successfully. A model whereby core components are written in Java/C#/C++ and are manipulated from the UI (or other "top-of-the-stack" code, such as might be found in nightly batch execution) by these less-rigorous languages is a powerful and effective architecture to keep in mind, particularly in combination with the next point....

### Where do you run again?
With the release of JRuby, and the work on projects like IronRuby and Ruby.NET, it's entirely reasonable to assume that these dynamic languages can and will now run on top of modern virtual machines like the JVM and the CLR, completely negating arguments 2 and 4. While a dynamic language will usually take some kind of performance and memory hit when running on top of VMs that were designed for statically-typed languages, work on the DLR and the MLVM, as well as enhancements to the underlying platform that will be more beneficial to these dynamic language scenarios, will reduce that. Parrot may change that in time, but right now it sits at a 0.5 release and doesn't seem to be making huge inroads into reaching a 1.0 release that will be attractive to anyone outside of the "bleeding-edge" crowd.

### So where does that leave us?
The allure of the dynamic language is strong on numerous levels. Without having to worry about type details, the dynamic language programmer can typically slam out more work-per-line-of-code than his statically-typed compatriot, given that both write the same set of unit tests to verify the code. However, I think this idea that the statically-typed developer must produce the same number of unit tests as his dynamically-minded coworker is a fallacy--a large part of the point of a compiler is to provide those same tests, so why duplicate its work? Plus we have the guarantee that the compiler will always execute these tests, regardless of whether the programmer using it remembers to write those tests or not.

Having said that, by the way, I think today's compilers (C++, Java and C#) are pretty weak in the type expressions they require and verify. Type-inferencing languages, like ML or Haskell and their modern descendents, F# and Scala, clearly don't require the degree of verbosity currently demanded by the traditional O-O compilers. I'm pretty certain this will get fixed over time, a la how C# has introduced <a href="http://blogs.tedneward.com/2005/09/22/Language+Innovation+C+30+Explained.aspx">implicitly typed variables</a>.

Meanwhile, why the rancor between these two camps? It's eerily reminiscent of the ill-will that flowed back and forth between the C++ and Java communities during Java's early days, leading me to believe that it's more a concern over job market and emplyability than it is a real technical argument. In the end, there will continue to be a ton of Java work for the rest of this decade and well into the next, and JRuby (and Groovy) afford the Java developer lots of opportunities to learn those dynamic languages and still remain relevant to her employer.

***It's as Marx said, lo these many years ago: "From each language, according to its abilities, to each project, according to its needs."***

Oh, except Perl. Perl just sucks, period. :-)

### PostScript
I find it deeply ironic that the news piece TSS cited at the top of the discussion claims that the Chandler project failed due to mismanagement, not its choice of implementation language. It doesn't even mention what language was used to build Chandler, leading me to wonder if anybody even read the piece before choosing up their sides and throwing dirt at one another.

