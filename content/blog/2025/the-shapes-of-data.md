title=The Shapes of Data
date=2025-1-31
type=post
tags=engineering, storage, database
status=draft
description=Data storage takes on several different "shapes", and knowing the shape of both the data you're trying to store and the shape of the database you're using can make a huge difference in the complexity of your project.
~~~~~~

**tl;dr** Dating all the way back to the earliest of databases, data has had a "shape" to it, a natural schematic form that defines the various "atoms" and "molecules" that the database understands naturally. Relational data, such as that described by SQL and relational databases, is only one such shape; the various "NoSQL" databases often offer a different shape, but it's not always the same. What's more, just because a database uses a non-relational shape doesn't mean it's a natural fit to your object-programming language's code. When it doesn't, you have an impedance mismatch, which has to be solved somewhere (usually to the detriment of your code and complexity budget).

<!--more-->

<script type="module">
import mermaid from 'https://cdn.jsdelivr.net/npm/mermaid@11/dist/mermaid.esm.min.mjs';
mermaid.initialize({ startOnLoad: true });
</script>

*(BTW, much of this material is stuff I've covered in the past in talks and other materials, but never really with this level of focus; if it sounds familiar, you've probably already heard me yak on about it before, so you might choose to move on.)*

### The Atom of Data: The Bit
Fundamentally, all data boils down to a single bit, 1 or 0. Everything that ever crosses a CPU, resides in RAM, or is stored on disk, is made up of dozens, hundreds, thousands, millions or even billions of these. Beyond that, though, the bit is entirely uninteresting, because with the very rare exception of either writing assembly code by hand or working with bitmasks in a higher-level language (lookin' at you, C), we don't really deal with bits very often. Even native boolean types are often "widened" out to a larger value.

### Er, I mean...
So while the bit is useful and necessary to understand at a foundational level, its purpose here is to combine in various ways to create higher-level data types, which are usually made atomic at the language or data-storage level:

* If we string bits together, we can use each bit in a binary numeric system to represent whole numbers. Depending on how many bits we use, we can get a pretty wide range of values:

    * 8 bits together is a *byte*, which can represent up to 256 (0 to 255) different values. Sometimes the first bit in the pattern is used to indiciate a positive or negative value, which makes this a *signed byte*, capable of storing -127 to +128.
    * Sometimes we string 16 bits together in a programming language and call that a *short integer*, or *short* for short (pun intended), and it can store 2-to-the-16 different values, which is a range of 0 to 65,535, or 64k. It also can be signed, which changes the range from -32k to +32k. 
    * 32 bits together is an *integer* in most circa-2000 programming languages, and again it can be unsigned (0 to 4,294,967,296), or signed (-2,147,483,648 to 2,147,483,647).
    * 64 bits, a *long integer* or *long*, gives us something like 18,446,744,000,000,000,000 possible values; that's 1.8446744e+19 for those of you who prefer scientific notation. (By the way, somebody double-check me on those two numbers, I tried to count the zeros and decimal places and lost track three times.)

* We can also string bits together in 32- and 64-bit formats, but this time use a different encoding mechanism to capture floating-point values.

But these are just numbers; a good chunk of our data is stored in human text, a la *strings*, which are collections of 8-bit bytes (if it's stored in ASCII) or 16- to 64-bit Unicode Transfer Format chunks; this is where UTF-8, UTF-16, and/or UTF-32 comes into play. And, in many cases, since we don't know how long a string should be (are we storing a single word from the dictionary, or the entire collected works of Shakespeare?), we have to either set a special value aside to indicate the end of the string (C used the value 0, or NULL, to indicate the end of its byte-wide strings storing ASCII characters, hence giving us the term "NULL-terminated ASCII string"), or we have to capture the length somewhere (Pascal put the length in the first byte, so that the first character in the string was always at index 1, which neatly offset the C quirk of the first byte being at index 0, but also led to a max size of 255 characters for the string), or we just have to set a fixed size and assume the string falls under that length, or something.

Here is a mermaid diagram:
<pre class="mermaid">
    graph TD
    A[Client] --> B[Load Balancer]
    B --> C[Server01]
    B --> D[Server02]
</pre>
