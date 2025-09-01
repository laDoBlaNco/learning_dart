// ignore_for_file: use_super_parameters, unnecessary_type_check, overridden_fields, unused_local_variable, unreachable_switch_default

/*Chapter 9: Advanced Classes
  Object oriented programming has captured developer's imaginations for decades.
  Just as the name 'class' is inspired by the biological notation, the true beauty
  of OOP is how I'm able to elegantly build connective tissue between classes. In this
  chapter I'll learn how to use tools such as inheritance, interfaces, mixins and
  extension methods to move beyond simple coding and enter a world of software
  design 
  
  Extending Classes:
  Creating hierachies of classes that share some basic functionality is really what
  Flutter is based on. I can create my own hierarchies by extending classes. This is
  also call INHERITANCE, because the classes form a tree (like the widget tree) in
  which child classes inherit from parent classes. The parent and child classes
  are also called super and sub classes respectively. The Object class is the top
  superclass for all non-nullable types in Dart. All other classes (except null)
  are subclasses of Object
  
    NOTE: Although there is no named top type in Dart, since all non-nullable Dart
    types derive from the Object type and Object itself is a subtype of the nullable
    Object? type, then Object? can be considered in practice to be the root of the 
    Dart type system.*/

// Creating a subclass
enum Grade { A, B, C, D, E, F }

class Person {
  Person(this.givenName, this.surname);
  String givenName;
  String surname;
  String get fullName => '$givenName $surname';

  @override // NOTE: while using override is optional in Dart, it does help in that
  // the compiler will give me an error if I'm overriding something that doesn't
  // exist in the parent class.
  String toString() => fullName;
}

/*
class Student {
  Student(this.givenName, this.surname);

  String givenName;
  String surname;
  var grades = <Grade>[]; // using generics 🤔
  String get fullName => '$givenName $surname';

  @override
  String toString() => fullName;
}
*/

// So the only difference above is the grades. Does it make sense to repeat
// all of this code? Subclassing removes code duplication

class Student extends Person {
  Student(String givenName, String surname) : super(givenName, surname);

  var grades = <Grade>[];

  @override
  // overriding the parent method to print name first name last
  String get fullName => '$surname,$givenName';
  /*
    A few points to pay attention to:
      ▪ The constructor parameter names don't refer to 'this' anymore. Whenever
        I see the keyword 'this', I should remember that 'this' referes to the
        current object, which in this case would be an instance of the Student
        class. Since Student no longer contains the field names givenName and surname
        using this.givenName or this.surname would have nothing to reference.
        
      ▪ In contrast to 'this', the 'super' keyword is used to refer one level up the
        hierarchy. Similar to the forwarding ':' constructor I learned in Chapter 6, 
        using super(givenName,surname) passes the constructor parameters on to another
        constructor. However since I'm using super instead of 'this', I'm forwarding
        the params to the parent class's constructor, that is, to the constructor
        Person
        
        As a quick side note, if I use an initializer list as I learned in chapter
        6 I believe, the call to super always goes last 🤔, that is, after my assert
        statements and initializers.
        
          class SomeChild extends SomeParent{
            SomeChild(double height)
              : assert(height != 0), -- this is my assertion
                _height = height,    -- initializing my private properties
                super();             -- running my super constructor

            final double _height;

            // in this example I don't need super() at all since I'm not passing anything
            // also since Dart ALWAYS calls the default constructor for the super class
            // even if there are no arguments to pass. The reason that I or Dart always
            // need to make the super call is to ensure that all of the field values have
            // finished initializing
          }*/
}

/*Calling super from an overridden method. 
  
  Sometimes I might want to override methods of the parent class to ADD functionality
  instead of replacing it. Rather than again duplicating code I can make a call to 
  super either at the beginning or end of the overridden method*/
class SomeParent {
  void doSomeWork() {
    print('parent working');
  }
}

class SomeChild extends SomeParent {
  @override
  void doSomeWork() {
    print('child doing some other work');
    super
        .doSomeWork(); // NOTE: not just super() but super.doSomeWork() and it doesn't
    // have to be first, as I moved it now last in this method
  }
}

/*Multi-level Hierarchy

  I can also add more levels to my hierarchy, though I need to be careful not to create
  unneeded complexity. */

class SchoolBandMember extends Student {
  SchoolBandMember(super.givenName, super.surname);
  // NOTE: THIS ISN'T IN THE BOOK, BUT APPARENTLY RATHER THAN USING ':' SUPER(...)
  // I CAN JUST USE  SUPER.PARAMETER FOR SUPER PARAMETERS
  // either this way or how I did it in Student, super will call the Student constructor
  // which will then call the Person constructor through the chain
  static const minimumPracticeTime = 2;
}

// Sibling Classes
// Basically another class derived from Student, so it falls into the same level of
// SchoolBandMember (same parent makes them siblings)
class StudentAthlete extends Student {
  StudentAthlete(String givenName, String surname) : super(givenName, surname);
  bool get isEligible => grades.every((grade) => grade != Grade.F);
  // to remaiin eligible for athletics, a student athlete ha an isEligible getter
  // .every is a higher-order list method as I learned in chapter eight as it takes an
  // anony function as its arg to ensure  no element is Grade.F
}

