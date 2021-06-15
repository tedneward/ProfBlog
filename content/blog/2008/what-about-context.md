+++
date = "2008-01-29T17:41:42.0936612-08:00"
draft = false
title = "What about Context?"
aliases = [
	"/2008/01/30/What+About+Context.aspx"
]
categories = [
	
]
concepts = []
languages = []
platforms = []
 
+++
<p>Andrew Wild emails me:  <blockquote> <p>I vaguely remember one of your blog posts in which you went into a bit of an exposition of 'context'. <br>Did you ever come up with anything solid or did you wind up talking yourself in self-referential circles? </p></blockquote> <p>Because that post was actually a part of the old weblog hosted at neward.net, I decided to repost it and the followup discussion to this blog in order to make it available again, although the WayBack Machine also has <a href="http://web.archive.org/web/20040824184000/http://www.neward.net/ted/weblog/index.jsp?date=20040823">it</a> and its <a href="http://web.archive.org/web/20041010214204/www.neward.net/ted/weblog/index.jsp?date=20040825">followup</a> tucked away.  <blockquote> <h2>Context</h2> <p>I'm not normally one to promote myself as a "pattern miner"--those who "discover" patterns in the software systems around us--since I don't think I have that much experience yet, but one particular design approach, "patlet", if you will, has been showing up with frightening regularity (such as Sandy Khaund's mention of EDRA, the format of a SOAP 1.2 message, which in itself forms a Context, and more), and yet hasn't, to my knowledge, been documented anywhere, that I thought I'd take a stab at documenting it and see what comes out of it. Treat this as a alpha, at best, and be brutal in your feedback.<br> <h3>Context (Object Behavioral)</h3> <p>Define a wrapper object that encapsulates all aspects of an operation, including details that may not be directly related to that operation. Context allows an object or graph of objects to be handled in a single logical unit, as part of a logical unit of work.<br> <h3>Motivation</h3> <p>Frequently an operation, which consists fundamentally of inputs and a generated output, requires additional information by which to carry out its work. In some cases, this consists of out-of-band information, such as historical data, previous values, or quality-of-service data, which needs to travel with the operation regardless of its execution path within the system. The desire is to decouple the various participants working with the operation from having to know everything that is being "carried around" as part of the operation.  <p>In many cases, a Context will be what is passed around between the various actors in a Chain of Responsibility (223).<br> <h3>Consequences</h3> <p>I'm not sure yet.<br> <h3>Known Uses</h3> <p>Several distributed communication toolkits make use of Context or something very similar to it. COM+, for example, uses the notion of Context as a interception barrier, allowing for a tightly-coupled graph of objects to be treated as an atomic unit, synchronizing multi-threaded calls into the context, also called an apartment. Transactions are traced as they flow through different parts of the system, such that each Context knows the transaction ID it was associated with and can allow that same transaction ID (the causality) to continue to flow through, thus avoiding self-deadlock.  <p>Web Services also make use of Context, using the SOAP Message format as a mechanism in which out-of-band information, such as security headers and addressing information, can be conveyed without "polluting" the data stored in the message itself. WS-Security, WS-Transaction, WS-Routing, among others, are all examples of specifications that simply add headers to SOAP messages, so that other "processing nodes" in the Web service call chain can provide the appropriate semantics.  <p>(I know there are others, but nothing's coming to mind at the moment.)<br> <h3>Related Patterns</h3> <p>Context is often the object passed along a Chain of Responsibility; each ConcreteHandler in the Chain examines the Context and potentially modifies it as necessary before handing it along to the next Handler in the Chain.  <p>Context is also used as a wrapper for a Command object, providing additional information beyond the Command itself. The key difference between the two is that Context provides out-of-band information that the Command object may not even know is there, for processing by others around the Command. </p></blockquote> <p>The followup looked like this:  <blockquote> <p>Wow--lots of you have posted comments about Context. Let's address some of them and see what comes up in the second iteration:  <ul> <li> <p>Michael Earls wrote:  <blockquote>Very timely. I'm building a system right now that fits this pattern. We spent about five minutes determining what to call "it" (the little "black box" that holds the core command, entity, and metadata information). We settled on "nugget". Now there's prior art I can refer to. I'm using Context with WSE 2.0 and SOAP extensions for the pipeline in exactly the way you describe. Nice.</blockquote>and  <blockquote>Another Related Pattern: Additionally, the Context may also be an container/extension/augmentation/decoration on the UnitOfWork (???).</blockquote>I suspect you're right--Context can be used to hold the information surrounding a UnitOfWork, including the transaction it's bound to (if the transaction is already opened). This is somewhat similar to what the MTS implementation does, if I'm not mistaken. <p></p> <li> <p>Kris wrote:  <blockquote>The HTTP pipeline in ASP.NET comes to mind, with the HttpContext being passed through for various things like session state, security, etc. One possible side effect that I can see (hopefully you can drop some thoughts on this one), is how to manage dependencies between the chain, as well as order of invocation of chain elements. The MS PAG stuff I believe talks about this somewhat with the Pipelines &amp; Filters pattern, but I'd love to hear your thoughts as well.</blockquote>The PAG stuff (Sandy Khaund's post) was part of what triggered this post in the first place, but I want to be careful not to rely too much on Microsoft prior art (WSE, Shadowfax, HttpContext, COM/MTS/COM+) since in many cases those systems were designed by people who had worked together before and/or shared ideas. The Rule of Three says that the pattern needs to be discovered "independently" of any other system, although with Google around these days that's becoming harder and harder to do. :-) As to managing dependencies between the chain, I think that's out of scope to Context itself--in fact, that raises another interesting pattern relationship, in that Context can be the thing operated upon by a Blackboard [POSA1 71]. Context doesn't care who interacts with it when, IMHO. <p></p> <li> <p>Dan Moore wrote:  <blockquote>Another context <i>(pun intended? --TKN)</i> I've read a lot about is the transactional context used in enterprise transaction processing systems. This entity contains information about the transaction, needed by various participants.</blockquote>Yep. Read on (Dan Malks' post). <p></p> <li> <p>Dan Malks wrote:  <blockquote>Hi Ted, Good start with your pattern writeup :) We document "Context Object" in our pattern catalog in our book "Core J2EE Patterns" 2nd ed., Alur, Crupi, Malks. I hope you'll find some interesting content in our writeup, so please feel free to have a look and let me know what you think. Thanks, Dan Malks</blockquote>Thanks, Dan. As soon as you posted I ran off and grabbed my copy of your book, and looked it up, and while I think there's definitely some overlap (boy what I wouldn't give to workshop this thing at PLOP this year), Context Object, given the protocol-independence focus that you guys gave it in Core J2EE, looks like a potential combination of Context and Chain of Responsibility. I wanted to elevate Context out of just the Chain of Responsibility usage, though, to create something that isn't "part of" another pattern--I'll leave it to you guys to decide whether Context makes sense in that regard. <p></p> <li> <p>Mark Levison wrote:  <blockquote>On related patterns: Context is what is passed into a Flyweight (alias Glyph's). We've been using Context for over two years on current project.</blockquote>Really? Wow; I never would have considered that, but of course it makes sense when you describe it that way. I'm not really keeping track, but I think we've reached the Rule of Three. <p></p> <p>By the way, if there's anybody listening in on this weblog that's going to the PLOP conference this year in Illinois, I would LOVE for you to workshop this one, if there's time. (I wish I could go, but I'm going to be otherwise occupied.) Drop me a note if you're going, are interested, and think there's still time to get it onto the program. </p></li></ul></blockquote> <p>To answer your question, Andrew, no, I never did follow up on this further, but I think Context did emerge as a pattern at one of the PLoP conferences, though I don't know which one and can't find it via Google right now. (I write this at the Lang.NET conference, and I'm trying to keep up with the presentations.)</p>
 