// ignore_for_file: unused_local_variable

/*
VARIABLES AND TYPES:

Variables act as placeholders for storing data
Data types specify the kind of data a variable can hold

Variables:
  ▪ Act as containers to hold data that can change over time
    ▪ Step 1 - Declare the variable with a name (var greeting;)
    ▪ Step 2 - Set a value for the variable (greeting = 'hello';)

Variables in Dart: Use of keywords
  ▪ var - declares a variable without specifying its type - inferred
    ▪ I can change a var variable at any time with a value of the same type
  ▪ const - declares compile-time constants
    ▪ The value of a const variable is determine at compile-time and can't be
      changed at run-time
  ▪ final - declares a variable that can only be set once. Once set they can't
    be changed. But unlike const, they can be set at runtime


Data types in Dart
  ▪ Every variable in dart must have a data type
  ▪ Common data types:
    ▪ numbers
    ▪ strings
    ▪ bools
    ▪ lists
    ▪ maps

Numbers
  ▪ Two types of numbers in dart
    ▪ int for integers
    ▪ double for floating-point

Strings
  ▪ Represent a sequence of characters
  ▪ I can use single or double quotes
  ▪ string interpolation is a powerful feature in Dart
    ▪ allows including variables or expressions inside a string
    ▪ allows using the $ symbol to embed variable directly to the string 
      rather than using concatenation (+)

Booleans
  ▪ representing true or false values
  ▪ used in control flow statements such as 'if' and 'while'

Lists
  ▪ Ordered collections of items
  ▪ the first element is at index 0 (zero-based)

Maps
  ▪ Collections of key-value pairs
  ▪ Useful to look up values based on unique keys

Null: Significance
  ▪ Represents an absence of a value
  ▪ Variables are not initialized (technically they are in fact initialized
    to 'null' and nullable vars are automatically initialized to null)

Type inference and annotations: Significance
  ▪ Infers the type of a variable
  ▪ Annotates data types

*/

// example
void main() {
  var name = 'Alice'; // can be changed later
  final age; // can't be changed once set, but can be set during runtime
  const pi = 3.14; // can't be changed after compilation

  name = 'Kevin'; // this is ok since its 'var'
  age = 20; // this is also ok as its 'final', and can be set at runtime
  // pi = 3.142; // this will error as we can't change it at runtime

  // example numbers
  int age2 = 30;
  double height = 5.9;

  // string example
  String greeting = 'Hello, Dart!';
  String name2 = 'Odalis';
  String message = 'Hello, $name2!';
  print(message);
  print('');

  // boolean example
  bool isVisible = true;
  bool isActive = false;

  // List examples
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  print(fruits[0]);
  fruits.add('Orange'); // you can add to the list with the 'add' method
  print(fruits);
  print(fruits[0]);
  print('');

  // map example
  Map<String, int> scores = {'Alice': 90, 'Bob': 85, 'Charlie': 95};
  scores['Dave'] = 88; // we can add to the map using the same syntax
  print(scores);
  print(scores['Alice']);

  print('');

  // null example
  String? nullableString = null; // without the '?' we can't set to null
  int? nullableInt = null;

  // type inference and annotations
  var city = 'New York'; // type inferred is String
  String country = 'USA'; // type annotated explicitly
}

/*
Conclusion: Understanding the use of variables and data types is crucial
for any Dart dev to build more complex and powerful applications

Recap:
  ▪ Variables are like containers that hold data. I can declare them using the
    var, final, or const keywords
  ▪ Common data types for variables include numbers, strings, bools, lists, and
    maps.
  ▪ The two types of numbers in dart are int for integers and double for 
    floating-point numbers
  ▪ Strings represent a sequence of characters within single or double quotes
  ▪ Booleans represent true or false values
  ▪ Lists are ordered collections of items
  ▪ Maps are unordered? 🤔 collections of key-value pairs


*/
