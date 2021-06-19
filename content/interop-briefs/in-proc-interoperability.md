title=Interop Briefs: In-proc interoperability
date=2007-01-30
type=page
tags=interop briefs, clr, jvm, c++, java, j2ee, ruby, windows, xml services
status=published
description=In which I discuss interoperability in-process.
~~~~~~
*(This piece was originally on <A href="http://www.infoq.com/articles/in-process-java-net-integration">InfoQ.com</A>; I repost it here since it's been a while since.)*

<!--more-->

Although not well-known, the two most popular managed environments (the JVM and the CLR) are in fact, nothing more than a set of shared libraries, each of which provide a set of services to the executing code: memory management, thread management, code compilation (JIT), and so on. Because of this, using both the JVM and the CLR inside the same operating system process is a relatively trivial matter, since any process is capable of loading just about any shared library.

At this point in the conversation, however, most developers will stop, cock their head to one side, and ask (quite rightfully), "But... why?"

Over the years, the Java platform has grown to include an astonishing number of APIs and technologies. (JavaSound, anybody?) And, of course, the CLR has the innate awareness of the full richness of the Windows operating system underneath it. But there are a lot of things available in the Windows OS that aren't currently made accessible to us in Java, and sometimes it's easier to just reach out from Java to those features. This is the usual argument for any sort of JNI use inside of Java, and as such, should be fairly familiar to Java developers. What's not so familiar is the idea of looking to make use of .NET features within the JVM, such as the new .NET 3.0 features (Workflow, WPF, or InfoCard being the principal interest), or of using JVM tools from inside a .NET process (such as hosting Spring beans containing complex business logic written in Java or accessing a JMS queue inside of ASP.NET).

Loading the DLLs and interacting with the underlying managed environment are two different topics, however, and each provides a standard API for doing so. For example, the following (unmanaged) C++ code, from the Java Native Interface documentation set, creates a JVM from a standard (unmanaged) process1:

```
#include "stdafx.h"
#include <jni.h>

int _tmain(int argc, _TCHAR* argv[])
{
     JavaVM *jvm;       /* denotes a Java VM */
     JNIEnv *env;       /* pointer to native method interface */
     JavaVMInitArgs vm_args; /* JDK/JRE 6 VM initialization arguments */

     JavaVMOption options[4]; int n = 0;
     options[n++].optionString = "-Djava.class.path=.";

     vm_args.version = JNI_VERSION_1_6;
     vm_args.nOptions = n;
     vm_args.options = options;
     vm_args.ignoreUnrecognized = false;

     /* load and initialize a Java VM, return a JNI interface
      * pointer in env */
     JNI_CreateJavaVM(&jvm, (void**)&env, &vm_args); // cast necessary to make C++ happy

     /* invoke the Main.test method using the JNI */
     jclass cls = env->FindClass("Main");
     jmethodID mid = env->GetStaticMethodID(cls, "test", "(I)V");
     env->CallStaticVoidMethod(cls, mid, 100);

     /* We are done. */
     jvm->DestroyJavaVM();

     return 0;
}
```

In order to compile this code, the JDK's include and include\win32 directories must be part of the C++ compiler's include path, and the JDK's jvm.lib (found in the JDK lib directory) must be on the linker's path. When run, this assumes that the Main.class file is in the same directory as the executing executable, and that the JRE's "jvm.dll" shared library can be found, typically by putting it on the PATH. (Normally, "jvm.dll" doesn't need to be on the PATH because the java.exe launcher dynamically searches for it and binds to it once found.)

Similarly, the CLR provides its own API, referred to as the Hosting API, for doing the same:

```
#include "stdafx.h"
#include <mscoree.h>

int _tmain(int argc, _TCHAR* argv[])
{
 	ICLRRuntimeHost* pCLR = (ICLRRuntimeHost*)0;
 	HRESULT hr = CorBindToRuntimeEx(NULL, L"wks",
 		STARTUP_CONCURRENT_GC, CLSID_CLRRuntimeHost, IID_ICLRRuntimeHost,
 		(PVOID*)&pCLR);
 	if (FAILED(hr))
 		return -1;

 	hr = pCLR->Start();
 	if (FAILED(hr))
 		return -1;

 	DWORD retval = 0;
 	hr = pCLR->ExecuteInDefaultAppDomain(L"HelloWorld.exe", L"Hello", L"Main", NULL, &retval);
 	if (FAILED(hr))
 		return -1;

 	hr = pCLR->Stop();
 	if (FAILED(hr))
 		return -1;

 	return (int)retval;
}
```

