title=Architectural Katas
date=2010-06-17
type=post
tags=architecture, architects, industry, kata
status=published
description=In which I present the Architectural Katas.
~~~~~~

By now, the Twitter messages have spread, and the word is out: at Uberconf this year, I did a session ("Pragmatic Architecture"), which I've done at other venues before, but this time we made it into a 180-minute workshop instead of a 90-minute session, and the workshop included breaking the room up into small (10-ish, which was still a teensy bit too big) groups and giving each one an "architectural kata" to work on.

<!--more-->

The architectural kata is a take on PragDave's coding kata, except taken to a higher level: the architectural kata is an exercise in which the group seeks to create an architecture to solve the problem presented. The inspiration for this came from Frederick Brooks' latest book, <em>The Design of Design</em>, in which he points out that the only way to get great designers is to get them to design. The corollary, of course, is that in order to create great architects, we have to get them to architect. But few architects get a chance to architect a system more than a half-dozen times or so over the lifetime of a career, and that's only for those who are fortunate to be given the opportunity to architect in the first place. Of course, the problem here is, you have to be an architect in order to get hired as an architect, but if you're not an architect, then how can you architect in order to become an architect?

Um... hang on, let me make sure I wrote that right.

Anyway, the "rules" around the kata (which makes it more difficult to consume the kata but makes the scenario more realistic, IMHO):

* you may ask the instructor questions about the project
* you must be prepared to present a rough architectural vision of the project and defend questions about it    
* you must be prepared to ask questions of other participants' presentations
* you may safely make assumptions about technologies you don't know well as long as those assumptions are clearly defined and spelled out
* you may not assume you have hiring/firing authority over the development team
* any technology is fair game (but you must justify its use)
* any other rules, you may ask about

The groups were given 30 minutes in which to formulate some ideas, and then three of them were given a few minutes to present their ideas and defend it against some questions from the crowd.

*(**UPDATE 2021:** The full list of katas is available at the [architectural katas website](http://www.architecturalkatas.com), and available for forking as a repository from my [Github](https://github.com/tedneward/ArchKatas). The website code is available [here](https://github.com/tedneward/ArchKatasCode) for those who'd like to play with it, but it's pretty simple and probably much better re-thought from the ground up.)*

An example kata is below:

<blockquote>
**Architectural Kata #5: I'll have the BLT**

a national sandwich shop wants to enable "fax in your order" but over the Internet instead

users: millions+

requirements: users will place their order, then be given a time to pick up their sandwich and directions to the shop (which must integrate with Google Maps); if the shop offers a delivery service, dispatch the driver with the sandwich to the user; mobile-device accessibility; offer national daily promotionals/specials; offer local daily promotionals/specials; accept payment online or in person/on delivery
</blockquote>

As you can tell, it's vague in some ways, and this is somewhat deliberate--as one group discovered, part of the architect's job is to ask questions of the project champion (me), and they didn't, and felt like they failed pretty miserably. (In their defense, the kata they drew--randomly--was pretty much universally thought to be the hardest of the lot.) But overall, the exercise was well-received, lots of people found it a great opportunity to try being an architect, and even the team that failed felt that it was a valuable exercise.

I'm definitely going to do more of these, and refine the whole thing a little. (Thanks to everyone who participated and gave me great feedback on how to make it better.) If you're interested in having it done as a practice exercise for your development team before the start of a big project, ping me. I think this would be a *great* exercise to do during a user group meeting, too.
 
