+++
date = "2016-01-11T01:22:52-08:00"
title = "More blog notes"
concepts = ["Architecture", "Distributed Systems","Industry","Review","Personal"]
languages = ["Go"]
platforms = ["Native","Stie44"]

+++

Or, How I'm handling more old blog URLs using [Hugo](https://gohugo.io) and [Site44](https://www.site44.com).

<!--more-->

For the curious, as [I mentioned before](http://blogs.tedneward.com/post/blog-details/), I migrated
the old blog away from dasBlog over to use [Hugo](https://gohugo.io), and for the most part, it's a
pretty cool system. I've always liked the idea of statically-generated content 
(see [Item #55](http://www.amazon.com/Effective-Enterprise-Java-Ted-Neward/dp/0321130006)), and the
painful slowness that the old dasBlog system was experiencing was just the icing on the cake around
deciding to go static-site-generated, so that was a no-brainer decision. And, as I said, after some
Twitter traffic on the subject, a buddy suggested Hugo, which happens to be written in Go, not that
I really care one way or the other. (More on that later.)

Here's the basic set of steps I ended up having to go through to make all of this work so far:

### First pass: Content
dasBlog stores entries in XML files, one per day. (Not one per entry, as I'd first assumed.) Hugo
wants each entry in its own Markdown file. I briefly thought about an XSLT, then realized this would
be a perfect opportunity to exercise my nascent Ruby skills, so armed with the Nokogiri parser, I
wrote a Ruby script. Fundamentally, it starts by looping through each file in the directory containing
all of the entry files:

```ruby
equire 'rubygems'
require 'nokogiri'
require 'time'

#. . . (more here later)

old = Dir.open("old")
old.each { |f|
  if !File.directory?(f)
    process_file("old/" + f)
  end
}
```

Remember, each file contains one or more entries, so I need to pull those entries out separately,
and pipe their contents into its own file. However, each Hugo MD file also wants to have some "front
matter", which contains the metadata for the post---the date it was posted (necessary for ordering),
the title, and so on.

### Second pass: Categories
Front matter can also contain "taxonomies", which is Hugo's fancy category/tags system. (It's actually
a lot more flexible than just categories or tags, but I'll leave that for readers to go through on
their own---it's a pretty nifty system.) So I need to go through the categories listed in the XML
(a semicolon-delimited list of strings inside the Categories tag, which is highly disappointing
considering we're in an XML file here!), and add those each as an array entry in the "categories"
array in the front matter.

### Third pass: Aliases
As mentioned in the other post, I also needed links to come over. Fortunately, Hugo has some pretty
simple "alias" support to preserve old links: In the front matter of a specific post, I can add 
an "aliases" array with the old links present, and Hugo will generate a static HTML page that 
redirects immediately (using a meta-refresh tag in the HTML) over to the new link. So, in addition
to the other front matter, I'm also writing out the old aliases. And that, as it turned out, was
probably the hardest thing in the script, because dasBlog does some really weird "escaping" of the
post titles to make them legitimate URLs; I ended up going with an 80% solution and hand-fixed
the ones that didn't generate exactly.

So at this point, the `process_file` function (and its supporting routines) look like this:

````ruby
def dasBlogize(oldtitle)
  title = ((oldtitle.gsub(/['":#!*(),.?]/, '')).gsub('/', '').split(" ").each { |e| e.capitalize! }).join("+")
  title = title.gsub(/[-]/, '')
  title + ".aspx"
end

def test_old_link(link)
  result = ""
  
  cmd = %Q<curl -s --head http://blogs.tedneward.com#{link}>
  IO.popen(cmd, 'w+') do |subprocess|
    subprocess.close_write
    result = subprocess.read.split("\n")[0]
  end
  
  return result
end

@redirectFails = File.open("redirectfails.txt", "w")

def process_file(file)
  puts "Processing #{file}:"
  
  dayentry_xml = Nokogiri::XML(File.open(file))
  entryset = dayentry_xml.xpath("/xmlns:DayEntry/xmlns:Entries/xmlns:Entry")
  entryset.each { |e|
    puts "... Processing #{e.xpath("xmlns:Title").text}"
    
    date = Time.strptime(e.xpath("xmlns:Created").text, "%Y-%m-%d").utc
    
    title = e.xpath("xmlns:Title").text
    title = (Nokogiri::HTML.parse title).text
    mdfile = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    mdfilepath = "sandbox/content/post/#{mdfile}.md"
    
    newtitle = title.gsub('"', %q(\\\"))

    year = date.year
    fileday = file.split(".")[0].split("-")[2]
    month = date.strftime("%m")
    
    redirect = "/#{year}/#{month}/#{fileday}/#{dasBlogize(title)}"
    test = test_old_link(redirect)
    if test.include?("404")
      @redirectFails.puts "\t*** REDIRECT #{redirect} FAILS"
    end
    
    oldcats = e.xpath("xmlns:Categories").text.split(";")
    oldcats = oldcats.map { |cat| cat = '"' + cat + '"' }

    File.open(mdfilepath, "w") do |out|
      out.puts "+++"
      out.puts "date = \"#{e.xpath("xmlns:Created").text}\""
      out.puts "draft = false"
      out.puts "title = \"#{newtitle}\""
      out.puts "aliases = [\n\t\"#{redirect}\"\n]"
      out.puts "categories = [\n\t#{oldcats.join(",")}\n]"
      out.puts " "
      out.puts "+++"
      out.puts "#{e.xpath("xmlns:Content").text}"
      out.puts " "
      out.close()
    end
  }
end
````

You may be curious about the call to curl in the `test_old_link` function; to be honest, that
was me giving up on trying to use Ruby to do HTTP requests. Every time I tried to issue a GET
request to a URL, when running it from the script (`ruby port.rb`), it timed out, even if
doing the exact same GET from the interactive shell worked fine. Curl seemed to work, so screw
it, let's use curl.

### Results, so far
Armed with said script, I ran it, did the hand-editing of the alises that needed fixing, and
turned that loose. That's what the initial release looked like a week ago or so.

### Added: Google Analytics
Looking to hopefully get some kind of blog-usage report like I used to get from dasBlog every
day, and noticing that the Vienna theme had some built-in (just configure it and off you go)
support for it, I thought, why not? I turned on GA through my Google account, tossed the GA
id into the theme configuration, and *voila!* I now have analytics for my
blog site.

A little *too* much analytics, actually---I have no idea what three-quarters of those metrics
are, or mean. Which was exactly the point! I now have a "production-quality" space with which
to experiment with GA, without losing the "playground" aspect of experimentation. (Meaning, if
I turn something on that totally borks all my metrics and history, nobody gets fired and/or no
money gets lost.)

### Added: Disqus
I also kinda wanted to let people comment on my blog again (which a static site typically
doesn't support natively, since it does no server-side processing, which is the whole point!),
]
concepts = []
languages = []
platforms = []
system---which I had wanted to play around with for another system I was working on not that
long ago but never had the opportunity to do so---so why not? Again, it was trivial to turn
it on: Get a Disqus account, plug in the ID into the Vienna template, and boom, now I have
comments. (And truth be told, looking at the template code, it's not all that hard to add
even without the template stuff in place, so I'm feeling pretty good about that if I do want
to use Disqus on another site.)

### Added: Syndication redirect
One of the key things to the thousands of blog hits I get per day is the RSS feeds that people
have set up against the blog. This one, I'm less sure if it's working, since I don't see any
page hits in GA (since GA requires JavaScript to work!), so I'm just going to have to cross
my fingers and assume it's working, or else hope that somebody who's consuming the old RSS
feed can tell me that it's still coming in, without modification.

As I mentioned at the top of the blog post, I'm using [Site44](http://www.site44.com) for my
static site hosting needs. (They're an awesome host, by the way; much kudos to Steve Marx,
who's patiently answered every single support question I've ever asked him, and when we found
a bug in his hosting setup, he had it fixed within minutes.) They hook up each site you want
to run as a folder underneath your Dropbox folder, so deploying to the site is just a matter
of copying files over to Dropbox and waiting for a few minutes. Been using them for a few
years now for a variety of sites, and I couldn't be happier.

Here's where this is important to the story: Because this is static file hosting, I can't do
anything server-side with the incoming URL, right? As it turns out, that's not entirely true;
Site44 supports [server-side redirects](http://www.site44.com/advanced), among other things,
so that I can set up a "URL to new URL" redirect that will hand back an HTTP 301 and then
load up the new resource.

This is important, since now I can take the old "SyndicationService.asmx/GetRss" URL that
dasBlog sports, and redirect it to the `index.xml` file that Hugo generates:

````
/SyndicationService.asmx/GetRss /index.xml
````

That (hopefully) allows all the RSS-consumers to keep consuming the site without modification.

### Added: Category views
This is the most recent addition to the blog. dasBlog supports a variety of different views,
based on category, using the really odd URL `/CategoryView,category,Android.aspx`. Fortunately,
I only have a few categories (relatively speaking), so I just added them by hand to the
redirects file again, as in:

````
/CategoryView,category,Android.aspx /categories/android/index.xml
````

And again (in theory) I've now managed to support the old category view links. (I know that
there's a few places out there using them because I discovered through Google Analytics that
people were trying to access links on the site using them).

### Summary (so far)
There's a few things yet that I don't have in place:

* **Month/year views.** dasBlog supports views of the form "2005-12", meaning "show me all the
  posts from that month in that year", and I haven't quite figured out how to do that, since
  that's not something that neither Hugo nor the Vienna theme has support to do. (I'm not
  even sure yet which would have the responsibility to do so.) Not sure how important this is.
* **The old comments preserved and brought over.** Honestly, some of the commentary was good,
  but to port it over, I'd need to pipe them all into Disqus, and I'm not sure how kosher
  that would be to do, since those were other people who entered them. Hate to say it, but I
  think comments are not coming over, period.
* **Permalinks.** The old system used GUIDs for permalinks (hey, it seemed like a good idea at
  the time! I guess), and while I could either slip them in as a front-matter alias or as a
  redirects link, I'm not sure how many people actually used the permalinks (I'm only seeing
  a very scattered few in the Google Analytics so far), so this may not be worth the trouble.

Overall, I'm pretty pleased with the whole thing so far, and I thikn I have a systme I'm going
to find easy and useful to use.

In the next blog installment, I'll talk about the new workflow I've evolved for writing blog
posts. Spoiler alert: It involves a source-control system and a continuous-integration server
running on my desktop machine (which is always on).




