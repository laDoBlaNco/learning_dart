// ignore_for_file: unused_local_variable, unused_field

/*DEEP DIVE: LANGUAGE SPECIFICATION DETAILS

  This section contains some interesting language features that are covered in the Dart
  specification document regarding classes. The contents of the document are very
  rigorous and formal so here its been extracted and rephrased regarding some curiosities
  about classes and their members.

    ▪ In Dart, classes can't be nested insideo their classes. Both examples below raise
      compile-time errors (classes A and B)

      Classes can ONLY be top-level members. As such, I can't even define a class inside
      the body of a getter, a setter or a function for example.

    ▪ I've seen that annotations, also known as metadata, can be retrieved at runtime 
      using the dart:mirror library. However, they could also be statically retrieved
      by parsing the program and evaluating the constants using a suitable interpreter. 
      In fact, many (if not most) uses of metadata are entirely static 🤔

    ▪ The Dart core library (dart:core) is implicitly imported by all libraries other
      than itself. Any import of the core library, even if restricted with show, hide,
      or as, preempts the automatic import.

    ▪ A SCRIPT is a library that includes a top-level function named 'main' with either
      zero, one, or two required arguments. In other words, a script is a library that
      contains the application's entry-point function (main). It can be of 3 types:

        void main(List<String> args, Object? value){...}

        void main(List<String> args){...}

        void main(){...}

      If main requires more than two parameters (so it's not in any of the forms listed
      above), the library is not considered a script and thus it can't serve as entry-
      point

    ▪ When compiling a Dart application for the web (using dart compile js), I can 
      lazily load libraries. This is mostly useful to reduce the application startup
      time and avoid loading code that might never be used. Deferred loading (or 
      "lazy loading") has the following syntax

        import 'my_library.dart' deferred as my_lib;

      To lazily load a library, I must used 'deferred as' followed by a name, as it 
      happens with library aliasing. When my code needs to use the library, I must 
      make sure it was loaded with loadLibrary(). For example:

        Future<void> doSomething() async{
          await my_lib.loadLibrary(); // <---this must be called first
          my_lib.function1();
          my_lib.function2();
        }

        In this example above, await pauses the method execution until the library is 
        loaded. I can call loadLibrary() multiple times without problems because it 
        will only load the library once. 

        The async and await keywords are covered in chapter 8 - Section 2.2 "async and
        await". An example of a Dart web application that uses deferred loading  is in 
        chapter 22 - Section 4.2 "Deferred imports"

      ▪ Setters, getters, and operators can NEVER have optional parameters of any kind

      ▪ All Dart classes have a noSuchMethod method (which I saw when working with 
        annotations) that is implicitly invoked when one or more member lookups fail. 
        For exaample: (main:safe)

        This code is safe because the compiler sees that there is no 'test' method in 
        class A. But if we use something like 'dynamic' (main:unsafe)

        Since I'm using dynamic here, its not possible for the compiler to determine 
        whether test is a member of A or not. When I run the program, the noSuchMethod 
        method is called when I try to access 'test' from A since the member doesn't 
        exist. noSuchMethod is like a "backup method" that kicks in when a runtime 
        invocation on a member is attempted but it fails. So this means that on the first
        example when I used 'final' since the compiler catches it, noSuchMethod is never
        invoked. Only as a runtime error.

      ▪ The constructor of a class can be "torn off" using the new keyword after the type
        name. For example (MyClass and transform): (since this 'tear off' stuff confuses
        me, I got some other examples from Google here):

          Dart's constructor tear-offs, introduced in Dart 2.15, allow me to reference
          a constructor directly as a function object without explicitly calling it with
          ()s. The creates a closure that, when invoked, will call the constructor with 
          the provided arguments. 

          KEY ASPECTS OF CONSTRUCTOR TEAR-OFFS:

          ▪ DIRECT REFERENCE: instead of writing (arg) => MyClass(arg), I can simply write
            MyClass.new for the unnamed constructor or MyClass.namedConstructor for a named
            constructor

          ▪ FUNCTION-LIKE BEHAVIOR: The torn-off constructor behaves like a function,
            accepting the same parameters as the constructor it represents and returning
            an instance of the class. (I guess that's where the idea of "tearing off" comes
            from in the since that you can separate it from its context and use it elsewhere)

          ▪ USE CASES: Constructor tear-offs are particularly useful when I need to pass a
            constructor as an argument to a higher-order function, such as map, forEach, or
            in scenarios like building Flutter UIs where widgets are often created from lists
            of data.

            GOOGLE EXAMPLE BELOW: Person, people, morePeople

          BENEFITS (still from Google)
          ▪ CONCISENESS: Reduces boilerplate code by eliminating the need for explicit
            lambda expressions to wrap constructor calls.

          ▪ READABILITY: Makes code cleaner and easier to understand by directly expressing
            the intent to use a constructor as a function

          ▪ IMPROVED ABSTRACTION: Facilitates passing constructors as parameters, enabling
            mroe flexible and reusable code as we see in Flutter.

        Back to the MyClass and transform examples now:

        The MyClass.new syntax replaces the anony function that forwards the parameter to
        the constructor. Both versions are equivalent, but the constructor tear-off is
        less verbose and earier to understand.

      ▪ When I have to initialize a variable with a pre-defined value, I can do it immediately
        in the declaration site rather than using a constructor. For example (Example)

        Here I've initialized 'value' directly in the declaration site. I could have also
        initialized it in the constructor, but it would have been more verbose as in Example2
        where I use the initializer list syntax

        Both examples are equivalent, but the former is shorter and in the author's opinion,
        more readable


*/

