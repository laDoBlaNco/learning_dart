// ignore_for_file: unnecessary_getters_setters

/*Checking for errors
  Initializer Lists are a great place to check for errors in the constructor
  parameters, metiendo assert statements. I can think of asserts like sanity checks
  that make sure I'm not doing anything silly, by checking that a condition is in
  fact true.
  
  An assert takes a condition, and if the condition is false, terminates the app. This
  only happens during debugging, though. The compiler completely ignores assert
  statements in release builds 🤓🤓🤓 
  
  Asserts added to the top of the initializer list above. So before a user is
  ever created, the app will crash. Example in main function.
  
  I thought it didn't work but then I saw this Note below
  NOTE: If I'm running Dart from the command line (as I do in VSCode, and not from
  VS Code debugger, then I won't get the assert errors unless I enable them with
  dart --enable-asserts file_name.dart*/

// ignore_for_file: unnecessary_this

class User7 {
  // User7({this._id = 0, this._name = 'anonymous'});
  // Named parameters can't start with _, so replacing it with:
  User7({int id = 0, String name = 'anonymous'})
    : assert(id >= 0),
      assert(name.isNotEmpty),
      _id = id,
      _name = name {
    print('User name is $_name');
  }

  User7.anonymous() : this();
  int _id;
  String _name;
  String toJson() {
    return '{"id":${this._id},"name":"${this._name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this._id}, name: ${this._name})';
  }
}

/*Constant Constructors:
  So with _ I can keep people from modifying the properties of my class, but I can
  also make the properites immutable. By using immutable properties, I don't even 
  need to worry about them being private
  
  Making properties immutable
  Two ways to make a variable immutable in Dart: final and const, but since
  properties are only known at runtime, for classes the only way is with 'final'
  
  All I need to do is add final before the property declarations 
  
  What about making the class immutable? If all the properties are final and will
  never change, then we can add const to the constructors name which will ensure that 
  all instances of the class will be constants at compile-time and I can 
  declare the objects as consts in the main function*/

class User8 {
  // User8({this._id = 0, this._name = 'anonymous'});
  // Named parameters can't start with _, so replacing it with:
  const User8({int id = 0, String name = 'anonymous'})
    : assert(id >= 0),
      // assert(name.isNotEmpty),// this is a compile-time check, so doesn't work with
      // const constructor
      _id = id,
      _name = name;

  const User8.anonymous() : this();

  final int
  _id; // immutable properties now, but keeping the 'int' and 'String' so as
  final String _name; // not to fall back to dynamic
  String toJson() {
    return '{"id":${this._id},"name":"${this._name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this._id}, name: ${this._name})';
  }
}

/*What are the benefits of using const?
In addition to being immutable, another benefit of const variables is that they're
CANONICAL INSTANCES, which means that no matter how many instances I create, as long
as they properties used to create them are the same, Dart will only see a single 
instance 🤔🤔🤯🤯 (I've heard of that before but called something else. (Singleton) I think it
was in Lua and Defold or Godot). This means I can instantiate User.anonymous() 
a thousand times across my app without incurring the performance it of having
a thousand different objects.

NOTE: Flutter uses this pattern frequently with its const widget classes in the 
user interface of my app .Since Flutter knows that the const widgets are immutable
it doesn't have to wast time recalculating and drawing the layout when it finds
these widgets

IT SHOULD BE A GOAL TO USE CONST OBJECTS AND CONSTRUCTORS AS MUCH AS POSSIBLE. ITS
A PERFORMANCE WIN!!*/

/*Factory Constructors (I've seen these before as well)
Apart from generativce constructors, Dart has Factory constructors 🤔🤔🤔
A factory constructor provides more flexibility in how I can create my
objects. A generative constructor can only create a new instance of the
class itself, while a factory constructor can return EXISTING instances
of the class, or even subclasses of it. 🤔🤔🤔🤔🤔 What does that mean???
Ok, I think I know what this means. Since it returns an already created (existing)
instance rather than adding all the information while you are declaring it, but 
I still don't get it. GOT IT. 
This is useful if I waant to hide the implementation details of a class
from the code  that uses it.

Its basically a special method that starts with the 'factory' keyword and 
returns an object of the class Type. So it uses a generative constructor to
create and return a new instance. I still don't see what the fuss is about, 
so lets dig in some more. Got it now. The thing to pay attention to here is
that the factory constructor body allows me to perform some extra work
before return the new object, without exposing the inner wiring of that
instantiation process to whoever is using the class. For example, I could 
do the below, again, with a named constructor, but outside of some asserts
in an initialization list, there's not much else that can be done. with a 
factory I can do all kinds extra stuff, even modification of the args if
needed before creating the object.
 */
