title=Ism: Credibility is Currency
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Within a company, your credibility as a manager is paramount. It's best to think of it as a currency.
~~~~~~

For many managers, there is an implied assumption that "anybody working for me has to do what I tell them". This in turn breeds the corollary that if you want to get your initiative or idea to be adopted by those not reporting to you on the org chart, you have to get somebody high on the org chart pyramid to "tell everybody to do it this way". That is entirely a fallacy.

<!-- more -->

## Wait, what? Like money?

Think about this for a moment: What would you do if your boss showed up on a Zoom call one day, and told you that starting tomorrow, the entire company was going to start rewriting everything in assembly language? Like, every single line of code of every software package your company currently builds/owns/operates, must immediately begin a project to write everything in assembly language.

Your boss has just given you a direct order--by the virtue of "anybody working for me has to do what I tell them", you should immediately start figuring out how to integrate your new assembly-language projects into the CI/CD pipeline.

If you're like most engineering managers, you're going to double- and triple-check this. Has the boss cleared this with others in the company? Do they understand how much *work* that's going to require? What the heck are they *thinking*?

But now imagine that the CTO comes in, freshly hired from a successful startup that they took to billion-plus revenue, and says, "We need to rewrite everything in Rust." Still the same depth of disbelief and (be honest) disobedience?

What does this startup CTO have that your boss lacks? *Credibility.*

Credibility, for those who aren't familiar with the term, is defined by the Oxford Dictionary as "the quality of being trusted and believed in." with the example cited as "the very public loss of *credibility* led to the demise of the magazine". The startup CTO has credibility because their startup made billions; your boss lacks that.

But here, let's test it: Let's reverse the two and see how it holds up.

Your boss shows up on that Zoom call announcing that the company is rewriting everything in assembly language. Now, your boss also happens to be the one that came in to the company three years ago, rewrote some of the core systems (that used to be in JavaScript) in assembly language, and cut the company's cloud budget by 90%, making the company millions. What's more, he did it in a fraction of the time everybody thought it would take by using features of modern assemblers that none of the rest of you realized were possible--in fact, some of the code he shows you looks an awful lot like a modern high-level language....

Meanwhile, the CTO that comes in, they were acquired along with the startup that your company bought, but the startup was one of those "flame-out" startups that burned bright but ran into scaling issues almost immediately, and never could get its reliability issues sorted. The CTO had used Rust there, but you find out (through the rumor mill) that the code was in a pretty sorry state, and people who've inherited those systems are just about ready to pitch the whole lot and start over.

Now who are you gonna believe?

In each case, the decision is implicitly judged not only on its own technical merits, but also with the weight of the *credibility* of the individual asserting a direction or answer. That credibility, it turns out, is something that each and every individual in the company has to a greater or lesser degree, and it is that credibility that you spend whenever you advocate for a particular decision, change in policy, or solution.

Consider:

* **You choose to hire someone.** Implicitly, you are borrowing some of your credibility to make that decision. If they turn out to be a great employee, your credibility goes up; if they turn out to be a mediocre employee, your cred pretty much remains where it is. (If you have to fire them six weeks later, yeah, your cred took a sizable hit.)

* **You recommend a friend for a role at your company.** Same as the above, but at lower stakes--their doing well nets you a little boost in cred, their dooing poorly nets you a tiny hit. 

* **You make a choice on which build tool to use.** If the tool turns out to be easier to use than what you had before, your cred goes up. If that tool turns out to be useful across the company and becomes a new standard, your cred goes *way* up.

Each decision you make that affects others or is seen by others is, in effect, an *investment of credibility*, and like any investment, can either make you credibility, or cost you credibility. Some investments are longer-term (hiring decisions or technology choices), some are shorter-term (choosing to work all night to clear a bug before the end of the sprint tomorrow, or choosing to help your teammate with their stories when yours are done, rather than taking on a new story).

Keep in mind that while currency has a well-defined exchange rate, different people can view your credibility at different valuations--where your CTO sees your expertise and experience as rating you as having high amounts of credibility, your CEO may be rating you lower because you lack business vision and/or accounting chops. This is where at times, you borrow against someone else's credibility: They "vouch" for you with others (such as the CTO telling the CEO, "We really should listen to this person."), which lends of their credibility to you. If you are successful in your efforts, then not only does your credibility go up, but so does the credibility of the one who "vouched" for you.

In other words, *credibility can be loaned to others, and realize gains and losses from the loan based on their performance*.

Or, put simply, credibility is a currency.
