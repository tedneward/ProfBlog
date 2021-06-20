title=Just Say No to SSNs
date=2012-03-16
type=post
tags=industry, languages, design, reading
status=published
description=In which I expound on what a terrible, terrible idea it is to use a SSN as a primary key in a database.
~~~~~~

<p>Two things conspire to bring you this blog post.</p>

<h2>Of Contracts and Contracts</h2>
<p>First, a few months ago, I was asked to participate in an architectural review for a project being done for one of the states here in the US. It was a project dealing with some sensitive information (Child Welfare Services), and I was required to sign a document basically promising not to do anything bad with the data. Not a problem to sign, since I was going to be more focused on the architecture and code anyway, and would stay away from the production servers and data as much as I possibly could. But then the state agency asked for my social security number, and when I pushed back asking why, they told me it was “mandatory” in order to work on the project. I suspect it was for a background check—but when I asked how long they were going to hold on to the number and what their privacy policy was regarding my data, they refused to answer, and I never heard from them again. Which, quite frankly, was something of a relief.

Second, just tonight there was a thread on the Seattle Tech Startup mailing list about SSNs again. This time, a contractor who participates on the list was being asked by the contracting agency for his SSN, not for any tax document form, but... just because. This sounded fishy. It turned out that the contract was going to be with AT&T, and that they commonly use a contractor’s SSN as a way of identifying the contractor in their vendor database. It was also noted that many companies do this, and that it was likely that many more would do so in the future. One poster pointed out that when the state’s attorney general’s office was contacted about this practice, it isn’t illegal.

Folks, this practice has to stop. For both your sake, and the company’s.

## Of Data and Integrity
Using SSNs in your database is just a bad idea from top to bottom. For starters, it makes your otherwise-unassuming enterprise application a ripe target for hackers, who seek to gather legitimate SSNs as part of the digital fingerprinting of potential victims for identity theft. What’s worse, any time I’ve ever seen any company store the SSNs, they’re almost always stored in plaintext form (“These aren’t credit cards!”), and they’re often used as a primary key to uniquely identify individuals.

There’s so many things wrong with this idea from a data management perspective, it’s shameful.

* **SSNs were never intended for identification purposes.** Yeah, this is a weak argument now, given all the <em>de facto</em> uses to which they are put already, but when FDR passed the Social Security program back in the 30s, he promised the country that they would never be used for identification purposes. This is, in fact, why the card reads “This number not to be used for identification purposes” across the bottom. Granted, every financial institution with whom I’ve ever done business has ignored that promise for as long as I’ve been alive, but that doesn’t strike me as a reason to continue doing so.

* **SSNs are not unique.** There’s rumors of two different people being issued the same SSN, and while I can’t confirm or deny this based on personal experience, it doesn’t take a rocket scientist to figure out that if there are 300 million people living in the US, and the SSN is a nine-digit number, that means that there are 999,999,999 potential numbers in the best case (which isn’t possible, because the first three digits are a stratification mechanism—-for example, California-issued numbers are generally in the 5xx range, while East Coast-issued numbers are in the 0xx range). What I can say for certain is that SSNs are, in fact, recycled—-so your new baby may (and very likely will) end up with some recently-deceased individual’s SSN. As we start to see databases extending to a second and possibly even third generation of individuals, these kinds of conflicts are going to become even more common. As US population continues to rise, and immigration brings even more people into the country to work, how soon before we start seeing the US government sweat the problems associated with trying to go to a 10- or 11-digit SSN? It’s going to make the IPv4 and IPv6 problems look trivial by comparison. (Look for that to be the moment when the US government formally adopts a hexadecimal system for SSNs.)

* **SSNs are sensitive data.** You knew this already. But what you may not realize is that data not only has a tendency to escape the organization that gathered it (databases are often sold, acquired, or stolen), but that said data frequently lives far, far longer than it needs to. Look around in your own company—how many databases are still online, in use, even though the data isn’t really relevant anymore, just because “there’s no cost to keeping it”? More importantly, companies are increasingly being held accountable for sensitive information breaches, and it’s just a matter of time before a creative lawyer seeking to tap into the public’s sensitivities to things they don’t understand leads him/her takes a company to court, suing them for damages for such a breach. And there’s very likely more than a few sympathetic judges in the country to the idea. Do you really want to be hauled up on the witness stand to defend your use of the SSN in your database?

Given that SSNs aren’t unique, and therefore fail as their primary purpose in a data management scheme, and that they represent a huge liability because of their sensitive nature, why on earth would you want them in your database?

## A Call
But more importantly, companies aren’t going to stop using them for these kinds of purposes until we <em>make</em> them stop. Any time a company asks you for your SSN, challenge them. Ask them why they need it, if the transaction can be completed without it, and if they insist on having it, a formal declaration of their sensitive information policy and what kind of notification and compensation you can expect when they suffer a sensitive data breach. It may take a while to find somebody within the company who can answer your questions at the places that legitimately need the information, but you’ll get there eventually. And for the rest of the companies that gather it “just in case”, well, if it starts turning into a huge PITA to get them, they’ll find other ways to figure out who you are.

This is a call to arms, folks: Just say NO to handing over your SSN.</p>
 
