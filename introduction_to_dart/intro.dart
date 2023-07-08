import 'dart:async';
import 'dart:io';

// VARIABLES:
// Eenv in type-safe dart, you can declare most vars without explicitly specifying their type
// using 'var'. We use type-inference in dart very similar to most other static langs nowadays. 
// Also good to note that unlike Go, Dart puts the type before the identifier 'int myNumber'.
// We'll discuss it later, but I also discovered some interesting stuff about 'final', 'const', and '?' usage.
var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg'
};

// CONTROL FLOW STATEMENTS:
// Dart has the normal flow statements from what it looks like, with maybe some slight syntax
// differences -- examples below in main

// FUNCTIONS:
// For functions the dart convention is to explicitly specify types for args and return values, as we
// do in Go. -- NOTE: remember that types comes first in dart
int fibonacci(int n){ 
  if(n==0||n==1)return n;
  return fibonacci(n-1)+fibonacci(n-2);
}// noting we don't need ';' for functions defs

// there is also a shorthand '=>' version for functions where as I can tell is the dart usage of 
// anony funcs and closures. (Example in main below using both anonys and funtions as args)


// COMMENTS aren't surprising at all here. We have // for line comments and /**/ for blocks
// One thing to keep in mind is the use of /// for doc comments. We put these over specific 
// elements and then Dart will use for the autodocumentation 

// IMPORTS - are also pretty basic. Things to note are the ':' in the syntax and of course 
// everything ending with the ';'. 
// Importing core libraries - import 'dart:math';
// Importing libraries from external pkgs - import 'package:test/test.dart';
// Importing files - import 'path/to/my_other_file.dart';

// CLASSES - this example has 3 props, 2 constructors, and a method. One of the props shouldn't be set
// directly, so we define using a getter method (instead of a var). The method uses string
// interpolation to print variables' string equivalents inside of string literals.
class Spacecraft{
  String name;
  DateTime? launchDate; // NOTE the ? to show that its possible we could get a 'null'. This reminds me of 
  // the langs that have 'optional' values. 
  
  // This is the read-only non-final (again for the '?') property. Since it uses a getter, there's no
  // way to grab it and change it
  int? get launchYear => launchDate?.year; // NOTE again the use of ? here. There's a possiblity we back null
  // as the result and when we look for the 'year' on launchDate which is a DateTime object that has other fields (day, month, etc)
  
  // Here is the constructor, with the syntactic sugar for assignment to members.
  Spacecraft(this.name,this.launchDate){
    // then we put some initialization code here...
  }
  
  // Here is a 'named' constructor that forwards to the default one above. It seems kinda like
  // inheritance
  Spacecraft.unlaunched(String name):this(name,null); // so looks like what's happening here is that we are passing the
  // variant of our constructor with only a name through ':' to the original this(name,null) call it with the name and null
  
  // here's the method.
  void describe(){ // looks like just putting the void inside the class def makes it a method, just like JS, etc. 
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters
    var launchDate = this.launchDate;
    if(launchDate!=null){
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      // I think when we say that type promotion doesn't work on getters, since we used a getter with this read-only non-file prop
      // we had to basically 'type' it again above 'int years = ...'
      print('Launched: $launchYear ($years years ago)');
    }else{
      print('Unlaunched');
    }
  }
}
// uses of the class below in main...


// ENUMS
/// Enums are pretty simple and working as expected. They are
/// ways of enumerating a predefined set of values or instances in a way
/// that there can't be any other instance of that type. Here's an example with
/// a list of planets
enum PlanetType{terrestrial,gas,ice}

// we can also enhance it as a class describing planets, with a defined set of constant
// instances, namely the planets of our own solar system.
/// Enum that enumerates the different planets in our solar system
/// and some of their properties.
enum Planet{
  mercury(planetType:PlanetType.terrestrial, moons:0,hasRings:false),
  venus(planetType:PlanetType.terrestrial,moons:0,hasRings:false),
  earth(planetType:PlanetType.terrestrial,moons:1,hasRings:false),
  uranus(planetType:PlanetType.ice,moons:27,hasRings:true),
  neptune(planetType:PlanetType.ice,moons:14,hasRings:true);
  
  /// a constant generating constructor
  const Planet(
    {required this.planetType,required this.moons,required this.hasRings});
  
  /// All instance variables are final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;
  
  /// Enhanced enums support getters and other methods
  bool get isGiant=>planetType==PlanetType.gas||planetType==PlanetType.ice;
  
}

// INHERITANCE - Dart has single inheritance
class Orbiter extends Spacecraft{
  double altitude;
  
  Orbiter(super.name,DateTime super.launchDate,this.altitude);
}


// MIXINS - are a way of re-using code in multiple hierarchies. I've heard of them before, but never really
// dived in to understand them. Here is an example:
mixin Piloted{
  int astronauts = 1;
  
  void describeCrew(){
    print('Number of astronauhts: $astronauts');
  }
}

// Then to use it we just create a class that extends another 'mixes'in our mixin
// class PilotedCraft extends Spacecraft with Piloted{
//   // ... then some code.
// }


