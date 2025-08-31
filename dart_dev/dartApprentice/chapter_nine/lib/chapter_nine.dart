// ignore_for_file: use_super_parameters, unnecessary_type_check, overridden_fields

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
  final platypus = Platypus();
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

class Platypus extends Animal {
  // note the error right off the bat. 'Missing concrete implementations of 'abstract class
  // Animal.eat' and 'abstract class Animal.move'.
  // this means I must implement them or the compiler will complain.
  //
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
}
