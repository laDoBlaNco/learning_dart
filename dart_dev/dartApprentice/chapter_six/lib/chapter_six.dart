// ignore_for_file: prefer_initializing_formals, unnecessary_this

/* Dart Classes:

  Classes are like architectural blueprints that tell the system how to
  make an object, where an object is the actual data that's stored in
  the computer's memory. If a class is the blueprint, then I could say
  the object is like the house that the blueprint represents. For 
  example, the String class describes its data as a collection of UTF-16
  units, but a String object is something concrete like 'Hello, Dart!'

  All values in Dart are objects that are build from a class. This includes
  the values of basic types like int, double and bool. This is different
  from other languages like Java, where basic types are 'primitive'. For
  example, if I have x = 10 in Java, the value of x IS 10 itself. However
  Dart doesn't have primitive types. Even for a simple int, the value is
  an object that wraps the integer. 

  classes are used to combine data and functions inside a single structure.
  The functions exist to transform the data. Functions inside of a class
  are known as methods, while constructors are special methods used to
  create objects from the class.
*/

// classes go on the top level of the file, meaning either above or below
// the main function
import 'user.dart';

class User {
  int id = 0;
  String name = '';

  // Adding a JSON serialization method
  String toJson() {
    return '{"id":$id,"name":"$name"}';
    /*Notes:
        ▪ Since this is my own custom method and I'm not overriding a method
          that belongs to another class, I don't add the @override annotation
        ▪ In Dart naming conventions, acronyms are treated as words. Thuse, 
          toJson is better than toJSON
        ▪ There's nothing magic about serialization in this case. I simply used
          string interpolation to insert the property values in the correct
          locations in the JSON formatted string.
        ▪ In JSON, objects are  surrounded by {}s, properties are separated by
          ','s, property names are separated from property values by ':'s, and
          strings are surrounded by double-quotes. If a string needs to included
          a double-quote inside itself, I escape it with a \.
        ▪ JSON is very similar to Dart data type called Map. In fact, Dart
          even has a built-in function in the dart:convert library to serialize
          and deserialize JSON maps. And that's what most people use to serialize
          objects. However, I haven't gottent to chapter 8 about maps yet, so this
          is going to work for now. 
    */
  }

  // this changes how instances of User are printed '@override' the Object
  // class version of .toString()

  // NOTE: interestingly 🤔 the @override is optional, but it gives the
  // compiler more to work with if an error is made in our overriden method
  // If I comment out @override, everything works the same, but with @override
  // the compiler knows what I'm trying to do and will scream if something is off
  @override
  String toString() {
    return 'User(id: $id, name: $name)';
  }

  // NOTE: Most programmers put the toString method at or near the bottom of the
  // class rather than burying it in the middle somewhere. As I continue to add to
  // User, I'll keep toString at the bottom. This makes navigating and reading the
  // code easier in the long run
}

// miniexercise 1
class Password {
  String value = '';

  // mini exercise 3
  bool isValid() {
    if (value.length < 8) return false;
    return true;
  }

  // mini exercise 2
  @override
  String toString() {
    return value;
  }
}

// Constructors
/*Constructords are methods that create, or construct, instances of a class
  That is to say, constructors build new objects. Constructors have the sane
  name as the class, and the implicit return type of teh constructor method is
  also the same type as the class it self
  
  Default Constructor
  Dart provides a default constructor that takes no parameters and just returns
  an instance of the class. Such as below: */
class Address {
  var value = '';
}

// same as doing this, and is optional for the default constructor:
class Address2 {
  Address2(); // the order of the constructor in the class doesn't matter but
  // the Dart convention is to put it before the property variables
  var value = '';
}

/*Custom constructors are for passing parameters to the constructor to modify
  how my class builds an object. Same as the default, the name is the same as
  the class name. This type of constructor is call a generative constructor
  because it directly generates an object of the same type*/