/*Type Inference in a List of Mixed instances

  if all of our instances have the same parent, I can put them into a list
    List<Student> students
    
  Dart will also infer this as I can see in main. It will use the most specific
  common ancestor as the type for the list. So this means if I add a non-student
  Dart will infer a more general type
  
   */

/*Mini-exercises*/
class Fruit {
  String color = 'black';

  void describeColor() {
    print('My fruit is $color');
  }
}

class Melon extends Fruit {
  @override
  final color = 'green';
}

class Watermelon extends Melon {
  @override
  final color = 'red';

  @override
  void describeColor() {
    print('I am a watermelon and my color is $color');
  }
}

class Cantaloupe extends Melon {
  @override
  final color = 'yellow';
}

void main() {
  print('===Using the classes===');
  print('===And Overriding parent methods===');

  final kevin = Person('Kevin', 'Whiteside');
  final odalis = Student('Odalis', 'Whiteside');
  print(kevin.fullName);
  print(
    odalis.fullName,
  ); // remember that getter methods don't need () and even basic
  // properties are all just getter methods

  // only Student has grades
  final historyGrade = Grade.B;
  // kevin.grades.add(historyGrade); // ERROR: the getter 'grades' isn't defined ...
  odalis.grades.add(historyGrade); // this works since odalis is a student
  print(odalis.grades);

  print('');

  print('===Calling Super from an Overridden Method===');
  final child = SomeChild();
  child.doSomeWork();
  print('');

  print('===Multi-level hierarchy===');
  final kelen = SchoolBandMember('Kelen', 'Whiteside');
  print(kelen.fullName);
  print(
    SchoolBandMember.minimumPracticeTime,
  ); // since its static I call it off class not instance
  print('');

  print('===Sibling Classes as well===');
  final melany = SchoolBandMember('Melany', 'Made');
  final xavi = StudentAthlete('Xavier', 'Whitside');
  print(melany.fullName);
  print(xavi.fullName);
  print(xavi.isEligible);
  // print(melany.isEligible); // ERROR: the getter 'isEligible' isn't defined...
  melany.grades.add(Grade.C);
  melany.grades.add(Grade.B);
  melany.grades.add(Grade.A);
  xavi.grades.add(Grade.A);
  xavi.grades.add(Grade.F);
  xavi.grades.add(Grade.B);
  print(melany.grades);
  print(xavi.grades);
  print(xavi.isEligible);
  print('');

  print('===Type Inference in a Mixed List===');
  final students = [melany, xavi, odalis, kelen];
  print(students);
  print(students.runtimeType);
  final people = [...students, kevin];
  print(people);
  print(people.runtimeType); // List<Person> since a non-student is now included
  print('');

  print('NOTE: This is why a mixed list type is List<Object>🤓🤯:');
  print('as the common specific type is "Object"');
  var test = ['list', 'with', 23, 'different', 'types'];
  print(test);
  print(test.runtimeType);
  print('');

  print('===Checking an object type at runtime===');
  print(xavi is Object);
  print(xavi is Person);
  print(xavi is Student);
  print(xavi is SchoolBandMember);
  print(xavi is! SchoolBandMember); // NOTE: is! and not !is
  print(xavi is StudentAthlete);
  print('');

  print('===Mini-exercise 1===');
  /*1. Create a class named Fruit with a String field named color and a method
    named describeColro, which uses color to print a message. */
  final myFruit = Fruit();
  print(myFruit);
  myFruit.describeColor();
  print('');

  print('===Mini-exercise 2===');
  /*
  2. Create a subclass of Fruit named Melon and then create two melon subclasses
     named Watermelon and Cantaloupe
  */
  final myFruit2 = Melon();
  final myFruit3 = Watermelon();
  final myFruit4 = Cantaloupe();
  myFruit2.describeColor();
  myFruit3.describeColor();
  myFruit4.describeColor();
  print('');

  print('===Mini-exercise 3===');
  /*
  3.Override describeColor in Watermelon class to vary the output
  */
  myFruit2.describeColor();
  myFruit3.describeColor();
  myFruit4.describeColor();
  print('');

  print("===Can't instantiate abstract class===");
  print('===no output here===');
  // final animal = Animal(); // Error: Abstract classes can't be instantiated
  print('');

  print('===Concrete Subclasses===');
  final platypus = Platypus(25);
  print(platypus.isAlive);
  platypus.eat();
  platypus.move();
  platypus.layEggs();
  print(platypus);
  print('');
  /*
  NOTE: 
    ▪ A concrete subclass has access to the concrete data, like isAlive, from its
      abstract parent class
    ▪ Dart recognized that the runtime type was Platypus, even though runtimeType
      comes from Object, and was accessed in the toString method of Animal.
  */

  print('===Treating concrete classes as abstract===');
  /*
  One other interesting thing here is that Dart infers that this is of Platypus 
  type. This isn't a surprise, but what if I annotate it as the parent type.

  If I hover over platypus I get  Platypus platypus, but if I hover platypus2
  I get Animal Platypus. Dart now sees platypus2 as merely an Animal with none
  of the special stuff I added.
  Now note when I print both of them an their types. At compile time Dart treats 
  platypus2 like an Animal even though at runtime Dart knows its a Platypus. This is
  usefule  when I don't care about the concrete implementation of an abstract class
  but I do care that its an Animal with Animal characteristics.
  
  How do this help? Understanding Interfaces
  */

  Animal platypus2 = Platypus(15);
  platypus.layEggs();
  // platypus2.layEggs(); // Error not defined
  print(platypus);
  print(platypus.runtimeType);
  print(platypus2);
  print(platypus2.runtimeType);
  print('');

  print('===Interfaces===');
  print('===Using the interface===');
  // final repository = DataRepository(); // Error: remember that I can't instantiate from an
  // abstract class, so this doesn't work

  // I could use my implementation directly like so:
  final DataRepository repository = FakeWebServer();
  // remember using the abstract type Dart sees our FakeWebServer as such
  final temperature = repository.fetchTemperature('Berlin');
  print(temperature); // I get junk data, but it works!!
  // but this defeats the whole purpose of trying to keep the detail separate from the
  // business logic. If I try to swap out FakeWebServer for something real, I'd have
  // to go through and update everything. That means they are still too coupled
  print('');

  print('===Adding a Factory Constructor===');
  final repository2 =
      DataRepository(); // this works this time since its an unnamed
  // factory constructor
  final temperature2 = repository2.fetchTemperature('Manila');
  print(temperature2);
  print('');

  // now this code has no idea that the repository is actually FakeWebServer and
  // when it comes time to swap it out, all I need to do is update the subclass returned
  // by the factory constructor in the DataRepository interface.

  /*
    NOTE: In the code above, I used a factory to return the concrete implemenation
          of the interface. There are other options, though. Do a search for 'service
          locators', of which get_it package is a good example, and 'dependency injection'
          to learn more about that topic.
  */

  print('===Example of Extending===');
  final someClass = SomeClass();
  print(someClass.myField);
  someClass.myMethod();
  print('');

  print('===Example of Implementing===');
  final someClass2 = SomeClass2();
  print(someClass2.myField);
  someClass2.myMethod();
  print('');

  print('===Mini-exercise 1===');
  /*1. Create an interface call Bottle and add a method to it called open
  */
  print('...no output, interface Bottle created');
  print('');

  print('===Mini-exercise 2===');
  /*2. Create a concrete class calls SodaBottle t hat implements Bottle and prints
    "Fizz fizz" when open is called
  */
  print('...using concrete class implementation directly to show it works');
  final sodaBottle = SodaBottle();
  sodaBottle.open();
  print('');

  print('===Mini-exercise 3 and 4===');
  /*3. Add a factory constructor to Bottle that returns a SodaBottle instance
    4. Instantiate SodaBottle by using the Bottle factory constructor and call 'open'
       on the object
  */
  print(
    '...using the original interface, now with a factory constructor making it instantiable',
  );
  final sodaBottle2 = Bottle();
  sodaBottle.open();
  print('');

  print('===Mixins===');
  print('===Mixing in code===');
  final platypusMixed = Platypus2();
  final robinMixed = Robin2();
  platypusMixed.layEggs();
  robinMixed.layEggs();
  print('');

  print('===Mini-exercise 1===');
  /*1. Create a class called Calculator with a method called 'sum' that prints
    the sum of any two integers I give it */
  final calc = Calculator();
  calc.sum(70, 7);
  print('');

  print('===Mini-exercises 2 and 3===');
  /*2. Extract the logic in sum to a mixin called Adder
    3. Use the mixin in Calculator */
  final calc2 = Calculator2();
  calc2.sum(70, 7);
  print('');

  print('===Extension Methods===');
  print('===Solving the normal way===');
  final original = 'abc';
  final secret = encode(original);
  print(secret);
  print('');

  print('===Converting to an extension===');
  print('abc'.encoded); // 🤓🤯🤯🤯🤯🤯 DART IS AWESOME!!!
  print('');

  print('===Adding a decode extension===');
  print('bcd'.decoded); // Lots of duplication in this one though
  print('');

  print('===Refactored Extension===');
  final originalString = 'I like extensions!';
  final secretString = originalString.encoded2;
  final revealedString = secretString.decoded2;
  print(secretString);
  print(revealedString);
  print('');

  print('===Int Extension Example===');
  print(5.cubed); // 🤯🤯🤯
  print('');

  print('===Enum Extension Example===');
  final language = ProgrammingLanguage.dart;
  print(language.isStronglyTyped);
  print(ProgrammingLanguage.javaScript.isStronglyTyped);
  print(ProgrammingLanguage.swift.isStronglyTyped);
  print('');

  print('===Challenges 1: Heavy Monotremes===');
  /*Heavy Monotremes

    Dart has a class named Comparable, which is used by the sort method of List
    to sort its elements. I'll add a weigh  field to the Platypus class I made
    in this chapter. Then make Platypus implement Comparable so that when I
    have a list of Platypus objects, calling sort on the list will sort them by
    weight. This must have some connection with the error I get when I try to use
    let's say sort or something else, and I see the method is not defined. But there's
    something else I can't quite remember now. Maybe later Ok got it. I tried to do
    a for-in on a string, but again, the String doesn't have Iterable implemented
  */
  final testList = [
    Platypus(34),
    Platypus(5),
    Platypus(75),
    Platypus(53),
    Platypus(1),
  ];
  print(testList);
  print(testList.runtimeType);
  print('');
  testList.sort();
  print(testList);
  print('');

  print('===Challenge 2: Fake Notes===');
  /*Fake Notes
    Design an interface (repository) to sit between the business logic of my
    note-taking app and a SQL-Database. After than implement a fake database
    that will return some junk data
  */
  final noteRepo = NoteRepository();
  noteRepo.createNote('This is a note');
  print(noteRepo.readNote(66));
  noteRepo.updateNote(66, 'The replacer note');
  noteRepo.deleteNote(66);
  print('');

  // I have to admit the above challenge was a great exercise in thinking abstractly
  // about programming

  print('===Challenge 3: Time to Code===');
  /*Time to Code

    Dart has a Duration class for expressing lengths of time. Make an extension on int
    so that I can express a duration like the following:

      final timeRemaining = 3.minutes; 
  */

  print(3.minutes);
  print(3.seconds);
  print(3.hours);
  print(3.hours.inMinutes);
  print(3.hours.inSeconds); // 🤯🤯🤯🤯🤯🤯🤯🤯🤯🤯
  print('');

  print('===One More Thing===');
  final msg1 = 'Uif!tfdsfu!up!mfbsojoh!Ebsu!xfmm!jt!up!';
  final msg2 = 'dg"ewtkqwu"cpf"lwuv"vt{"vjkpiu0"';
  final msg3 = 'Vlqfh#|rx*uh#uhdglqj#wklv/#wkdw#reylrxvo|#ghvfulehv#|rx1#';
  final msg4 = 'Kssh\$nsf%';
  print(msg1.decoded2);
  print(msg2.decoded3);
  print(msg3.decoded4);
  print(msg4.decoded5);
}

