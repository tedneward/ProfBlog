title=Cheating With Chat-GPT
date=2024-2-1
type=post
tags=management,teams
status=published
description=Your interview process is not as good at filtering out cheaters as you think it is.
~~~~~~

A colleague pointed out a semi-scientific study about [interviewees cheating with ChatGPT](https://interviewing.io/blog/how-hard-is-it-to-cheat-with-chatgpt-in-technical-interviews) hosted by interview.io; the results are not particularly great if you're relying on LeetCode-style problems: "Predictably, the [interviewee group using common LeetCode problems without modification] performed the best, passing 73% of their interviews. Interviewees reported that they got the perfect solution from ChatGPT. ... In our experiment, interviewers were not aware that the interviewees were being asked to cheat. As you recall, after each interview, we had interviewers complete a survey in which they had to describe how confident they were in their assessments of candidates Interviewer confidence in the correctness of their assessments was high, with 72% saying they were confident in their hiring decision."

Whoops! Maybe it's time to unit-test your interview process?

<!--more-->

These are not reassuring numbers. When almost three-quarters of the interviews *in which the interviewees were told explicitly (by the experimenters) to not rely on their own skills, but exclusively on ChatGPT* are considered "confident", you really have to wonder: How good *is* your interview process? How many false positives are you allowing through? How many false negatives?

This sort of scientific testing (although, to be fair, this really needs to be done many more times, with different interviewees and interviewers, for the results to be considered scientifically conclusive) of interview processes really needs to happen a lot more. And while I'll step aside and let more-qualified psychological-testing masters tell us how to create tests of this nature industry-wide, I think there's value in considering the more localized test--that is, testing the recruiting process within your own company.

But let's forget the "cheating with ChatGPT" for just a moment--because we hadn't really solved interviewing even before ChatGPT got into the mix. Most companies, their interview processes are broken--hilariously so.

Lots of technology companies not only don't believe their interviewing/hiring process is broken, they think it's magnificient. As a matter of fact, I've been told point-blank (as a candidate, no less!) that "Our interview process is one of the top 10% across the industry." (Soooo many questions went through my mind when they said that, like, how did you measure that? Who else participated? What was the metric used here? And did you measure this yourself, did you use a neutral third-party, and did you ask the candidates their opinions? On that last point, by the way, the answer was, not surprisingly, "no".)

The basis of any test--unit- or otherwise--is the relatively simple concept that we want to validate the algorithm by putting known inputs into one end, and comparing/seeing the known/expected outputs at the other end. With code, we can do this pretty easily, since (most) code is deterministic: put a character string into the parameter of a "toLower()" function, and we expect that the result will be a character string with all the upper-cased ASCII characters to be converted to lower-case. Put the same input in, you'll always get the same result.

With humans, though, this is trickier. Humans are most certainly non-deterministic, so the same inputs can yield vastly different outputs. (Insert Dr Ian Malcolm's explanation of Chaos Theory from Jurassic Park here: "The conditions... never repeat and vastly affect the outcome".) Imagine I come to work every morning and greet the security guard at the door with the same message. "Morning, Joe." Some mornings he may nod back. Some mornings he may smile. Some mornings he may take that as an invitation to a longer conversation. Why is Joe so wildly all over the map in his responses? Because some mornings, he had a great morning: His alarm went off on time, he woke up refreshed, his spouse made him a lovely breakfast, whatever. Some mornings, Joe has a lousy morning: his alarm failed to go off, he didn't sleep a wink, his spouse is sick, whatever. Some of it even has to do with the number of times we've done this particular exchange--in the beginning, he may have felt I was just being polite, but then he may have noticed that I said something similar to someone else, which started a longer conversation about kids, weather, or sportsball, and Joe may be deciding that I use this as an open invitation to a deeper conversation. So many different conditions deeply affect Joe's response, and I neither control, nor have any visibility, into any of them.

Now take this to your interview process: If you're like most companies, you have a team of people you draw from to conduct interviews. There's variation #1, because two different people will test and interact with candidates differently. Many companies mix-and-match the teams of people doing the interview (often just grabbing people at random when the interview time comes up), which creates yet another significant variation, as the team dynamics can change how the team comes up with an answer. The team often comes up with questions on the fly, or worse, grabs standard LeetCode problems for the candidate to solve, interacting with the candidate the entire time (all the while pushing, prodding, rewarding, or punishing with their gestures, facial expressions, words, or outright statements)

We can normalize some of this--having the same interview questions, the same process, even creating a rubric for the answers--but no matter the effort, *you'll never know if you're successful unless you test it.*

Which brings me to the point: Unless you test your interview process, you'll have no idea of how good, or bad, it really is.

#### Testing Interviews
Before I go any further in this essay, I want to make two points clear: One, I have never had the opportunity to do any of this--the orgs I've been a part of, where I wanted to do it, explicitly shot down the idea for one reason or another; and Two, I absolutely am going to keep looking for opportunities to do this, because I firmly believe that it is a necessary prerequisite to being able to feel confident about an interview process.

***Hypothesis***: That a deterministic result is obtained when a candidate is put into our hiring/interview process. *(To be fair, a perfectly deterministic result is never going to be possible with humans--there's really just too many variables in play. So let's settle for a "reasonably" deterministic result, at least until we get some experience under our belts, hmm?)*

***Experiment***: We will take a candidate, and ask them to perform the same steps of our interview process as we would any other candidate. 

Caveats:

* We do not wish to change the process; changing the process would change the algorithm, and yield an untrustworthy result.

* We do not with to change the interviewers; these are also part of the process. However, if the interviewers know that this is a test, they will very likely behave differently than they would in a "live" setting. Therefore, the interviewers must be kept unaware that a test is under way.

In order to be able to "know the outcome" of the experiment, we need to work with "known" inputs ahead of time--that is to say, if we put a candidate into the system who is a highly-venerated, highly-respected engineer, our interview process should identify them as a highly-senior engineer (even if we don't pick up on all the accolades or successes); similarly, if we put a random individual "off the street" with no relevant skills whatsoever through our process, we should be able to identify them as such and yield a "no-hire" response.

Readers familiar with my writing will probably already be thinking what I think is the key to this process: Work with known-quantity candidates, a la, friends and colleagues of the hiring team that are known to be solid performers, for the "yes-hire" known inputs. For the known "no-hire" known inputs? Hell, use paid actors. But to be certain, give the "known-yes-hire" candidates full transparency into the process and what questions might be asked, and give the "known-no-hire" candidates explicit instructions on how to answer any questions in the negative.

Doing this, either the candidates have to be unknown to the interviewers (which unfortunately means you can't really use other engineers from your company, unless your company is extremely large), *or* you have to hide their personal and physical characteristics from the interview team (which you probably should do anyway, but that's another discussion for another day). The ideal scenario would be use people who have already been hired by your company, so as to minimize the ambiguity of the "outsider-as-a-yes-or-no" (some people would insist that even somebody like Vint Cerf is not qualified to work at this company in the network team), so tweaking your process to allow for that kind of deception is preferred.

By the way, if you do this several times a month (say perhaps one in every five "live" canddiates, maybe one in ten), you can slip a "known-no-hire-using-ChatGPT" into the cycle and see how well your process responds.

Critics will be adamant that this is an absolute waste of time. I recall when people said the same thing about unit tests, and before that, QA. If it's important to you, it's important to measure it, examine it, and critique it.

But hey, if you want to run your interviews with a close-to-0% confidence that you're getting the right results.... you do you.