// INTERFACES AND ABSTRACT CLASSES:
// First all class have an implicit interface implemented meaning you can 'implement' any class
// Its not as simple as Go's interfaces as you have to explicitly use 'implement' and there is
// also an explicit 'interface' keyword
// class MockSpaceship implements Spacecraft{
//   //....
// }

// There are also 'abstract' classes which can be extended (or implemented) by concrete classes.
// The can contain empty bodies (abstract methods)
abstract class Describable{
  void describe();
  
  void describeWithEmphasis(){
    print('==============');
    describe();
    print('==============');
  }
}
// Now any class that extends or implements Describable has the describeWithEmphasis method which 
// calls the extender's implementation of describe().


// ASYNC:
// Rather than using callbacks we can also use async, which reminds me of the nodejs concurrency
// structure. 'async' and 'await'
const oneSecond = Duration(seconds:1);
Future<void> printWithDelay(String message) async{
  await Future.delayed(oneSecond);
  print(message);
}

// this is the same as this:
// Future<void> printWithDelay(String message){
//   return Future.delayed(oneSecond).then((_) {
//     print(message);
//   });
// } // which is very JS lookin'


// As we see here async and await help making asychronous code easier to read
Future<void> createDescriptions(Iterable<String> objects) async{
  for(final object in objects){
    try{
      var file = File('$object.txt');
      if(await file.exists()){
        var modified = await file.lastModified();
        print(
          'File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch(e){
      print('Cannot create description for $object: $e');
    }
  }
}

// We also have async* as a nice readable way to build streams (sicp) ;)
Stream<String>report(Spacecraft craft, Iterable<String> objects) async*{
  for(final object in objects){
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object'; // again I see $ and ${}, the latter being for evaluations
    // in interpolation
  }
}

// EXCEPTIONS - though there is a lot of controversy around Exceptions, in dart we have them
// to raise an exception, use 'throw' as expected
// if(astronauts==0){
//   throw StateError('No astronauts.');
// }

// To catch an exception, we use 'try...(on / catch)' as we saw above
// 'try' works for both asynchronous and synchronous code in an async function. 


// NOTE: KEEP THE FOLLOWING IN MIND ON THIS VOYAGE:
  // Everything we place in an var is an 'object', and every object is an instance of a 'class'. This
  // includes numbers, functions, and null objects. With the exception of null (if we enable sound null safety),
  // all objects inherit from the Object class (this sounds a lot like the JS Object structure)
  
  // Although Dart is strongly typed, type annotations are optional because Dart can infer types. 
  // in 'var number = 101', number is inferred to be a type 'int'.
  
  // If you enable null safety, variables can't contain null unless you say they can. You can make a
  // variable nullable by putting a question mark (?) at the end of its type. (this is what I've been 
  // seeing and thing it was returning an 'option'). For example, a var of type 'int?' might be an
  // integer, or it might be 'null' (these are options after all then). If you know that an expression
  // never evaluates to null but Dart disagrees, you can add '!' to assert that it isn't null (and to 
  // throw an exception if it ever is). An example of this would be; int x = nullableButNotNullInt!
  
  // when you want to explicitly say that any type is allowed, use the  type Object? (if you've enabled
  // null safety), Object, or - if you must defer type checking until runtime
  
  // Dart supports generic types, like List<int> (a list of integers) or List<Object> (a list of
  // objects of any type).
  
  // Dart supports top-level functions (such as main()), as well as functions tied to a class or object
  // (static and instance methods, respectively). You can also create functions within functions (nested
  // or local functions).
  
  // Similarly, Dart supports top-level variables, as well as vars tied to a class or object (static
  // and instance vars). Instance variables are sometimes known as fields or properties as well.
  
  // Unlike Java, Dart doesn't have keywords public, protected, and private. If an identifier starts
  // with an underscore (_), it's private to its library. (Is this enforced by the compiler???) 
  
  // Identifiers can start with a letter or an '_', followed by any combination of those chars plus digits.
  
  // Dart has both expressions (which have runtime values) and statements (which don't). For example
  // the conditional expression condition ? expr1 : expr2 has a value of expr1 or expr2 at compile time.
  // While an if-else statement, won't have any value until run-time. A statement often contains
  // one or more expressions, but an expression can't directly contain a statement. Examples of statements
  // then would be function declarations/defs, or for loops, etc.
  
  // Dart tools will report 2 kinds of problems: warnings and errors. Warnings are just indications that
  // your code might not work, but they don't prevent your program from compiling or executing. Errors
  // can be either compile-time or run-time. A Compile-time error prevents the code from executing at 
  // all; a run-time error results in an exception being raised while the code executes. 


///////////////////////////////////////////////////////////////////////////////////////////////
// MAIN
//////////////////////////////////////////////////////////////////////////////////////////////


void main(){
  
  print('CONTROL FLOW STATEMENTS:');
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }

  for (final object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }
  print('');
  
  print('FUNCTIONS:');
  var result = fibonacci(20);
  print('fibonacci of 20 is $result');
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
  print('');
  
  print('CLASSES:');
  var voyager = Spacecraft('Voyager I',DateTime(1977,9,5));
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  
  voyager.describe();
  voyager3.describe();
  print('');
  
  print('ENUMS:');
  final yourPlanet = Planet.earth;
  if(!yourPlanet.isGiant){
    print('Your planet is not a "giant planet".');
  }
  print('');
}