class User9 {
  const User9({int id = 0, String name = 'anonymous'})
    : assert(id >= 0),
      _id = id,
      _name = name;
  const User9.anonymous() : this();

  final int _id;
  final String _name;

  // I could do this with a named/default constructor, so what's the big deal?
  factory User9.ladoblanco() {
    return User9(id: 6666, name: 'Ladoblanco');
  }

  // a more common example for a factory constructor is to make a .fromJson method
  // I've seen the .from... methods before, so let's see if this makes sense 🙄
  // 👌🏾🫡 I think I get it. Certain instance are more complex than simply adding
  // in the parameters. If I don't want users to see or do all of that, I can create
  // a factory constructor to do it for them, and just return the instance already
  // made (existing). Example in main function
  factory User9.fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User9(id: userId, name: userName);
  }

  String toJson() {
    return '{"id":${this._id},"name":"${this._name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this._id}, name: ${this._name})';
  }
}

/*NOTE: Using a factory constructor over a named constructor can also help
  to prevent breaking changes for subclasses of my class. that topic is a little
  beyond the scope of this chapter, but I'll get there in a bit */

/*Constructor Summary
  Since there are so many ways that constructors can vary, here a brief 
  comparison. Constructors can be:
    ▪ Forwarding or non-forwarding
    ▪ Named or unnamed
    ▪ Generative or factory
    ▪ Constant or not constant
    
    For example, here's a non-forwarding, unnamed, generative const constructor:
      const User(this.id, this.name); */

/*Mini-exercises
  Given the following class:
    class Password{
      String value = '';
    } 
    1. Make value a final variable, but not private
    2. Add a const constructor as the only way to initialize a Password
       object*/
class Password2 {
  const Password2(this.value);
  // I could also make this.value a 'required' parameter, but this seems to work as well
  final String value;
}

/*Dart Objects
Objects in Dart act as references to the instances of the class in memory. So if I assign
oen object to another, the other object simply holds a ref to the same object in memory
-- its not a new instance.  */
class MyClass {
  var myProperty = 1;
}
/*NOTE: if I want to make an actual copy of the class -- not just a copy of its ref in
  memory but a whole new object with a deep copy of all the data it contains --  then
  I'll need to implement that mechanism myself by creating a method in my class that 
  builds up a whole new object 🤔. We'll talk more about this later in Chapter 8*/

/*Getters
  Right now our  User class fields are private. So no way to access id or name 
  outside of the class. I can solve this by adding a getter, which is  a special
  method using the 'get' keyword before the property anme and returns a value.
  See below my User10 version*/

class User10 {
  const User10({int id = 0, String name = 'anonymous'})
    : assert(id >= 0),
      _id = id,
      _name = name;
  const User10.anonymous() : this();

  final int _id;
  final String _name;

  // the getters for my private properties. Looks kinda like an arrow syntax function
  // which is actually a use for the arrow syntax. But I can also use {}s if I want to
  // use more than one line of code or calculate a return value, etc
  // I can even use getters without a dedicated value, o sea, are calculated when called
  int get id => _id;
  String get name => _name;
  bool get isBigId => _id > 1000;

  // I could do this with a named/default constructor, so what's the big deal?
  factory User10.ladoblanco() {
    return User10(id: 6666, name: 'Ladoblanco');
  }

  factory User10.fromJson(Map<String, Object> json) {
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User10(id: userId, name: userName);
  }

  String toJson() {
    return '{"id":${this._id},"name":"${this._name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this._id}, name: ${this._name})';
  }
}

/*Setters
  If I need some mutable data in the class I can use the special 'set' method to
  go along with the 'get' method.  
  The last line is the setter, which starts with the 'set' keyword. The name 'value'
  is the same name that's used by the getter above it. The set method takes a parameter
  which I can use to set some value. As a special set method, even though it has ()s
  I don't use it like other methods 'value('somevalue') but rather value = 'someValue'*/

