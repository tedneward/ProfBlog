title=Functional Programming, for the Uninitiated (using Java)
date=2016-01-18
type=post
tags=industry, enterprise, architecture, cloud, containers, devops, distributed systems, security, interoperability, functional programming, jvm, java, csharp, fsharp, scala, clojure
status=published
description=Transcribing a talk I used to give at the NFJS shows, giving those who've never seen functional programming before a chance to understand its approach and power, but in more approachable terms.
~~~~~~

**tl;dr** It's been a few years since I did this particular routine for the NFJS shows, but I found a sequence of demos/explanations that really demonstrated clearly why Java (and other classic O-O) developers should learn a little functional programming style, even if they never pick up an actual functional language. The keystone to that sequence of demos? ***"Collections are the gateway drug to functional programming."***

<!--more-->

I have concluded over the last decade or so that the best way to demonstrate a new concept is to "root" it (anchor it) cognitively against something developers already know how to do. With objects, that often entails "business objects" or "domain objects". I looked for ways to somehow relate functional programming to these business objects through collections (the Java Collections in particular, since Java was the platform of choice for the No Fluff Just Stuff conferences at which I honed a lot of this message, but the story works pretty equally well for .NET---which admittedly has LINQ but for a long time wasn't recognized as a functional language within it---or C++.)

### The Domain Type
Imagine we have a collection of Person types:

````java
public class Person {
  public Person(String fn, String ln, int a) {
    this.firstName = fn; this.lastName = ln; this.age = a;
  }
  
  public String getFirstName() { return firstName; }
  public String getLastName() { return lastName; }
  public int getAge() { return age; }
  
  public String toString() {
    return "[Person: " +
      "firstName:" + firstName + " " + 
      "lastName:" + lastName + " " +
      "age:" + age + "]";
  }
  
  private String firstName;
  private String lastName;
  private int age;
}
````

Yawn. Pretty boring stuff. Note that my Person type has no mutators/setters; this is both because this demo simply won't need them, and because in general it's better to try to work with immutable types anyway.

### Groups of Persons
It's not uncommon that we will have a group of Persons with which we want to do various domain-ish kinds of things. The typical way to do this is with an array:

````java
Person[] attendees = new Person[] {
  new Person("Ted", "Neward", 43),
  new Person("Charlotte", "Neward", 39), // and she will ALWAYS be 39
  new Person("Michael", "Neward", 22),
  new Person("Matthew", "Neward", 16),
  new Person("Carter", "Wickstrom", 45),
  new Person("David", "Dennison", 41),
  new Person("Kristy", "Overton", 20),
  new Person("Hilary", "Clinton", 79),
  new Person("Bernie", "Sanders", 129)
};
````

A motley crew if ever there was one.

Frequently, we find that we need to do various things with a subset of this crowd; for example, it's often happy hour, and we want to give everybody a nice cold one to top off the day:

````java
for (Person p : attendees)
  System.out.println("Have a beer, " + p.getFirstName());
````

Spot anything particularly wrong with this code?

Of course you do---you're like my wife, who has this crazy notion that my 16-year-old shouldn't actully be drinking. (Actually, neither should Kristy, for that matter.) So, when this bug is pointed out, the natural thing to do is put a guard clause of some form in the "for" loop:

````java
for (Person p : attendees)
  if (p.getAge() >= 21)
    System.out.println("Have a beer, " + p.getFirstName());
````

And, we're done, right?

Not really; the next time we want to do something across the entire group, we need to write almost exactly the same code again:

````java
for (Person p : attendees)
  if (p.getAge() >= 65)
    System.out.println("Here's your retirement check, " + p.getFirstName());
````

or:

````java
for (Person p : attendees)
  if (p.getAge() >= 16)
    System.out.println("Here's your driver's license, " + p.getFirstName());
````

or even:

````java
for (Person p : attendees)
  if (p.getAge() >= 18 && p.getAge() <= 65)
    System.out.println("Have you registered for the draft, " + p.getFirstName() + "?");
````

When viewed this way, it's easy to see that *for loops violate the DRY principle*.

### An aside: arrays suck
By the way, arrays in Java suck. They're not quite as bad in .NET, but they really REALLY suck in C++. Basically, the closer your language is to thinking of an array as just a pointer with some sexy pointer math on top of it, the more they suck. It's far better to use the collection classes that are (now) standard with every language.

In Java, that usually means using List<T> and ArrayList<T>, and to a lot of developers, that means initializing that set of Persons to start with gets really cumbersome:

````java  
List<Person> attendees = new ArrayList<Person>();
attendees.add(new Person("Ted", "Neward", 43));
attendees.add(new Person("Charlotte", "Neward", 39));
attendees.add(new Person("Michael", "Neward", 22));
attendees.add(new Person("Matthew", "Neward", 16));
attendees.add(new Person("Carter", "Wickstrom", 45));
attendees.add(new Person("David", "Dennison", 41));
attendees.add(new Person("Kristy", "Overton", 20));
attendees.add(new Person("Hilary", "Clinton", 79));
attendees.add(new Person("Bernie", "Sanders", 129));
````

But as it turns out, the Java Collections library has a better approach to this; they refer to them as *algorithms*, but in essence, these are black-box methods that do some pretty simple things:

````java
List<Person> attendees = Arrays.asList(
  new Person("Ted", "Neward", 43),
  new Person("Charlotte", "Neward", 39), // and she will ALWAYS be 39
  new Person("Michael", "Neward", 22),
  new Person("Matthew", "Neward", 16),
  new Person("Carter", "Wickstrom", 45),
  new Person("David", "Dennison", 41),
  new Person("Kristy", "Overton", 20),
  new Person("Hilary", "Clinton", 79),
  new Person("Bernie", "Sanders", 129)
);
````

The `Arrays` class is part of `java.util`, and it's a set of static methods that are "just used". No class initialization, no objects, just a good-ol' method call. It's like 1985 called, screamed "Happy Birthday!" into the phone, and left a brand-new laser disc on our doorstep along with the receipt from Blockbuster.

Still, it works, and there's a lot to be said for the simplicity and the ease by which we convert from the array form to the Collection form using `asList` up there. But while we're on the subject, let's not call these "I don't really do anything on an object" things "methods"; let's get used to the idea of calling them "functions", since they modify no object state, don't live on an instance, and really only use the "class" around them as a lexical scoping mechanism (and because Java has this really annoying rule about everything having to be part of a class because, you know, "globals are bad". Unless they're called "singletons", of course.)

### Reusing code
Stepping back, look at the various loops above; it's fairly easy to generalize what we're doing; in each case, we're testing to see if somebody meets an age criteria, and if so, taking some kind of action. We like reusable code, so let's do that:

````java
class Utils {
  public static void happyHour(List<Person> persons) {
    for (Person p : persons)
      if (p.getAge() >= 21)
        System.out.println("Have a beer, " + p.getFirstName());
  }
  public static void retirement(List<Person> persons) {
    for (Person p : persons)
      if (p.getAge() >= 65)
        System.out.println("Here's your check, " + p.getFirstName());
  }
}
````

We can actually do better than this pretty quickly, or so we think:

````java
class Utils {
  public static testGTAndPrint(List<Person> persons, int age, String message) {
    for (Person p : persons)
      if (p.getAge() > age)
        System.out.println(message + p.getFirstName())
  }
  public static void happyHour(List<Person> persons) { 
    testGTAndPrint(21, "Have a beer, ");
  }
  public static void retirement(List<Person> persons) {
    testGTAndPrint(65, "Here's your check, ");
  }
}
````

But the flaws come out pretty quickly---we're not always going to want to test if the age is greater than the passed value (sometimes it will want to be less-than, like when seeing if anybody qualifies for the kids' menu), and sometimes we will want to do something other than print a message to the console.

