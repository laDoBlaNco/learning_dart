// ignore_for_file: unused_local_variable, unused_element

/*Chapter 2 - Dart Fundamentals
*/

// import 'dart:math';

void main() {
  // beginning with variables:
  // variables are declared with var, final, and const with optional type annotations
  var name = 'Alice'; // type inferred as String
  String email = 'alice@example.com'; // explicit type of String
  final age = 25; // type inferred  and connot be reassigned
  const pi = 3.14; // compile-time constant

  // Dart supports a range of data types to handle different kinds of information
  // The most common are:

  // int and double for numbers
  int count = 10; //
  double price = 19.99;

  // String for text
  String greeting = 'Hello';

  // bool for true/false values
  bool isActive = true;

  // List for ordered collections
  List<String> names = ['Alice', 'Bob'];

  // map for key-value pairs
  Map<String, int> scores = {'Alice': 90, 'Bob': 85};

  // set for unique collections
  Set<String> tags = {'flutter', 'dart'};

  // Control flow in Dart is as expected with 'if, else, for, while, and switch
  // statements
  if (age >= 18) {
    print('Adult');
  } else {
    print('Minor');
  }
  print('');

  for (var i = 0; i < 5; i++) {
    print(i);
  }

  // Functions are declared with a return type (or void for no return) and can
  // include parameters. for example:

  // i can also create functions in functions
  int add(int a, int b) {
    return a + b;
  }

  // Dart's arrow syntax also allows concise single-line expression functions
  int square(int n) => n * n; // the return is implied

  print('');
  // Named params are also available and make function calls more readable (wrapped in {})
  // They are very intuitive for Flutter - 'required' to ensure null-safety
  void greet({required String name, required int age}) {
    print('Hello, $name! You are $age');
  }

  greet(name: 'Alice', age: 25);

  // Null safety was implemented in 2.12 making variables non-nullable by default
  // They can only be null if explicitly told they can with a '?' after the type
  String? city =
      null; // nullable (and I didn't have to add the  '= null'. That's implied by the '?')
  String country = 'USA'; // non-nullable
  print('');
  print(
    city?.length ?? 0,
  ); // Dart even has null-aware operators for safe access members
  // that may or may not exist

  // Darts standard lib gives us utilities for things like string manipulation
  // math, and collections.
}
