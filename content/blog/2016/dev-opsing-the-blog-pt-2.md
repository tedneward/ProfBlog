+++
concepts = ["Architecture", "Cloud", "DevOps"]
date = "2016-01-21T00:20:19-08:00"
languages = ["Ruby"]
platforms = ["Site44"]
title = "DevOps-ing the Blog, Part 2"

+++

**tl;dr** For years, I've wanted to use social media to help draw attention to the blog entries I write.
But manually posting to Twitter and LinkedIn about each blog entry was just too boring to contemplate.
With this latest reboot, and the fact that I'm using a CI server to generate each post, I finally decided
to break down and automate the process.

<!--more-->

In [the last blog update](http://blogs.tedneward.com/post/dev-ops-blog), I mentioned how I'm making use
of [TeamCity](http://www.jetbrains.com/teamcity) to pick up when I check in a new blog post, run the
[hugo](https://gohugo.io) generator against the collection of posts to regenerate the site, and deploy
the files all to the [Site44](http://www.site44.com) static site host through my Dropbox account to push
the site live.

But one of the things that I've often wondered was whether it would actually net me more readers and/or
more eyeballs if I let people know every time I post a new blog entry. Obviously, social media is the
mechanism by which to do this; in my case, that means Twitter and LinkedIn, since I reserve my use of
Facebook exclusively for personal stuff.

(The rationale there being, I don't control who follows me on Twitter, and on Facebook you and I each
have to mutually agree to be friends in order for us to be considered such. LinkedIn uses a similar
kind of algorithm for determining connections, but there, the emphasis is much more strongly around
professional connections.)

Both social media tools have HTTP-based APIs that can be used to accomplish what I'm looking to do
(although it took me a while to figure out what LinkedIn considered the difference between a 'share'
and a 'post', and I'm still not sure I understand the difference), so on the surface of it, all it
should really require is a simple "POST" to the right URL, and voila! Social media magic.

The reality was a touch more complex, although I must admit, far less so than I'd feared.

With TeamCity already configured to poll the Mercurial repo every half-hour, and pull down the files
in order to re-gen the site, I just needed to figure out a couple of things:

1. Can TeamCity determine which posts are new (and thus need to be posted), and which aren't (and thus
   shouldn't be posted)? If I make an edit/update to a post, I don't necessarily want to re-Tweet about
   the update. Matter of fact, I realized that probably 95% of the time, I won't, and the other 5%, I
   can always do by hand.
2. Can TeamCity discover the title of the post? The title and the file names are not the same. (This
   post, for example, lives in the file "dev-opsing-the-blog-pt-2", and technically in Hugo the file
   name and the title really have no relationship to one another except by what I the author choose
   to enforce or apply.)

### First step: Figuring out the changes
Obviously, on each build request, TC needs to figure out what changed. My first thought was that I
would have to determine this somehow "by hand", but it turns out that TeamCity will actually provide
that to a given Build Step, through what they call
[build parameters](https://confluence.jetbrains.com/display/TCD9/Defining+and+Using+Build+Parameters+in+Build+Configuration).
In this particular case, they will provide all of the "file diffs" in a very specific format, and then
pass that file's name as parameter to whatever you're configuring as the build step, if desired.
(Note that this is described [here](https://confluence.jetbrains.com/display/TCD9/Predefined+Build+Parameters#PredefinedBuildParameters-ServerBuildProperties)
and the actual format of the file in question is described
[here](https://confluence.jetbrains.com/display/TCD9/Risk+Tests+Reordering+in+Custom+Test+Runner);
personally I think this should probably be documented elsewhere in a reference and just linked from
the test-runner docs, but so be it.)

The format of this file is pretty straightforward. Each file changed gets its own line, and each line
is a three-part tuple separated by colon (":") markers, a la `<relative file path>:<change type>:<revision>`.
The relative-file-path is relative to the root of the repo, the change-type is one of "ADDED","CHANGED",
"REMOVED","NOT_CHANGED" (althogh I don't know how that ever comes up) and three other values related to
directories that I didn't care about; and lastly, the revision number/tag that this file was changed in.

So, when I write this blog post, and commit the file to the repo, that means that TC will get a line
in this temporary "revisions-file" that would look something like:

````
content/post/dev-opsing-the-blog-pt-2.md:ADDED:1234abcd
````

where the revision tag is what Mercurial calls the "changeset".

One drawback here, of course, is that there's no title here, and I don't really want to write a full
Markdown parser if I can help it. But first of all, I need something to be triggered from TC when the
build starts, and that's where Ruby comes in again.

### Second step: discoverChanges.rb
The Ruby script's job is going to be fairly simple, in theory:

1. For each line in that "revisions-file", check to see if it's a blog post, and if so, if it's new.
2. For each element that is a new blog post:
   1. Discover its title
   2. Tweet it
   3. LinkedIn "share" it

So, the Ruby script is called "discoverChanges", and lives in the root of the repo. (I thought about
tucking it away in a subdirectory, but frankly, I wasn't sure how easy it would be to run Ruby from TC
in the first place, so I wanted to keep things as simple as possible; as it turned out, that was nowhere
close to where I spent the majority of my time/frustration.)

A first step for this Ruby script looked something like this:

````ruby
def process_line(line)
  puts "Processing #{line}"
  
  lineSplits = line.strip.split(":")
  path = lineSplits[0]
  changeType = lineSplits[1]
  revTag = lineSplits[2]
  
  puts "\tPath: #{path}"
  puts "\tChangeType: #{changeType}"
  puts "\tRev: '#{revTag}'"

  message = fetch_commit_message("blog", revTag)
  puts "\tMessage: #{message}"
  
  if path.start_with?("content/post") and changeType == "ADDED"
    path.slice! "content/"
    path.slice! ".md"
  
    tweet("BLOGGED: \"#{message}\": http://blogs.tedneward.com/#{path}")
    linkedin_status("BLOGGED: \"#{message}\": http://blogs.tedneward.com/#{path}")
  end
end

changedFiles = File.open(ARGV[0], "r").read
changedFiles.lines.each { |line| process_line(line) }
````

The TeamCity Build Step to run this is a Command-Line build step, with the executable command set to
`ruby.exe discoverChanges.rb %teamcity.build.changedFiles.file%`. That will pass the revisions-file
as the first argument to the script, which you can see me grabbing out of `ARGV[0]`.

The `tweet` and `linkedin_status` methods are where I'm going to be filling in the API for each,
but at first all they did was just write to the console, so I could verify that everything was
working as promised. The "puts" messages write to the TeamCity build log, so it was a quick and
easy way to verify that everything was working.

However, I also discovered that the "edit, switch over to the TC console, command it to run a build,
wait a few minutes while it does so, then check the build log for the results" development cycle was
a bit slow. It took me a shamefully long time to realize "Why not just create a quick-n-dirty revisions-file
myself here in my dev directory, and just test with that?" Duh. That sped things up quite a bit.

The key part that's not clear in the above, however is the `fetch_commit_message` call, and that
appears to be where I find the title for the post.

### Third step: BitBucket API
You see, I've been a fan of [BitBucket](http://www.bitbucket.org) for five years now (since Sep 2010,
according to the dashboard when I log in there), largely because I (at the time) understood Mercurial
far more than I did Git, and BB supported Mercurial. (They now support both hg and git.) More importantly,
though, BB allows an unlimited number of private repositories at their free tier, with support for up to
five users on each. Since I'm really the only user on my private repos, that's a beautiful thing for me.
(Sorry, folks, but I don't really want my repos to be available for anybody else to clone and/or fork;
a lot of the stuff up in those repos is stuff you wouldn't want anyway, or it's stuff I'm working on for
clients, or it's stuff I'm working on for me and just don't want to show the world yet.)

And wouldn't you know it, but BitBucket has a 
[REST API](https://confluence.atlassian.com/bitbucket/use-the-bitbucket-cloud-rest-apis-222724129.html).

I knew about this a while ago, because I was leveraging it as part of the website for the
[Architectural Katas](http://www.architecturalkatas.com), to pull the descriptions of each kata directly
from BitBucket via client-side Javascript. Now I just needed to discover how to correlate the TeamCity
concept of "revision tag" to the proper spot in BitBucket, and sure enough a "revision tag" relates
to a "changeset", such that if I submit a GET request to the BitBucket 
`repositories/(repo)/changesets/(changeset)` URL, it will hand back a lovely JSON data structure that
contains the commit message at the time that particular file was committed.

And, best of all, I can avoid doing the OAuth dance with BitBucket (which I was hoping to avoid for
all of them, but discovered later it wasn't as bad as I thought it would be) by just doing a simple
HTTP Basic-Auth as part of the HTTP request. So now, the Ruby looks like:

````ruby
require 'net/http'
require 'net/https'
require 'json'

def fetch_commit_message(repo_slug, changeset)
  user = "TedNeward"
  password = "XXXXXX"
  page_link = "https://bitbucket.org/api/1.0/repositories/#{user}/#{repo_slug}/changesets/#{changeset}/"
  puts "\tFetching #{page_link}"
  uri = URI page_link
  Net::HTTP.start(uri.host, uri.port, :use_ssl => true, :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
    request = Net::HTTP::Get.new uri.request_uri
    request.basic_auth(user, password)
    response = http.request request

    body = JSON.parse response.body
    return body['message']
  end
end
````

Some Rubyists will wonder why I didn't use one of the other Ruby HTTP client libraries; quite
honestly, because I couldn't get most of them to work. There were some issues with digital certificates
(necessary in order to do an SSL request), and in some cases, the libraries just simply didn't work.
I didn't really want to debug them; I just wanted to use them, so I kept thrashing around looking
for a gem that would work, until I finally found the above snippet of code that uses just the core
Ruby library, and sonofagunitworks, so boom, that's what we use here.

So now, I have the commit message. I originally thought I'd do something tricky like prefix the
title in the commit message with "TITLE" and read until some kind of end marker, and then thought,
"Dude, you're the only one committing to this repo, and if you just remember to put the title as
the commit message, you can just grab the whole string and not worry about it."

(Funny story: Shortly after making that decision, I had to do a merge commit against the repo to
pull down some script changes I was working on over on the desktop, and it happened to be in the
same commit as a new blog post. Sure enough, a number of you saw the Tweet "BLOGGED: Merge commit",
and asked about that. Now you know why.)

### Fourth step: Twitter
So now I have the file (from which I can generate the URL relative to the server), the commit
message, and obviously I already know my own Twitter username and password, so now I need to
figure out a way to post to Twitter. I [know](http://www.ibm.com/developerworks/java/library/j-scala05059/index.html)
that Twitter used to support Basic Auth, but shortly after I wrote that article, they switched over
to a fully OAuth-based credential system, and I wasn't sure how well OAuth would work for client apps
like this one, where I want to essentially "bake in" the account being used.

Some random Googling led me to ["t", the command-line Twitter client](https://github.com/sferik/t),
and after a few quick experiments, I thought "Sweet! This does what I need it to do!", including
cache off the authentication tokens so that I can just say "t update (whatever)" and have it show
up in Twitter.

Alas, it was not to be. "t" works well for logged-in users, but it stores those credentials in a file
in your home directory (C:\Users\Ted, in my case), and when TeamCity is running as a service, it's
not using your user account to run, it's using a lower-privileged account. I might have, in retrospect,
just re-configured TeamCity to use my "Ted" account on the desktop to run, but I thought, "Pffft. This
isn't a problem--I'll juse use t's command-line --profile parameter to tell it from where to pick
up the .trc file it's looking for the auth tokens in."

Except that didn't work. Contrary to the docs and the code, I was never able to get "t" to pick up
the .trc file from any place other than the default location.

*sigh*

And did I mention that the author has basically abandoned the codebase, because he's got other stuff
he wanted to work on?

*sigh*

I sort of glanced around for a while trying to find a new client, but then while browsing through
the t code, I noticed that it uses a gem called "twitter", written by the same guy.

Hmmm.

Sure enough, it turned out to be almost next to trivial to use, so long as I could do the OAuth
dance by hand. And that is just complicated enough to merit its own discussion, since it's something
I had to do for both the Twitter code and the LinkedIn code (which also has a gem out there, by
the way).

### OAuth dance
I'm not going to explain OAuth---that's the job of a number of other posts out there, and it would
distract from the discussion here. The upshot is, for an app like this, which is entirely non-interactive
and won't be running as a service somewhere (to allow for HTTP callbacks), we have to do things a little
differently from the traditional OAuth dance.

First, as per normal, you need to go to the system in question (Twitter and/or LinkedIn) and
obtain a "consumer key" and "consumer secret". As a Twitter user, the easiest way I know to do
this is to go to your Twitter web page, a la http://www.twitter.com, and once you're authenticated
in to your account, click on your avatar picture in the upper-right corner, and select "settings".
It'll take you to http://www.twitter.com/settings/account. There, you'll see one of the menu options,
"Applications", which will show you a list of all the applications you've already approved to use
your Twitter account. I needed to get my command-line client into that list.

The Twitter-mandated way to do that, of course, is here: https://apps.twitter.com/ . Click "Create
New App", and fill in the blanks. (Leave the callback field blank, since we're not going to use
it.) Assuming that your app name is unique, you're taken to a screen that contains information about
your shiny new "Twitter app". On that page, the "Keys and Access Tokens" will list your new app's
consumer key and consumer secret, which is OAuth parlance for "your client's proof that they are
who they claim they are", but in order to make API calls, you need both of those and an "access
token" and an "access token secret".

Normally, a Twitter client obtains this on behalf of a user by doing the OAuth dance, getting the
user to type in their password through the Twitter login dialog, and then harvest the access keys
that way (and usually cache them off somewhere). Here, since this is all being done on my behalf,
there's only one user and therefore only ever one set of access keys to manage. Fortunately,
Twitter thought ahead about this, and provides a "Create my access token" button right underneath
the Application Settings section. That'll give you the access keys.

So now, it's just a matter of using those four values in the Twitter gem's API:

````ruby
def tweet(message)
  require 'twitter'

  client = Twitter::REST::Client.new do |config|
    config.consumer_key = YOUR_CONSUMER_KEY
    config.consumer_secret = YOUR_CONSUMER_SECRET
    config.access_token = YOUR_ACCESS_TOKEN
    config.access_token_secret = YOUR_ACCESS_TOKEN_SECRET
  end
  puts client.update("#{message}").uri
end
````

The `client.update` call posts the message, and the returned object contains the URI of the
Tweet on twitter.com, and I just print it to the build log so that I can go back and look at the
actual Twitter status ID if for some reason I want to. (I wanted to have some kind of message in
the build log that indicated that the Tweet successfully went out.)

It took a lot longer to get to this point than the above code suggests by the way, so if you are
interested in going down this path, and can make all this work in fifteen minutes or so, you owe
me a beer or something. *grin*

### Fifth step: LinkedIn
Conceptually, posting a "share" to LinkedIn is just the same kind of thing: Do the OAuth dance
ahead of time to obtain consumer and access key pairs, then use the linkedin gem to authenticate
and post the message. Doing the OAuth dance with LinkedIn took a little bit of time to wander
through their (not particularly impressive) documentation and the example code from the linkedin
gem README.

Essentially, do the following:

* In an interactive Ruby session, do the following:

   ````ruby
   require 'rubygems'
   require 'linkedin'

   # get your api keys at https://www.linkedin.com/secure/developer
   client = LinkedIn::Client.new('your_consumer_key', 'your_consumer_secret')

   # If you want to use one of the scopes from linkedin you have to pass it in at this point
   # You can learn more about it here: http://developer.linkedin.com/documents/authentication
   request_token = client.request_token({}, :scope => "r_basicprofile r_emailaddress")
   ````
   
* Look at the request_token returned to you. It should consist of two parts, the `token` and
  the `secret`. Open a browser window to https://api.linkedin.com/uas/oauth/authorize?oauth_token=<token>
  and after logging in to LinkedIn, write down or copy to the clipboard the PIN that it displays.
  You need this for the next step.

* Do the following in irb:

   ````ruby
   client.authorize_from_request(rtoken, rsecret, pin)
   ````

* What is returned to you are two long hexadecimal strings; the first is the access token, the
  second the access token secret. You'll need both of them (in that order!) to pass to the
  `client.authorize_from_access` method in the client code.

So the LinkedIn code in my script looks like the following:

````ruby
def linkedin_status(message)
  require 'linkedin'
  
  consumer_key = YOUR_CONSUMER_KEY
  consumer_secret = YOUR_CONSUMER_SECRET
  access_token = YOUR_ACCESS_TOKEN
  access_secret = YOUR_ACCESS_TOKEN_SECRET

  client = LinkedIn::Client.new(consumer_key, consumer_secret)
  client.authorize_from_access(access_token, access_secret)
  
  # This client.profile call appears to be necessary before being able
  # to send a share. Fascinating.
  #
  client.profile 

  puts "LINKEDINNING: #{message}"
  param = {comment: "#{message}"}
  client.add_share(param)
end
````

Note the comment right before the call to `profile`; it shouldn't be necessary, but the linkedin
gem wouldn't post the share unless I called it first. No idea why. Don't care, either, now that
it's all working. *grin*

### Summary and notes
It works. If you came to this post via Twitter or LinkedIn, you're living proof that it worked!

Is this a perfect system? Not quite yet. There's one noticeable thing I haven't quite sorted out
yet, though I have an idea how to fix it.

See, when I do a build, Build Step 2 does an "xcopy" of the generated files (from the local "public"
directory when hugo runs) over to my Dropbox directory, and from there Dropbox syncs them against the
Dropbox servers, and from there, Site44 picks up those changes and deploys them to the server hosting
the site. All of that takes a non-trivial amount of time, but it's essentially an async process as far
as I'm concerned, once the files are copied over to my local Dropbox directory.

What that means, then, as some of you have noticed, is that the Tweet sometimes goes out before the
files are actually there on the server yet. That's why some of you have gotten "404"s when clicking
through the links.

Solution? Well, the simplest thing is to just "pause" the build for a few seconds after the files
have been copied. 

Yep. It's a hack. It's the TeamCity equivalent of "thread.sleep(1000)". But I can't come up with an
easier way to hold it all up, and frankly, we are not talking about a heavy concurrency scenario
here. (Still, if somebody has a better solution here, I'm all ears!)

(BTW, as I write this, a Google search reveals that there's a command in windows called "timeout"
which will pause for *n* seconds, plus or minus 1. I don't need super-high degrees of accuracy,
so that's where I'm going first. Worst case, Ruby supports the "sleep" call, so a quick one-line
Ruby script to "sleep 15" would probably work, too. You'll know if I didn't get it work if you
see a "404" immediately after I Tweet or LI-status-update, and please let me know if you do!)

(**UPDATE**: "timeout" didn't work; it didn't like being called from TeamCity, since that would
require its I/O to be redirected, and it really doesn't like that. So that turned into a quick
one-liner "ruby -e 'sleep 30'" in the Command-Line build step, and it works like a charm.)

The other thing I need to do is figure out how to make the bulk-copy process a little less "bulk".
Theoretically, only a few files change when I post a new blog entry, so ideally only those files
that have changed should be copied over (and upstream through Dropbox). I think the old
"robocopy" tool will be the tool of choice here, but barring that, maybe another quick-and-dirty
Ruby script to do a file-size comparison before doing the copy, or maybe even I'll drop back to
my old roots and write a little C/C++ code, just for fun.

At any rate, thanks for reading, and as I make changes to the process, I'll blog about it so you
can decide whether I'm totally crazy or not.

(Now, if only I could figure out how to automatically write blog posts for me...)

