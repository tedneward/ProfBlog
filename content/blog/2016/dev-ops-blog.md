+++
concepts = ["Architecture", "Cloud", "DevOps", "Industry"]
date = "2016-01-16T23:33:49-08:00"
languages = ["Ruby"]
platforms = ["Windows","Site44"]
title = "DevOps-ing the blog"

+++

**tl;dr** With a static-site-generated blog, it was getting painful to do all the steps necessary to
push a new post out the (virtual) door. So I did what any good DevOps-minded engineer would do---I
put TeamCity on the job.

<!--more-->

In a [previous post](http://blogs.tedneward.com/post/more-blog-notes/), I talked about how the new blog
is run using a static-site generator system called [Hugo](https://gohugo.io), and that I've enjoyed
working with it so far. And for the most part, that's true.

Except when it came time to push a new post out the door.

Don't get me wrong, it's not like it's rocket science. But I have to run hugo, copy the generated files
(from the local "public" directory) over to Dropbox, and let Dropbox and Site44 do their thing. And 
considering that I often write posts while not at home (and, by definition, not on my home
WiFi network), it could often be a very expensive process to upload the resulting files through
Dropbox to the site home. Particularly if I'm overseas and using a hotel connection where they like
to charge by the byte or something.

A solution was necessary.

### Workflow
Let's talk about my desired blogging workflow before I get too deep into this.

I really like the idea of writing blog posts while offline. So much so, in fact, that I deliberately
chose to adopt a blog engine ten years ago (the aforementioned dasBlog) that would allow me to
email blog posts in to the server to be posted. Just hook up the right POP3 credentials, let dasBlog
cruise through your mail folders looking for posts that are prefixed with the right annotations, and
so on and so on.

I ended up not using it very much---it was too hard to format, it was too hard to remember all the
little i's and t's that needed to be dotted and crossed, and frankly, when all was said and done, I
was spending more time troubleshooting and supporting the idea than I was actually using it. Not a
desirable state of affairs, so that more or less fell by the wayside.

Now, my desired workflow is still the same:

1. Write a blog post.
2. Save it (someplace).
3. System picks up the new blog post.
4. System automatically regenerates the site with the new blog post in place.

Pretty straightforward stuff. But ideally, the system should also make sure that the blog posts are
saved off/backed up somewhere, so that there's some backwards history, in the event that I make
some kind of edit that I'd like to get back (or there's some kind of disaster). Sure, Dropbox will
keep some versioning of the end-result files, but the Markdown files in which I write, those aren't
kept anywhere as far as Hugo is concerned. Those are source artifacts, not end-results.

So where to source artifacts go? In source control, of course.

### Step 1: BitBucket
Some of you will be surprised to note that I actually prefer [BitBucket](https://www.bitbucket.org)
for my personal source control needs, over GitHub. The reason for it is simple: not everything I want
to store in a DVCS do I want to be public, and BB allows for private repositories at their free tier
while GH doesn't. Couple that with the fact that BB supports both Mercurial and Git, and that it's
got most of the same kinds of tools that GH has, should I ever want/need to use them, and it's a
pretty easy conclusion.

So when I write a new post, it gets added to BitBucket. This gives me the backup capability, as well
as the revision history, and as a bonus, since it's distributed VCS (I happen to use Mercurial in
this case, since that's the one I know better than git), I can commit a few posts while I'm on the
airplane, then "push" when I'm on a connection again, and I won't be uploading the whole world
through Dropbox.

Win.

### Step 2: TeamCity
But now, something needs to know that there is a new post, waiting, and run the "hugo" tool to
generate the new site and push it through Dropbox to Site44. This sounds familiar to anybody
who's ever done anything with a source control server, and it so happens that I have
[TeamCity](https://www.jetbrains.com/teamcity/) installed on a desktop machine at home that's
pretty much perpetually on. (It's my gaming rig, my desktop Windows machine for when I want to
do some quick Windows work, and it's the machine that my eldest son is using to build his
capstone graduation-requirement game project in Unity3D, since it runs better on my desktop
than on his laptop.)

The next step was clear: Hook up TeamCity to the Mercurial VCS Root at BitBucket, tell it how
to "build" the site (`C:\Prg\bin\hugo.exe -t vienna`, since it runs in the temporary directory
where the site sources get downloaded on checkout), and run a second build step to "deploy"
the code (`xcopy /s/e public/** C:\Users\Ted\Dropbox\...`).

Set the timeout timer to something reasonable (30 minutes, and even at that, I should probably
knock it down to an hour or two), and voila!

Oh, and by turning on email notifications, TeamCity will now email me every time there's a
successful "build" of my blog, so I know roughly when a new post goes out.

Win.

### Step 3: ...
There is no step 3.

Well, OK, yes, there is a step 3. It's not quite finished yet, but some of you may have come
here through what is essentially the (brand-new) third build step in the build server: to
automatically [Tweet](http://www.twitter.com/tedneward) (and, hopefully, post to 
[LinkedIn](http://www.linkedin.com) as a "share") when a new blog post has gone up, so that
all those folks who follow me on Twitter but don't yet subscribe to the feed can know when
a new post is up.

And this post will, hopefully, be the first proof that it works. But I'll save the details
of how I hooked it all up for a later post, because first I want to make sure it all works
before I start going on about it.

Stay tuned....