The larger pattern here is obvious, though: test, then act. How do we generalize this?

[Strategy pattern](../../patterns/behavioral/Strategy/), of course!

### Everybody knows Strategy
Java has long had a rich history with patterns, particularly those defined in the "Gang of Four" book, and Strategy is one of the ones that has been with us from the beginning. Most of the time we're familiar with it from wanting to compare two objects to see if one is "greater" or "lesser" than the other, using the `Comparable` interface: one simply implements it on the class that we want to compare, and provide an implementation of it.

Unless, of course, we want to sort by a different criteria. Then things get a little tricky.

See, part of the magic of Strategy is that its implementation is supposed to be replaceable at runtime for another implementation, and we can't do that if we inherit the interface and define the implementaiton as a method. This is not an unreasonable thing to want for comparisons; sometimes we want to arrange people by last name, sometimes by first name, sometimes by age, sometimes by height, and so on. We want to change the implementation used to do the comparison at runtime, so we use a `Comparator`; for a `Person`, that often looks something like:

````java
class AgeComparator<Person> implements Comparator<Person> {
  // return negative for "less than", 0 for "equal", or 
  // positive for "greater than"; easiest way to do that is
  // to just subtract one from the other
  //
  public int compare(Person lhs, Person rhs) {
    return lhs.getAge() - rhs.getAge();
  }
}
````

