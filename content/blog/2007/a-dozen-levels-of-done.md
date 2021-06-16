title=A Dozen Levels of Done
date=2007-12-05
type=post
tags=development processes, reading
status=published
description=In which I discuss Michael Nygard's definition of "done".
~~~~~~

Michael Nygard (author of the <em>great</em> book <em>Release It!</em>), writes that "<a href="http://www.michaelnygard.com/blog/2007/11/a_dozen_levels_of_done.html">[his] definition of 'done' continues to expand</a>". Currently, his definition reads:

> A feature is not "done" until all of the following can be said about it:
> * All unit tests are green.
> * The code is as simple as it can be.
> * It communicates clearly.
> * It compiles in the automated build from a clean checkout.
> * It has passed unit, functional, integration, stress, longevity, load, and resilience testing.
> * The customer has accepted the feature.
> * It is included in a release that has been branched in version control.
> * The feature's impact on capacity is well-understood.
> * Deployment instructions for the release are defined and do not include a "point of no return".
> * Rollback instructions for the release are defined and tested.
> * It has been deployed and verified.
> * It is generating revenue.
> Until all of these are true, the feature is just unfinished inventory.

As much as I agree with the first 11, I'm not sure I agree with #12. Not because it's not important--too many software features are added with no positive result--but because it's too hard to measure the revenue a particular program, much less a particular software *feature*, is generating.

My guess is that this is also conflating the differences between "features" and "releases", since they aren't always one and the same, and that not all "features" will be ones mandated by the customer (making #6 somewhat irrelevant). Still, this is an important point to any and all development shops: 

What do *you* call "done"?
 
