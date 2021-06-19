title=Laziness in Scala
date=2009-03-29
type=post
tags=languages, scala, clr, csharp, fsharp, functional programming
status=published
description=In which I examine Scala's linguistic choices and wonder if they're crazy, or I am.
~~~~~~

While playing around with a recent research-oriented project for myself (more on that later), I discovered something that I haven't seen mentioned anywhere in the Scala universe before. (OK, not really--as you'll see towards the end of this piece, it really is documented, but allow me my brief delusions of grandeur as I write this. They'll get deflated quickly enough.) 

<!--more-->

So the core of the thing was a stack-oriented execution engine; essentially I'm processing commands delivered in a postfix manner. Since some of these commands are relational operators, it's important that there be two things to relationally operate on the execution stack, after which I want to evaluate the relational operation and push its result (1 if true, 0 if false) back on the stack; this is pretty easily done via the following: 

```
def compareOp(op : (Int, Int) => Boolean) = 
{
  checkStack(2)
  val v1 = (execStack.pop()).asInstanceOf[Int]
  val v2 = (execStack.pop()).asInstanceOf[Int]
  val vr = op(v1, v2)
  execStack.push(if (vr) 1 else 0)
}
```

where `execStack` is a `mutable.Stack[Any]` held in an enclosing function. 

Interestingly enough, however, when I wrote this the first time, I wrote it like this, which is a very different sequence of operations: 

```
def compareOp(op : (Int, Int) => Boolean) =
{
  checkStack(2)
  def v1 = (execStack.pop()).asInstanceOf[Int]
  def v2 = (execStack.pop()).asInstanceOf[Int]
  def vr = op(v1, v2)
  execStack.push(if (vr) 1 else 0)
}
```

See the difference? Subtle, is it not? But the actual code is significantly different, something that's more easily seen with a much simpler (and standalone) example: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        def v1 = (stack.pop()).asInstanceOf[Int]
        def v2 = (stack.pop()).asInstanceOf[Int]
        def vr = v1 + v2
        System.out.println(vr)
    }
}
```

When run, the console prints out "36", as we'd well expect. 

But suppose we want to look at those values of v1 and v2 along the way, perhaps as part of a logging operation, or perhaps because you're just screwing around with some ideas in your head and you don't want to bother to fire up an IDE with Scala support in it. So you decide to spit those values to a console: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        def v1 = (stack.pop()).asInstanceOf[Int]
        def v2 = (stack.pop()).asInstanceOf[Int]
        System.out.println(v1)
        System.out.println(v2)
        def vr = v1 + v2
        System.out.println(vr)
    }
}
```

And then something *very* different happens; you get "24", "12", and then a NoSuchElementException. 

If you're like me the first time I ran into this, your first reaction is, "Eh?". Actually, if you're like me, when you're programming, your profanity filters are probaby at an ebb, so your first reaction is "WTF?!?", said with great gusto and emphasis. Which has a tendency to get some strange looks when you're at a Denny's doing your research, I will admit. Particularly when it's at 3 AM in the morning. And the bar crowd is in full alcoholic haze and slightly nervous about the long-haired, goatee-sporting guy in his headphones, wearing his black leather jacket and swearing like a drunken sailor at his laptop. But I digress. 

What is Scala doing here? 

Turns out this is exactly as the language designers intended, but it's subtle. (Or maybe it's just subtle to me at 3AM when I'm pumped full of caffeine.) 

Let's take this a different way: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        def v1 = (stack.pop()).asInstanceOf[Int]
        def v2 = (stack.pop()).asInstanceOf[Int]
        System.out.println(stack)
    }
} 
```

When run, the console prints "Stack(12, 24)", which *really* starts to play with your mind when you're a little short on sleep and a little high on Diet Coke. At first glance, it looks like Scala is broken somehow--after all, those "pop" operations are supposed to modify the Stack against which they're operating, just as the push()es do. So why is the stack convinced that it still holds the values of 12 and 24? 

Because Scala hasn't actually executed those pop()s yet. 

The `def` keyword, it turns out, isn't what I wanted here--what I wanted (and in retrospect it’s painfully obvious) was a `val`, instead, in order to force the execution of those statements and capture the value into a local value (an immutable local variable). The `def` keyword, instead, creates a function binding that waits for formal execution before evaluating. So that when I previously said 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        def v1 = (stack.pop()).asInstanceOf[Int]
        def v2 = (stack.pop()).asInstanceOf[Int]
        def vr = v1 + v2
        System.out.println(vr)
    }
} 
```

... what in fact I was saying was this: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        def v1 = (stack.pop()).asInstanceOf[Int]
        def v2 = (stack.pop()).asInstanceOf[Int]
        System.out.println(v1 + v2)
    }
} 
```

... which is the same as: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        System.out.println((stack.pop()).asInstanceOf[Int] + (stack.pop()).asInstanceOf[Int])
    }
}
```

... which, when we look back at my most recent "debugging" version of the code, substituting the "def"ed versions of v1 and v2 (and vr) where they're used, makes the reason for the NoSuchElementException become entirely more clear: 

