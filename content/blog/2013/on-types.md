title=On Types
date=2013-04-26
type=post
tags=languages, csharp, java, fsharp, industry
status=published
description=In which I think out loud more about objects and strong types, and how we're doing it wrong.
~~~~~~

<p>Recently, having been teaching C# for a bit at Bellevue College, I’ve been thinking more and more about the way in which we approach building object-oriented programs, and particularly the debates around types and type systems. I think, not surprisingly, that the way in which the vast majority of the O-O developers in the world approach types and when/how they use them is flat wrong—both in terms of the times when they create classes when they shouldn’t (or shouldn’t have to, anyway, though obviously this is partly a measure of their language), and the times when they should create classes and don’t.</p>

<!--more-->

<p>The latter point is the one I feel like exploring here; the former one is certainly interesting on its own, but I’ll save that for a later date. For now, I want to think about (and write about) how we often don’t create types in an O-O program, and should, because doing so can often create clearer, more expressive programs.</p>  <h3>A Person</h3>  <p>Common object-oriented parlance suggests that when we have a taxonomical entity that we want to represent in code (i.e., a concept of some form), we use a class to do so; for example, if we want to model a "person" in the world by capturing some of their critical attributes, we do so using a class (in this case, C#):

```csharp
class Person
{
	public string FirstName { get; set; }
	public string LastName { get; set; }
	public int Age { get; set; }
	public bool Gender { get; set; }
}
```

Granted, this is a pretty simplified case; O-O enthusiasts will find lots of things wrong with this code, most of which have to do with dealing with the complexities that can arise.

From here, there’s a lot of ways in which this conversation can get a lot more complicated—how, where and when should inheritance factor into the discussion, for example, and how exactly do we represent the relationship between parents and children (after all, some children will be adopted, some will be natural birth, some will be disowned) and the relationship between various members who wish to engage in some form of marital status (putting aside the political hot-button of same-sex marriage, we find that some states respect "civil unions" even where no formal ceremony has taken place, many cultures still recognize polygamy—one man, many wives—as Utah did up until the mid-1800s, and a growing movement around polyamory—one or more men, one or more women—looks like it may be the next political hot-button around marriage) definitely depends on the business issues in question...

... but that’s the whole point of encapsulation, right? That if the business needs change, we can adapt as necessary to the changed requirements without having to go back and rewrite everything.

#### Genders
Consider, for example, the rather horrible decision to represent "gender" as a boolean: while, yes, at birth, there are essentially two genders at the biological level, there are some interesting birth defects/disorders/conditions in which a person’s gender is, for lack of a better term, screwed up—men born with female plumbing and vice versa. The system might need to track that. Or, there are those who consider themselves to have been born into the wrong gender, and choose to live a lifestyle that is markedly different from what societal norms suggest (the transgender crowd). Or, in some cases, the gender may not have even been determined yet: fetuses don’t develop gender until about halfway through the pregnancy.

Which suggests, offhand, that the use of a boolean here is clearly a Bad Idea. But what suggests as its replacement? Certainly we could maintain an internal state string or something similar, using the get/set properties to verify that the strings being set are correct and valid, but the .NET type system has a better answer: Given that there is a finite number of choices to gender—whether that’s two or four or a dozen—it seems that an enumeration is a good replacement:

```csharp
enum Gender
{ Male, Female, Indeterminate, Transgender }

class Person
{
	public string FirstName { get; set; }
	public string LastName { get; set; }
	public int Age { get; set; }
	public Gender Gender { get; set; }
}
```

Don’t let the fact that the property and the type have the same name be too confusing—-not only does it compile cleanly, but it actually provides some clear description of what’s being stored. (Although, I’ll admit, it’s confusing the first time you look at it.) More importantly, there’s no additional code that needs to be written to enforce only the four acceptable values—or, extend it as necessary when that becomes necessary.

#### Ages
Similarly, the age of a person is not an integer value—people cannot be negative age, nor do they usually age beyond a hundred or so. Again, we could put code around the get/set blocks of the Age property to ensure the proper values, but it would again be easier to let the type system do all the work:

```csharp
struct Age
{
	int data;
	public Age(int d) { Validate(d); data = d;
}

public static void Validate(int d)
{ 
	if (d < 0) throw new ArgumentException("Age cannot be negative");
	if (d > 120) throw new ArgumentException("Age cannot be over 120");
}

// explicit int to Age conversion operator
public static implicit operator Age(int a) { return new Age(a); }

// explicit Age to int conversion operator 
public static implicit operator int(Age a){ return a.data; }

class Person
{
	public string FirstName { get; set; }
	public string LastName { get; set; }
	public Age Age { get; set; }
	public Gender Gender { get; set; }
}

Notice that we’re still having to write the same code, but now the code is embodied in a type, which is itself intrinsically reusable—we can reuse the Age type in other classes, which is more than we can say if that code lives in the Person.Age property getter/setter. Again, too, now the Person class really has nothing to do in terms of ensuring that age is maintained properly (and by that, I mean greater than zero and less than 120). (The "implicit" in the conversion operators means that the code doesn’t need to explicitly cast the int to an Age or vice versa.)

Technically, what I’ve done with Age is create a restriction around the integer (System.Int32 in .NET terms) type; were this XSD Schema types, I could do a derivation-by-restriction to restrict an xsd:int to the values I care about (0 – 120, inclusive). Unfortunately, no O-O language I know of permits derivation-by-restriction, so it requires work to create a type that "wraps" another, in this case, an Int32.

#### Names
Names are another point of problem, in that there’s all kinds of crazy cases that (as much as we’d like to pretend otherwise) turn out to be far more common than we’d like—not only do most people have middle names, but sometimes women will take their husband’s last name and hyphenate it with their own, making it sort of a middle name but not really, or sometimes people will give their children to multiple middle names, Japanese names put family names first, sometimes people choose to take a single name, and so on. This is again a case where we can either choose to bake that logic into property getters/setters, or bake it into a single type (a "Name" type) that has the necessary code and properties to provide all the functionality that a person’s name represents.

So, without getting into the actual implementation, then, if we want to represent names in the system, then we should have a full-fledged "Name" class that captures the various permutations that arise:

```csharp
class Name
{
	public Title Honorific { get { ... } }
	public string Individual { get { ... } }
	public string Nickname { get { ... } }
	public string Family { get { ... } }
	public string Full { get { ... } }
	public static Name Parse(string incoming) { ... }
}
```

See, ultimately, everything will have to boil back to the core primitives within the language, but we need to build stronger primitives for the system—Name, Title, Age, and don’t even get me started on relationships.

#### Relationships
Parent-child relationships are also a case where things are vastly more complicated than just the one-to-many or one-to-one (or two-to-one) that direct object references encourage; in the case of families, given how complex the modern American family can get (and frankly, it’s not any easier if we go back and look at medieval families, either—go have a look at any royal European genealogical line and think about how you’d model that, particularly Henry VIII), it becomes pretty quickly apparent that modeling the relationships themselves often presents itself as the only reasonable solution.

I won’t even begin to get into that example, by the way, simply because this blog post is too long as it is. I might try it for a later blog post to explore the idea further, but I think the point is made at this point.

### Summary
The object-oriented paradigm often finds itself wading in tens of thousands of types, so it seems counterintuitive to suggest that we need more of them to make programs more clear. I agree, many O-O programs are too type-heavy, but part of the problem there is that we’re spending too much time creating classes that we shouldn’t need to create (DTOs and the like) and not enough time thinking about the actual entities in the system.

I’ll be the first to admit, too, that not all systems will need to treat names the way that I’ve done—sometimes an age is just an integer, and we’re OK with that. Truthfully, though, it seems more often than not that we’re later adding the necessary code to ensure that ages can never be negative, have to fall within a certain range, and so on.

As a suggestion, then, I throw out this idea: <strong><em>Ensure that all of your domain classes never expose primitive types to the user of the system.</em></strong> In other words, `Person` never exposes an `int` for the idea of age, only an `Age` type. C# makes this easy via `using` declarations, like so:

```csharp
using FirstName = System.String;
using LastName = System.String;
```

which can then, if you’re thorough and disciplined about using the FirstName and LastName types instead of `string`, evolve into fully-formed types later in their own right if they need to. C++ provides `typedef` for this purpose—unfortunately, Java lacks any such facility, making this a much harder prospect. (This is something I’d stick at the top of my TODO list were I nominated to take Brian Goetz’s place at the head of Java9 development.)

In essence, encapsulate the primitive types away so that when they don’t need to be primitives, or when they need to be more complex than just simple holders of data, they don’t have to be, and clients will never know the difference. That, folks, is what encapsulation is trying to be about.
 
