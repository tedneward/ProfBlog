+++
date = "2014-12-03T04:18:07-08:00"
draft = false
title = "Recruiting: Doing it (I think) the right way"
aliases = [
  "/2014/12/03/Recruiting+Doing+It+I+Think+The+Right+Way.aspx"
]
categories = [
]
concepts = []
languages = []
platforms = []
+++

        <p>
There's been a fair amount of conversation around how to recruit software developers
effectively. <a href="http://blogs.tedneward.com/2013/08/20/Programming+Interviews.aspx">I've
participated in some of it.</a> But just today, a blog post crossed my desk(top) and
finally prompted me enough to get around and blog about it.
</p>
        <p>
In <a href="http://blog.alinelerner.com/resumes-suck-heres-the-data/">Resumes Suck.
Here's the Data."</a>, Aline Lerner talks about a scientific process she used to actually
try to gauge the efficacy of resumes in the hiring process. (I probably should say
"pseudo-scientifically", only because while it looks pretty legit to me, and frankly
it's more legit science than most companies will engage around hiring, it probably
has a few statistical/scientific holes in it that could lead to some misleading data;
that said, it's better than the traditional answer of "Well, *I* know how to interview
people, so....", which to me is an outright so-you-buy-into-your-own-bullshit answer.)
</p>
        <p>
Her conclusion? 
</p>
        <blockquote> ... it may not be a matter of being good or bad at judging resumes
but rather a matter of the task itself being flawed — at the end of the day, the resume
is a low-signal document. ... Very smart people, who are otherwise fantastic writers,
seem to check every ounce of intuition and personality at the door and churn out soulless
documents expounding their experience with the software development life cycle or
whatever… because they’re scared that sounding like a human being on their resume
or not peppering it with enough keywords will eliminate them from the applicant pool
before an engineer even has the chance to look at it. </blockquote> Yeah. I can relate.
<p>
If you combine her findings here with my anecdotal evidence around how most companies'
interview process is fundamentally broken (which Google seems to have confirmed),
what you come to realize is that for most companies, the entire recruiting process
is just one giant coin-flip based on equal parts intuition, mutual fakery with the
best of intentions ("This company is great!" "I'm an amazing candidate!"), and almost
no science--or accountability, or independent verification of the results, or testing--involved.
</p><p>
So here's what we do at <a href="http://www.itrellis.com">iTrellis</a> (the company
where I'm currently the CTO): 
</p><ul><li><b>Our recruiters are instructed to look at much more than the resume.</b> Quite frankly,
if you have a Github profile, a BitBucket profile, a blog, or God-help-us-all just
your own domain, we take all of that into account. As Aline points out, resumes suck.
No resume has ever accurately captured what somebody did on the job: either they exaggerate
for effect, or they totally misrepresent (both positively and negatively) what they
did. And quite frankly, any employment history, technology, project or customer you
helped more than ten years ago is really not going to matter much, unless that's exactly
what we're hiring you for. But forking a project to play with it, contributing a pull
request, commenting on a blog about something interesting you discovered... folks,
that's a more accurate representation of who you are than any resume you could possibly
hand me. And if you have your own domain, and you built your own blog... Nice.</li><li><b>Once identified, our recruiter calls you to make sure you pass the Bozo Test.</b> Seriously.
The phone call is a pleasant ten- to thirty-minute chat to find out if you have a
pulse, you're actually looking for a job, and that you're not some wingnut out of
left field who thinks that C++ is a better grade than a B-. More importantly, <em>they
are doing no technical evaluation of the candidate</em>. Seriously, think about that:
you're going to ask somebody whose specialty is Human Resources to make a call on
whether this person has the chops to write code? All they're going to be able to do
is look to see if they have the <em>credentials</em> (degree, certifications, etc),
and we all know how accurate those are. No way. Don't ask me to put together a pension
program, and don't ask the HR guy to evaluate a technologist.</li><li><b>Once you've agreed that you're looking for a job, and you passed the Bozo Gate,
we tell you to go write some code.</b> Seriously. No, you're not going to talk to
any of our people. No, there's no "preliminary screening". We have code to write.
And frankly, the best screen we can put in place to determine if you have technical
chops is to have you write some code. Specifically, we ask you to spend no more than
10 hours on <a href="https://bitbucket.org/itrellis">one of these projects</a>. Notice
how there's both Java and C# versions? If you wanted to do it in Ruby or Node, I'd
be OK with that. Hell, if you wanted to take a wild stab in the dark and do it in
a language you've never written before, I'd take that, too. (Shows moxie. Gumption!
Dare I say, chutzpah!) We don't even care if you finish it. We just want to have a
pile of code that you wrote specifically for this purpose, because then we can use
it (free of any IP restrictions) for the next stage.</li><li><b>Once you've written the code, you send it to us.</b> Zip it up, or better yet,
point us to the pull request, or, even better, your version of the project on your
own source control system public server of choice. This is where we evaluate your
technical chops: what tools did you use, what results did you get, how closely did
you adhere to our requests/"requirements", and so on. Did you ask us questions around
the ambiguities? Did you make assumptions about what we wanted without checking with
us first? Did you remember to unit test? (We said, right there in the README, "Unit
tests are very important to us". If you didn't unit test, you gonna have some 'splainin'
to do....) And so on.</li><li>
By the way, take note: other than ten to thirty minutes of our recruiters' time for
the phone call (and whatever time the recruiter spent looking at your profile/resume/whatever,
and I've told them to keep that bar pretty low!), no iTrellis time has been consumed
as part of this process so far. Your code is what we care about at this point, why
should we even talk to you yet?</li><li><b>We evaluate your code sample.</b> Can we build it? Can we run it? Can we run the
tests? This step is pretty straightforward.</li><li><b>Assuming your code passes muster, we bring you in.</b> But not to interview--oh,
no. The human brain is a deeply flawed instrument, and we don't want to give in to
its accidental prejudices and flaws. No, instead, we want you to "pair" with three
of our existing employees, over your code. This has a couple of parts to it: 
<ul><li>
We want to find out if you fit with our existing staff. Hey, let's face it, you could
be the best coder in the world, but if you manage to piss off all three of your pairs,
you are Not Going To Work.</li><li>
We want to find out if we can put you in front of a client. We are a consulting company.
We can't afford to have people that can't stand the light of day.</li><li>
We want to see how mentally nimble you are.</li></ul>
And by that last part, what I do is I ask my three pairs to specifically work with
you on three different things, from a list of things like: 
<ul><li>
"Can you explain your code to me? Why did you choose to do this? Why didn't you do
that?" You need to be able to explain your decisions without getting defensive or
angry. I may sometimes ask the pair-er to deliberately disagree with the decision,
to see what your reaction is. Disagreement happens. How you handle it is what matters.</li><li>
"The customer has now changed their requirements; they need the project to do (whatever)
different." The ToDo list now needs "categories". The ToDo list now needs to be able
to sort by dates. Whatever. How does this break your domain model? More importantly,
what changes do you identify that need to be made? Let's write some of that code now.
How does this change your tests?</li><li>
"We now need to store to a database" or "to a different database" or "to several different
databases (sharding)". Ideally, we'll pick something you've never seen before. I want
to see how you'll approach using something or doing something you've never done before:
where do you start? How do you start?</li><li>
"How would you put a DevOps pipeline around this thing?" What's your tools, how would
you relate it back to stories, the whole nine yards.</li><li>
"Oh, my! We need to secure this thing, stat!" What's insecure? What's already secure?
Where do you begin doing the security analysis?</li></ul>
... and so on. The goal here is to push your boundaries a little, and yes, maybe pile
on a little stress to see how you react. But at every step, something that is what
you'll actually have to deal with, every day, when working for a consulting company.</li><li><b>Assuming you have the chops we're looking for, we hire you.</b> This part is pretty
simple, if you ask me. But my CFO, now he takes over. :-)</li></ul>
That's our recruiting process. 
<p>
By the way, I say all of this here because none of this is Secret Sauce(TM). We want
the entire process to be entirely transparent. No "hidden agenda". Yes, I'll admit,
right up front, what each stage is designed to do, and why. I'll even tell you, right
from the beginning, if you ask. Yes, it's a little longer than your average "one-hour
interview with the hiring manager"; but if you notice, the time commitment on the
iTrellis side is 30 minutes (recruiter call) + code evaluation time, probably not
more than 30 minutes (my or an engineer's time) + pairing time, not more than 30 -
45 minutes per pair (of an engineer's time), which is actually pretty comparable to
your average "stand at the whiteboard and code" interview time. Yes, you've put in
10 or so hours into the coding project--but it's <em>coding</em>, and tell me right
now, which would you rather do: a full eight-hour "interview loop" in front of people
at a whiteboard, or snuggled up with the cat in front of the TV, gloriously hacking
using your favorite IDE and your favorite libraries with your favorite tunes blasting
through your favorite headphones?
</p><p>
Yeah, I thought so. (So do most of the candidates who come through, whether we accept
them or not. Of course, they could be trying to just brown-nose me, hard to say. )
</p><p>
How do I know it works? A couple of reasons. One, we've gotten some great hires out
of it. (OK, yes, that could be just luck--random luck could give you that, too.) Two,
we've had no "bozo" hires. (OK, we've only been around a year, so again, we could
just be lucky.) Three, we've had more than a few candidates that looked great on paper
either walk away from the coding challenge entirely (buh-bye!) or turn in some pretty
weak results. Sure, they might've been great, but frankly, if your audition tape is
bad, your band is not going to get gigs, either.
</p><p>
But mostly, I have faith in this process because it lends itself well to unit-testing;
at some point (haven't done it yet, but this is in my plans for 2015), I'm going to
slip a few "known quantities" into the system and see how they do: I'm going to slip
a complete newbie with great confidence and a few buzzwords into the process to see
if they can get all the way through, and I'm going to slip an amazing coder with a
crappy cover resume in as well, just to see how we do. And, by the way, note that
I'm not part of the recruiting process: as soon as I could get myself out of the way
of it, I did, because I didn't want to create a company of Ted-clones. (Which is also
something that we tend to do intuitively: prefer the familiar, and nothing is more
familiar than the self. This is part of the reason why a team of white men tends to
stay a team of white men.)
</p><p>
If you've made it this far, thanks for reading. Two more important points, then I'm
out: 
</p><ul><li>
Did I mention we're hiring? We're hiring. At this exact moment we're looking for Java
folks who love writing automated tests and working in the DevOps pipeline; and we're
hiring for people who have good C# skills and want to work with a client who's building
a modern (DurandalJS, Azure, etc) web app. <a href="mailto:hr@itrellis.com">Contact
our recruiters</a> or contact me if you're interested.</li><li>
This process is licensed "Creative Commons" (if a process can be so licensed, that's
just to make the lawyers happy), so if you want to take it and use it for your own
company's hiring process, go for it. Nothing would make me happier than for the industry
to reject the coding-at-the-whiteboard nonsense for something like this or derived
from this. (Because, in truth, this is in turn derived from lots of different hiring
processes I went through over my 25 years.)</li></ul>
Peace, out, y'all.
