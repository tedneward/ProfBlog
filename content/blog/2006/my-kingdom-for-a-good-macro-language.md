+++
date = "2006-03-11T19:23:47.7642032-08:00"
draft = false
title = "My kingdom for a good macro language!"
aliases = [
	"/2006/03/12/My+Kingdom+For+A+Good+Macro+Language.aspx"
]
categories = [
	"Java/J2EE",".NET","C++","Ruby","XML Services"
]
concepts = ["XML Services"]
languages = ["C++", "Ruby"]
platforms = ["Java/J2EE", ".NET"]
 
+++
<p>Much of the power, it seems, of languages like Ruby or Nemerle or LISP derives from the ability to create chunks of code that operate in turn on the code itself; a long-standing meme of the LISP world is that "code is data", meaning it can be manipulated and twisted and tweaked in structural ways before being executed. And this isn't the first time we've experimented with this idea: CLOS, Common List Object System, was where Gregor Kiczales, of AspectJ fame, cut his teeth on the AOP concepts, largely because it seemed to him that having a completely open meta-object protocol was too dangerous--but that's another story.</p>

<p>So given that everybody's going ga-ga over Ruby's MOP/metaprogramming facilities, it occurs to me, is what we're really after an MOP for Java? Because such things exist already in the academic world--see OpenJava, for example. Is that what Java would need to do to evolve and take back the productivity label? Is the lack of productivity in Java (the chief complaint of Java today, according to Bruce Tate) due directly to its statically-typed nature, or is it simply the inability to twist the language in ways that are closer to what the programming staff really needs and wants? After all, if you take away some of the MOP features that Ruby uses <a href="http://blogs.tedneward.com/2006/03/02/Scala+Pt+2+Brevity.aspx" target="_blank">to make the Person class pretty brief</a>, such as the attr_reader and attr_writer manipulators, then a lot of Ruby's terseness goes away, too.</p>

<p>Not that functional languages aren't still a good way to go--and I will continue the discussion of Scala, largely because there's some nifty stuff there we haven't touched yet--but I'm becoming more and more convinced that the problem with Java isn't in its statically-typed nature, but in the language we use to generate bytecode for the platform. (.NET may have some better answers here, given Microsoft's greater friendliness to languages on their platform, but it's just another platform similar to the JVM in a lot of ways, and as such has the same drawbacks and benefits as Java does in this regard.)</p>

<p>So where are all the good macro-friendly tools/languages for Java? (And that means, "macros as from LISP", not "macros as from C". Frankly, C++ could use a good MOP, too, but that's another story for another day...)</p>
 
