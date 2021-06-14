+++
date = "2007-12-05T02:44:41.8642980-08:00"
draft = false
title = "A Dozen Levels of Done"
aliases = [
	"/2007/12/05/A+Dozen+Levels+Of+Done.aspx"
]
categories = [
	"Development Processes","Reading"
]
concepts = ["Development Processes", "Reading"]
languages = []
platforms = []
 
+++
<p>Michael Nygard (author of the <em>great</em> book <em>Release It!</em>), writes that "<a href="http://www.michaelnygard.com/blog/2007/11/a_dozen_levels_of_done.html">[his] definition of 'done' continues to expand</a>". Currently, his definition reads:</p> <blockquote> <p>A feature is not "done" until all of the following can be said about it: <ol> <li>All unit tests are green.  <li>The code is as simple as it can be.  <li>It communicates clearly.  <li>It compiles in the automated build from a clean checkout.  <li>It has passed unit, functional, integration, stress, longevity, load, and resilience testing.  <li>The customer has accepted the feature. <li>It is included in a release that has been branched in version control.  <li>The feature's impact on capacity is well-understood. <li>Deployment instructions for the release are defined and do not include a "point of no return".  <li>Rollback instructions for the release are defined and tested.  <li>It has been deployed and verified.  <li>It is generating revenue.</li></ol> <p>Until all of these are true, the feature is just unfinished inventory.</p></blockquote> <p>As much as I agree with the first 11, I'm not sure I agree with #12. Not because it's not important--too many software features are added with no positive result--but because it's too hard to measure the revenue a particular program, much less a particular software <em>feature</em>, is generating. <p>My guess is that this is also conflating the differences between "features" and "releases", since they aren't always one and the same, and that not all "features" will be ones mandated by the customer (making #6 somewhat irrelevant). Still, this is an important point to any and all development shops: <p>What do <em>you</em> call "done"?</p>
 