Then, when sorting (perhaps using a `SortedSet` or the `Collections.max` or `Collections.min` methods), we simply instantiate and pass in the `Comparator` of choice.

By the way, though, I never liked seeing these guys float around as top-level classes; the `AgeComparator` there is specific to Person, so it really should be captured inside the class, if you ask me:

````java
class Person {
  public class AgeComparator<Person> implements Comparator<Person> {
    // return negative for "less than", 0 for "equal", or 
    // positive for "greater than"; easiest way to do that is
    // to just subtract one from the other
    //
    public int compare(Person lhs, Person rhs) {
      return lhs.getAge() - rhs.getAge();
    }
  }
}
````

And now that you mention it, we really don't ever need more than one of them at a time, so we can just instantiate one, make it `static` (and make it `final` while we're at it, since we probably don't want anybody outside of `Person` to change what it means to compare two `Person`s by age):

````java
class Person {
  public static final Comparator<Person> BY_AGE = new Comparator<Person>() {
    public int compare(Person lhs, Person rhs) {
      // Notice that now, since we're inside the class, we can go directly at the
      // fields, which may be faster, depending on how complicatd the internal state
      // of the class is
      //
      return lhs.age - rhs.age;
    }
  };
}
````

All boned up on Strategy? Cool. 

By the way, this is where things are going to take a bit of a cognitive leap, so if you need to, you know, grab a coffee or go to the bathroom or something, now's a good time to do it. Fortunately, this isn't a conference, so I'll just stop here and wait for you until you get back. Totally cool---I have a few emails to do anyway.

*(Hums and fires up email client)*

Ready? Let's keep going.

### Strategy to the reusable rescue
We have two Strategies at work here, actually: one to do the test, and the other to do the action, so let's create two interfaces, one for each:

````java
interface Test {
  public boolean test(Person p);
}

interface Act {
  public void do(Person p);
}
````

Now we can rewrite `Utils` a little bit more... reusably.

````java
class Utils {
  public static testAndAct(List<Person> persons, Test tester, Act actor) {
    for (Person p : persons)
      if (tester.test(p))
        actor.do(p);
  }
  
  public static class DrinkableAge : Test {
    public boolean test(Person p) { return p.getAge() > 21; }
  }
  public static class RetiredAge : Test {
    public boolean test(Person p) { return p.getAge() > 65; }
  }
  
  public static class HaveABeer : Actor {
    public void do(Person p) { System.out.println("Have a beer, " + p.getFirstName()); }
  }
  public static class HeresYourCheck : Actor {
    public void do(Person p) { System.out.println("Here's your check, " + p.getFirstName()); }
  }
  
  public static void happyHour(List<Person> persons) {
    testAndAct(persons, new DrinkableAge(), new HaveABeer());
  }
  public static void retirement(List<Person> persons) {
    testAndAct(persons, new RetiredAge(), new HeresYourCheck());
  }
}
````

