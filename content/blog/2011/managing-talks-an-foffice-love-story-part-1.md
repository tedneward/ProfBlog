+++
date = "2011-04-26T23:15:13.2769304-07:00"
draft = false
title = "Managing Talks: An F#/Office Love Story (Part 1)"
aliases = [
	"/2011/04/27/Managing+Talks+An+Foffice+Love+Story+Part+1.aspx"
]
categories = [
	".NET","Conferences","Development Processes","F#","Windows"
]
concepts = ["Development Processes"]
languages = ["F#"]
platforms = [".NET", "Windows"]
 
+++
<p>Those of you who’ve seen me present at conferences probably won’t be surprised by this, but I do a lot of conference talks. In fact, I’m doing an average of 10 or so talks at the NFJS shows alone. When you combine that with all the talks I’ve done over the past decade, it’s reached a point where maintaining them all has begun to approach the unmanageable. For example, when the publication of <em>Professional F# 2.0</em> went final, I found myself going through slide decks trying to update all the “Credentials” slides to reflect the new publication date (and title, since it changed to <em>Professional F# 2.0</em> fairly late in the game), and frankly, it’s becoming something of a pain in the ass. I figured, in the grand traditions of “itch-scratching”, to try and solve it.</p>  <p>Since (as many past attendees will tell you) my slides are generally not the focus of my presentations, I realized that my slide-building needs are pretty modest. In particular, I want:</p>  <ul>   <li>a fairly easy mechanism for doing text, including bulleted and non-bulleted (yet still indented) lists </li>    <li>a “section header” scheme that allows me to put a slide in place that marks a new section of slides </li>    <li>some simple metadata, from which I can generate a “list of all my talks” page, such as what’s behind the listing at <a href="http://www.tedneward.com/speaking.aspx">http://www.tedneward.com/speaking.aspx</a>. (Note that I realize it’s a pain in the *ss to read through them all; a later upgrade to the site is going to add a categorization/filter feature to the HTML, probably using jQuery or something.) </li> </ul>  <p>So far, this is pretty simple stuff. For reasons of easy parsing, I want to start with an XML format, but keep the verbosity to a minimum; in other words, I’m OK with XML so long as it merely reflects the structure of the slide deck, and doesn’t create a significant overhead in creating the text for the slides.</p>  <p>And note that I’m deliberately targeting PowerPoint with this tool, since that’s what I use, but there’s nothing offhand that prevents somebody from writing a tool to drive Apple’s Keynote (presumably using Applescript and/or Apple events) or OpenOffice (using their Java SDK). Because the conferences I speak to are all more or less OK with PowerPoint (or PDF, which is easy to generate from PPT) format, that’s what I’m using. (If you feel like I’m somehow cheating you by not supporting either of the other two, consider this a challenge to generate something similar for either or both. But I feel no such challenge, so don’t be looking at me any time soon.)</p>  <p>(OK, I admit it, I may get around to it someday. But not any time soon.)</p>  <p>(Seriously.)</p>  <p>As a first cut, I want to work from a format like the following:</p>  <pre>&lt;presentation xmlns:xi=&quot;http://www.w3.org/2003/XInclude&quot;&gt;
  &lt;head&gt;
    &lt;title&gt;Busy Java Developer's Guide|to Android:Basics&lt;/title&gt;
    &lt;abstract&gt;
This is the abstract for a sample talk.