/*NOTE: Prefer  composition over inheritance

  Having an object/instance be able to take multiple forms is known as polymorphism
  which is a key part of OOP and I'll see more of in a bit.
  
  Knowing and understanding inheritance means I can model anything as a hierarchy.
  But, experience teaches that deep hierarchies are not always the best. That 
  builds in complexity and unneeded complexity is bad.
  
  For example, knowing when and where to call super(), gets complex the deeper
  I go. Another problem is that they're tightly bound together. Changes in a 
  parent class can break a child class. Say I 'fix' Person by removing the
  givenName and replacing it with firstName and middleName. Now I need to 'fix'
  or refactor all the subclasses. Even if just adding middleName, other classes
  are impacted. 
  
  Tight coupling isn't the only problem with deep hierarchies. What if one of my
  school band members decides to become an Athlete. Do I now need another class of
  type SchoolBandMemberAndStudentAthelete? Things get complex very quickly.
  
  This is why many say its best to, prefer composition over inheritance. This means
  that, when appropriate, I should ADD behavior to a class rather than SHARE behavior
  with an ancestor 🤔🤔🤔.  It's more of a focus on what an object HAS, rather than
  what an object IS. For example, I could flatten the hierarchy for Student by 
  giving it a list of roles
  
    class Student{
      List<Role>? roles;   // I saw something like this in 'The Boring Flutter Show'
    } 
    
  Now when I create a student, I could pass in the roles as a constructor parameter
  This would allow me to add and remove roles later. Of course since Dart doesn't have
  a Role type, I'd need to define that myself, making it abstract (generic) enough
  that a role could be a band member, athlete, or a student union memeber, etc. 
  
  All this talk about composition isn't to say that Inheritance is bad. It might just
  make more sense for Student to extend Person in many cases. Inheritance can be good
  when a subclass needs ALL of the behavior of its parent. However, when I only need
  SOME of the behavior, I should consider passing in the behavior as a parameter,
  or perhaps using a MIXIN
  
    NOTE: The whole Flutter framework is organized and based around the idea of
    composition. I build my UI as a tree of widgets, where each widget does one
    simple thing and has ZERO or more child widgets that also do one simple thing.
    This type of architecture generally makes it easier to understand the purpose
    of a class*/

