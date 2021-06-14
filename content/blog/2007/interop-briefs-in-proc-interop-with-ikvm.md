+++
date = "2007-01-21T00:38:25.1960000-08:00"
draft = false
title = "Interop Briefs: In-proc interop with IKVM"
aliases = [
	"/2007/01/21/Interop+Briefs+In-proc+Interop+With+Ikvm.aspx"
]
categories = [
	".NET","Java/J2EE","Windows"
]
concepts = []
languages = []
platforms = [".NET", "Java/J2EE", "Windows"]
 
+++
<P><EM>(This originally appeared on 8 November 2006 as an entry on <A href="http://tssblog.techtarget.com/index.php/distributed-objects/a-look-at-out-of-proc-or-rpc-interop/">TheServerSide's blog</A>. The title there was erroneously called "A look at out-of-proc or RPC interop", which is completely nonsensical, since this entry had nothing at all to do with out-of-proc or RPC. I've since corrected the title, and fixed the horrendous formatting problems that appeared there, as well.)</EM></P>
<P>For years, the concept of “Java-.NET interoperability” has been wrapped up in discussions of Web services and the like, but in truth there are a bunch of different ways to make Java and .NET code work together. One such approach is to host the JVM and the CLR inside the same process, using a variety of tools, such as the open-source project IKVM (a part of the Mono project).</P>
<P>IKVM isn’t a “bridge” tool, like other interop technologies—instead, IKVM takes a different path entirely, doing bytecode translation, transforming Java bytecode into CIL instructions, and feeding them through the traditional CLR as such.</P>
<P>This means that Java classes basically become .NET assemblies, and executed using the CLR’s execution engine. The JVM itself, technically, is never loaded—instead, the CLR essentially becomes a JVM, capable of executing Java classes. This also means, then, that the various features that accompany the JVM, such as Hotspot execution of Java bytecode, the JVM garbage collectors, and the various JMX-related monitoring tools that are part of Java5 and later, will not be present, either.</P>
<P>IKVM comes in two basic flavors—a runtime component that’s used to load and execute Java classes from .class binaries, and a precompiler/translator tool, ikvmc, that can be used to translator (or cross-compile, if you will) Java binaries into .NET assemblies. While the second option generally yields faster execution, the first is the more flexible of the two options, as it doesn’t require any preparation on the part of the Java code itself.</P>
<P>Using IKVM to load arbitrary Java code and execute it via Java Reflection turns out to be fairly easy to do; so easy, in fact, that you can use it from Visual Basic code. After adding the IKVM assembly to a VB.NET project, write:</P>
<BLOCKQUOTE>
<P><FONT face=courier>Imports IKVM.Runtime<BR>Imports java.lang<BR>Imports java.lang.reflect<BR></FONT></P>
<P><FONT face=courier>Imports jlClass = java.lang.Class<BR>Imports jlrMethod = java.lang.reflect.Method<BR></FONT></P></BLOCKQUOTE>
<P>The first line just brings the IKVM.Runtime namespace into use, necessary to make use of the “Startup” class without having to fully-qualify it. The next two lines bring in parts of the Java runtime library that ship with IKVM (the GNU Classpath project, precompiled to CIL using ikvmc and tweaked as necessary to fit the CLR’s internals). Similarly, the last two lines create an “alias”, such that now the types “jlClass” and “jlMethod” are now synonyms for “java.lang.Class” and “java.lang.Method”, respectively—we want this because otherwise we’ll run into name clashes with the CLR Reflection APIs, and because it helps cut confusion about which Reflection we’re working with.</P>
<BLOCKQUOTE>
<P><FONT face=courier>Module Module1<BR>&nbsp; Sub Main()<BR>&nbsp;&nbsp;&nbsp; Dim properties As Hashtable = New Hashtable<BR>&nbsp;&nbsp;&nbsp; properties("java.class.path") = "."<BR>&nbsp;&nbsp;&nbsp; Startup.SetProperties(properties)<BR></FONT></P></BLOCKQUOTE>
<P>Next, we create a Hashtable object to hold a set of name-value pairs that will be passed to IKVM in the same manner that we pass “-D” properties to the Java Virtual Machine on the command-line. In this particular case, I’m (redundantly) setting the CLASSPATH to be the current directory, causing the JVM to look for code there along with the usual places (rt.jar and the Extensions directory inside the JRE). “Startup” is a static class, meaning there’s no instance thereof.</P>
<BLOCKQUOTE>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Startup.EnterMainThread()</FONT></P></BLOCKQUOTE>
<P>To quote the vernacular, we’re off and running. By calling “EnterMainThread”, IKVM is now up and running, ready to start taking on Java code. Our next task is to find the code we want to execute via the standard Java ClassLoader mechanism, find the “main” method exposed thereon, create the String array of parameters we want to pass, and call it, all via traditional Java Reflection APIs, but called through IKVM instead of through Java code itself.</P>
<BLOCKQUOTE>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim sysClassLoader = ClassLoader.getSystemClassLoader</FONT></P>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim cl1 As jlClass = jlClass.forName("App", True, sysClassLoader)</FONT></P>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim paramTypes As jlClass() = { _<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jlClass.forName("[Ljava.lang.String;", True, sysClassLoader) _<BR>&nbsp;&nbsp;&nbsp; }<BR>&nbsp;&nbsp;&nbsp; ‘ java.lang.Class has an implicit conversion operator to/from Type<BR>&nbsp;&nbsp;&nbsp; ‘Dim paramTypes As jlClass() = { _<BR>&nbsp;&nbsp;&nbsp; ‘ GetType(String()) _<BR>&nbsp;&nbsp;&nbsp; ‘}</FONT></P>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim main As jlrMethod = cl1.getDeclaredMethod("main", paramTypes)<BR></FONT></P></BLOCKQUOTE>
<P>In the lookup for the “main” method, notice how there are two different ways to specify the method parameters: one, using the JVM syntax to specify an array of Strings (“[Ljava.lang.String;” as given in the Java Virtual Machine Specification), and the other using IKVM’s ability to translate types from .NET to Java, which allows us to specify it as a “String()” in VB (or “String[]” in C#).</P>
<BLOCKQUOTE>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim parms As Object() = { _<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; New String() {"From", "IKVM"} _<BR>&nbsp;&nbsp;&nbsp; }</FONT></P>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; Dim result = main.invoke(Nothing, parms)<BR></FONT></P></BLOCKQUOTE>
<P>We create the array of Strings to pass, then call invoke(), passing “Nothing” (the VB&nbsp;synonym&nbsp;for C#'s&nbsp;null) for the object instance, as per the usual Java Reflection rules. At this point, the “App.main()” method is invoked, and when it returns, the Java code has completed execution. All that is left is to harvest the results and display them, and shut IKVM down appropriately.</P>
<BLOCKQUOTE>
<P><FONT face=courier>&nbsp;&nbsp;&nbsp; If result &lt;&gt; Nothing Then<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Console.WriteLine(result)<BR>&nbsp;&nbsp;&nbsp; Else<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Console.WriteLine("No result")<BR>&nbsp;&nbsp;&nbsp; End If</FONT></P>
<P><FONT face=Courier>&nbsp;&nbsp;&nbsp; Startup.ExitMainThread()<BR>&nbsp;&nbsp;End Sub</FONT></P>
<P><FONT face=Courier>End Module</FONT></P></BLOCKQUOTE>
<P>Using IKVM is not a silver bullet, but it does offer some powerful in-proc interoperability options to the development team looking to leverage both .NET and Java simultaneously, such as calling out to Java EJB servers from within Excel or Word documents, or loading Spring into Outlook in order to evaluate incoming mail messages and process them for local execution.</P>
 
