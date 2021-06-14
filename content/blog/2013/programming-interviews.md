+++
date = "2013-08-19T21:30:55.1290000-07:00"
draft = false
title = "Programming Interviews"
aliases = [
	"/2013/08/20/Programming+Interviews.aspx"
]
categories = [
	".NET","Android","Azure","C#","C++","Conferences","Development Processes","F#","Flash","Industry","iPhone","Java/J2EE","Languages","LLVM","Mac OS","Objective-C","Parrot","Personal","Python","Reading","Review","Ruby","Scala","Security","Social","Solaris","Visual Basic","VMWare","WCF","Windows","XML Services"
]
concepts = ["Development Processes", "Industry", "Languages", "Reading", "Security", "Social", "XML Services"]
languages = ["C#", "C++", "F#", "Python", "Ruby", "Scala", "Visual Basic"]
platforms = [".NET", "Java/J2EE", "LLVM", "Mac OS", "Parrot", "Windows"]
 
+++
<p>Apparently I have become something of a resource on programming interviews: I've had three people tell me they read the last two blog posts, one because his company is hiring and he wants his people to be doing interviews right, and two more expressing shock that I still get interviewed--which I don't really think is all that fair, more on that in a moment--and relief that it's not just them getting grilled on areas that they don't believe to be relevant to the job--and more on that in a moment, too.</p>

<p>A couple of things have emerged in the last few weeks since the saga described earlier, so I thought I'd wrap the thing up with a final post. Besides, I like things that come in threes.</p>

<p><b>First, go see <a href="http://channel9.msdn.com/Events/ALM-Summit/ALM-Summit-3/Technical-Interviewing-You-re-Doing-it-Wrong">this video</a>.</b> Jonathan pinged me about it shortly after the second blog post came out, and damn if he and Mitch don't nail a bunch of things directly on the head. Specifically, I want to call out two lists they put into their slides (which I can't find online, or I'd include a link, sorry).</p>

<p>One, what are the things you're trying to answer in an interview? They call it out as three questions an interviewer or interview team is seeking to answer:
<ol>
<li>Can they do the job?</li>
<li>Will they be motivated?</li>
<li>Would they get along with the team?</li>
</ol>
Personally, #2 to me is a red herring--frankly, I expect that if you, the candidate, take a job with my company, then either you have determined that you will be motivated to work here, or else you can force yourself to be. I don't really expect you to be the company cheerleader (unless, of course, I'm hiring you for that role), but I do expect professionalism: that you will be at work when you are scheduled or expected to be, that you will do quality work while you are there, and that you will look to make the best decisions possible given the information you have at the time. Motivation is not something I should be interviewing for; it's something you should be bringing.</p>

<p>But the other two? Spot-on.</p>

<p>And this brings me to my interim point: <b>I'm not opposed to a programming test.</b> I think I gave the impression to a number of readers that I think that I'm too good or too famous or whatever to be tested on my skills; that's the furthest thing from the truth. I think you most certainly should be verifying that I have the technical chops to do the job you want me to do; what I do want to suggest, however, is that for a number of candidates (myself included), there are ways to determine my technical chops without forcing me to stand at a whiteboard and code with a pen. For some candidates, you can examine their GitHub profile and see how many repos they have that're public (and have a look through some of the code they wrote). In fact, what I think would be a <i>great</i> interview question would be to look at a repo they haven't touched in a year, find some element of the code inside there, and ask them to explain what they were thinking when they wrote it. If it's well-documented, or if it's simple code, they'll be able to do that fairly quickly (once they context-swap to the codebase--got to give them time to remember, after all). If it's a complex or tricky bit, and they can't explain it...</p>

<p>... well, you just learned something about the code they write, now didn't you?</p>

<p>In my case, I have no public GitHub profile to choose from, but I'm an edge case, in that you can also watch my videos, and/or read my books and articles. Granted, there's a chance that I have amazing editors who save me from incredible stupidity and make me look good... but what are the chances that somebody is doing that for over a decade, across several technology platforms, and all without any credit? Probably pretty close to nil, IMHO. I'm not unique in this case--there's others whose work more or less speaks for itself, and I think you're disrespecting the candidate if you don't do your homework on the interview first.</p>

<p>Which, by the way, brings up another point: As an interviewer, you have a responsibility to do your homework on the candidate before they walk in the door, particularly if you're expecting them to have done their homework on your firm. Don't waste my time (and yours, particularly since yours is probably a LOT more expensive than mine, considering that a lot of companies are doing "interview loops" these days with a team of people, and all of their time adds up). If you're not going to take my candidacy seriously, why should I take your job or job offer or interview seriously?</p>

<p>The second list Jon and Mitch call out is their "interviewing antipatterns" list:
<ul>
<li>The Riddler</li>
<li>The Disorienter</li>
<li>The Stone Tablet</li>
<li>The Knuth Fanatic</li>
<li>The Cram Session</li>
<li>Groundhog Day</li>
<li>The Gladiator</li>
<li>Hear No Evil</li>
</ul>
I want you to watch the video, so I'm not going to summarize each here; go watch it. If you're in a position of doing hiring, ask yourself how many of those you yourself are perpetrating.</p>

<p><b>Second, go read <a href="http://firstround.com/article/The-anatomy-of-the-perfect-technical-interview-from-a-former-Amazon-VP">this article</a>.</b> I don't like that he has "Dig into algorithms, data structures, code organization, simplicity" as one of his takeaways, because I think most interviewers are going to see "algorithms" and "data structures" and stop there, but the rest seems pretty spot-on.</p>

<p><b>Third, ask yourself the critical question: What, exactly, are we doing wrong?</b> You think you're an agile organization? Then ask yourself how much feedback you get on your interviewing process, and how you would know if you screwed it up. Yes, you will know if hire a bad candidate, but how will you know if you're letting good candidates go? Maybe you're the hot company that everybody wants to work at, and you can afford to throw some wheat out with the chaff a few times, but you're not going to be in that position for long if you do, and more importantly, you're not going to be in that position for long, period. If you don't start trying to improve your hiring process now, by the time you need to, it'll be too late.</p>

<p><b>Fourth, practice!</b> When unit-testing came out, many programmers said, "I don't need to test my code, my code is great!", and then everybody had a good laugh at their expense. Yet I see a lot of companies say essentially the same thing about their hiring and interview practices. How do you test an interview process? Easy--interview yourselves. Work with known-good conditions (people you know, people who work with you already, and so on), and run them through the process, but with the critical stipulation that <i>you must treat them exactly as you would a candidate</i>. If you look at your tech lead and say, "Yeah, this is where I'd ask you a technical question, but I already know...", then unless you're prepared to do that for your candidates, you're cheating yourself on the feedback. It's exactly like saying, "Yeah, this is where I'd write a test checking to see how we handle a null in that second parameter, but I already know...". If you're not prepared to do the latter, don't do the former. (And if you are prepared to do the latter, then I probably don't want to work with you anyway.)</p>

<p><b>Fifth, remember: Interviewing is not easy!</b> It's not easy on the candidates, and it shouldn't be on you. It would be great if you could just test somebody on one dimension of themselves and call it good, but as much as people want to pretend that a programmer is just a code-spewing cog in a machine, they're not. If you want well-rounded candidates, then you must interview all aspects of that well-roundedness to determine if they are or not.</p>

<p>Whatever you interview for, that's what you will get.</p>
 