/*Abstract Classes:

  What I've created so far has been CONCRETE classes, basically meaning that they 
  make actual objects. In contrast to ABSTRACT classes, from which I can't make
  objects. But why would I want a class that doesn't make an object? 🤔 Well, I
  deal with abstract concepts all the time. For example, what's an animal look
  like, devoid of all features that are relevant to only one kind of animal, just
  the 'essence' of an animal? 

  No one has seen an 'animal' in an abstract sense, but everybody has seen
  concrete instances of things that fit the abstract animal category. Humans
  are good at generalizing and categorizing observations, and honestly, these
  abstract ideas are very useful. With them I can make statements like, "I saw
  a lot of animals at the zoo", rather than, "I saw a lion, an elephant, a lemur
  , a shark, ...etc"

  The same applies to OOP. After making lots of concrete classes, I begin to notice
  patterns and more generalized characteristics of the classes I'm writing. So when
  I come to the point of just wanting to describe the general characteristics and
  behavior of class without specifying the exact way that class is implemented, I'm
  ready to write abstract classes. 
*/

abstract class Animal {
  bool isAlive = true;
  void eat();
  void move();

  @override
  String toString() {
    return "I'm a $runtimeType";
  }

  /*
  Here are a few important points about this code:
    ▪ The way I define an abstract class in Dart is to put the 'abstract' keyword
      before 'class'
    ▪ In addition to the class itself being abstract, Animal also has two abstract
      methods: eat and move. I know they are abstract because they don't have braces
      or bodies, they just end in ';'
    ▪ These abstract methods DESCRIBE behavior that a subclass MUST implement but
      don't tell how to implement. That's up to the subclass. Leaving implementation
      details up to the subclass is a good thing because there are such a variety of
      ways to eat and move throughout the animal kingdom, so it would be almost 
      impossible for Animal to specify anthing meaningful here.
    ▪ Note that just because a class is abstract doesn't mean that it can't have 
      concrete methods or data. I can see that Animal has a concrete 'isAlive' field
      with a default value of true. Animal also has a concrete implementation of the
      toString method, which belongs to the Object superclass. The runtimeType
      property also comes from Object and gives the object type at runtime.
    ▪ i can't create an instance of an abstract class. I'll get an error as seen
      in the main function
  */
}

