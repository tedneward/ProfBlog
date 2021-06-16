title=Scala reactions, pt2: Brevity
date=2006-03-03
type=post
tags=jvm, java, j2ee, c++, ruby, xml services, scala
status=published
description=In which I offer up some more reactions to Scala.
~~~~~~

While speaking at a conference in the .NET space (the patterns &amp; practices Summit, to be precise), Rocky Lhotka once offered an interesting benchmark for language productivity, a variation on the kLOC metric, what I would suggest is the "CLOC" idea: how many lines of code required to express a concept. (Or, since we could argue over formatting and style until the cows come home, how many <I>keystrokes</I> rather than lines of code.)

<!--more-->

Let's start with a simple comparison. The basic concept we want to express is that of a domain object type, my favorite example, that of a Person type. In domain lingo,

> A Person has a first name, a last name, and a spouse. Persons always have a first and last name, but may not have a spouse. Persons know how to say hi, by introducing themselves and their spouse.

which, as domain logic goes, is pretty simple and lame, but serves to highlight the metric pretty effectively. 

In Java, we express this class like so:

```
public class Person
{
    private String lastName;
    private String firstName;
    private Person spouse;
    
    public Person(String fn, String ln, Person s)
    {
        lastName = ln; firstName = fn; spouse = s;
    }
    public Person(String fn, String ln)
    {
        this(fn, ln, null);
    }
    
    public String getFirstName()
    { 
        return firstName;
    }
    
    public String getLastName()
    { 
        return lastName;
    }
    
    public Person getSpouse()
    { 
        return spouse;
    }
    public void setSpouse(Person p) 
    { 
        spouse = p;
            // We ignore sticky questions of reflexivity and
            // changing last names in this method for simplicity
    }
    
    public String introduction()
    {
        return "Hi, my name is " + firstName + " " + lastName +
            (spouse != null ? 
            " and this is my spouse, " + spouse.firstName + " " + spouse.lastName + "." :
            ".");
    }
}
```

Relatively verbose, and while I'm certain people will stand up and argue that any modern IDE can code-generate some of this basic scaffolding for you, the fact is that the language itself requires this much degree of verbosity in order to express the concept. And this is a fairly basic concept; consider a much more complex domain object that has dozens of attributes associated with it. Code-generation and templates can mitigate some of the pain, but it can't remove it entirely, unfortunately. 

This isn't just a Java problem; the C# version of this type isn't much better:

```
public class Person
{
    private string lastName;
    private string firstName;
    private Person spouse;
    
    public Person(string fn, string ln, Person s)
    {
        lastName = ln; firstName = fn; spouse = s;
    }
    public Person(string fn, string ln)
        : this(fn, ln, null)
    {
    }
    
    public string FirstName
    {
        get { return firstName; }
        set { firstName = value; }
    }
    
    public string LastName
    {
        get { return lastName; }
    }
    
    public Person Spouse
    {
        get { return spouse; }
        set { spouse = value; }
    }
    
    public string Introduction()
    {
        return "Hi, my name is " + firstName + " " + lastName +
            (spouse != null ? 
            " and this is my spouse, " + spouse.firstName + " " + spouse.lastName + "." :
            ".");
    }
}
```

and the Visual Basic version arguably gets even worse since VB prefers to use keywords to symbols: 

```
Class Person
  Dim _FirstName As String
  Dim _LastName As String
  Dim _Spouse As Person

  Public Sub New(ByVal FirstName As String, ByVal LastName As String, ByVal Spouse As Person)
    Me._LastName = LastName
    Me._FirstName = FirstName
    Me._Spouse = Spouse
  End Sub

  Public Sub New(ByVal FirstName As String, ByVal LastName As String)
    Me.New(FirstName, LastName, Nothing)
  End Sub

  Public ReadOnly Property LastName() As String
    Get
      Return _LastName
    End Get
  End Property

  Public Property FirstName() As String
    Get
      Return _FirstName
    End Get
    Set (ByVal Value As String)
      Me._FirstName = Value
    End Set
  End Property

  Public Property Spouse() As String
    Get
      Return _Spouse
    End Get
    Set (ByVal Value As Person)
      Me._Spouse = Value
    End Set
  End Property

  Public Function Introduction As String
    Dim temp As String
    temp = "Hi, my name is " &amp; _FirstName &amp; " " &amp; _LastName
    If _Spouse &lt;&gt; Nothing Then
      temp = temp &amp; " and this is my spouse, " &amp; _Spouse.FirstName() &amp; " " &amp; _Spouse.LastName() &amp; "."
    Else
      temp = temp &amp; "."
    End If
    Return temp
  End Function
End Class
```

