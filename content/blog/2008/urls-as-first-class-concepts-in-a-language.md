title=URLs as first-class concepts in a language
date=2008-02-22
type=post
tags=reading, industry, languages, java, clr
status=published
description=In which I discuss URLs and how they could or should operate in a language.
~~~~~~

While perusing the <a href="http://www.erights.org/elang/intro/finding-text.html">E Tutorial</a>, I noticed something that was simple and powerful all at the same time: *URLs as first-class concepts in the language.* 

<!--more-->

Or, if you will, URLs as a factory for creating objects. Check out this snippet of E:

```
? def poem := <http://www.erights.org/elang/intro/jabberwocky.txt>
# value: <http://www.erights.org/elang/intro/jabberwocky.txt>

? <file:c:/jabbertest>.mkdirs(null);
? <file:c:/jabbertest/jabberwocky.txt>.setText(poem.getText())
```

Notice how the initialization of the "poem" variable is set to what looks like an HTTP URL? This essentially downloads the contents of that file and stores it into poem (in a form I don't precisely understand yet--I think it's an object that wraps the contents, but I could be wrong). Then the script uses file URLs to create the local directory (jabbertest) and to create a new file (jabberwocky.txt) and set the contents of that file to be the same as the contents of the stored "poem" object.

That, my friends, is just slick. It also neatly avoids the whole "how are files and directories and stuff different from URLs" that tends to make doing this same bit of code in Java or C# that much more difficult.
 
