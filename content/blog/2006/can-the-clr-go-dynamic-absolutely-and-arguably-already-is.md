title=Can the CLR "go dynamic"? Absolutely... and arguably, already is
date=2006-05-06
type=post
tags=clr, c++, java, javaee, ruby, xml services
status=published
description=In which I discuss the CLR's options for dynamic language execution.
~~~~~~

<!--more-->

[Larry O'Brien](http://www.knowing.net) asks 

> Are you confident that continuations can be even semi-efficiently implemented on the CLR? I'm not.
 
and in turn [references his blog](http://www.knowing.net/PermaLink,guid,785f41a5-3acf-47d5-b26a-580c46e8a117.aspx), where he points out a quote from Patrick Logan that says "If Microsoft really looks at Ruby as competition then Microsoft has already lost the war" and offers this: 

> * If Microsoft thinks Ruby is important, they're ignoring the threat to them posed by X (where, I suspect, X = LISP), or 
> * If Microsoft thinks Ruby is competition, they will not implement it and therefore be doomed

> Not long ago, Microsoft posted a job opening for a developer "first task will be to drive the exploration of other dynamic languages such as Ruby and JavaScript on the CLR", so my feeling is that if Microsoft could get a Ruby on the CLR, they'd be thrilled.

First of all, said job has already been filled--Jim Hugunin, of Jython fame, joined Microsoft some months ago on the CLR team and has since pushed a 1.0 beta of his IronPython implementation (which, according to Python benchmarks, is already faster than the corresponding native C Python implementation), available from Microsoft. Second of all, I won't suggest that I know what Mr. Logan was thinking when he made his comment, but I suspect he's thinking more about development process than technological issues. What's more, I don't agree with the comment at all: I think Microsoft needs to pursue high-level "scripting" languages on the CLR, if only because they ARE more productive than statically-typed languages like C#/Java/C++; this is the lesson we forgot, and inadvertently abandoned, from VB. Which leads me to suggest that *Ruby is the VB of the next decade*. Or, if not Ruby, then something like it. 

Larry goes on to say: 
> Ruby is not easy to implement on the CLR, at least in part because a complete Ruby implementation requires continuations, which are not modeled within the CLR. This isn't just laziness on the part of langauge implementors. The CLR presents a machine architecture different than the wide-open architecture in which most compiler experience has been gathered. The CLR architecture is safer, but more restrictive, when it comes to manipulating the stack, which is central to continuations.

Ruby actually requires more in the way of support than just continuations, but it's not necessarily impossible to implement on the CLR; it's just hard to implement on the CLR *in a high-performing manner* using *today's CLR*. That's part of what Jim is there to do, evolve the CLR to better support languages with Ruby's interesting featureset (like open classes and the "missing_method" method) in such a way that it doesn't tear down perf. 

Continuations are not impossible to support, however they are currently more or less impossible to support given the current lack of access to the underlying stack frames in the managed environment--you'd need some support from the runtimes (either the JVM or the CLR) to make it work. Such runtime support would not be too difficult to add, however, as both environments already have rich and powerful stack-walking mechanisms (because both environments use the thread stack as bookkeeping tools, among other things, and need to be able to crawl through those stack markers for a variety of reasons, such as security checks), and it would not be hard to create a runtime-level mechanism that allowed code to "take a snapshot" of the stack--and its related object graph--from a certain point to a certain point, and save off that state to some arbitrary location. In many respects, it would be similar to serializing an object, I believe. In fact, we could imagine something along the lines of: 

```
// All this is totally C#-like pseudocode. Imagine 
// something similar for Java if you like. 
// 
public int ContinuationedMethod() { 
  SnapshotMarker sm = new SnapshotMarker(); 
    // in other words, the StackSnapshot will only crawl 
    // back to the SnapshotMarker referenced when we 
    // take the thread's snapshot; this way we don't crawl 
    // all the way back to the Thread's starting point (unless 
    // you really wanted to). 
  int x = 1; 
  for (int i=0; i<10; i++) { 
    x = x * i; 
    if (i == 5) { 
      StackSnapshot ss = Thread.Current.TakeSnapshot(sm); 
        // At this point, the managed stack is walked, heap-referenced 
        // objects are captured, the instruction label that we're on is 
        // saved, and a StackSnapshot is allocated and returned. 
        // However, when ss is later rehydrated--using, say, ss.Resume(), 
        // we need some way of knowing that. So, following the lead of the 
        // old Unix fork() call, I presume that a "null" return value from 
        // TakeSnapshot is our way of knowing that we are resuming. 
        // 
      if (ss == null) 
        continue; 
      else 
      {
        // store ss someplace for later retrieval and return, either by 
        // throwing an exception if you like or just plain-old-"return 0"
        // or something
        //
      }
    } 
  } 
  return x; 
}
```

This is the API that I cooked up in all of thirty seconds, but hopefully you get the idea--it would be difficult to do from outside the runtime, as the many exception-trace stack-frame approaches suggest.

In the end, continuations are not, I believe, nearly as hard to implement--on either the JVM or the CLR--as some might suggest. Had I the money, I would go off and build the necessary Ruby-esque features we'd want into the CLR (through Rotor) or the JVM (through... uh... the JCL source, I guess, though the licensing there bothers me) for use. Anybody got some cash laying around to cover my mortgage while I do this? :-)
 