class Platypus extends Animal implements Comparable<Platypus> {
  // note the error right off the bat. 'Missing concrete implementations of 'abstract class
  // Animal.eat' and 'abstract class Animal.move'.
  // this means I must implement them or the compiler will complain.
  //

  // Adding weight field from challenge 1
  Platypus(this.weight);
  int weight;
  //I then use vscode to quickly add the missing method skeletons
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }

  // subclasses can of course have their own unique methods as well
  void layEggs() {
    print('Plop plop');
  }

  @override
  // This works, but i'm not sure why I had to put dynamic instead of
  // int compareTo(Platypus other)...Ok, I fixed it. I didn't take into consideration that
  // I need to implement Comparable<T>, so if I leave the <T> off then its dynamic
  // so I had to add 'implements Comparable<Platypus> in the sig and now I can use below
  int compareTo(Platypus other) {
    return weight < other.weight
        ? -1
        : weight == other.weight
        ? 0
        : 1;
  }

  @override
  String toString() {
    return 'p weight: $weight';
  }
}

/*Interfaces

  Similar to abstract classes there are Interfaces which allow me to define
  behavior I expect for all classes that implement the interface. They're are 
  means of hiding the implementation details of the concrete classes from the 
  rest of the code. Why is that important to me?

  Software Architecture
  When I'm building an App (in Flutter), my goal should be to keep core business
  logic separate from infrastructure like the UI, database, network and 3rd-party
  packages. the core business logic doesn't change frequently, while the infrastructure
  does. Mixing unstable code with stable would cause the stable code to become
  unstable.

    NOTE: Business logic, sometimes called busines rules or domain logic, refers to
          the essence of what my app does. The business logic of a calculator app
          would be the mathematical calculations themselves. Those calculations don't
          depend on what the UI looks like or how  I store the answers and it typically
          doesn't change. 

  An idealized app would have the stable business logic in the middle and the more 
  volatile infrastructure parts surrounding it. This means everything connects to the
  business logic in some way, but the UI shouldn't communicate directly with the web. 
  Direct calls to the database should scatter across the app from anywhere and everywhere.
  The business logic shouldn't know any implementation detals about the infrastructure

  This is what gives me the plug-in style architecture, where I can swap one database
  framework for another and the rest of the app won't even know anything changed. I could
  replace the mboile UI with a desktop UI, and the rest of the app wouldn't care (Flutter
  anyone). This is useful for building scalable, maintainable and testable apps. 

  Communication Rules
  This is where Interfaces come into the picture. An interface is a description of
  how communication will be managed between two parties. A phone number is a type of
  interface. If I want to call my friend, I have to dial my friend's interface or 
  phone number. Dialing a different number won't work. Another word for interface
  is protocol, as in Internet Protocol or Hypertext Transfer Protocol. Those protocols
  are the rules for how communication happens among the users of the protocol.

  When I create an interface in Dart, I must define the rules for how one part
  of the codebase wil communicate with another part. As long as both parts follow
  the interface rules, each part can change independently of the other. This makes
  my app much more manageable. In team setting, interfaces also allow different people
  to work on different parts of the codebase without worrying that they're going to mess
  up someone else's code.

  Separating Business Logic from Infrastructure
  The interface comes between the business logic and the code for accessing a piece
  of the volatile infrastructure. The business logic doesn't know anything about the
  infrastructure. Its just talking to the interface. That means I could even swap out
  that key piece of infrastructure for something new and improved or different (database
  in local storage to something like cloud storage, etc) and the business logic
  doesn't care.

  There's a famouse adage related to this that goes, code against interfaces, not 
  implementations. I define an interface, and then I code my app to use that interface
  only. While I must implement the interface with concrete classes, the rest of the app
  shouldn't know anything about those concrete classes, only the interface.
*/