You know what, though? Every time we call either of those methods, we're creating new objects, when they don't really need to be new; we can use the same one, over and over again (even across multiple threads, since they don't hold any state). Let's make them Singletons:

````java
class Utils {
  public static testAndAct(List<Person> persons, Test tester, Act actor) {
    for (Person p : persons)
      if (tester.test(p))
        actor.do(p);
  }
  
  public static final Test DRINKER = new Test() {
    public boolean test(Person p) { return p.getAge() > 21; }
  };
  public static final Test RETIRED = new Test() {
    public boolean test(Person p) { return p.getAge() > 65; }
  };
}
````

... and in fact, we can generalize the "printers" a little more by getting a little creative:

````java
class Utils {
  public static testAndAct(List<Person> persons, Test tester, Act actor) {
    for (Person p : persons)
      if (tester.test(p))
        actor.do(p);
  }
  
  public static Actor createPrinterActor(String message) {
    return new Actor() {
      public void do(Person p) {
        System.out.println(message + p.getFirstName());
      }
    };
  }
  
  public static final Actor HAVE_A_BEER = createPrinterActor("Have a beer, ");
  public static final Actor HERES_CHECK = createPrinterActor("Here's your check, ");
}
````

... which then makes the other methods even more interesting:

````java
class Utils {
  public static testAndAct(List<Person> persons, Test tester, Act actor) {
    for (Person p : persons)
      if (tester.test(p))
        actor.do(p);
  }
  
  public static void happyHour(List<Person> persons) {
    testAndAct(persons, DRINKER, HAVE_A_BEER);
  }
  public static void retirement(List<Person> persons) {
    testAndAct(persons, RETIRED, HERES_CHECK);
  }
}
````

Interesting, wot?

### Utilicizing Utils
Have a look back at the `testAndAct` method again; is there anything really all that specific to the `Person` type inside of it? Not a lick, which implies that it can actually be genericized entirely away from `Person` itself:

````java
class Utils {
  // will not compile yet
  public static <T> testAndAct(List<T> items, Test tester, Act actor) {
    for (T t : items)
      if (tester.test(t))
        actor.do(t);
  }
}
````

... but in order for that to work, Test and Act have to be made generics, as well. (Note that the method is generic, not the entire Utils class, which necessitates the "generic type argument" at the front of the method signature.)

Now, it's time for a bit of an admission: technically, `testAndAct` is actually two methods in one. One is a method designed to filter out items that don't fit a particular criteria, and the other is to perform a specific action against each element in the collection. So let's rename the interfaces accordigly, and break the two methods out:

````java
interface FilterFn<T> {
  public boolean apply(T it);
}
interface ActionFn<T> {
  public void apply(T it);
}

class Utils {
  public static <T> List<T> filter(List<T> src, FilterFn<T> criteria) {
    List<T> results = new ArrayList<T>();
    for (T it : src)
      if (criteria.apply(it))
        results.add(it);
    return results;
  }
  public static <T> void map(List<T> src, ActionFn<T> action) {
    for (T it : src)
      action.apply(it);
  }
}
````

I've made a little terminology switch here, too. Each of the methods inside the interface is called "apply", for historical reasons. (That's what functional guys call doing something with a method on an object, "applying" it.) And "test" became "filter", and "action" became "map". (That last one deserves explanation---the functional crowd says that when you apply a function across each element of a collection, you're "mapping" the function to each element. Why that particular verb, though, I honestly don't know.)

(And yes, all you classic functional programmers, I know that you may disagree with my use of the terminology; hold your criticism for now, please. I've heard "map" used several different ways in several different languages, and I don't want to get into the nuances right now.)

And while we could go back and rewrite the `happyHour` and `retirement` methods on Utils, it actually is becoming more clear that `Utils` is about a lot more than just people. As a matter of fact, it's arguable that those are actually things that should be defined on the `Person` class itself, since they relate more to Person-hood than anything else:

````java
public class Person {
  public static final FilterFn<Person> DRINKER = new FilterFn<Person>() {
    public boolean apply(Person it) { return it.getAge() >= 21; }
  };
  public static final FilterFn<Person> RETIRED = new FilterFn<Person>() {
    public boolean apply(Person it) { return it.getAge() >= 65; }
  };
}
````

And now we can go back to just using them inline, right?:

````java
Utils.map(
  Utils.filter(attendees, Person.DRINKER),
  new ActionFn<Person>() {
    public void apply(Person it) {
      System.out.println("Have a beer, " + it.getFirstName());
    }
  });
````

... because this is so much clearer!

### Sanity, O Sanity, wherefore art thou, Sanity?
It's usually at about this point in the discussion that even the most open-minded soul starts looking at me a little quizzically, because this really doesn't seem to have a whole lot of upside to it---it's longer, it's much more indirect than a traditional iteration loop, and frankly, using this inline just feels hideous. Part of this is the awkward pre-Java8 syntax. But part of it is that this just doesn't seem to have much advantage to it.

Until you get to writing tests.

Here's the challenge: how many tests do you need to write each time you write a for loop in your code? Typically, there's going to need to be a test to exercise every possible combination through that loop, for each for loop in the code. And let's talk about how many different permutations of collections you need to construct in order to test all of those permutations. This is going to spiral out of control pretty quickly.

But in my new version, how many tests do you need to write? I count:

1. Test that `Utils.filter()` works
2. Test that `Utils.map()` works
3. Test that `DRINKERS` works
4. Test that `RETIRED` works
5. Test that the anonymous `ActionFn` works

And, really, look back at `DRINKERS` and `RETIRED`; do we really need a test to determine that a simple getter works, or that Java's math works? I'd argue that we can strike those out completely. And as for the `ActionFn`, when's the last time that `System.out.println` failed you? Or String concatenation?

So we're down to two methods to test. (And I would argue that they're also so ridiculously simple, they don't need testing, either, but maybe that's pushing it for you, I dunno.) But here's a nice parting gift for our contestants today: Once those two methods are tested to your satisfaction, they're tested for everything that might use them---whether it's a `Person` being passed in, or a `Pet` or a `CheckingAccount` doesn't matter.

Hunh. That's not a bad tradeoff, actually.

And if we use the `static import` to pull in the members on Utils (a la `import static Utils.*;`), then `map` and `filter` become top-level symbols, so we can leave off the "Utils." prefix. And heck, if you rename "map" to "for" (oh, if only we could, curse you keywords!), you end up with something like this:

````java
map(
  filter(attendees, Person.DRINKER),
  new ActionFn<Person>() {
    public void apply(Person it) {
      System.out.println("Have a beer, " + it.getFirstName());
    }
  });
````

Now, all it really takes is to create one of those "printerActor" objects somewhere as a static, and this can simplify down to:

````java
map(
  filter(attendees, Person.DRINKER),
  HAVE_A_BEER
);
````

It sure as hell doesn't look like Java much anymore, but is there any question left in your mind as to what is going on here? It almost reads like pseudocode!

### Now do this a million times...
But here's the kicker: What if there aren't just ten attendees, but ten million? The `filter` and `map` implementations in Utils are totally inappropriate for that; they should be parallelized, probably using the ForkJoin framework from inside Java7, or at least breaking up the work into smaller chunks and handing each chunk out to a separate thread for processing, gathering those results up into a final collection, and and and

And how often do you want to write that?

In the earlier "for" loop case, you'd have to write that every single time you wanted to do anything with this 10-million-item collection. Every. Single. Time.

In my Utils-based version, though, the FilterFn and ActionFn implementations remain exactly as they are; we just need a new version of Utils that does all that parallelization stuff, and now the code can take advantage of parallelization by going from this:

````java
map(
  filter(attendees, Person.DRINKER),
  HAVE_A_BEER
);
````

to this:

````java
map(
  filter(attendees, Person.DRINKER),
  HAVE_A_BEER
);
````

See the difference?

Actually, I lied; we actually need to do it like this:

````java
import static Utils.*;

// ...

map(
  filter(attendees, Person.DRINKER),
  HAVE_A_BEER
);
````

to

````java
import static ParallelUtils.*;

// ...

map(
  filter(attendees, Person.DRINKER),
  HAVE_A_BEER
);
````

That's not bad. Change one lie of code, and voila! You have a thread pooled set of operations. Twice. Without changing an actual implementation line of code.

But wait---act now, and we'll throw in a set of Ginsu knives as well. Or, maybe not. But something just as cool, I promise.

