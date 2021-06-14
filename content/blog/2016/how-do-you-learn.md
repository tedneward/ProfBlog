+++
concepts = ["Psychology", "Philosophy", "Reading"]
date = "2016-01-24T01:22:07-08:00"
languages = ["Java", "Scala", "Groovy", "Clojure", "Kotlin", "C#", "F#", "Visual Basic", "Go", "C++", "Swift", "Objective-C", "Haskell", "Ruby", "Python", "JavaScript", "Erlang", "Elixir", "Elm"]
platforms = ["JVM", "J2EE", "JavaEE", "CLR", "LLVM", "Node", "iOS", "Android", "AWS", "Azure", "GoogleCloud", "Solaris", "Windows", "Mac OS", "Parrot", "Native"]
title = "How do you learn?"

+++

**tl;dr** I've been asked a number of times over the years how, exactly, I approach learning new stuff, whether that
be a new programming language, a new platform, whatever. This is obviously a highly personal (meaning specific to the
individual offering the answer) subject, so my approach may or may not work for you; regardless, I'd suggest to anyone
that they give it a shot and if it works, coolness.

<!--more-->

The first thing to understand about how I approach learning new stuff is that I agree whole-heartedly with our former
Secretary of Defense, Donald Rumsfeld, when he says (said) that there are "three kinds of knowledge":

1. **That which you know you know.** In other words, the stuff that you already know. You have empircal knowledge of the
   subject. I know C++: I know most of the keywords, I know pretty much all of the syntax, I understand the mechanics
   of how the language compiles and what it compiles to, and so on. Personally, I consider myself to "know" a subject
   if I've made use of it, in some fashion, for a moderately complex task. "Hello world" doesn't count (if we're
   speaking of a programming language), but doing one of the [code katas](http://codekata.com/) can, if it's got some
   good "range" to it (doing some I/O, a little algorithmic exercise, and so on).
2. **That which you know you do not know.** I am aware of the subject, but I have not spent much, if any, time on it.
   For myself, however, the key distinction between this category and the following one is, "Do I understand what this
   subject's purpose is? Do I know it's "two-sentence story", and can I tell that story to somebody else?" (I'll talk
   more about the two-sentence story in a second.) This usually implies having done a small bit of reading on the
   subject, or doing that "hello world"/getting-started kind of tutorial. I know enough to have a good idea of where
   this thing fits in the world, but not enough to get started in it without having to do more reading and research.