class Email {
  var _address = '';

  String get value => _address;
  set value(String address) => _address = address;
}

/*Refactoring - interestingly if its mutable, then we don't need to use _ or private
  properties, and if we use public properties, Dart creates the needed getters and setters
  and we end up just shadowing the internal fields, which is easier*/
class Email2 {
  var value = '';
}
// if you only want a getter and not a setter, than just make the property final. After
// its initially set, it won't change, o sea, can't be set

/*Refactoring User
Now we are only User11 with a full refactor using the principles we learned
from the getter/setter section

  ▪ Since the getters were only shadowing internal private fields, its cleaner
    to just remove the fields and use 'final'. If I need to use hidden/private
    fields again later, I can do so without affecting how the class is used
    from the outside.
  ▪ Since I'm removing the private fields, setting them in the initializer list is
    no longer necessary.
  ▪ Because the properties are now public vars, I can use this.id and this.name to
    initialize them in the short-form constructor style as they were before
  
  "Why all the runaround? If I coulda done this to begin with?" The I wouldn't have
  learned nothin' */
class User11 {
  const User11({this.id = 0, this.name = 'anonymous'}) : assert(id >= 0);
  const User11.anonymous() : this();

  final String name;
  final int id;

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  @override
  String toString() {
    return 'User(id:$id,name:$name)';
  }
}

/*State Members:
  Just one last thing to cover formy well-rounded foundation on Dart classes - Static
  Putting 'static' in front of a member variable or method, causes it to belong to
  the CLASS rather than the INSTANCE/OBJECT */

class SomeClass {
  static int myProperty = 0;
  static void myMethod() {
    print('Hello, Dart!');
  }
}

/*Common cases for static:class

  static variables often used for constants and in singletone pattern (which I'll 
  see later)
  
  NOTE: Variables are given differnt names accoring to where they belong or where 
  they are located. Since static variables belong to the class itself, they're 
  called CLASS VARIABLES. Non-static member variables are calls INSTANCE VARIABLES
  because they only have a value after an object is instantiated. Variables within
  a method are called LOCAL VARIABLES, and top-level variables outside of a class
  (or the main function) are called GLOBAL VARIABLES
  
  Constants:
  I can create constants by combining static and const as in:
    static const myConstant = '42'; 
  
  Doing so in our User class will improve readability for the default user ID and name.
  Now in the unamed constructor, the defaults are more clear on what they are, especially
  _anonymousID instead of just 0 */
class User12 {
  const User12({this.id = _anonymousID, this.name = _anonymousName})
    : assert(id >= 0);
  const User12.anonymous() : this();

  final String name;
  final int id;
  static const _anonymousID = 0;
  static const _anonymousName = 'anonymous';

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  @override
  String toString() {
    return 'User(id:$id,name:$name)';
  }
}

/*Singleton Pattern - (this one I'll be typing a lot as I'm not 100% clear on what this 
  is)
  A second use of static variables is to create a SINGLETON class. Singletons are a 
  common design pattern where there is only ever one instance of an object. I think I 
  first started to understand this in Lua with some game code I was working with. While
  some people debate their benefits, they do make certain tasks more convenient.
  
  Its easy to reate a singleton in Dart. I wouldn't want User to be a singleton obviously,
  since I'll likely one to have lots of distinct users, requiring lots of distinct 
  instances of User. However, I might want to create a singleton class as a database
  helper so that I can ensure that I don't open multiple connections to the database.
  
  Here's what that would look like: */
class MySingleton {
  MySingleton._();
  static final MySingleton instance = MySingleton._();
}

/*Strange looking right? 🤔. The MySingleton._() part is a private named constructor.
  Some people like to call it ._internal() to emphasize that it can't be called from
  outside. The underscore makes it impossible to instantiate the class normally. Since
  you can't access it from outside the file.
  However, the static property, which is only intialized once, since its 'final',providing
  a reference to the instantiated object. 

    NOTE: Static fields and top-level variables, that is, global variables outside of
          the class, are lazily initialized. That means Dart doesn't actually calculate
          and assign their values until I use them the first time.

  So it looks like there is no way to create an instance, but since its lazily 
  created, it won't just be sitting out there until I actually use the static
  .instance property which will have our singleton instance. As seen below, I 
  can also implement with a factory constructor since factory constructors don't 
  have to return a new instance.ButI'll need to make .instance private so that 
  I'm only allowing access through the factory */