/*Creating an Interface
  There is no 'interface' keyword in Dart. Instead, I use any class as an interface. 
  Since only the field and method names are important, most interfaces are made from
  abstract classes that contain no logic.

  So for a weather app example with my business logic needing to get the current
  temperature in some city. These these are the requirements, my Dart interface class
  would be like the following:
*/
abstract class DataRepository {
  // Repository is a common term to call an interface that
  // hides the details of how data is stored and retrieved. Its nullable cuz someone might
  // ask for the temperature in a city that doesn't exist

  factory DataRepository() => FakeWebServer();
  // since  FakeWebServer is a subclass, then my factory is allowed to return it. The neat
  // trick here that by using an unnamed constructor  for the factory, I can make it
  // look like its possible to to instantiate the class now
  double? fetchTemperature(String city);
}

// Implementing the interface
// The Dart class above was just a normal abstract class, like the one I made earlier.
// However, when creating a concrete class to implement the INTERFACE, I must use the
// implements keyword instead of the extends keyword.
class FakeWebServer implements DataRepository {
  @override
  double? fetchTemperature(String city) {
    return 42.0;
  }

  /*
  Couple of points to note:
    ▪ Besides the benefits mentioned previously, another great advantage of using an
      interface is that I can create mock implementations to temporarily replace real
      implementations. In the FakeWebServer class, I am simply returning a random number
      instead of going through all the work of contacting a real server. This allows me
      to have a 'working' app until I can get around to writing the code to contact 
      the web server. This is also useful when I'm testing my code and I don't want to
      wait for a real connection to the server.

    ▪ Speaking of waiting for a web server, a real interface would return a type of 
      Future<double?> instead return double? directly. However, I haven't read 
      chapter 10 about async programming just yet, though I have seen Futures in
      some other tutorials. 

  Let's test our interface in main above.
  */
}

// in chapter 6 I learned about factor constructors return subclasses.  Let's add that
// above in the interface class

/*Interfaces and the Dart SDK

  If I browse the Dart source code, I'll see that Dart makes heavy use of interfaces
  to define its API. That allows the Dart team to change the implementation details
  without affecting developers. The only time developers are affected is when the 
  interface changes. 

  The concept is key to the flexibility that Dart has as a language. The Dart VM
  implements the interface one way and gives me the ability to hot-reload my Flutter
  apps. The dart compile js tool implements the interface using JavaScript and gives
  me the ability to run my code on the web. The dart compile exe tool implements the
  interface on Windows or Linux or Mac and let's me run my code on those platforms. As 
  mentioned before, the business logic doesn't know about or care about those items 
  changing, as long as the interface is followed. 

  The implementation details are different for every platform, but I don't have to
  worry about that, cuz my code will only talk to the interface, not to the platform.
  Note the power of interfaces??? 🤯🤯🤯🤓

  Extending vs Implementing
  Remember that I implement abstract classes as interfaces and extend abstract classes
  as normal parent classes.

  There are a couple of differences between 'extends' and 'implements'. Dart only allows
  me to extend a singl superclass. This is known as SINGLE INHERITANCE, in contrast
  with other languages that allow multiple inheritance.

  So the following won't work in Dart:

    class MySubClass extends OneClass, AnotherClass{...}

  But I can IMPLEMENT more than one interface

    class MyClass implements OneClass, AnotherClass {} 

  This is ok. 

  I can also combine extends and implements together

    class MySubclass extends OneClass implements AnotherClass {...}

  What's the big difference from just changing that one word?
  When I extend AnotherClass, SomeClass has access to any logic or variables
  in AnotherClass. However, if SomeClass implements AnotherClass, SomeClass
  must provide its own version of all methods and variables in AnotherClass.
*/

// Example of extending
class AnotherClass {
  int myField = 42;
  void myMethod() => print(myField);
}

// extend with no issues
class SomeClass extends AnotherClass {}

// just replacing extends with implements doesn't work in the same way
// I must have concrete implementations of everything
class SomeClass2 implements AnotherClass {
  @override
  int myField = 0;

  @override
  void myMethod() => print('Hello');
}

/*Mini-exercises*/
abstract class Bottle {
  factory Bottle() => SodaBottle();
  void open();
}

class SodaBottle implements Bottle {
  @override
  void open() {
    print('Fizz fizz');
  }
}

/*Mixins
  So Mixins are interesting as a feature of Dart that I'm not super familiar with, though
  in one of the previous Dart tutorials (dart.dev I think) I did learn a bit about them.
  They are a way to reuse methods or variables amount otherwise unrelated classes 🤔
  
  But why do I need them?
  
  Problems with extending and implementing
  Thinking back to the Animal examples. Say I've got a bunch of birds, so I carefully plan
  an abstract class to rep them as below */
abstract class Bird {
  void fly();
  void layEggs();
}

// now when I try to extend
class Robin extends Bird {
  @override
  void fly() {
    print('Swoosh swoosh');
  }

  @override
  void layEggs() {
    print('Plop plop');
  }
}

