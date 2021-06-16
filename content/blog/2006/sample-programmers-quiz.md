title=Sample programmers' quiz
date=2006-03-11
type=post
tags=java, j2ee, clr, c++, ruby, xml services
status=published
description=In which I proffer a sample quiz for programmers.
~~~~~~

While training last week, the group I was training asked for some help in interviewing candidates for some openings. I came up with the following, and thought I'd post it in the interests of giving teams looking to hire some new folks. This was created specifically to find candidates with 2-3 years' experience with some familiarity with web applications.

<!--more-->

* What was the most interesting computer/technical book you read last year? Why? 
* What was the last new programming language you learned? 
* How do you convince a customer that what they want is wrong? 
* Describe the last elegant hack you wrote. Why, where, how, when, ...? 
* Write a servlet that prints all parameters and HTTP headers to the browser. Build an Ant script that compiles, and creates the appropriate .war file for deployment into Tomcat. 
* Name all of the verbs in the HTTP/1.1 specification. 
* Given a tag library, "utilitytags.jar" which is described by the tag library descriptor file "utilitytags.tld", please write a JSP that uses the "foobar" tag from that library. 
* What keyword in Java do we use to grant package-level access to class members? 
* When do you think you should use an abstract base class as opposed to using an interface? 
* How do I protect code in a multithreaded environment from being executed by more than one thread at a time? 
* Please fill in the necessary code to return the contents of the "last name" column using the following SQL statement; make all necessary changes so that this code will compile:

    ```
    public void printUsers(Connection conn)
    {
      String sql = "SELECT last_name FROM users WHERE first_name = 'Sean'";
      ...
    }
    ```
    
* What is a design pattern? Please describe three patterns that you have used and why you used them and what the consequences of using them were, both good and bad. </LI></UL>More suggestions, questions, and comments welcome. Note that some of the questions are deliberate traps, some of them are deliberately open-ended in order to encourage discussion and opportunities to flesh out what's on the resume, and some of them are intended not to hear the answers but to watch the candidates' reaction. (Yeah, I'm a hard interviewer. :-) ) 

------

**Update:** A couple of commenters have pointed out that a few of the questions are answered by simply looking up stuff (in the HTTP specification, for example). Two answers come to mind why I want people to know this without having to look it up--one, sometimes I want to pitch a slowball just to see how they'll react and answer, and two, if they can answer the question without having to look it up, it means they *know* the spec, which is a far, far different thing than being able to look something up.
 
