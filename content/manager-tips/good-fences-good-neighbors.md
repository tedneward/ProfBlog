title=Ism: Good Fences Make Good Neighbors
date=2024-08-10
type=page
tags=management, antipatterns
status=published
description=Knowing what responsibilities belong to which teams is crucial between two teams whose areas of interest possibly overlap (or even just come close to one another).
~~~~~~

"Hey, neighbor, that sprinkler over by the tree is broken, and it's shooting water everywhere."  "Yeah, I noticed that. You going to fix it anytime soon?"  "Me? No, I thought that was on your side of the property line."  "No, I'm pretty sure it's your side."  "I dunno, the last time I looked, the line ran over this way, so that means that's yours to fix."  "No way, I know the line runs the other way, which means that's your job...." If two entities/organizations don't know where the "line" is between their areas of responsibility, then into that gap will fall a variety of things, and one of those will eventually create a problem that could be existential to the team, the organization, or even the company as a whole. Knowing precisely "who" is responsible for "what" is not a turf battle (though it can turn into one), it's organizational discipline.

<!-- more -->

The concern, of course, among "polite" managers, is that wanting to clarify who does what can be viewed as some kind of "turf claim" (in which the manager is trying to claim more responsibility for their team, in order to grow their team size, because team size is sometimes seen as a relative measurement of importance or competence), or the appearance of an unwillingness to work together or allow for third-party view into how the team operates. "Of course I want to be a good team player," the naive manager says, "So I will just kinda assume that my team does the things I know we're supposed to do, and let things just... be."

Unfortunately, this *laissez-faire* attitude often masks or outright ignores edge cases in the organization, or between organizations, and the net result can be disastrous.

For example, one such common edge case is that of interview oversight and ownership of the process of hiring technologists. On the one hand, this is clearly an HR function (a Recruiting function, to be more specific, but since most Recruiting teams report into HR, we can generalize it to be an HR thing): the company has particular legal standards it must follow (which HR knows, and Engineers generally don't), the company has particular salary bands and benefits packages it offers (or doesn't offer), and there may even be some company-specific guidelines that must be enforced. These are all clearly HR things.

But at the same time, HR doesn't understand technology, and definitely doesn't understand how to determine whether somebody is an associate-level programmer or a principal-level programmer. (Historically, this was measured in "years of experience", which is how we get job descriptions that call for "20+ years of experience" in a language that is less than 10 years old.) In most cases, the ability to weigh and judge the candidate's technical skills and abilities rests exclusively within Engineering.

Here, then, is a ripe place for failure. If HR owns the process fully, the hiring managers will cycle through tons of candidates that look great on paper but can't stand up to scrutiny. If Engineering owns the process fully, the company risks violating federal and state laws around illegal hiring practices. (For example, you can never ask about somebody's marital status, even if you phrase it in such a way to determine whether a candidate would be able to work overtime, or about somebody's future family plans or intended pregnancies. Such can absolutely land you squarely in the crosshairs of a discrimination lawsuit.)

When presented with this dilemma, most companies will wave a generality at the problem and expect it to be solved: "Well, HR will work with Engineering to make sure everybody's needs are met." (You can imagine the VP of Engineering and VP of HR high-fiving each other after this profundity.) The problem is, it's not clear *how* they're going to work together. For example, who's going to have final say on the job description? Who's keeping an eye on whether the postings to job boards and LinkedIn are matching what's in the JD? How is the JD matching up against performance reviews? And so on.

This is where it becomes critical for both HR and Engineering leadership to get together, brainstorm on all the elements involved in an engineering hire (both the individual hiring instances, as well as the setup and overhead, like job description creation and maintenance), and then start a frank and honest conversation about which team(s):

* have the expertise around a particular facet of the process or domain
* have a stake in the outcome
* are accountable to others for the outcome

These are commonly known as "RACI Discussions", after the chart/exercise of the same name. More formally, this is a ["Responsibility assignment matrix"](https://en.wikipedia.org/wiki/Responsibility_assignment_matrix), which breaks down different roles and their degree of involvement:

> There is a distinction between a role and individually identified people: a role is a descriptor of an associated set of tasks; may be performed by many people; and one person can perform many roles. For example, an organization may have ten people who can perform the role of project manager, although traditionally each project only has one project manager at any one time; and a person who is able to perform the role of project manager may also be able to perform the role of business analyst and tester.

> **R = Responsible** (also *recommender*)
> Those who are responsible for the correct completion of the task. There is at least one role with a participation type of responsible, although others can be delegated to assist in the work required. 

> **A = Accountable** (also *approver* or *final approving authority*)
> The one ultimately answerable for the correct and thorough completion of the deliverable or task, the one who ensures the prerequisites of the task are met and who delegates the work to those responsible. In other words, an accountable must sign off (approve) work that responsible provides. There must be only one accountable specified for each task or deliverable.

> **C = Consulted** (sometimes *consultant* or *counsel*)
> Those whose opinions are sought, typically subject-matter experts, and with whom there is two-way communication.

> **I = Informed** (also *informee*)
> Those who are kept up-to-date on progress, often only on completion of the task or deliverable, and with whom there is just one-way communication.

Frankly, I dislike the distinction between "responsible" and "accountable" here; I believe that if you're accountable, you have to have control over it. (Nothing like being held accountable for something you don't do to add to your ulcer!) So I'll often simplify it down to an "OCI" chart (owner, consulted, informed). However, I do get that many people may contribute to the process (responsible) while only one person is the final approving authority (accountable), but frequently I've seen RACIs miss this subtlety; it's simpler, at least between organizations, to designate one "owner", and then let that org figure out internally who is the accountable figure.

(By the way, this isn't just a HR/Engineering thing--I've seen the exact same problem of things falling through the cracks with bug reports in a microservices-based architecture. Someone needs to "own" the bug report, and its fix, no matter where it lands inside the microservice, even if that bug winds its way through hundreds of distinct services and dozens of teams. Otherwise, each team points out a reason that "it's not our bug" and nothing is ever done to fix the bug.)

Whether you use RACI or my OCI approach, having the hard conversation between two groups (whether it's HR and Engineering or two technology teams working together on a project) to make it crystal-clear who owns which part of a process or scenario will be worth its weight in gold later.