// this uses the 'long-form constructor'
class User2 {
  User2(int id, String name) {
    this.id = id;
    this.name = name;
    // The keyword 'this' allows me to disambiguate which variable I'm talking about
    // It means this object or this instance. So this.name refers to the OBJECT property
    // name, while just 'name' refers to the constructor parameter
  }

  int id = 0;
  String name = '';

  String toJson() {
    return '{"id":${this.id},"name":"${this.name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this.id}, name: ${this.name})';
  }
}

/*Dart also has a short-form constructor where I don't provide a function body, but
  instead list the properties i want to initialize, prefixed with 'this'. Arguments
  sent to the short form constructor  are automatically used to initialize the 
  corresponding object properties */
class User3 {
  User3(this.id, this.name);
  int id = 0;
  String name = '';

  /*Named Constructor
    Dart also has a second type of generative constructor called a 'named constructor
    which I create by adding an identifier on the class name
      ClassName.identifier()
    
    Why would I use this? Sometimes I have some common cases that i want to provide
    a convenience constructor for, or maybe I have some special edge cases for
    constructing certain classes that need a slightly different approach. For example
    an anonymous user with a preset ID and name. This can be added in addition to the
    custom constructor? 🤔 YES YES IT CAN. When using the constructor you add the
    .name to tell the class to use your special constructor */
  User3.anonymous() {
    // the identifier is .anonymous y ya que no tiene parameters, there's
    // no need for this.id or this.name
    id = 0;
    name = 'anonymous';
    /*NOTE: Without these default values Dart would have complained that these vars
      weren't initialized, even though User.anonymous does in fact initialize  them
      int he constructor bady. I could get around that using the 'late' keyword
      but I'm not learning about that till next chapter. */
  }

  String toJson() {
    return '{"id":${this.id},"name":"${this.name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this.id}, name: ${this.name})';
  }
}

/*Forwarding Constructors:
  In the named constructor I set the class properties direclty in the constructor
  body, but this goes again DRY as I'm repeating code in every constructor. One 
  way to solve this is by calling the main constructor from the named constructor.
  This is called forwarding or redirecting and to do this I use the keyword 'this'
  again */
class User4 {
  // short form constructor
  User4(this.id, this.name);
  int id;
  String name;

  // named constructor with forwarding or redirecting
  User4.anonymous() : this(0, 'anonymous');
  /*This time there's no constructor body, but instead, I follow the name with a ':'
    and then forward (just like with superclasses, which I haven't seen yet 😏). The
    forwarding syntax simply replaces:
      User.anonymous() : User(0,'anonymous');
    with:
      User.anonymous() : this(0,'ononymous'); 
    
    Also now that I've moved property initialization from the constructor body to
    the parameter list, Dart is finally convinced that id and name are guaranteed
    to be initialized.  */

  String toJson() {
    return '{"id":${this.id},"name":"${this.name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this.id}, name: ${this.name})';
  }
}

// Adding named parameters for User
// Everything I learned previously about function parameters (optional and named)
// still hold true for classes and constructor methods so:
// [] for optional - MyClass([this.myProperty]);
// {} for optional/default - MyClass({this.myProperty});
// {required} for default/required - MyClass({required this.myProperty});
// This helps with readability in constructors and classes
class User5 {
  // unamed constructor with optional/default parameters
  User5({this.id = 0, this.name = 'anonymous'});

  // named constructor  using forwarding to main constructor and since we have
  // the same default values we don't need to put anything in the forwarded call
  User5.anonymous() : this();

  int id;
  String name;

  String toJson() {
    return '{"id":${this.id},"name":"${this.name}"}';
  }

  @override
  String toString() {
    return 'User(id: ${this.id}, name: ${this.name})';
  }
}

