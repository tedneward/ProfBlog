title=Nullable Type correction/bugfix
date=2005-11-08
type=post
tags=clr, javaee, j2ee, ruby
status=published
description=In which I talk about nullable types and nulls.
~~~~~~
This is a bit of old news, but the discussion came up during the Seattle Code Camp, so I thought I'd go through the problem, and use it as an example of the issues that can come up when trying to map language concepts on top of a platform that doesn't support the idea natively. Hopefully, this will cause developers looking to build DSLs or other languages on top of the .NET (or JVM) platform to see some of the edge cases a bit more clearly and a bit sooner. :-)

To lay down the background first: dealing with NULLs has always been somewhat problematic; the most obvious example of this is the mapping between relational databases, where even an INTEGER column can either have a value, or be empty, or be NULL, each of those being separate and distinct states. Trying to map NULL integer column values to integer values in the language has always been difficult in Java. C++, and C#, since primitive types / value types generally don't support null values, and Anders (among others) decided that it was time to try and integrate nullability more deeply into the language. The .NET team saw an opportunity to support nullability by creating a generic/templatized type to represent the possibility of nullability, and the C# language team took it further to try and make nullability feel "more at home" within the language. It was a bold, if at first seemingly-trivial, step.

Initially, the Nullable<T> type was pretty simple: it captured an instance of T internally, and if T was null it tripped an internal flag such that the IsNull property would return true. So, using a nullable int would work something like this:

```
Nullable<int> ni = new Nullable<int>(null);
if (ni.IsNull)
  Console.WriteLine("It's null!");
else
  Console.WriteLine(ni.Value);
```

By doing this, it seemed fairly straightforward, and then the C# team took it one step further and decided to integrate this more deeply into the language itself, by creating a native syntax for nullability:

```
int? ni = null;
if (ni == null)
  Console.WriteLine("It's null!");
else
  Console.WriteLine((int)ni);
```

In other words, any <i>type?</i> designation was an alias for <i>Nullable<type></i>, and appropriate properties would be consulted when looking to evaluate the nullable type instance. Conversion rules (from the nullable type into the type) had to be written, because it's not necessarily a silent and unambigious conversion to it's original type; for example, in the case where you wrote:

```
int? ni = null;
int i = (int)ni;
```

what should the expected behavior of the conversion of ni to i be? Some would argue that it should silently seek to "best" convert the null value of ni to an acceptable integer value of i, but that gets us back to the original problem, figuring out what that mapping is. (Ask any C++ programmer versed in the lore, and they'll be the first to tell you that "0 is NOT the same thing as NULL".) So here, asking to make that conversion will trigger a NullReferenceException.

OK, so far, so good. The problem is, however, that people were going to ask these nullable types to do things that subtly were different from what they'd ask of Nullable<T> instances. For example, the following snippet of code wouldn't behave as expected:

```
int? ni = null;
object o = ni; // What should this conversion be?
if (o == null) {
  // Should we be in this block?
}
```

What the conversion from int? to object should be was the subject of some debate, but what the C# team ended up with was the idea that the conversion followed basic CLR rules: that because int? was, internally, an <i>instance</i> of the type Nullable<int>, the conversion was to obtain an object reference to the Nullable<int> instance. In other words, a <i>boxing</i> operation took place, and since the Nullable<int> instance was always present (it's never null, even though it's <i>value</i> might be null), the "if" block above would never evaluate as "true".

<a href="http://blogs.msdn.com/somasegar/archive/2005/08/11/450640.aspx" target="_blank">Somasegar's weblog</a> describes what happened next in some detail:

> Clearly this had to change. We had a solution in Visual Studio 2005 Beta2 that gave users static methods that could determine the correct null-ness for nullable types in these more or less untyped scenarios. However, these methods were costly to call and difficult to remember to use. The feedback you gave us was that you expected it to simply work right by default. 
> So we went back to the drawing board. After looking at several different workarounds and options, it became clear to all that no amount of tweaking of the languages or framework code was ever going to get this type to work as expected. 
> The only viable solution was one that needed the runtime to change.

In other words, the runtime had to take a special interest in the Nullable type, treating it with special-cased logic to handle those conversions between Nullable instances and their non-Nullable equivalents. As Soma points out, "A Nullable int now boxes to become not a boxed Nullable int but a boxed int (or a null reference as the null state may indicate)." More importantly, this permeates throughout the entire runtime, so that

```
int? x = 10;
object y = x;
int? z = (int?)y; // unbox into a Nullable<int>
```

works as intended, where under the old rules it would have failed conversion because the boxed Nullable reference wouldn't be the same type as the Nullable type it was being converted into. (In other words, boxed(Nullable(T)) != T.)

The lessons here? When building languages to run on top of another platform or runtime, the decisions that runtime makes often put some serious constraints around what you can do within your language. For example, looking to support first-class functors on a JVM or CLR will run into the fact that functions <i>aren't</i> first-class in the runtime, but instead have to be handled with object wrappers around the functions. Hiding those differences in language semantics can only get you so far, and that sometimes you need to involve the runtime team a bit more deeply if you want to close all those edge cases. (Hint to Sun: you really need to start thinking about revising and extending the JVM, instead of this current policy that essentially describes the JVM as perfect as-is. The changes made to support annotations were minor, but a good first step; it's time to open that Pandora's box wider if you want to keep up with the CLR, to be blunt about it.)
 