A lot of what makes Ruby interesting to people is the fact that Ruby makes this a lot simpler (and I'll bet my Ruby here isn't the most terse it could be):

```
class Person
  def initialize(firstname, lastname, spouse = null)
    @firstname = firstname
    @lastname = lastname
    @spouse = spouse
  end

  attr_reader :lastName
  attr_writer :firstName, :spouse
  
  def introduction
    if spouse == nil
      "Hello, my name is #{firstName} #{lastName}"
    else
      "Hello, my name is #{firstName} #{lastName} and this is my spouse, #{spouse.firstName} #{spouse.lastName}"
    end
  end
end
```

Scala, similarly, simplifies the definition of the type. Take a look: 

```
class Person(ln : String, fn : String, s : Person)
{
    def lastName = ln;
    def firstName = fn;
    def spouse = s;
    
    def this(ln : String, fn : String) = { this(ln, fn, null); }

    def introduction() : String = 
        return "Hi, my name is " + firstName + " " + lastName +
            (if (spouse != null) " and this is my spouse, " + spouse.firstName + " " + spouse.lastName + "." 
             else ".");
}
```

There's a couple of things to notice here. First off, like Ruby, Scala defines the backing store for a field and simple accessor around those fields; note that since this is a functional language, Scala assumes immutable objects by default, so there are no mutators. (It turns out to be fairly trivial to write a mutator method to set the state of those attributes, but that starts to wander away from the intent of functional languages; this is clearly a difference between Scala and a more traditional O-O language like Java or C#.) You may be curious to know where the three-argument constructor went; as it turns out, it's considered the "primary constructor", and is defined in the same line as the class declaration itself. The only reason we need the "this" method (another constructor) is because of the domain rule that says we can have a Person with no spouse. 

This is hardly an exhaustive comparison of the languages, but it does give you a little taste of Scala's object flavor. Ruby's syntax is arguably of the same length as Scala's (and frankly, to my mind, they're too close to call... or care), but clearly Scala's length is much much smaller than that of the equivalent C#, Java, Visual Basic or C++ class. (C++ could make things interesting with judicious use of templates to handle backing store, accessor and mutator, but that's considered too advanced by many C++ devs, and therefore too obscure to use in common practice, rightly or wrongly.)

When next we look at this, we'll look at what Scala means when they say "everything's an object"... and how that, in many ways, this means that Scala is more object-oriented than Java itself.

------


**Update:** Glenn Vanderburg pointed out that my Ruby wasn't quite correct, and also suggested a bit more "Rubification":

```
class Person
  def initialize(firstname, lastname, spouse = null)
    @firstname, @lastname, @spouse = firstname, lastname, spouse
  end

  attr_reader :lastName
  attr_accessor :firstName, :spouse  # attr_writer *just* makes a writer.  You really want this.

  # I would typically use the more explicit "if" that you used here, but for terseness I've
  # put this in the form you used with the Scala version:
  def introduction
    "Hello, my name is #{firstName} #{lastName}" + (spouse ? " and this is my spouse, #{spouse.firstName} #{spouse.lastName}" : "")
  end
end
```

Thanks, Glenn. Again, I'm struck by how Ruby's strength lies not in the core language itself, but the various "macros" that they've defined (such as attr_reader and attr_accessor or attr_writer). This notion of "core language with user-defined extensions" is a powerful one, and I hope to show how Scala does much the same in its language definition.
 
