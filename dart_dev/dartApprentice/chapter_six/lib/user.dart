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
instance 🤔🤔🤯🤯 (I've heard of that before but called something else. I think it
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
 */