This is the second paragraph for an abstract.
    &lt;/abstract&gt;
    &lt;audience&gt;For any intermediate Java (2 or more years) audience&lt;/audience&gt;
  &lt;/head&gt;

  &lt;xi:include href=&quot;Testing/external-1.xml&quot; parse=&quot;xml&quot; /&gt;

  &lt;!-- Test bullets --&gt;
  &lt;slide title=&quot;Concepts&quot;&gt;
    * Activities
    * Intents
    * Services
    * Content Providers
  &lt;/slide&gt;
  &lt;!-- Test up to three- four- and five-level nesting --&gt;
  &lt;slide title=&quot;Tools&quot;&gt;
    * Android tooling consists of:
    ** JDK 1.6.latest
    ** Android SDK
    *** Android SDK installer/updater
    **** Android libraries &amp; documentation (versioned)
    ***** Android emulator
    ***** ADB
    ** an Android device (optional, sort of)
    ** IDE w/Android plugins (optional)
    *** Eclipse is the oldest; I don’t particularly care for it
    *** IDEA 10 rocks; Community Edition is free
    *** Even NetBeans has an Android plugin
  &lt;/slide&gt;

  &lt;!-- Test bulletless indents --&gt;
  &lt;slide title=&quot;Objectives&quot;&gt;
    My job...
    - ... is to test this tool
    -- ... is to show you enough Android to make you dangerous
    --- ... because I can't exhaustively cover the entire platform in just one conference session
    ---- ... I will show you the (barebones) tools
    ----- ... I will show you some basics
  &lt;/slide&gt;

  &lt;!-- Test section header --&gt;
  &lt;section title=&quot;Getting Dirty&quot; 
      quote=&quot;In theory, there's no difference|between theory and practice.|In practice, however...&quot; 
      attribution=&quot;Yogi Berra&quot; /&gt;
&lt;/presentation&gt;</pre>

