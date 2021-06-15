+++
date = "2010-05-10T00:01:36.9808932-07:00"
draft = false
title = "Code Kata: RoboStack"
aliases = [
	"/2010/05/10/Code+Kata+Robostack.aspx"
]
categories = [
	".NET","C#","C++","F#","Industry","Java/J2EE","Languages","Mac OS","Objective-C","Parrot","Python","Ruby","Security","Visual Basic"
]
concepts = ["Industry", "Languages", "Security"]
languages = ["C#", "C++", "F#", "Python", "Ruby", "Visual Basic"]
platforms = [".NET", "Java/J2EE", "Mac OS", "Parrot"]
 
+++
<p><a href="http://codekata.pragprog.com/2007/01/code_katahow_it.html" target="_blank">Code Katas</a> are small, relatively simple exercises designed to give you a problem to try and solve. I like to use them as a way to get my feet wet and help write something more interesting than &quot;Hello World&quot; but less complicated than &quot;The Internet's Next Killer App&quot;.</p>  <p>&#160;</p>  <p>This one is from the <a href="http://uva.onlinejudge.org/index.php?option=com_onlinejudge&amp;Itemid=8&amp;category=3&amp;page=show_problem&amp;problem=37" target="_blank">UVa online programming contest judge system</a>, which I discovered after picking up the book <em>Programming Challenges</em>, which is highly recommended as a source of code katas, by the way. Much of the advice parts of the book can be skimmed or ignored by the long-time professional developer, but it's still worth a read, since it can be an interesting source of ideas and approaches when solving real-world scenarios.</p>  <p>&#160;</p>  <p><strong>Problem:</strong> You work for a manufacturing company, and they have just received their newest piece of super-modern hardware, a highly efficient assembly-line mechanized pneumatic item manipulator, also known in some circles as a &quot;robotic arm&quot;. It is driven by a series of commands, and your job is to write the software to drive the arm. The initial test will be to have the arm move a series of blocks around.</p>  <p>&#160;</p>  <p><strong>Context:</strong> The test begins with <em>n</em> number of blocks, laid out sequentially next to each other, each block with a number on it. (You may safely assume that <em>n</em> never exceeds 25.) So, if <em>n</em> is 4, then the blocks are laid out (starting from 0) as:</p>  <blockquote>   <p>0: 0</p>    <p>1: 1</p>    <p>2: 2</p>    <p>3: 3</p> </blockquote>  <p>The display output here is the block-numbered &quot;slot&quot;, then a colon, then the block(s) that are stacked in that slot, lowest to highest in left to right order. Thus, in the following display:</p>  <blockquote>   <p>0:</p>    <p>1:</p>    <p>2: 0 1 2 3</p>    <p>3:</p> </blockquote>  <p>The 3 block is stacked on top of the 2 block is stacked on top of the 1 block is stacked on top of the 0 block, all in slot 2. This can be shortened to the representation [0:, 1:, 2: 0 1 2 3, 3:] for conciseness.</p>  <p>&#160;</p>  <p>The arm understands a number of different commands, as well as an optic sensor. (Yeah, the guys who created the arm were good enough to write code that knows how to read the number off a block, but not to actually drive the arm. Go figure.) The commands are as follows, where <em>a</em> and <em>b</em> are valid block numbers (meaning they are between 0 and <em>n</em>-1):</p>  <ul>   <li>&quot;move <em>a</em> onto <em>b</em>&quot; This command orders the arm to find block <em>a</em>, and return any blocks stacked on top of it to their original position. Do the same for block <em>b</em>, then stack block <em>a</em> on top of <em>b</em>.</li>    <li>&quot;move <em>a</em> over <em>b</em>&quot; This command orders the arm to find block <em>a</em>, and return any blocks stacked on top of it to their original position. Then stack block <em>a</em> on top of the stack of blocks containing <em>b</em>.</li>    <li>&quot;pile <em>a</em> onto <em>b</em>&quot; This command orders the arm to find the stack of blocks containing block <em>b</em>, and return any blocks stacked on top of it to their original position. Then the arm must find the stack of blocks containing block <em>a</em>, and take the stack of blocks starting from <em>a</em> on upwards (in other words, don't do anything with any blocks on top of <em>a</em>) and put that stack on top of block <em>b</em>.</li>    <li>&quot;pile <em>a</em> over <em>b</em>&quot; This command orders the arm to find the stack of blocks containing block <em>a</em> and take the stack of blocks starting from <em>a</em> on upwards (in other words, don't do anything with any blocks on top of <em>a</em>) and put that stack on top of the stack of blocks containing block <em>b</em> (in other words, don't do anything with the stack of blocks containing <em>b</em>, either).</li>    <li>&quot;quit&quot; This command tells the arm to shut down (and thus terminates the simulation).</li> </ul>  <p>Note that if the input command sequence accidentally offers a command where <em>a</em> and <em>b</em> are the same value, that command is illegal and should be ignored.</p>  <p>&#160;</p>  <p>As an example, then, if we have 4 blocks in the state [0: 0, 1: 1, 2: 2, 3: 3], and run a &quot;move 2 onto 3&quot;, we get [0: 0, 1: 1, 2:, 3: 3 2]. If we then run a &quot;pile 3 over 1&quot;, we should end up with [0: 0, 1: 1 3 2, 2:, 3:]. And so on.</p>  <p>&#160;</p>  <p><strong>Input:</strong> n = 10. Run these commands:</p>  <ol>   <li>move 9 onto 1</li>    <li>move 8 over 1</li>    <li>move 7 over 1</li>    <li>move 6 over 1</li>    <li>pile 8 over 6</li>    <li>pile 8 over 5</li>    <li>move 2 over 1</li>    <li>move 4 over 9</li>    <li>quit</li> </ol>  <p>The result should be [0: 0, 1: 1 9 2 4, 2:, 3: 3, 4:, 5: 5 8 7 6, 6:, 7:, 8:, 9:]</p>  <p>&#160;</p>  <p><strong>Challenges:</strong></p>  <ul>   <li>Implement the Towers of Hanoi (or as close to it as you can get) using this system.</li>    <li>Add an optimizer to the arm, in essence reading in the entire program (up to &quot;quit&quot;), finding shorter paths and/or different commands to achieve the same result.</li>    <li>Add a visual component to the simulation, displaying the arm as it moves over each block and moves blocks around.</li>    <li>Add another robotic arm, and allow commands to be given simultaneously. This will require some thought—does each arm execute a complete command before allowing the other arm to execute (which reduces the performance having two arms might offer), or can each arm act entirely independently? The two (or more) arms will probably need separate command streams, but you might try running them with one command stream just for grins. Note that deciding how to synchronized the arms so they don't conflict with one another will probably require adding some kind of synchronization instructions into the stream as well.</li> </ul>
 