3. **That which you do not know.** I have no awareness of this subject; I don't even know it exists. Obviously, this
   is hard for me to hold up examples, because if I knew of any, I'd be moving them into the second category already.
   One such possibility is [Kali Linux](https://www.kali.org/), which (from the context of a few articles/books I've
   seen touch on the subject, as well as referencing the website to get its address just now) is apparently a Linux 
   distribution tailor-made for doing security attacks and penetration testing. I have no idea what makes that
   distribution somehow better than any other, so right now I can't really formulate a two-sentence story around it
   other than what you just read. (And even then, one might argue that since I know of it, I am now aware that I
   don't know anything about it, and therefore it goes into category 2 as opposed to this one.)

Confused yet? It's not a hard breakdown, but it turns on the notion of knowledge vs ignorance---I can know a thing,
or I can be aware of a thing and not know anything about it, or I can be ignorant of a thing. (And, of course, others
will interpret the distinctions differently, and that's OK, too. This is just how I apply this to the topics that I
need to know for work-related discussions/engagements/etc.)

So, assuming that somebody or something brings a new thing to my attention, here's (roughly) the process by which
I go learn something new:

### Formulate a two-sentence story on it
The term "two-sentence story" dates back to my time at DevelopMentor. When
we were working out new class materials, the common refrain was, "What's the two-sentence story for this thing?"
In other words, if you could only describe the thing in two sentences, what would they say? Originally, the TSS
was geared more around the class itself---"What's the two-sentence story for this class?"---which is a little
different than coming up with a TSS for a technology as a whole, but I found it a useful mechanism to help identify
and isolate the aspects of a new thing that I care about for a given technology. Some examples:

* AspectJ: Aspect-oriented programming is a flavor of "metaobject programming", a code mechanism that seeks to 
  capture first-class constructs that "cut across" the traditional object-oriented hierarchy, around fields 
  and/or methods, and apply those constructs reusably in multiple cases. AspectJ is a language-based 
  implementation of AOP against the Java language running on the JVM.
* Groovy: Ruby and Java meet up one night in a bar and have a night of passion. Groovy is that love child,
  exhibiting the linguistic tendencies of Ruby, but with the underlying structure and (more or less) common
  language heritage of Java.
* Parrot: A register-oriented virtual machine that seeks to be for dynamic languages what the JVM or CLR were for
  statically-typed object languages (Java and C#). Tied closely at first to the next generation of the Perl
  language, and as a result more or less died with it.
* MongoDB: A schemaless document-oriented database written to run without any platform dependencies (statically-
  linked executables). Mongo looks to provide some of the traditional server-based database experience that is
  familiar and comfortable to those who are used to traditional RDBMS environments, while also channeling the
  "free-form" experience that those from the NoSQL crowd are expecting, including the ability to "scale up" to
  large datasets without having to significantly reprogram the code that accesses it.
* Boo: A Python-based language for the CLR that opens up the compiler pipeline for plugins to view and/or modify
  the AST of the code before execution. Interprets and/or compiles on the CLR.
* CouchDB: A schemaless document-oriented database that embraces HTTP and REST to the n-th degree, simultaneously
  embracing the same sort of "distributed non-centralized" model that is favored by distributed version control
  systems. In other words, Couch doesn't have a single source of truth, but collectively determines what that
  truth might be through replication and optimistic updates.
* Lua: A dynamically-typed tuple-centric scripting language designed to be easily embedded into native platform
  environments, most notably from C/C++ code. It is widely used in the gaming industry, and has a very well-
  designed FFI (foreign function interface) specifically to enable easy interoperability between the "high-level"
  Lua code and the native implementation underneath it.

As you can tell, not all of these are wrapped up in academic language, because in some cases, they are specifically
tied to my own understanding of other things. For example, Groovy being "the love child of that one-night stand
between Ruby and Java" meme, that tells me a whole lot of things---namely, that Groovy runs on the JVM, and can
be seen as "just another Java", but has lots of genetic influence imparted upon it from Ruby. (Not surprising,
considering that James Strachan, when he first started working on the language, wanted very specifically to bring
over some of the things he saw in Ruby.)

The key here is that the two-sentence story is my own story; it's somewhat personal to me, because it keys off of
what other things I know pretty well. I don't expect that my two-sentence story for any given subject, when viewed
alone or outside of my head like this, will actually impart much of anything in terms of actual understanding to
anybody else. It's purely for me.

But obviously, getting to the point of being able to formulate a TSS on it requires some research.

### What is this thing like?
Like most people, I don't have a ton of time, so I need to come to grips with a thing fairly quickly. So when
I'm first looking at a subject, the goal is to find something I already know to which it is similar and/or 
from which it descends or is based. Having made that initial connection, though, doesn't mean that I have
enough knowledge on the thing yet---next, I have to start looking for ways that it's different from the anchor:
how is "A" not like "B"? No two things "A" and "B" are ever perfectly alike, so where are the differences? How
profound are those differences? And does that mean I need a new anchor upon which to rest my understanding of
the new thing?

For example, when I was first learning Ruby, the obvious thing it was similar to was other object-oriented
languages. It's tempting to see it thus as "another Java" or "another C#". However, Ruby is a dynamic O-O, whereas
Java and C# are statically-typed O-O, so that connection is weak. Even weaker, C++ compiles to native code,
whereas Java compiles to bytecode and runs on a virtual machine; Ruby does neither of these things. It is a
straight interpreted language, so that's even less of a comparison. Yes, Java/C# and Ruby both have this notion
of "objects" and "fields" and "methods", but that's like suggesting that a Ferrari and a Mack truck are similar,
in that they both have "engines" and "wheels" and "drivers".

As I started hearing more about Ruby from the Rubyists around me, a more accurate connection started to form
between Ruby and Smalltalk---both are object languages, but both are dynamically-typed, and both support some
very similar kinds of "meta-programming", most notably the idea of "method_missing", where an attempt to invoke
a method on an object that doesn't have said method won't result in a compile-time or runtime error, but instead
potentially be handled by routing the request through a well-defined "trap" that can then examine the method
call at runtime to determine what to do next. (This is how ActiveRecord works, by the way.)

Oh, and the syntax of Ruby was originally pretty Perl-based, but has since mellowed out significantly, to the
point where most Rubyists of reputable fame avoid the Perl-isms, so that it reads a little more "English-like"
now. (With all apologies to those who aren't native English speakers.)

Now, obviously, this isn't a 100% accurate summation of Ruby. JRuby, for example, is an implementation of Ruby
that runs on top of the JVM, and as such, would sort of defy what I said earlier about it being interpreted.
Fair enough. But at that level of nuance, I'm pretty clearly out of category 2 and into category 1.

### What is this thing used for?
One of the best ways to begin to understand a thing is to see what it is used for. For most of us, Ruby came 
to prominence because of Rails. (Several people I knew who were talking a lot about Ruby and RoR at the
time were fond of saying, "Ruby-on-Rails is a domain-specific language for producing web applications.")
The approach was obvious: Ruby was about building web apps quickly. No wories about fine-tuning, no concerns
over performance, the goal was to crank out a new web app quickly.

Rightly or wrongly, that paints Ruby as a higher-level tool, a paint spray-gun, if you will, that will blast
out a ton of stuff quickly, without much concern for the degree of control at the edges. (And that's OK, by
the way, even if it is perhaps a tad misguided in terms of the interpretation of Ruby itself.) That positioning
deliberately put it opposite tools like Java and certainly way far away from C++.

But it also (again, perhaps wrongly) mischaracterized Ruby as "just" a web tool, and as a result Ruby missed
out on the "cross-platform" nature that it represents, something which the JavaScript/Node community is trying
very hard to cash in on.

### Use it!
Assuming that I now have a better grip on the thing, the next step, to take it out of "known unknown" and
bring it into the "known known" is to try and use it on something.

Contrary to the [popular myth](http://www.amazon.com/Great-Myths-Popular-Psychology-Misconceptions/dp/1405131128)
that "everybody learns differently", actually using a thing remains one of the best ways to actually 
grab hold of a subject and keep it. In this particular case, I don't mean just going through an existing
tutorial and repeating the steps, but creating your own project and slogging your way through it from
start to finish. Sometimes, it's helpful to do the same project over and over again, a la a Code Kata, but
sometimes I want to try something new, partly because I want to explore an idea or a concept.

Case in point: Fifteen years ago, I wanted a blog, and at the time, all of the existing ones were just not
what I was looking for. (I don't remember why---I may have just told myself that because I wanted to write
my own, too. I just don't remember.) More to the point, I had this idea about self-modifying JSP pages:
What would the practical implications be, from a coding perspective, if I had a blog implementation that,
like a Wiki, would be modifying itself? In other words, creating a new blog post would be writing a new
JSP page to disk, and subsequent requests to that page would be simply compiling-on-the-fly that JSP, as
per any other JSP page? So I built that implementation (while on vacation with the family at DisneyWorld,
actually), and cool! It worked. There were a few issues with it, though---for example, I had to get a little
creative with servlet filters and use those as the "controllers" in a traditional MVC model---but that
taught me that filters could be just as good, if not better, than servlets as the controller in an MVC
model. (Which is in turn what made NodeJS "middleware" make so much sense to me, fifteen years later.)

Another example: A year or two ago, a buddy of mine came to me and wanted to know how hard it would be to 
build a web app that would allow volunteers to track their hours and make it easier to generate the email 
reports he had to send on. (He was a section leader, responsible for the pacific Northwest section of a volunteer 
organization, and the owning company wanted monthly emails about which people were doing what work at which locations.
He was having to chase after people, then hand-assimilate their emails into a larger email and send that on
to the company, which was costing him hours each month that he could be better using.) At the time, I was
learning AngularJS, so I thought, "Sure, why not?" I built out a rough prototype for him, AngularJS on
the front-end, but (in a daring architectural move!), I decided to try going "no-server", and instead
use the REST API feature offered by [MongoLab](http://www.mongolab.com) to a MongoDB instance in the cloud.
It worked, but I fought with AngularJS all the damn time, and thank God he never really started using it
in any kind of Production-like capacity, because that code was an absolute mess. It wasn't until the very
end of working on it that I started to see "the Angular Way", and by then, I'd have had to rip it all up
and start over. (I kept trying to use it as a kind of bastardized jQuery, and that didn't work out so well.)

These "forcing function" projects are generally projects that aren't anywhere close to production requirements,
and usually focused around my own interest and/or issues. The recent "DevOpsing the Blog" projects are a
good example of that: I had a problem, I decided to explore how to use TeamCity to fix it, and lo, the
results. (That said, a commenter suggested what I think may be [a much better solution](http://ifttt.com)
to the automated posting to Twitter and LinkedIn, and I'm exploring that now, too. If you got to this
post from my Facebook feed, then the Facebook integration---which I'm not sure if I'll keep, we'll see---works,
and I just have to decide which approach I want to keep.)

"Forcing function" projects ideally will be projects I can throw away and walk away from, because sometimes,
the attempt to use a particular tool or a particular approach will just fail spectacularly, and the resulting
mess will be something nobody, particularly me, wants to support. So it's always better NOT to use a project
for which I am getting paid as a forcing function project. (The sole caveat: If the client knows that this
is a project that I am using as a "forcing function" project, and they verbally and contractually agree to
pay me to explore it, that's a different story. Anything less is, in my mind, a violation of professional
ethics.) But the project will hopefully be non-trivial (no CRUD apps), and should be something a bit larger
than what I see in the tool's tutorial section.

And in some cases, it can be helpful to reuse a forcing function---for example, the blog. I might re-do
that buddy's volunteer system in something like [MeteorJS](https://www.meteor.com), just to see how well
it would work and to compare the two approaches.

In any event, doing a forcing-function project like this is usually sufficient to take something from
category 2 into category 1, and from there, I tend to leave it be.

### Summary
There's probably a few other tricks that I'm forgetting about right this second (or may not even realize
I'm doing, until I catch myself doing it), and if something comes up, I'll append/update the post. But
for now, that's basically where it goes.


