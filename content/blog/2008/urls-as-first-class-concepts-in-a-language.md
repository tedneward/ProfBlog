title=URLs as first-class concepts in a language
date=2008-02-22
type=post
tags=reading, industry, distributed systems, xml services
status=published
description=In which I discuss URLs and how they could or should operate in a language.
~~~~~~

<p>While perusing the <a href="http://www.erights.org/elang/intro/finding-text.html">E Tutorial</a>, I noticed something that was simple and powerful all at the same time: <em>URLs as first-class concepts in the language</em>. Or, if you will, URLs as a factory for creating objects. Check out this snippet of E:</p> <blockquote> <div style="border-right: gray 1px solid; padding-right: 4px; border-top: gray 1px solid; padding-left: 4px; font-size: 8pt; padding-bottom: 4px; margin: 20px 0px 10px; overflow: auto; border-left: gray 1px solid; width: 97.5%; cursor: text; max-height: 200px; line-height: 12pt; padding-top: 4px; border-bottom: gray 1px solid; font-family: consolas, 'Courier New', courier, monospace; background-color: #f4f4f4"><pre style="padding-right: 0px; padding-left: 0px; font-size: 8pt; padding-bottom: 0px; margin: 0em; overflow: visible; width: 100%; color: black; border-top-style: none; line-height: 12pt; padding-top: 0px; font-family: consolas, 'Courier New', courier, monospace; border-right-style: none; border-left-style: none; background-color: #f4f4f4; border-bottom-style: none">? pragma.syntax(<span style="color: #006080">"0.8"</span>)

? def poem := &lt;http:<span style="color: #008000">//www.erights.org/elang/intro/jabberwocky.txt&gt;</span>
# value: &lt;http:<span style="color: #008000">//www.erights.org/elang/intro/jabberwocky.txt&gt;</span>

? &lt;file:c:/jabbertest&gt;.mkdirs(<span style="color: #0000ff">null</span>);
? &lt;file:c:/jabbertest/jabberwocky.txt&gt;.setText(poem.getText())</pre></div></blockquote>
<p>Notice how the initialization of the "poem" variable is set to what looks like an HTTP URL? This essentially downloads the contents of that file and stores it into poem (in a form I don't precisely understand yet--I think it's an object that wraps the contents, but I could be wrong). Then the script uses file URLs to create the local directory (jabbertest) and to create a new file (jabberwocky.txt) and set the contents of that file to be the same as the contents of the stored "poem" object.</p>
<p>That, my friends, is just slick. It also neatly avoids the whole "how are files and directories and stuff different from URLs" that tends to make doing this same bit of code in Java or C# that much more difficult.</p>
 
