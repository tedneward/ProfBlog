title=Scala reactions, pt3: Everything's an object
date=2006-03-04
type=post
tags=jvm, java, j2ee, c++, ruby, xml services, scala
status=published
description=In which I offer up some reactions to Scala.
~~~~~~

In the Scala documentation, they make a point of calling out the idea that "everything's an object", including numbers and (most importantly) functions. Smalltalk had this same perception/assumption in its design, and Scala, as a result, sometimes feels very Smalltalk-ish.

<!--more-->

For example, when Scala sees this expression:

```scala
2 + 4 * 7
```

Scala actually translates that into a sequence of method calls as follows:

```scala
2.+(4.*(7))
```

Yes, in Scala, there is operator overloading, but the rules are slightly different than what you might expect from C++ or C#. In Scala, there really is no predetermined set of symbols that are defined as "operators", per se. Instead, Scala simply sees any collection of tokens (within reason) as methods to be invoked. (I should point out here that the case of integer constants being used as parameters to methods on integer constants is a special case that the Scala compiler recognizes and generates more efficient bytecode around, so the overhead of a method call isn't present. It's an obvious optimization, when you think about it.) This means that Scala can make use of some "operators" that traditionally C# and Java have eschewed:

```scala
val nums = 1 :: 2 :: 3 :: 4 :: Nil;
```

In this case, nums will be List (specifically, a List[T], where "T" is of type Integer), and the "::" operator is used to concatenate an element from the right and return a new List; "Nil" is, like "true" and "false", a special constant signifying the empty list. So, written out, the above turns into:

```scala
val nums = 1.::(2.::(3.::(4.::(Nil))));
```

Since the Scala compiler recognizes both "::" and ".::" as being equivalent, and has no predetermined since of operators, this means that any given method definition can be used in either its "dot" form, or its "operator" form; this means that in cases where the method expects a single operand, we can write the method without the "dot" notation as well. So, for example...

```shell
> val msg = "Hello World"
val msg: java.lang.String("Hello World") = Hello World
> msg equals "Hello World"
true: scala.Boolean
```


Note that here I'm using the Scala interpreter instead of the traditional class; Scala is equally at home as either compiled code or interpreted, and running the interpreter to test certain snippets is just a delight, compared to having to cruft up class scaffolding just to test a simple language concept.</p>