Like the JNI example, this sample presumes that there is a HelloWorld.exe .NET assembly2 in the current directory when executed. Because the CLR has deeper "hooks" into the operating system, the CLR's implementation DLLs don't need to be on the PATH (see *Shared Source CLI Essentials* for more details on how the CLR bootstrap process works).

While it would certainly be possible for a developer to write an application in unmanaged C++ that explicitly loads each of the two runtimes and then delegates processing to one or the other, this puts the majority of the application development logic squarely into an area that most developers fear to tread these days, that of developing in unmanaged "old school" C++. Tempting as it may be to exercise those skills once more, for most of us there's a number of alternatives.

First and foremost, for example, both technologies support "calling down" to unmanaged code (in the JVM, this is JNI, where in the CLR, it's P/Invoke), which gives us the opportunity to implement methods declared in one environment to be implemented in the terms of the other, via a small amount of "trampoline" code in between them. For example, in Java, implementing a native method in JNI is relatively trivial and documented in other literature3 ; the only twist added here would be to implement the C++ native implementation using Microsoft's C++/CLI (from Visual Studio 2005) or Managed C++ (from Visual Studio 2003) compilers.

At this point, the only complexity comes in making sure the JVM knows how to find this DLL at runtime. This is done in two parts: first, when the Java class using the native method is loaded, it needs to ask the JVM to load the shared library backing it via the Runtime.loadLibrary() call. Notice that the native library requested is done so without specifying the filename's extension. This lack of extension is deliberate-because different operating systems use different conventions with respect to shared libraries (under Windows, shared libraries have the ".DLL" suffix, whereas under Unix-like operating systems, the convention is to name them "libNAME.so"), only the base name is passed. At this point, the JVM will search for the shared library along whatever conventions the hosting OS uses; in the case of Windows, this is formally documented in the API documentation for LoadLibrary(), but essentially includes the operating system's installation directories (C:\WINDOWS and C:\WINDOWS\SYSTEM32), the current working directory, and the PATH. The JVM will also look in two other locations, however: along the directories specified by the "java.library.path" system property, and in the "lib\i386" directory under the executing JRE. Generally speaking, it's recommended that native implementations live either in a custom location specified by the "java.library.path" property (if you have control over the system properties specified at JVM startup), or in the "i386" directory of the executing JRE. For this particular sample, it's easiest to assume that specifying the JVM system properties are out of the control of the developer (as it will be for a number of application servers), so the DLL should be copied underneath the JRE used by your servlet container/application server. Once the DLL is found, the fact that this is a "mixed-mode" .NET DLL (meaning it has both managed and unmanaged code inside of it) will force the CLR to auto-bootstrap inside the process, and now the full power of the CLR is at your JNI DLL's fingertips.

Flipping this around, a .NET application can call out to the JVM through another trampoline, again an unmanaged DLL. This time, however, because the JVM doesn't have any sort of bootstrapping magic like the CLR does (the price of WORA), the unmanaged DLL will need to explicitly load the JVM into the process using the same APIs as before. Once bootstrapped into place, however, the JNI Reflection-like Invocation API allows for classes to be loaded, objects created and methods invoked. Accessing the unmanaged DLL from the CLR code is simply an exercise in using the P/Invoke API, which is (again) well-documented elsewhere.

If all of this seems like a tremendous amount of work, you're not alone in thinking this. Fortunately, there are several tools and technologies available to us to make this process much, much simpler.

First of these is an open-source toolkit that simplifies the Java JNI interaction, called JACE (http://jace.sourceforge.net), designed to make it simpler to both host the JVM and to call into Java methods in Java classes. It makes writing the JNI portions of either scenario that much simpler and easier, particularly the JVM bootstrapping. The rest of the story remains intact, however-JACE is intended for use by unmanaged C++, and as such, means we're still back to writing all sorts of "unsafe" code in native Windows DLLs.

Along different lines is another open-source library, called IKVM, now part of the Mono project. IKVM is unusual in that it takes a different approach to "interoperability" than some of the other resources mentioned-instead of looking to load the JVM and somehow bridge the gap between the CLR and the JVM4 , IKVM instead translates Java bytecode into CIL, thus eliminating the need for the JVM to be loaded into the same process whatsoever. This has some interesting implications, in that since the JVM is never loaded, none of the JVM's goodness comes into play: no Hotspot, no JMX hooks for monitoring (which means no jconsole for monitoring your Java code), and so on. Of course, since all the code is now being turned into CIL, the full goodness of the CLR-the CLR's JIT, the CLR's Performance Monitor counters, and so on-are now in play instead. And since IKVM can do the bytecode translation "on the fly", the effect feels fairly transparent to the CLR developer.

At times, however, we really do want the JVM to be loaded, and this is when an in-proc proxy comes to the rescue, such as those generated by Codemesh's JuggerNET utility5 . It provides two things: a more .NET-friendly version of the JNI Invocation API, making it that much easier to create the JVM inside a .NET application, and a code-generator utility to generate .NET proxies that manipulate their arguments as necessary to make them into Java arguments and execute the Java methods on Java objects. Thus, loading the JVM into a .NET app looks like:

```
/*
 * Copyright 1999-2006 by Codemesh, Inc.  ALL RIGHTS RESERVED.
 */
using System;
using Codemesh.JuggerNET;

//
// This application programmatically configures a JVM and loads it.
//
// The JVM to be used is determined via platform-dependent logic
// in this example.  You could also use the JvmPath property to
// programmatically configure the JVM to be used.
//
public class Application
{
 public static void Main( string[] argv )
 {
 	try
 	{
 		//--------------------------------------------------------------------
 		// the following line gives you access to an object you can use
 		// to initialize the runtime settings.
 		//
 		IJvmLoader	loader = JvmLoader.GetJvmLoader();

  		//--------------------------------------------------------------------
 		// configure the Java settings
 		//

  		// set the classpath to the current working directory
 		loader.ClassPath = ".";

  		// append the CWD's parent directory to the classpath
 		loader.AppendToClassPath( ".." );

  		// set the maximum heapsize
 		loader.MaximumHeapSizeInMB = 256;

  		// set a couple of -D options
 		loader.DashDOption[ "myprop" ] = "myvalue";
 		loader.DashDOption[ "prop_without_value" ] = null;

  		// specify a trace file.  If you don't, all tracing output will go to
 		// stderr
 		loader.TraceFile = ".\\trace.log";

  		//--------------------------------------------------------------------
 		// you can leave it at that and the configured settings will be used
 		// to kick off the JVM on-demand when the first proxy operation is
 		// executed OR you can explicitly load the JVM.  If anything goes wrong
 		// an exception will be thrown.
 		//
 		loader.Load();

 	}
 	catch( System.Exception )
 	{
 		Console.WriteLine( "!!!!!!!!!!!!!!!  we caught an exception  !!!!!!!!!!!!!!!!" );
 	}

  	Console.WriteLine( "***************  we're leaving Main() ****************" );

  	return;
 }
}
```

Code-generating the .NET-to-Java proxies is a bit trickier, but only because there's the manual step of specifying which Java classes and packages should be proxied; this is done using either the JuggerNET GUI tool for specifying a "model file" that describes the list of packages and classes, or it can be done from within an Ant script (meaning now at least part or all of your .NET build is being done from the Java Ant utility, not an entirely unreasonable state of affairs for a interoperating project) using the "<juggernet%gt;" task. So, for example, the "peer" example in the JuggerNET distribution looks like so, where the Java.*-named classes are generated .NET proxies to their namesakes in the Java world:

```
/*
 * Copyright 1999-2006 by Codemesh, Inc.  ALL RIGHTS RESERVED.
 */

using System;
using Codemesh.JuggerNET;
using Java.Lang;
using Java.Util;

/// <summary>
/// A .NET type that declares data members.
/// By extending the <c>Serializable</c> proxy interface we
/// automatically gain the so-called "peer" capability for our
/// .NET type. The <c>Serializable</c> interface is marked in
/// the code generator as having a Java peer type that can hold
/// the serialized information of a .NET instance.
/// </summary>
public class MyDotNetClass : Java.Io.Serializable
{
 	public int		field1 = 0;
 	public int		field2 = 1;
 	public string	strField = "<not set>";

 	public MyDotNetClass()
 	{
 	}

 	public MyDotNetClass( int f1, int f2, string s )
 	{
 		field1 = f1;
 		field2 = f2;
 		strField = s;
 	}

 	public override string	ToString()
 	{
 		return "MyDotNetClass[field1=" + field1 + ", field2=" + field2 + ", strField='" + strField + "']";
 	}
}

/// <summary>
/// Another .NET type that extends <c>Serializable</c> but declares
/// different data elements.
/// </summary>
public class MyDotNetClass2 : Java.Io.Serializable
{
 	public int[]	test = new int[] { 0, 1, 2 };

 	public MyDotNetClass2()
 	{
 	}

 	public MyDotNetClass2( int f1, int f2 )
 	{
 		test[ 0 ] = f1;
 		test[ 1 ] = f2;
 	}

 	public override string	ToString()
 	{
 		System.Text.StringBuilder	result = new System.Text.StringBuilder();

  		result.Append( "MyDotNetClass2[test=[" );
 		for (int i = 0; i < test.Length; i++)
 		{
 			if( i != 0 )
 				result.Append( "," );
 			result.Append( "" + test[i] );

 		}
 		result.Append( "]]" );

 		return result.ToString(); 	}
}

/// <summary>
/// This type illustrates how we can achieve the goal of peer serialization
/// by adding a <c>JavaPeer</c> attribute to the .NET type.
/// This creates similar usability to extending <c>Java.Io.Serializable</c>
/// but is inferior in one way:  you cannot use an instance of a <c>PureDotNetType</c>
/// in a place that expects a <t>Serializable</t>.
/// The <c>JavaPeer</c> attribute here specifies two different properties:
/// <c>PeerType</c> and <c>PeerMarshaller</c>.  The first property specifies the
/// Java type that will hold the data and the second property specifies the type of
/// the class that knows how to serialize a .NET instance into that Java intstance
/// and reverse.
/// </summary>
[JavaPeer(PeerType= "com.codemesh.peer.SerializablePeer",
          PeerMarshaller= "Codemesh.JuggerNET.ReflectionPeerValueMarshaller")]
public class PureDotNetType
{
 	private char ch = 'a';
	/// </summary>
 	/// A field setter which helps us illustrate that we actually read real
 	///information back from Java.
 	/// </summary>
 	public char	CharProperty
 	{
 		set { ch = value; }
 	}

 	public override string ToString()
 	{
 		return "PureDotNetType[ch='" + ch + "']";
 	}
}

/// </summary>
/// This type illustrates the use of field attributes to control details
/// of the peer serialization.
/// </summary>
[JavaPeer(PeerType="com.codemesh.peer.SerializablePeer",
          PeerMarshaller="Codemesh.JuggerNET.ReflectionPeerValueMarshaller")]
public class PureDotNetType2
{
 	///<summary>
 	/// This field will always have the value '42' after unmarshalling because
 	/// its value does not get serialized/deserialized.
 	/// </summary>
 	[NonSerialized]
 	public int				NotUsed = 42;

  	/// <summary>
 	/// This field will always have the value null after unmarshalling because
 	/// its value does not get serialized/deserialized.
 	/// </summary>
 	[JavaPeer(Ignore=true)] 	public string			AlsoNotUsed = null;

 	///<summary>
 	/// This field will get serialized/deserialized, but on the Java side
 	/// this field is known under the name 'CustomFieldName'.  You usually
 	/// won't care about the Java name, but you might if a Java program might
 	/// gain access to the peer object and has to use its data.
 	/// </summary>
 	[JavaPeer(Name="CustomFieldName")]
 	public int				OnlyUsedField = 2;

 	public override string ToString()
 	{
 		return "PureDotNetType2[NotUsed=" + NotUsed +
                 ", AlsoNotUsed=" + ( AlsoNotUsed == null ? "null" : AlsoNotUsed ) +
                 ", OnlyUsedField=" + OnlyUsedField + "]";
 	}
}

public class Peer
{ 	
	public static void Main( string[] args )
 	{
 		try
 		{
 			IJvmLoader	loader = JvmLoader.GetJvmLoader();

 			if( args.Length > 1 && args[ 0 ].Equals( "-info") )
 				;//loader.PrintLdLibraryPathAndExit();

 			// create a hashtable instance
 			Java.Util.Hashtable	ht = new Java.Util.Hashtable();

 			// create some pure .NET instances
 			object			obj1 = new MyDotNetClass();
 			object			obj2 = new MyDotNetClass2( 7, 9 );
 			PureDotNetType	obj3 = new PureDotNetType();
 			PureDotNetType2 obj4 = new PureDotNetType2();

 			obj3.CharProperty = 'B';

 			// these two values will be lost after we get the object back from the hashtable
 			obj4.NotUsed = 511;
 			obj4.AlsoNotUsed = "test";
 			// this value will be retained but under a different name on the Java side
 			obj4.OnlyUsedField = 512;

 			// put the .NET instances into a Java hashtable
 			// please note that there is no original Java type available
 			// for these .NET types;  under the hood, the .NET object state
 			// is copied into a generic Java instance
 			ht.Put( "obj1", obj1 );
 			ht.Put( "obj2", obj2 );
 			ht.Put( "obj3", obj3 );
 			ht.Put( "obj4", obj4 );

 			// this is the REAL test!
 			// now we try to get back the original .NET information.
 			object	o1 = ht.Get( "obj1" );
 			Console.WriteLine( "o1={0}", o1.ToString());

 			object	o2 = ht.Get( "obj2" );
 			Console.WriteLine( "o2={0}", o2.ToString());

 			object	o3 = ht.Get( "obj3" );
 			Console.WriteLine( "o3={0}", o3.ToString());

 			object	o4 = ht.Get( "obj4" );
 			Console.WriteLine( "o4={0}", o4.ToString());

 			Console.WriteLine( "ht={0}", ht.ToString() );
 		}
 		catch( JuggerNETFrameworkException jnfe )
 		{
 			Console.WriteLine( "Exception caught: {0}\n{1}\n{2}", jnfe.GetType().Name,
                                      jnfe.Message, jnfe.StackTrace );
 		}
 	}
}
```

Overall, it may seem less-than-obvious why in-proc interop is even on the table of possible approaches; aside from an obvious speed advantage (in that moving data around in a single process is far, far faster than moving data across a network, even a fast gigabit one), a number of other advantages include:

* **Centralization.** In many cases, we want certain resources (database sequence identifiers generated within code, for example) to be inside of one-and-only-one process, to avoid complex synchronization code between processes.
* **Reliability.** The fewer hardware tiers involved, the less vulnerable the entire system is to a single machine outage.
* **Architectural requirements.** In certain scenarios, existing architectural requirements will mandate that all processing take place inside of a particular process; for example, the existing user interface for an application may already be coded in ASP.NET, and the interoperability part of the application is to drop a message into a JMS queue for an EJB message-driven bean to process. Sending the message out-of-proc to a Java service that simply drops the message into a JMS queue is a bit redundant and expensive, particularly given that JMS client code is typically straightforward. Putting the JMS client code inside the ASP.NET process (Codemesh offers a specialized version of JuggerNET proxies specifically for JMS client scenarios) offers the simplest way to keep with the "flow" of the existing architecture.

Again, not all interoperability solutions will be solved via an in-proc approach, but some will, and developers shouldn't fear the idea, given the wealth of tools available.

Resources

* "The Java Native Interface" (Liang)
* "Java Native Interface" (Gordon)
* The [JNI page at the Java SE website](http://java.sun.com/javase/6/docs/technotes/guides/jni/index.html)
* "Customizing the Common Language Runtime" (Pratschner)
* "Shared Source CLI" (Stutz, Neward, Shilling)
* The C++/CLI Language Specification (ECMA International)
 
[1] The accompanying code bundle has this in the JNIHosting subdirectory, as part of the InProcInterop solution; the best way to build this is from the command-line, with the JAVA_HOME environment variable pointing to the location of your JDK 1.6 directory.
[2] Which, because of the particular Hosting API we're using here (ExecuteInDefaultAppDomain), is expected to have a class called Hello inside of it, which in turn must have a method named Main that takes a single string as an argument and returns an int. Note that this is a different signature than the traditional entrypoint for C# or VB.NET
[3] See Liang's or Gordon's book, for example, or the JNI documentation in the JDK.
[4] Currently (and for the foreseeable future), IKVM only goes from the CLR to the JVM, not back the other way around.
[5] JuggerNET is a .NET version of their other proxy tool, JunC++tion, which is a Java-C++ proxy tool.