```
object App
{
    def main(args : Array[String]) =
    {
        import scala.collection.mutable.Stack
        var stack : Stack[Any] = new Stack()
        stack.push(12)
        stack.push(24)
        System.out.println((stack.pop()).asInstanceOf[Int])
        System.out.println((stack.pop()).asInstanceOf[Int])
        System.out.println((stack.pop()).asInstanceOf[Int] + (stack.pop()).asInstanceOf[Int])
    }
} 
```

Now, normally, this would probably set off all kinds of alarm bells in your head, but the reaction that went off in mine was "COOL!", the reasons for which revolve around the concept of "laziness"; in a functional language, we frequently don't want to evaluate the results right away, instead preferring to defer their execution until actually requiring it. In fact, many functional languages—such as Haskell—take laziness to new heights, baking it directly into the language definition and assuming laziness everywhere, so much so that you have to take special steps to avoid it. There’s a variety of reasons why this is advantageous, but I’ll leave those discussions to the Haskellians of the world, like Matt Podwysocki and Simon Peyton-Jones.

From a Scalist’s perspective, laziness is still a useful tool to have in your toolbox. Suppose you have a really powerful function that calculates PI to a ridiculous number of decimal places. In Java, you might be tempted to do something like this: 

```
class MyMath
{
  public static final double PI = calculatePiToARidiculousNumberOfPlaces();
  private static double calculatePiToARidiculousNumberOfPlaces()
  {
    // implementation left to the reader's imagination
    // imagine it being "really cool"
  }
}
```

The problem with this is that if that method takes any length of time to execute, it's being done during class initialization during its ClassLoading phase, and aside from introducing a window of time where the class *could* be used before that initialization is finished (it's subtle, it's not going to happen very often, but it can, according to older versions of the JVM Spec), the problem is that the time required to do that initialization is paid for *regardless of whether you use PI*. In other words, the classic Stroustrup-ian "Don't pay for it if you don't use it" principle is being completely tossed aside.

In Scala, using the "def" keyword here, aside from avoiding the need for the additional decorators, completely eliminates this cost--people won't need the value of PI until it becomes used: 

```
object App
{
    def PI = calculatePiToARidiculousNumberOfPlaces()
    def calculatePiToARidiculousNumberOfPlaces() =
    {
        System.out.println("Calculating PI")
        3 + 0.14
    }
    def main(args : Array[String]) =
    {
        System.out.println("Entering main")
        System.out.println("PI = " + PI)
    }
}
```

(In fact, you'd probably just write it without the calculating method definition, since it's easier that way, but bear with me.) 

When you run this, of course, we see PI being calculated after main()'s been entered, thus proving that PI is being calculated only on demand, not ahead of time, as a public-static-final-constant would be. 

The problem with this approach is, you end up calculating PI on <em>each</em> access: 

```
object App
{
    def PI = calculatePiToARidiculousNumberOfPlaces()
    def calculatePiToARidiculousNumberOfPlaces() =
    {
        System.out.println("Calculating PI")
        3 + 0.14
    }
    def main(args : Array[String]) =
    {
        System.out.println("Entering main")
        System.out.println("PI = " + PI)
        System.out.println("PI = " + PI)
            // prints twice! Not good!
    }
}
```

Which sort of defeats the advantage of lazy evaluation. 

This got me wondering--in F#, we have lazy as a baked-in concept (sort of), such that when I write 

```
#light
let sixty = lazy (30 + 30)
System.Console.WriteLine(sixty) 
```

What I see on the console is not 60, but a Lazy<T> type instance, which effectively defers execution until it's Force() method is invoked (among other scenarios). This means I can write things like `let reallyBigList = lazy ([1..1000000000000] |> complexCalculation |> anotherComplexCalcuation)` without fear of blowing the stack or heap apart, since laziness means the list won't actually be calculated until it's forced; we can see this from the following (from the F# interactive console): 

```
> let sixtyWithSideEffect = lazy (printfn "Hello world"; 30+30);;
val sixtyWithSideEffect: Lazy<int>
> sixtyWithSideEffect.Force();;
Hello world
val it : int = 60
> sixtyWithSideEffect.Force();;
val it : int = 60 
```