// Looks good so far
/* Note that my layEggs method is exactly like the implementation for Platypus. So I'm
   duplicating code here. Any future changes to layEggs will need to be done in both
   of these concrete classes. so how do I get around that?

    ▪ Platypus can't EXTEND Bird or Robin, because I'll get all the methods and 
      platypi can't fly
    ▪ Birds probably shouldn't extend Playtpus, because at some point I'll need to
      add 'stingWithVenomSpur' to my Platypus, and again, birds can't do that
    ▪ I could create an EggLayer class and have Bird and Platypus extend that. But
      then what about flying? Make a Flyer class too? Dart only allows me to extend
      one class (single-inheritance), so that won't work either.
    ▪ I could have birds IMPLEMENT EggLayer and Flyer (multi-inheritance with inferfaces)
      while PlatyPus implements only EggLayer. But then I'm back to code duplication, 
      since implementing requires me to supply the implementation code for every class.
  
  This is where  Mixins come into play
  To make a Mixin, I take whatever concrete code I want to share with different classes,
  and package it in its own special mixin class
 */
mixin EggLayer {
  void layEggs() {
    print('Plop plop');
  }
}

mixin Flyer {
  void fly() {
    print('Swoosh swoosh');
  }
}

/*The mixin keyword indicates that these classes can ONLY be used as mixins. I can
  use any class as a mixin, though, so if I wanted to use EggLayer as a normal class,
  then I just replace mixin with class or abstract class. In fact, the mixin keyword
  is fairly new in Dart, so I will still see regular classes as mixins in the wild, 
  though those classes aren't needed as standalone classes. 

  To use mixins, I use the 'with' keyword along with 'extends' ... Now I have...
 */
class Robin2 extends Bird with EggLayer, Flyer {}

// mixin classes are separated with ',' and since those mixins have all the methods
// I need for Robin2 I just use an empty {}
class Platypus2 extends Animal with EggLayer {
  @override
  void eat() {
    print('Munch munch');
  }

  @override
  void move() {
    print('Glide glide');
  }
}

// The layEggs logic is now in the mixin. Now both Robin2 and Platypus2 share the code
// that the EggLayer mixin contains. Testing above in main.

/*Mini-exercises */
class Calculator {
  void sum(num1, num2) {
    print('The sum is: ${num1 + num2}');
  }
}

mixin Adder {
  void sum(num1, num2) {
    print('The sum is ${num1 + num2}');
  }
}

class Calculator2 with Adder {}

/*Extension Methods

  Up to this point I've been writing my own classes and methods. Often though, I'll
  use other people's classes when I'm programming. Those classes may be part of a 
  core Dart lib, or they may be from packages that I got off pub.dev. In either case,
  I don't have the ability to modify them at will 
  
  However, Dart has a feature called EXTENSION METHODS that allow me to add functionality
  to exisiting classes 🤔🤓. Even though they're called extension methods, I can also
  add other members like getters, setters, or even operators. Though technically all of 
  those things are also methods in Dart, I believe 🤔 so that would make sense
  
  Extension syntax
  To make an extension, I use the following syntax:
  
    extension on SomeClass{
      // my custom code  
    }

  This should be located at the top-level in a file; that is, not inside another class or
  function. Replace SomeClass with whatever class I want to add functionality to.
  I can also give the extension a name:

    extension MyExtensionName on ClassName{
      // my custom code
    }

  I can use any name I want to. The name is only used to show or hide the extension
  when importing it in another lib.

  String Extension Example
  For this example I'm going to make an extension that will convert a string into
  a secret coded message. Then I'll add anotehr extension method to decode it. In
  this code, each letter will be bumped up to the next one. So a will be b and b 
  will be c, etc. To accomplish this I'll increase the Unicode value of each code
  point in the input string by 1. If the original message were 'abc', the coded
  message would be 'bcd';

  Solving in the normal way
  First I'll do this with a normal function:  
  */
String encode(String input) {
  final output = StringBuffer();
  for (final codePoint in input.runes) {
    output.writeCharCode(codePoint + 1);
  }
  return output.toString();
}

/*I use a string buffer for efficient string manipulation. A normal String is
  immutable, but a StringBuffer is mutable. That means my function doesn't have
  to create a new string every time I append a char. I loop through each Unicode
  code point and increment it by 1 before writing it to output (my StreamBuffer).
  Finally I convert the StringBuffer back to a regular String with toString() and
  return it. Tested above in main */

/*Converting to an extension

  What I want is to be able to use this as a method on a string as in

    final secret = 'abc'.encoded;

  Since this extension won't mutate the original itself, the naming convention of
  using an adjective rather than a commanding verb. That's why I use 'encoded' 
  rather than 'encode' for the extension name. 

  So following the syntax I learned above I can move my function into an extension
  method
 */
extension on String {
  String get encoded {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + 1);
    }
    return output.toString();
  }

  /*NOTES:
    ▪ The keywords 'extension on' are what makes this an extension. I can add 
      whatever I want inside the body. It's as if String were my own class now. 
      🤔🤓🤯 Very ruby-like.

    ▪ Rather than making a normal method, I can use a getter method. This makes it
      so that I can call the extension using '.encoded', without the ()s, rather than
      '.encoded()'. I've looked for this feature in other languages at times 🤯🤯

    ▪ Since I'm inside String already, there's no need to pass 'input' as an argument.
      If I need a reference to the string object, I can use the 'this' keyword. Thus,
      instead of 'input.runes', as I would expect, I could write 'this.runes'. But
      'this' is unnecessary and I can directly access runes. Remember that 'runes'
      is a member of String already and I'm INSIDE String. 🤯🤓 

    Tested above in main
   */
  // Adding a decode extension - first try - NOTE I'm still inside the original
  // extension, so I can add various methods in one extension
  String get decoded {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint - 1);
    }
    return output.toString();
  }

  // There's a lot of code duplication above. Whenever I see this I should automatically
  // think of how to make it DRY. Rather than refactor, I'll create a new version so I
  // can compare the differences
}

