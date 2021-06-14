+++
concepts = ["Agile", "Development Processes", "Psychology", "Philosophy", "Industry", "Management"]
date = "2016-03-23T13:51:53-07:00"
languages = ["Java", "Scala", "Groovy", "Clojure", "Kotlin", "C#", "F#", "Visual Basic", "Go", "C++", "Swift", "Objective-C", "Haskell", "Ruby", "Python", "JavaScript", "Erlang", "Elixir", "Elm"]
platforms = ["JVM", "J2EE", "JavaEE", "CLR", "LLVM", "Node", "iOS", "Android", "AWS", "Azure", "GoogleCloud", "Solaris", "Windows", "Mac OS", "Parrot", "Native"]
title = "When Interviews Fail"

+++

*tl;dr* Peter Verhas asks a seemingly innocent question during a technical interview, and gets an answer that is not wrong,
but doesn't really fit. He then claims that "Sometimes I also meet candidates who not only simply do not know the answer 
but give the wrong answer. To know something wrong is worse than not knowing. Out of these very few even insists and tries 
to explain how I should have interpreted their answer. That is already a personality problem and definitely a no-go in an 
interview." I claim that Peter is not only wrong, but that in addition to doing his company a complete disservice with this
kind of interview, I personally would never want to work for a company that takes this attitude.

<!--more-->

Let's begin with his original article, [here](https://dzone.com/articles/can-you-call-non-static-method-from-a-static). Go
have a look before you read any further---it's actually not that long.

Now, having familiarized yourself with the material, let's deconstruct it entirely, shall we?

## Asking the wrong questions
For starters, the whole process begins, in my opinion, entirely on the wrong foot:

> There are questions on a Java technical interview that even the most entry level junior is expected to give the right answer for. Since I am facing candidates who are not that junior I do not even bother most of the times to ask those questions. I assume that the candidate knows the correct answer. Sometimes, however, there are some candidates who I feel from the start they are juniors and to cut the interview short not wasting his/her and my time I ask some of those simple questions. The answers usually reveal the real level of knowledge and we can get to an agreement in a short time about the assessed level.

It begins with the phrase "There are questions....". Folks, let me be very clear about this: If you are conducting a
technical interview, then you need to be asking them to write code, not answer questions. Unless their role in the
position is to be a question-answerer of programming questions (in which case, you are interviewing for a teacher,
not an actual programmer), then you need to be asking them to demonstrate their technical skills, not their knowledge
of the terminology.

The reasoning for this should be pretty clear, but in case it's not, I'll argue it from logic, example, and analogy.

Logic: Not every programmer you interview will be classically-trained. They may not know all the preferred terminology.
Are they "getters and setters", or "automatically-defined properties", or "accessors and mutators"? It really sort of
depends on what language you grew up with (C++, for example, preferred the latter for quite some time). It depends on
which books you read. It depends on whether you even had to discuss this with other people---perhaps the candidate
actually learned everything from a book and reading stuff on the Internet. (StackOverflow's recent poll suggests that
around a third or more of the developers in the candidate pool are self-identified "self-taught" developers.) Do you
really want to be screening out perfectly-qualified candidates because they don't have the right words? And this doesn't
even begin to address the pressure-cooker situation that most candidates feel they're in when they interview, causing
them to flub even simple answers. Which brings me to...

Example: A developer who worked for me for two years was a quite capable C# developer. This is a guy who led teams,
mentored some of the more junior developers, and came up with some quite capable designs. And then, when asked during
a meeting by a prospective client, to explain what a static method is, he flubbed it completely, and started talking
about constructors and what-not. I sat there looking at him for a few minutes, with a total "Dude, WTF?!?" look on my
face, before he realized what he was doing. By Peter's criteria, he'd failed the interview. And yet, he served as the
team lead for that client for nine months after that meeting, with nary a complaint about his skills, his abilities, or
his answers on questions about static methods (which, ironically, never came up!) ever again. In other words, once we
got out of the pressure cooker, he did fine, and his work showed it. Which brings us to...

Analogy: If you're hiring a band to play your wedding, do you really care about their ability to explain musical theory
and composition? Or do you care more about their ability to play your favorite dance tunes, to play the song that your
spouse has chosen to be "your song", and to get Grandma and Grandpa on to the dance floor with a rendition of "Funky
Chicken"?  Most bands (dare I say all of them?) get a gig based on their body of work and/or their demo tape, not their
ability to answer questions.

## Expecting the wrong answers
Continuing, Peter says,

> To know something wrong is worse than not knowing. Out of these very few even insists and tries to explain how I should have interpreted their answer. That is already a personality problem and definitely a no-go in an interview.

Oh, hubris, thy name is "programming interviewer". Let's see what I mean:

> One such simple question is: Can a static method in a class call a non-static method of the same class? If you know Java a little bit you know the answer: no, it can not. A static method belongs to the class and not the instance. It can even be executed using the name of the class directly without any instance of the class. It can even run when there is not even a single instance of the class in the whole JVM. How could it invoke a normal method that runs attached to an instance?

Oh, hubris. *There is no reason that a static method cannot invoke an instance method.* The thing that Peter
is hinging on here is the fact that the static method lacks a reference to a particular object (which normally
is the "this" reference), which is his justification for his answer: "No *this*, no method call".

And yet:

> But then again: the answer from one candidate this time was: yes. And he even started to explain that it may happen that the static method has access to an instance. It may get an instance as a method argument and through that reference, it can call an instance method. That person was right. 

And yet:

> It did not, however, change the fact that he did not know Java well enough, but as a matter of fact in this very specific question, she was right.

So let me get this straight: the answer to the question was right, when you've said all along it was wrong, and yet
"this candidate didn't know Java well enough"? I'd say that the candidate understood Java well enough to be able
to find an answer that was not the one you expected, and yet was actually correct.

See, here's what's going on: the interviewer, convinced of their own technical superiority, is walking into an
interview with a predetermiend set of answers to questions they're going to ask, and when a candidate doesn't follow
that predetermined script, they're "not smart enough".

Here's a personal example. I was interviewing with a company years ago for a C++ position, and was asked, "Can a
private field be accessed from outside of the class?" The normal candidate's answer is supposed to be "No, private
creates an encapsulation barrier hiding the field from the rest of the world." 

````c++
#include <iostream>
#include <string>
using namespace std;

class Person
{
public:
  Person(const char* fn, const char* ln, int a)
    : first_name(fn), last_name(ln), age(a)
  { }
  
  string description() {
    return first_name + " " + last_name + " is " + to_string(age) + " years old";
  }
private:
  string first_name;
  string last_name;
  int age;
};

int main() {
  Person ted("Ted", "Neward", 45);
  cout << ted.description() << endl;
}
````

The "age" field is, by design, unavailable to the rest of the world, right?

My answer: "Of course it can. You just have to cast the object instance over to a void*, calculate the offset from the 
start of the object, and then access it."

````c++
int main() {
  Person ted("Ted", "Neward", 45);
  cout << ted.description() << endl;
  
  void* pTed = (void*)&ted;
  int offset = sizeof(string) + sizeof(string);
  char* pTedAge = (static_cast<char *>(pTed) + offset);
  cout << static_cast<int>(*pTedAge) << endl; // prints 45
}
````

I even showed them how you could generalize this into a template (I called it "THackOMatic", and consider it one of
my finest creations in the language.)

Now, you can take this one of three ways:

 * Wow, never thought you could do that. That's interesting. I wonder...
 * Well, yes, you can do this, but it's totally not a good idea.
 * This is totally not in the spirit of the question. You are still wrong.

And If you're in the first two camps, I'm kind of there with you. It's a cool hack, but it's a hack nevertheless,
and hacks are usually a sign that you're doing something wrong, except in very narrow circumstances where there's
simply no other way around it and you accept that you're the only one who will be touching that code from now on.

But if you're in the third camp, you're missing the point. The point being, the candidate figured out a way around
a supposed stumbling block in the language. If you can't recognize that, then I submit that the fault lies with you,
not with the candidate.

Which brings me to my last point.

## You hire what you interview for
Right or wrong, the candidate took your question, thought their way through it, and came up with a novel answer to
the question. And by focusing on the answer, you missed the important part--*they found a way around it*.

Part of this process is supposed to be finding those candidates who meet a certain technical bar, but part
of the process is also supposed to be finding those people who will find ways around obstacles. Bugs, production
outages, design flaws, whatever, you're supposed to be finding the candidates who won't accept the status quo as
a concrete law of the universe. 

A candidate did exactly that, and you shot them down.

You wanted a plain vanilla, boring-as-shit, everybody-get-in-line-and-do-what-the-supervisor-tells-you kind of
answer, and they gave out an "out of the box", creative, hammer-throwing-at-the-screen one.

Do you claim you hire "only the best"? When you're doing this, you're hiring only the middle part of the bell curve,
at best. Those who are on the far right-hand-side of the curve will be the out-of-the-box thinkers, who understand
that rules are made to be broken sometimes, and under specific circumstances.

Do you really think they will *want* to work for you at this point? I wouldn't.

## Wrapping up
So my challenge here is this: If you're an interviewer, what are **you** interviewing for?

By the way, that company I interviewed at all those years ago? The interviewer's response was classic: "Well, the
right answer was supposed to be 'no', but I can see what you're doing here. You're the first person to ever give
me that as an answer." They hired me shortly thereafter, and before I left the firm, I used a couple more language
tricks to help cut the size of their codebase down pretty significantly in a couple of situations.