class MySingleton2 {
  MySingleton2._();
  static final MySingleton2 _instance = MySingleton2._();
  factory MySingleton2() => _instance; // unamed factory constructor
}

// The advantage here is that when you use it you can hide the fact that its a
// singleton
//    final mySingleton = MySingleton.instance;
// vs
//    final mySingleton2 = MySingleton2();
// From outside it looks like a normal object giving me the freedom to change it back
// into a generatige constructor later without affecting or breaking any code

/*Static Methods:
  Now lets look at static methods. There are few interesting things about static methods.
  
  Utility methods
  One use for a static method is to create a utility or helper method that's associated
  with the class, but not associated with any particular instance. In other languages,
  some developers like to group related static utility methods in classes to keep them
  organized. Like the famouse Math library in JS or math in lua. However, Dart is 
  usually better at just putting these utility methods in their own file as top-level
  functions. I can then import that file as a library wherever I need those methods. I
  can see where this might lead to some name collisions if I'm understanding the concept,
  but I'll see.
  
  Creating New Objects
  I can also use static methods to create new instances of a class based on some input
  passed in. For example, I could use a static method to achieve precisely the same 
  result as I did earlier with the fromJson factory constructor: */

class User13 {
  const User13({this.id = _anonymousID, this.name = _anonymousName})
    : assert(id >= 0);
  const User13.anonymous() : this();

  final String name;
  final int id;
  static const _anonymousID = 0;
  static const _anonymousName = 'anonymous';

  static User13 fromJson(Map<String, Object> json) {
    // note its a normal method with return type 'User' with a method name and an param type
    // of Map<String,Object> and then static makes it owned by the class
    // This is different from the factory as that's a named constructor -
    // 'factory User13.fromJson(...){...}
    final userId = json['id'] as int;
    final userName = json['name'] as String;
    return User13(id: userId, name: userName);
  }

  String toJson() {
    return '{"id":$id,"name":"$name"}';
  }

  @override
  String toString() {
    return 'User(id:$id,name:$name)';
  }
}
// There are often multiple ways of accomoplishing the same thing
/*Comparing static methods and factory constructors:
  I was thinking this very question, so good to see we are on the same though plane
  
  Factory constructors in many ways are just like static methods, but there are a 
  fiew differences:
  
    ▪ A factory constructor can only return an instance of the class type or subtype,
      while a static method can return anything I want. For example, a static method
      can be asychronous and return a Future, which I'll learn about in Chapter 10, 
      but a factory constructor can't do that.
    ▪ A factory constructor can be unnamed so that, from the caller's perspective,
      it looks exactly like calling a generative constructor (I didn't know that 🤔).
      The singleton example above is an example of this. A static method, on the
      other hand, must have a name
    ▪ A factory constructor can be 'const' if it's a forwarding constructor, but
      a static method can't */

/*Challenges

  Challenge 1: Bert and Ernie
  Create a Student class with final firstName and lastName String properties
  and a variable grad as an int property. Add a constructor to the class that
  initializes all the properties. Add a method to the class that nicely formats
  a Student for printing. use the class to create students Bert and Ernie with 
  grades 95 and 85, respectively.

  Challenge2: Spheres
  Create a sphere class with a const constructor that takes a positive length radius
  as a named parameter. Add getters for the volume and surface area but non for the 
  radius. Dont' use the dart:math package but store my own version of pi as a 
  static constant. Use my class to find the volume of and surface area of a sphere
  with a radius of 12.
*/

class Student {
  Student(this.firstName, this.lastName, this.grade);
  final String firstName;
  final String lastName;
  int grade;

  @override
  String toString() {
    return '''
First Name: ${this.firstName}
 Last Name: ${this.lastName}
     Grade: ${this.grade}
''';
  }
}

class Sphere {
  const Sphere({required this.radius}) : assert(radius > 0);
  final double radius;

  double get volume => (4/3)*Sphere.pi*(this.radius*this.radius*this.radius);
  double get surfaceArea => 4*Sphere.pi*(this.radius*this.radius);
  static const pi = 3.14159;
}