Thus far, this concept of everything being an object may not seem all that powerful; in fact, arguably, the above section should probably have been mentioned in the previous post than this one, since the ability to recognize new operators is itself an extension of the idea of expressing exactly what you want, nothing more. In fact, in the "Scala by Example" document that comes with the Scala download, they show a traditional Java (but which could easily be written to read in C++ or C#) quicksort implementation:

```scala
def sort(xs: Array[int]): unit = {
  def swap(i: int, j: int): unit = {
    val t = xs(i); xs(i) = xs(j); xs(j) = t;
  }
  def sort1(l: int, r: int): unit = {
    val pivot = xs((l + r) / 2);
    var i = l, j = r;
    while (i <= j) {
      while (xs(i) < pivot) { i = i + 1 }
      while (xs(j) > pivot) { j = j - 1 }
      if (i <= j) {
        swap(i, j);
        i = i + 1;
        j = j - 1;
      }
    }
    if (l < j) sort1(l, j);
    if (j < r) sort1(i, r);
  }
  sort1(0, xs.length - 1);
}
```


and then show a later version of the exact same implementation, but written more "Scala-ish":

```scala
def sort(xs: List[int]): List[int] =
  if (xs.length <= 1) xs
  else {
    val pivot = xs(xs.length / 2);
    sort(xs.filter(x => x < pivot))
    ::: xs.filter(x => x == pivot)
    ::: sort(xs.filter(x => x > pivot))
  }
```


which is clearly more terse and defined. (Note that the second example uses lists instead of arrays, and that in Scala, List[int] is Scala's syntax for a generic type, in this case List, parameterized on "int". In other words, Scala uses "[T]" notation instead of Java/C++/C#'s angle-bracket notation. Takes some getting used to, but it's easier to adjust to than you might think.) The last example really demonstrates what I'm about to discuss next: the use of functions as first-class citizens in the language, because the above implementation makes use of three anonymous functions passed in to the List's filter method. So, translating the second example into pseudocode for a second (again, taken from the Scala By Example document):

* If the list is empty or consists of a single element, it is already sorted, so return it immediately.
* If the list is not empty, pick an an element in the middle of it as a pivot.
* Partition the lists into two sub-lists containing elements that are less than, respectively greater than the pivot element, and a third list which contains elements equal to pivot.
* Sort the first two sub-lists by a recursive invocation of the sort function.
* The result is obtained by appending the three sub-lists together.

This is only possible because we can pass in the anonymous functions "x < pivot", "x == pivot" and "x > pivot" into the "filter" function on List.

As hinted, functions are full objects in of their own right, and are just as easily accessible as parameters as any other object passed into a method. So, for example, consider the above sort implementation again. The only thing that really "ties" it to sorting lists of integers is the comparison that goes on to determine if the item inside the list is less-than, equal-to, or greater-than other elements in the list. If we could somehow genericize that decision-making, we could make the quicksort be entirely generic and applicable to lists-of-anything. (As it turns out, it's sometimes easier to do this by simply having any types that wish to be sorted implement the <, == and > methods in Scala, and this is possible to enforce via interfaces and mixins and such, but bear with me on this example.)

We'll start by making sort generic:

```scala
def sort(xs: List[T]): List[T] =
  if (xs.length <= 1) xs
  else {
    // ...
  }
```

The first part of the test is entirely generic already--if we're at the point where the list is 1 or 0 elements long, just return the list as it is. Now we examine the else block:

```scala
def sort(xs: List[T]): List[T] =
  if (xs.length <= 1) xs
  else {
    val pivot = xs(xs.length / 2);
    sort(xs.filter(x => <i>(x less-than pivot)</i> )
    ::: xs.filter(x => <i>(x equal-to pivot)</i> )
    ::: sort(xs.filter(x => <i>(x greather-than pivot)</i> )
  }
```

So in other words, we just need syntax to allow a caller to pass in the implementations for less-than, equal-to, and greater-than. Turns out we can do that by specifiying the following:

```scala
def sort[T](xs: List[T], lt: (T, T) => boolean, 
            eq: (T, T) => boolean, gt: (T, T) => boolean) : List[T] =
  if (xs.length <= 1) xs
  else {
    val pivot = xs(xs.length / 2);
    sort(xs.filter(x => lt(x, pivot)), lt, eq, gt)
      ::: xs.filter(x => eq(x, pivot))
      ::: sort(xs.filter(x => gt(x, pivot)), lt, eq, gt)
  }
```

Notice the signature for "lt", "eq" and "gt"--this says lt should be a function that takes two arguments (of the generic type T) and returns a boolean. "eq" and "gt" are defined similarly. This, then, means we can use it thusly:

```scala
object App with Application {

  def lessThan(lhs: int, rhs: int) : boolean =
    if (lhs < rhs) true else false;

  def equalTo(lhs: int, rhs: int) : boolean =
    if (lhs == rhs) true else false;

  def greaterThan(lhs: int, rhs: int) : boolean =
    if (lhs > rhs) true else false;

  val nums : List[int] = 1 :: 4 :: 3 :: 2 :: Nil;
  val sorted = Test.sort(nums, lessThan, equalTo, greaterThan);
  System.out.println(sorted);
}
```

Unfortunately, looking at this particular implementation, it's not really convincing that this is any better than the first approach--we have to define three functions that return less-than, equal, and greater-than for each type T that we want to sort. Ugh.

<p>This is where the notion of an anonymous function becomes important, however. Instead of defining those three functions outright and referencing them by name in the sort call, we can instead define them "on the fly" in the call itself:

```scala
object App with Application {
  val nums : List[int] = 1 :: 4 :: 3 :: 2 :: Nil;
  val sorted = Test.sort(nums, (lhs:int, rhs:int) => if (lhs < rhs) true else false, 
                               (lhs:int, rhs:int) => if (lhs == rhs) true else false,
                               (lhs:int, rhs:int) => if (lhs > rhs) true else false );
  System.out.println(sorted);
}
```

Here, the notation is a bit complicated, but once you get used to it, it's fairly straightforward. The "=>" indicates that we're defining a function inline. The parentheses before it contain the expected parameters to the function, and the statement that follows defines the body of the function. Note that we don't have to explicitly offer a return type, because Scala's type inference capabilities can deduce that the function returns "boolean". Which, as it turns out, is exactly what the sort function was expecting in the first place: a function that takes two T's (int's, since this is a List[int]) and returns a boolean. Boo-yah!

Er... maybe.

If you're like a lot of developers, you're looking at the above and you're not necessarily won over. There's a couple of things that could be red-flagging at the back of your head:

* "I thought that the Don't-Repeat-Yourself principle says it's better to collect this stuff into one place, for easier maintenance?" True. But consider this: how often have you written a method in a class because you HAD to, not because it satisfied the DRY principle? Java's use of nested inner classes (and C++'s inability to allow you to define functions in-line) forces the use of methods, even in those situations where you know, without a doubt, that you will never execute or reference this code more than once.
* "Shouldn't this be making the sort <i>shorter</i> to use?" False. Anytime you genericize something, you run a (strong) risk that you're actually making it more complicated, and therefore more difficult to use. If we really wanted to make sort easier, I'd ask for a function parameter "compare" that does the traditional C-style comparison (return -1 for less-than, 0 for equal, 1 for greater-than), and write the necessary code inline in the sort() to use that method to determine if something fit the less-than, equal, or greater-than filters. That's not really the point, though... so I didn't.
* "That syntax is just ugly." True. To a Java, C++ or C# programmer. To a LISP programmer, though, there's clearly some parentheses missing. :-) Seriously, the syntax isn't what you're used to, perhaps, but like most syntactic decisions, it has deeper meaning and rules around it that makes it look that way. The same is true of Java, C++ (remember the ">>" rule in multiple template usage?) and C#, and will remain so for as long as computers are what's interpreting our source code.

The thing is, the use of functions-as-objects is just the tip of the iceberg. Turns out there's some more interesting tidbits that we can make use of when using functions as objects, one of which is called "currying".

One frequently useful idiom in functional languages is to return a function, rather than the results of applying that function. This means that we can delay actually executing the function until later--this is what we're doing (sort of in reverse, passing it in rather than returning it) in the sort example above. We pass in the comparator function into the filter routine, who then executes it. Returning a function is of the same mindset--hand back a function to be executed by the caller (either implicitly or explicitly) that produces the results desired.

In some situations, however, the full inputs of the function aren't known at the time the function is returned. Or, as is often the case, some of the inputs are known, but others aren't. So the compiler, when handed a partially-called function, defers execution and uses parameters found in the caller's scope (wherever that may be) to fill out the remainder of the necessary functional inputs and carry out execution. Make sense?

Probably not; currying takes a while to ingest. At least it did for me. An example may serve to help cement this down.

```scala
def sum(f: int => int) = {
  def sumF(a: int, b: int): int =
    if (a > b) 0 else f(a) + sumF(a + 1, b);
  sumF
}
```

Here, we see a function "sum", which takes a function "f" that takes an int and returns an int. It in turn uses a nested function, "sumF", that takes two integer arguments "a" and "b" and applies the function "f" to them so long as "a > b". Notice, however, that sum neither takes the parameters "a" and "b", nor does it manufacture them from someplace in order to pass them in; in fact, it noticeably excludes them when it returns, without decoration, the function "sumF" as the return value of the "sum" function. (Notice again how we don't need to specify the return value of "sum", because Scala's type inference can figure it out without additional help from the programmer.)

So how does one use the sum function? By applying both parameters--the function to apply to each argument, and a pair of ints to supply bounds to be summed up:

```scala
sum(x => x * x)(1, 10)
```

Which, in this case, summarizes the expression 1^1 + 2^2 + 3^3 + ... + 10^10. (Readers with a background in mathematics will recognize it as a sequence, the "big E" notation, as I used to call it back in sophomore Advanced Algebra. Probably has a more formal name than that, but my background isn't in math.) To understand where the currying takes place, look at how the compiler sees this expression:

```scala
(sum(x => x * s))(1,10)
```

Which means, of course, pass the function "x * x" into sum, which then returns the sumF function with f(a) replaced by "a * a". sumF still expects two integer parameters, however, so the compiler takes the next expression "(1, 10)" and applies those as "a" and "b", respectively. From there, it's a simple exercise in recursion to arrive at the answer.

The power of currying becomes more apparent when you see that because the compiler is willing to accept partially-evaluated functions as first-order types, we can partially-define functions in terms of other functions, as in:

```scala
def sumInts = sum(x => x);
def sumSquares = sum(x => x * x);
def sumPowersOfTwo = sum(powerOfTwo);
```

and then use them as top-level functions without any special syntax:

```shell
> sumSquares(1, 10) + sumPowersOfTwo(10, 20)
267632001: scala.Int
```

Now, if for some reason the definition of sum() needed to change, it would ripple throughout this tiny framework by making one change in one place. (Don't know why sum() would need to change, mind you, but that's the problem with simple examples--it's sometimes hard to see the really positive benefits unless you get more complicated, but more complicated examples are harder to use to present the concept.) And I'd be lying to you if I said that I "get" how to use this in code more practical than summations yet--I still have a lot of internalizing to do. But I can see the outskirts of where it might be useful, and if I can get working samples of how and where it would, believe me, they're going up here. :-)

In the meantime, next is traits and mixins, which are both features that are definitely easier to see applicability.
 