// Initializer lists
// Private Variables
class User6 {
  // User6({this._id = 0, this._name = 'anonymous'});
  // Named parameters can't start with _, so replacing it with:
  User6({int id = 0, String name = 'anonymous'}) : _id = id, _name = name {
    print('User namee is $_name');
  }
  // The comma separated list after the ':' is call the initializer list. Externally
  // the parameters have one name, but internally I'm using private variable names
  // The initializer list is always executed before the body of the constructor. So
  // even though I didn't need one above, I added one and The constructor will initialize
  // _id and _name before runs the print statement
  User6.anonymous() : this();
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

void main() {
  // Creating an object from a class:
  // The value I create from a class is an object. another name for an object
  // is an instance, so creating an object is sometimes called instantiating
  // a class
  final user = User(); // User() is the constructor
  // before dart 2.0 it was obligatory to use 'new', so 'final user = new User(); still
  // works

  // Assigning values to properties:
  // dot notation
  user.name = 'Kevin';
  user.id = 3824;

  print('===Printing an Object===');
  print(user);
  print('');
  print('===Printing a JSON serialized object===');
  print(user.toJson());
  print('');
  print('===Cascading Notation===');
  // very interesting - Dart offers a cascade operator (..) that allows me to
  // chain together multple assignments on the same object (not to be confused
  // with the other chaining I've seen with the dot operator on multiple lines).
  // Note tha the ':' is only only the last line.
  final userB = User()
    ..name = 'Ladoblanco'
    ..id = 48;
  print(userB);
  print(userB.toJson());
  print('');

  print('===Mini-Exercises===');
  print('---nothing to output---');
  print('');
  /*Create a class called Password and give it a string property
    called 'value' */

  /*Override the toString method of Password so tahtit prings value */

  /*Add a method to Password call isValid that returns true only if the
    length of value is greater than 8 */
  print('===Long-form Constructors===');
  final user2 = User2(6677, 'Odalis');
  print(user2);
  print(user2.toJson());
  print('');

  print('===Short-form Constructors===');
  final user3 = User3(6677, 'Odalis');
  print(user3);
  print(user3.toJson());
  print('');

  print('===Named Constructors===');
  final anonymousUser = User3.anonymous();
  print(anonymousUser);
  print(anonymousUser.toJson());
  print('');

  print('===Forwarding Constructors===');
  final anonymousUser4 = User4.anonymous();
  print(anonymousUser4);
  print(anonymousUser4.toJson());
  print('');

  print(
    '===Optional, Named (Default), and Required Parameters in Constructors===',
  );
  final anonymousUser5 = User5.anonymous();
  print(anonymousUser5);
  print(anonymousUser5.toJson());
  print('');

  print('===Private Variables===');
  final user6 = User6(id: 24, name: 'Vicki');
  user6._name =
      'Nefarious Hacker'; // 🤔🤔🤔 so why does this still work, NOTE BELOW
  print(user6);
  print(user6.toJson());
  print('');

  print('===Private Variables (Fixed)===');
  final user7 = User7(id: 24, name: 'Vicki');
  // user7._name =
  'Nefarious Hacker'; // 🤯🤯🤯 This line no longer works 🤓🤓🤓
  print(user7);
  print(user7.toJson());
  print('');

  print('===Checking for Errors===');
  final jb = User7(id: -1, name: 'JB Lorenzo');
  print(jb);
  print('');

  print('===Constant Constructors===');
  const user8 = User8(id: 66, name: 'Odalis');
  const anonymousUser8 = User8.anonymous();
  print(user8);
  print(user8.toJson());
  print(anonymousUser8);
  print(anonymousUser8.toJson());
  print('');

  print('===Factory Constuctors Used to deserialize from JSON===');
  final map = {'id': 10, 'name': 'Manda'};
  final manda = User9.fromJson(map);
  print(manda);
  print(manda.toJson());
  print('');

  print('===Mini-exercise===');
  final pw2 = Password2('my_value');
  print(pw2);
  print('');

  print('===Dart Objects===');
  final myObject = MyClass();
  final anotherObject = myObject;
  // both reference the same instance (object) in memory. Changing in one object will
  // impact the other.
  print(myObject.myProperty);
  anotherObject.myProperty = 2;
  print(myObject.myProperty);
  // Just two names for the same instance/object
  print('');

  print('===Getters Examples - Dedicated and Calculated===');
  const user10 = User10(id: 66, name: 'Odalis');
  const anonymousUser10 = User10.anonymous();
  print(user10);
  print(user10.id); // using the new getters
  print(user10.name);
  print(user10.isBigId); // using a calculated getter
  print(user10.toJson());
  print(anonymousUser10);
  print(anonymousUser10.id);
  print(anonymousUser10.isBigId);
  print(anonymousUser10.name);
  print(anonymousUser10.toJson());
  print('');

  print('===Setters===');
  final email = Email();
  print(email.value); // nothing
  email.value = 'kev@example.com';
  print(email.value);
  print('');

  print('===Refactoring Email===');
  final email2 = Email2();
  print(email2.value);
  email2.value = 'oda@example.com';
  print(email2.value);
  print('');

  print('===Refactoring of User===');
  const user11 = User11(id: 66, name: 'Odalis');
  const anonymousUser11 = User11.anonymous();
  print(user11);
  print(user11.toJson());
  print(anonymousUser11);
  print(anonymousUser11.toJson());
  print('');

  print('===Static Members===');
  // no instantiate needed to access myProperty or call myMethod
  final value = SomeClass.myProperty;
  print(value);
  SomeClass.myMethod();
  print('');

  print('===Static Constants===');
  const user12 = User12(id: 66, name: 'Odalis');
  const anonymousUser12 = User12.anonymous();
  print(user12);
  print(user12.toJson());
  print(anonymousUser12);
  print(anonymousUser12.toJson());
  print('');

  print('===Static Methods Used to deserialize from JSON===');
  final map13 = {'id': 10, 'name': 'Manda'};
  final manda13 = User13.fromJson(map13);
  print(manda13);
  print(manda13.toJson());
  print('');

  print('===Challenges===');
  print('===Challenge 1: Bert and Ernie===');

  print('');

  print('===Challenge 2: Spheres===');

  print('');
}

/* Undestanding object Serialization

One disadvantage of using complex classes is when I'm saving the object or sending
it over the network. Files, databases, and networks only know how to handle simple
data types, such as numbers and strings. They don't know how to handle anything
more complex, like my User data type.

Serialization is the process of converting a complex data object into a string. One
the object has be serialized, it's easy to save that data or transfer it across
the network because everything from my app to the network and beyond knows how to
deal with strings. Later, when I want to read that data back in, I can do so by way
of deserialization, whcih is simply the process of converting a string back into 
an object of my data type.

Our overridden toString method is actually a serialization (changing to a string), 
but since we aren't using any standard, others wouldn't know how to deserialize
our data structure. It turns out that serialization and deserialization are such
common tasks that people have devised a number of standardized formats for 
serializing data. One of the most common is JSON: JavaScript Object Notation. 
Despite the name, it's far and wide outside the world of JavaScript

*/

/*NOTE: The member variables of a class are generally called fields. However,
  when the fields are public, that is, they are visible to the outside world,
  I can also call them properties. The getters and setters sections above show
  how to use public properties and private fields at the same time
  
  So, Why aren't the private properties actually private?
  It turns out in our example, my nefarious hacker can still access the "private"
  fields of User6, just by adding '_' (i.e., user6._name = 'Nefarious Hacker').
  What's that all about? Using an underscore before a variable or method name makes
  it "library private", not "class private". For my purposes in this chapter, a library
  is simply a file. Since the main function and the User class are in the same file
  nothing in User is actually hidden from main. To see private variables in action
  and working as they should, I'll need to make another file so that I'm not using
  my class in the same file in which its defined.
  
  I've done that for User7 above. 
  
  And thus I've continued these notes on that file, since this one is getting 
  pretty long*/
