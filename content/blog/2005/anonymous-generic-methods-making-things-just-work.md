+++
date = "2005-11-08T19:02:22.4814992-08:00"
draft = false
title = "Anonymous generic methods making things \"just work\""
aliases = [
	"/2005/11/09/Anonymous+Generic+Methods+Making+Things+Just+Work.aspx"
]
categories = [
	".NET","C++","Java/J2EE","Ruby"
]
concepts = []
languages = ["C++", "Ruby"]
platforms = [".NET", "Java/J2EE"]
 
+++
<p>A good friend of mine and I are looking at taking on a new project together, and as part of the discussion we were exploring some of the differences of taking a relational perspective against an object perspective, and one of the comments she made was that in a relational model, you can always "filter" the data you want based on some predicate. "Ha!", I said, "If that's what you want, I can give you that over objects, too!" What's more, thanks to generics, I can do this for any collection type in the system without having to introduce it on some kind of base class:
<pre>
    static class SetUtils
    {
        public static List&lt;T> Project&lt;T>(List&lt;T> list, Predicate&lt;T> pred)
        {
            List&lt;T> results = new List&lt;T>();

            foreach (T p in list)
                if (pred(p))
                    results.Add(p);

            return results;
        }

        // Not too hard to imagine the other relational operators here, too
    }

    // Usage:
    class Person
    {
        private string firstName;
        private string lastName;

        public Person(string fn, string ln, int age) {
            this.firstName = fn;
            this.lastName = ln;
        }

        public string FirstName {
            get { return firstName; }
            set { firstName = value; }
        }
        public string LastName {
            get { return lastName; }
            set { lastName = value; }
        }
        public override string ToString() {
            return "[Person [" + firstName + "]" + " " + "[" + lastName + "]" + "]";
        }
    }

    class Program {
        static void Main(string[] args) {
            Person cg = new Person("Cathi", "Gero", 35);
            Person tn = new Person("Ted", "Neward", 35);
            Person sg = new Person("Stephanie", "Gero", 12);
            Person mn = new Person("Michael", "Neward", 12);

            List&lt;Person> list = new List&lt;Person>();
            list.Add(cg);
            list.Add(tn);
            list.Add(sg);
            list.Add(mn);

            List&lt;Person> newards = 
                SetUtils.Project&lt;Person>(list, 
                    delegate (Person p) { if (p.LastName == "Neward") return true; else return false; } );
            foreach (Person p in newards)
                Console.WriteLine(p);
        }
    }
</pre>
Any more questions? (This is why having (1) a system that supports managed function pointers directly and (2) a generics system that doesn't rely on type erasure is so powerful. Hint, Hint, Sun guys....)</p>

<p>Now if I could just figure out how C# 3.0 manages to differentiate/overload between delegate instances and Expression objects in LINQ/DLinq, I might be able to backport that to C# 2.0, too, and be able to pass these Predicate instances across the wire for execution on other machines.</p>

<p>In a lot of ways, the Predicate delegate type is an example of using C#'s anonymous methods as a form of closure or lambda expression. (It's been argued that anonymous methods-as-delegates aren't "true" closures, since the local variables referenced in a closure will only be references to the objects, not complete copies, but to my mind that's exactly as it should be, as any time you pass a reference to an object, you're passing just that--a reference to an object, not a complete copy of the object. To do otherwise in anonymous methods would violate the Principle of Least Surprise, IMHO.) The Ruby syntax arguably isn't any more elegant or terse, and I suspect similar things could be done in C++ using templates; probably something along these lines already exists in Boost. But alas, I see no way to do this in Java given the current state of the JVM, namely the aforementioned lack of "managed functors" and type-preserving generics. If any out there in Java-land know otherwise, please holler, because I would <i>really</i> love to know how to do this as elegantly.</p>
 