<p>You’ll notice the XInclude namespace declaration in the top-level element; its purpose there is pretty straightforward, demonstrated in the “credentials” slide a few lines later, so that not only can I modify the “credentials” slide that appears in all my decks, but also do a bit of slide-deck reuse, using slides to describe concepts that apply to multiple decks (like a set of slides describing functional concepts for talks on F#, Scala,Clojure or others). Given that it’s (mostly) an XML document, it’s not that hard to imagine the XML parsing parts of it. We’ll look at that later.</p>

<p>The interesting part of this is the other part of this, the PowerPoint automation used to drive the generation of the slides. Like all .NET languages, F# can drive Office just as easily as C# can. Thus, it’s actually pretty reasonable to imagine a simple F# driver that opens the XML file, parses it, and uses what it finds there to drive the creation of slides.</p>

<p>But before I immediately dive into creating slides, one of the things I want my slide decks to have is a common look-and-feel to them; in some cases, PowerPoint gurus will start talking about “themes”, but I’ve found it vastly easier to simply start from an empty PPT deck that has some “slide masters” set up with the layouts, fonts, colors, and so on, that I want. This approach will be no different: I want a class that will open a “template” PPT, modify the heck out of it, and save it as the new PPT.</p>

<p>Thus, one of the first places to start is with an F# type that does this precise workflow:</p>

<pre>type PPTGenerator(inputPPTFilename : string) =
    
    let app = ApplicationClass(Visible = MsoTriState.msoTrue, DisplayAlerts = PpAlertLevel.ppAlertsAll)
    let pres = app.Presentations.Open(inputPPTFilename)

    member this.Title(title : string) : unit =
        let workingTitle = title.Replace(&quot;|&quot;, &quot;\n&quot;)
        let slides = pres.Slides
        let slide = slides.Add(1, PpSlideLayout.ppLayoutTitle)
        slide.Layout &lt;- PpSlideLayout.ppLayoutTitle
        let textRange = slide.Shapes.Item(1).TextFrame.TextRange
        textRange.Text &lt;- workingTitle
        textRange.Font.Size &lt;- 30.0f
        let infoRng = slide.Shapes.Item(2).TextFrame.TextRange
        infoRng.Text &lt;- &quot;\rTed Neward\rNeward &amp; Associates\rhttp://www.tedneward.com | ted@tedneward.com&quot;
        infoRng.Font.Size &lt;- 20.0f
        let copyright =
            &quot;Copyright (c) &quot; + System.DateTime.Now.Year.ToString() + &quot; Neward &amp; Associates. All rights reserved.\r&quot; +
            &quot;This presentation is intended for informational use only.&quot;
        pres.HandoutMaster.HeadersFooters.Header.Text &lt;- &quot;Neward &amp; Associates&quot;
        pres.HandoutMaster.HeadersFooters.Footer.Text &lt;- copyright</pre>

<p>The class isn’t done, obviously, but it gives a basic feel to what’s happening here: app and pres are members used to represent the PowerPoint application itself, and the presentation I’m modifying, respectively. Notice the use of F#’s ability to modify properties as part of the new() call when creating an instance of app; this is so that I can watch the slides being generated (which is useful for debugging, plus I’ll want to look them over during generation, just as a sanity-check, before saving the results).</p>

<p>The Title() method is used to do exactly what its name implies: generate a title slide, using the built-in slide master for that purpose. This is probably the part that functional purists are going to go ballistic over—clearly I’m using tons of mutable property references, rather than a more functional transformation, but to be honest, this is just how Office works. It was either this, or try generating PPTX files (which are intrinsically XML) by hand, and thank you, no, I’m not <em>that</em> zealous about functional purity that I’m going to sign up for that gig.</p>

<p>One thing that was a royal pain to figure out: the block of text (infoRng) is a single TextRange, but to control the formatting a little, I wanted to make sure the three lines were line-breaks in just the right places. I tried doing multiple TextRanges, but that became a problem when working with bulleted lists. After much, much frustration, I finally discovered that PowerPoint really wants you to embed “\r” carriage-return-line-feeds into the text directly.</p>

<p>You’ll also notice that I use the “|” character in the raw title to embed a line break as well; this is because I frequently use long titles like “The Busy .NET Developer’s Guide to Underwater Basketweaving.NET”, and want to break the title right after “Guide”. Other than that, it’s fairly easy to see what’s going on here—two TextRanges, corresponding to the yellow center right-justified section and the white bottom center-justified section, each of which is set to a particular font size (which must be specified in float32 values) and text, and we’re good.</p>

<p>(To be honest, this particular method could be replaced by a different mechanism I’m going to show later, but this gives a feel for what driving the PowerPoint model looks like.)</p>

<p>Let’s drive what we’ve got so far, using a simple main:</p>

<pre>let main (args : string array) : unit =
    let pptg = new PPTGenerator(&quot;C:\Projects\Presentations\Templates\__Template.ppt&quot;)
    pptg.Title(&quot;Howdy, PowerPoint!&quot;)
    ()
main(System.Environment.GetCommandLineArgs())</pre>

<p>When run, this is what the slide (using my template, though any base PowerPoint template *should* work) looks like:</p>

<p><a href="http://blogs.tedneward.com/content/binary/Windows-Live-Writer/Managing-Talks-An-FOffice-Love-Story_12849/image_2.png"><img style="background-image: none; border-right-width: 0px; margin: 0px; padding-left: 0px; padding-right: 0px; display: inline; border-top-width: 0px; border-bottom-width: 0px; border-left-width: 0px; padding-top: 0px" title="image" border="0" alt="image" src="http://blogs.tedneward.com/content/binary/Windows-Live-Writer/Managing-Talks-An-FOffice-Love-Story_12849/image_thumb.png" width="244" height="186" /></a></p>

<p>Not bad, for a first pass.</p>

<p>I’ll go over more of it as I build out more of it (actually, truth be told, much more of it is already built out, but I want to show it in manageable chunks), but as a highlight, here’s some of the features I either have now or I’m going to implement:</p>

<ul>
  <li>as mentioned, XIncluding from other XML sources to allow for reusable sections. I have this already.</li>

  <li>“code slides”: slides with code fragments on them. Ideally, the font will be color syntax highlighted according to the language, but that’s way down the road. Also ideally, the code would be sucked in from compilable source files, so that I could make sure the code compiles before embedding it on the page, but that’s also way down the road, too.</li>

  <li>markup formats supporting *bold*, _underline_ and ^italic^ inline text. If I don’t get here, it won’t be the end of the world, but it’d be nice.</li>

  <li>the ability to “import” an existing set of slides (in PPT format) into this presentation. This is my “escape hatch”, to get to functionality that I don’t use often enough that I want to try and capture it in text files yet still want to use. I have this already, too.</li>
</ul>

<p>I’m not advocating this as a generalized replacement of PowerPoint, by the way, which is why importing existing slides is so critical: for anything that’s outside of the 20% of the core functionality I need (animations and/or very particular layout come to mind), I’ll just write a slide in PowerPoint and import it directly into the results. The goal here is to make it ridiculously easy to whip a slide deck up and reuse existing material as I desire, without going too far and trying to solve that last mile.</p>

<p>And if you find it inspirational or useful, well… cool.</p>
 