(Examples taken from the excellent <em>Expert F#</em> by Syme/Granicz/Cisternino; highly recommended, if a touch out-of-date to the current language definition. I expect Chris Smith’s <em>Programming F#</em>, from O’Reilly, to correct that before too long.)

It would be nice if something similar were doable in Scala. Of course, once I start looking for it, it makes itself visible, in the wonderful Venners/Odersky/Spoon book, <em>Programming In Scala</em>, p. 444: 

<blockquote>
You can use pre-initialized fields to simulate precisely the initialization behavior of class constructor arguments. Sometimes, however, you might prefer to let the system itself sort out how things should be initialized. This can be achieved by making your val definitions lazy. If you prefix a val definition with a lazy modifier, the initializing expression on the right-hand side will only be evaluated the first time the val is used.

...

This is similar to the situation where x is defined as a parameterless method, using a def. However, unlike a def a lazy val is never evaluated more than once. In fact, after the first evaluation of a lazy val the result of the evaluation is stored, to be reused when the same val is used subsequently.
</blockquote>

Perfect! The key, then, is to define PI like so: 

```
object App
{
    lazy val PI = calculatePiToARidiculousNumberOfPlaces()
    def calculatePiToARidiculousNumberOfPlaces() =
    {
        System.out.println("Calculating PI")
        3 + 0.14
    }
    def main(args : Array[String]) =
    {
        System.out.println("Entering main")
        System.out.println("PI = " + PI)
        System.out.println("PI = " + PI)
            // prints once! Awesome!
    }
} 
```

That means, if I apply it to my Stack example from before, I should get the same deferred-execution properties of the "def"-based version ... 

```
def main(args : Array[String]) =
{
    import scala.collection.mutable.Stack
    var stack : Stack[Any] = new Stack()
    stack.push(12)
    stack.push(24)
    lazy val v1 = (stack.pop()).asInstanceOf[Int]
    lazy val v2 = (stack.pop()).asInstanceOf[Int]
    System.out.println(stack)
        // prints out "Stack(12,24)
} 
```

... but if I go back to the version that blows up because the stack is empty, using lazy val works exactly the way I would want it to: 

```
def main(args : Array[String]) =
{
    import scala.collection.mutable.Stack
    var stack : Stack[Any] = new Stack()
    stack.push(12)
    stack.push(24)
    lazy val v1 = (stack.pop()).asInstanceOf[Int]
    lazy val v2 = (stack.pop()).asInstanceOf[Int]
    System.out.println(v1)
    System.out.println(v2)
    lazy val vr = v1 + v2
    System.out.println(vr)
        // prints 12, 24, then 36
        // and no exception!
} 
```

Nice. 

So, it turns out that my accidental use of "def" inside the compareOp function behaves exactly the way the language designers wanted it to, which is not surprising, and that Scala provides nifty abilities to defer processing or extraction of values until called for.

Curiously, the two languages differ in how laziness is implemented; in F#, the lazy modifier defines the type to be a Lazy<T> instance, an ordinary type that we can pass around from F# to C# and back again as necessary (in much the same way that C# defined nullable types to be instances of Nullable<T> under the hood). We can see that from the interactive console output above, and from the fact that we call Force() on the instance to evaluate its value. 

In Scala, however, there is no corresponding Lazy[T] type; instead, the PI() method is defined to determine whether or not the value has already been evaluated:

```
public double PI();
  Code:
   0:   aload_0
   1:   getfield        #135; //Field bitmap$0:I
   4:   iconst_1
   5:   iand
   6:   iconst_0
   7:   if_icmpne       48
   10:  aload_0
   11:  dup
   12:  astore_1
   13:  monitorenter
   14:  aload_0
   15:  getfield        #135; //Field bitmap$0:I
   18:  iconst_1
   19:  iand
   20:  iconst_0
   21:  if_icmpne       42
   24:  aload_0
   25:  aload_0
   26:  invokevirtual   #137; //Method calculatePiToARidiculousNumberOfPlaces:()D
   29:  putfield        #139; //Field PI:D
   32:  aload_0
   33:  aload_0
   34:  getfield        #135; //Field bitmap$0:I
   37:  iconst_1
   38:  ior
   39:  putfield        #135; //Field bitmap$0:I
   42:  getstatic       #145; //Field scala/runtime/BoxedUnit.UNIT:Lscala/runtime/BoxedUnit;
   45:  pop
   46:  aload_1
   47:  monitorexit
   48:  aload_0
   49:  getfield        #139; //Field PI:D
   52:  dreturn
   53:  aload_1
   54:  monitorexit
   55:  athrow
  Exception table:
   from   to  target type
    14    48    53   any
```

If you look carefully at the bytecode, the implementation of PI is checking a bitmask field (!) to determine if the first bit is flipped (!) to know whether or not the value is held in the local field PI, and if not, calculate it and store it there. This means that Java developers will just need to call PI() over and over again, rather than have to know that the instance is actually a Lazy[T] on which they need to call Value or Force (such as one would from C# in the F# case). Frankly, I don’t know at this point which approach I prefer, but I’m slightly leaning towards the Scala version for now. (If only Java supported properties, then the syntax “MyMath.PI” would look like a constant, act lazily, and everything would be great.)

(It strikes me that the F# developer looking to write something C#-accessible need only tuck the Lazy<T> instance behind a property accessor and the problem goes away, by the way; it would just be nicer to not have to do anything special on either side, to have my laziness and Force() it, too. Pipe dream, perhaps.)

In retrospect, I could wish that Scala weren't *quite* so subtle in its treatment of "def" vs "val", but now that I'm aware of it, it'll (hopefully) not bite me quite so subtly in the sensitive spots of my anatomy again.

And any experience in which you learn something is a good one, right?
 