extension on String {
  String get encoded2 {
    return _code(1);
  }
  /*Defining in multiple extensions. As a test I created the new extension with the same
    method names and as I thought Dart gives me an Error:
      The property 'decoded' is defined in multiple extensions for 'String' and neither
      is more specific. Try using an explicit extension application of the wanted extension or
      hiding unwanted extension from scope.
  */

  String get decoded2 {
    return _code(-1);
  }

  String get decoded3 {
    return _code(-2);
  }

  String get decoded4 {
    return _code(-3);
  }

  String get decoded5 {
    return _code(-4);
  }

  String _code(int step) {
    final output = StringBuffer();
    for (final codePoint in runes) {
      output.writeCharCode(codePoint + step);
    }
    return output.toString();
  }

  // NOTE the private _code method factors out all the duplicated partes of
  // encoded2 and decoded2. Tested above in main
}

// int extension example:
// NOTE the use of 'this' to get  a reference to the int object
extension on int {
  int get cubed {
    return this * this * this;
  }
}

/*Enum Extension Example

  Dart enums, which I learned in chapter 4, are a pretty basic feature in themselves.
  However, with the power of extension, I can do so so much more with them
    ▪ First define an enum
    ▪ Normally I wouldn't be able to perform internal logic on enum values, but now
      I can by adding the following extension on ProgrammingLanguage.
      NOTE: I'm not adding to any original object like String or int. This is an instance
      of an object I created
    ▪ 

*/
enum ProgrammingLanguage { dart, swift, javaScript }

extension on ProgrammingLanguage {
  bool get isStronglyTyped {
    switch (this) {
      case ProgrammingLanguage.dart:
      case ProgrammingLanguage.swift:
        return true;
      case ProgrammingLanguage.javaScript:
        return false;
      default:
        throw Exception('Unknown Programming Language $this');
    }
  }
}
/*As seen, I can do a lot with extensions. Although they can be powerful, extensions
  by definition add non-standard behavior, and this can make it harder for other devs
  to understand my code. I must use extensions when they make sense, but try not to
  overuse them.
*/

// Challenge 2: Fake Notes
abstract class NoteRepository {
  factory NoteRepository() => FakeDatabase();

  void createNote(String note);
  String readNote(int id);
  void updateNote(int id, String note);
  void deleteNote(int id);
}

class FakeDatabase implements NoteRepository {
  @override
  void createNote(String note) {
    print('The note created was: $note');
  }

  @override
  void deleteNote(int id) {
    print('Note: $id has been deleted.');
  }

  @override
  String readNote(int id) {
    print('...Reading note...');
    return 'Note $id: This is the note read';
  }

  @override
  void updateNote(int id, String note) {
    print('Note with ID: $id was replaced with the following: $note');
  }
}

// Challenge 3: Time to Code
extension on int {
  Duration get hours => Duration(hours: this);
  Duration get minutes => Duration(minutes: this);
  Duration get seconds => Duration(seconds: this);
}
// EXTENSION METHODS ARE THE MOST AWESOME THING SO FAR

/*Key Points:

  ▪ A subclass has access to the data and methods of its parent class

  ▪ I can create a subclass of another class by using the 'extends' keyword

  ▪ A subclass can override its parent's methods or properties to provide
    custom behavior

  ▪ Dart only allows single inheritance on its classes

  ▪ Abstract classes define class members and may or may not contain concrete
    logic

  ▪ Abstract classes can't be instantiated (A factory constructor can make it look
    like they can)

  ▪ One rule of clean architecture is to separate business logic from infrastructure
    logic like the UI, storage, third-party packages and the network

  ▪ Interfaces define a protocol for code communication (abstract classes which are 
    implemented instead of extended)

  ▪ Use the 'implements' keyword to create an interface. Technically I create the
    interface when I create the abstract class. But I USE it as an interface by
    using 'implements' instead of 'extends'

  ▪ Mixins allow me to share code between classes even if they are unrelated

  ▪ Extension methods allow me to give additional functionality to classes that aren't
    my own. THIS ONE IS GREAT
*/

/*Important Note:

  Once I learn how to use a hammer everything will look like a nail. Now that I know
  about abstract classes and interfaces, I might be tempted to use them everywhere and
  all the time. I shouldn't over-engineer my apps, though. Start simple, and add 
  abstraction as I need it.

  Throughout this book, I've gotten a few ideas for writing clean code. However, the
  principles of building clean architecture take clean coding to a whole new level. I
  won't master the skill all at once, but reading books and articles and watching
  videos on the will help me grow as a software engineer.
*/
