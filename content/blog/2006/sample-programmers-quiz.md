+++
date = "2006-03-11T21:27:20.8480000-08:00"
draft = false
title = "Sample programmers' quiz"
aliases = [
	"/2006/03/12/Sample+Programmers+Quiz.aspx"
]
categories = [
	"Java/J2EE"
]
concepts = []
languages = []
platforms = ["Java/J2EE"]
 
+++
<P>While training last week, the group I was training asked for some help in interviewing candidates for some openings. I came up with the following, and thought I'd post it in the interests of giving teams looking to hire some new folks. This was created specifically to find candidates with 2-3 years' experience with some familiarity with web applications. 
<UL>
<LI>What was the most interesting computer/technical book you read last year? Why? 
<LI>What was the last new programming language you learned? 
<LI>How do you convince a customer that what they want is wrong? 
<LI>Describe the last elegant hack you wrote. Why, where, how, when, ...? 
<LI>Write a servlet that prints all parameters and HTTP headers to the browser. Build an Ant script that compiles, and creates the appropriate .war file for deployment into Tomcat. 
<LI>Name all of the verbs in the HTTP/1.1 specification. 
<LI>Given a tag library, "utilitytags.jar" which is described by the tag library descriptor file "utilitytags.tld", please write a JSP that uses the "foobar" tag from that library. 
<LI>What keyword in Java do we use to grant package-level access to class members? 
<LI>When do you think you should use an abstract base class as opposed to using an interface? 
<LI>How do I protect code in a multithreaded environment from being executed by more than one thread at a time? 
<LI>Please fill in the necessary code to return the contents of the "last name" column using the following SQL statement; make all necessary changes so that this code will compile: <PRE>public void printUsers(Connection conn)
{
  String sql = "SELECT last_name FROM users WHERE first_name = 'Sean'";
  ...
}
</PRE>
<LI>What is a design pattern? Please describe three patterns that you have used and why you used them and what the consequences of using them were, both good and bad. </LI></UL>More suggestions, questions, and comments welcome. Note that some of the questions are deliberate traps, some of them are deliberately open-ended in order to encourage discussion and opportunities to flesh out what's on the resume, and some of them are intended not to hear the answers but to watch the candidates' reaction. (Yeah, I'm a hard interviewer. :-) ) 
<P>
<HR>

<P></P>
<P><STRONG>Update:</STRONG> A couple of commenters have pointed out that a few of the questions are answered by simply looking up stuff (in the HTTP specification, for example). Two answers come to mind why I want people to know this without having to look it up--one, sometimes I want to pitch a slowball just to see how they'll react and answer, and two, if they can answer the question without having to look it up, it means they <I>know</I> the spec, which is a far, far different thing than being able to look something up.</P>
 