### Folding universes
The functional world is not done with us yet. It's got another surprise or two up its sleeve.

First of all, there's two more generic "function" types that they like to define; one is a "transformation" function that takes an A and turns it into a B, like so:

````java
interface TransformerFn<R,T>
{
    public R apply(T it);
}

class Utils {
  public static <R,T> List<R> xform(List<T> src, TransformerFn<R,T> transformer)
  {
    List<R> results = new ArrayList<R>();
    for (T it : src)
      results.add(transformer.apply(it));
    return results;
  }
}
````

where "R" means "result" and "T" is the traditional input type.

Using this one is pretty easy to understand---the `Person` has several of these kinds of "transformation" methods already defined, in the sense that you can think about `getFirstName` as a method that "transforms" a `Person` into a `String` that happens to hold that person's first name as its value. So it's possible to take our list of attendees, and "transform" them into a list of last names (perhaps for sorting reasons), by using a particular Utils method that basically looks like all of the others except for the type signature:

```java
List<String> lastNames = 
  Utils.xform(attendees, 
    new TransformerFn<String, Person>() {
      public String apply(Person it) { return p.getLastName(); }
    });
```

The other is an "accumulation" function, where we want to accumulate a value while doing something to each element of a collection. Doing this is called "folding", because it takes a collection of stuff and effectively "folds" it into one value, one element at a time. (These are sometimes called "folding left" or "folding right", depending on whether it starts at the beginning or the end of the collection.) Like so:

```java
interface FoldFn<R,T>   // F2<R,T,R>
{
    public R apply(R accum, T it);
}

class Utils {
  public static <R,T> R foldLeft(R seed, List<T> src, FoldFn<R,T> folder)
  {
    R accum = seed;
    for (T it : src)
      accum = folder.apply(accum, it);
    return accum;
  }
}
```

The easist example to see here is to "fold" a series of numbers together; perhaps we want to find the average age of all the attendees, so we sum them all up, and then divide by the number of attendees:

```java
// In other words, instead of doing this:
//
int accum = 0;
for (Person it : attendees)
  accum = accum + it.getAge();
System.out.println("total age = " + accum);
System.out.println("average age = " + (accum / attendees.size());

// Now we would do this:
//
Integer totalAge = Utils.foldLeft(0, people, new FoldFn<Integer,Person>() {
  public Integer apply(Integer accum, Person it) {
    return accum + it.getAge();
  }
});
System.out.println("total age = " + totalAge);
System.out.println("average age = " + (totalAge / attendees.size());
```

Seems kinda pointless, ya?

### The XML factor
Oh, by the way, the customer called; they want to see all of those attendees in a SOAP call by Monday. Time to break out your JAXB, or other Reflection-based Java-to-XML library of choice, right?

While you do that, I'm just going to transform this entire collection of `Person`s  into XML with only the use of these two functions:

````java
String xml = Utils.foldLeft("<people>", people, new FoldFn<String,Person>() {
  public String apply(String accum, Person it) {
    return accum + "<person>" + it.getFirstName() + "</person>";
  }
}) + "</people>";
System.out.println(xml);
````

And you know what's even more interesting? Doing it this way, I can actually change the format of how the Person renders into XML without having to chagne a thing inside the Person.

Oh, and did I mention that this is---still---all ridiculously easy to test? Because all of this code is, when you look at it, made up of entirely idiotically-simple primitives that really require no testing whatsoever. Point to one aspect of any of these functions that isn't drop-dead, absolutely-the-most-primitive-thing-the-language-can-do kinds of operations. For crying out loud, the `FoldFn` is just doing String concatenation and a simple getter call; what the hell is there to test?!?

Intrigued yet?

### Wrapping up
Don't get me wrong; there's a lot more to functional programming than just what I've demonstrated here, and Java8's new labmda support (which, by the way, I'm going to leave to you to use to refactor this code to Java8 syntax, because it's a good exercise and you need the practice anyway) most certainly does not do all the things that one would expect a modern "functional" language to do. (Talk to me when you know what "currying" is.)

Oh, and now, is it clear why I think collections are the gateway drug to functional programming?