class A {
  // class B{} // Error classes can't be declared inside other classes
}

void myFunction() {
  // class InnerClass{} // 'class' can't be used as an indentifier since its a keyword
}

class Person {
  String name;
  Person(this.name);

  Person.fromMap(Map<String, dynamic> data) : name = data['name'];
}

class MyClass {
  final double value;
  const MyClass(this.value);
}

void transform(MyClass Function(double) fn) {}

class Example {
  String _value =
      'initial'; // the declaration site, rather than 'Example(this._value)'
  Example();
}

class Example2 {
  String _value;
  Example2() : this._value = 'intial';
}

void main() {
  final safe = A();
  // safe.test();  // The method 'test' isn't defined for the type 'A'

  dynamic unSafe = A();
  // unSafe.test(); // this is now an unhandled exception:
  // NoSuchMethodError: Class 'A' has no instance method 'test'.

  // the tear-off example from google
  List<String> names = ['Kevin', 'Odalis', 'Kelen', 'Xavier'];

  // using a constructor tear-off with map for the UNNAMED constructor
  List<Person> people = names.map(Person.new).toList();
  // so Person.new is a closure that accepts each name mapped to it. then its converted
  // back to a list with .toList() off the iterator returned from .map()
  print('people is of Type: ${people.runtimeType}');
  print(people.map((p) => p.name)); // returns an iterator list in ()s
  print('');

  // Using a constructor tear-off with map for the NAMED constructor
  List<Map<String, dynamic>> dataList = [
    {"name": 'Ladoblanco'},
    {'name': 'Juana'},
  ];
  List<Person> morePeople = dataList.map(Person.fromMap).toList();
  // again using Person.fromMap as tear-off closure and it accepts the mapped entries
  // from dataList, then we convert the returned iterator list to a List
  print('morePeople is of Type: ${morePeople.runtimeType}');
  print(morePeople.map((p) => p.name)); // same result
  print('');

  // The original tear-off example from this section:
  // OK - classic anony function
  transform((value) => MyClass(value));

  // Also OK - equivalent to above (but using the tear-off)
  transform(MyClass.new); // again this is the use with UNNAMED constructor
}
