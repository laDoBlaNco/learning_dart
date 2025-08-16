// This is a single-line comment. It is not executed.
// This is also a comment,
// over multiple lines, stacked

// ignore_for_file: dangling_library_doc_comments, slash_for_doc_comments, unused_local_variable

/* This is also a comment. Over many ...
many...
many...
many lines. */

/* This is a comment.
/* And inside it is
another comment. */
Back the first. */

// NOTE: dart is the first language I've seen do this right

/// I am a documentation comment
/// at your service

/**
 * Me, Too!
 */

import 'dart:math';

void main() {
  // Statements and Expressions
  print('Hello, Dart Apprentice reader!');

  // Arithmetic operations
  // simple operations
  print(2 + 6);
  print(10 - 2);
  print(2 * 4);
  print(24 / 3);

  // decimal numbers
  print(22 / 7);
  print(22 ~/ 7);

  // The Euclidean modulo operation
  print(28 % 10);

  // order of operations
  print(((8000 / (5 * 10)) - 32) ~/ (29 % 5));
  print(350 / 5 + 2);
  print(350 / (5 + 2));

  // math functions
  print(sin(45 * pi / 180));
  print(cos(135 * pi / 180));
  print(sqrt(2));

  print(max(5, 10));
  print(min(-5, -10));

  print(max(sqrt(2), pi / 2));

  // mini-exercise
  print('');
  print(sin(45 * pi / 180));
  print(1 / sqrt(2));

  // Naming data
  // variables
  int number = 10; // 'int' type annotation
  number = 15;

  double apple = 3.14159;

  // NOTE: every value I can assign to a variable in Dart are objects. In fact,
  // Dart DOESN'T HAVE PRIMITIVES that exist in other languages. Everything is
  // an object. Although 'int' and 'double' look like primitives, they're subclasses
  // of 'num', which is a subclass of Object.
  print(10.isEven);
  print(3.14159.round()); // 🤯 this is very Ruby like, I think
  print('');

  // Type Safety
  int myInteger = 10;
  // myInteger = 3.14159; // No, no, no. That's not allowed and results in an error

  // And because of whaat I learned bout Dart and everything being an object
  // and subclassing, I can get some automatic generic action 🤯🤯🤯
  num myNumber;
  myNumber = 10;
  myNumber = 3.14159;
  // myNumber = 'ten'; // No, no, no, that one doesn't work as 'ten' isn't a subclass of num

  // one step further using 'dynamic'
  dynamic myVariable;
  myVariable = 10;
  myVariable = 3.14159;
  myVariable = 'ten';
  // but don't do it. "Friends don't let friends use dynamic"

  // Type inference
  // var = 'Dart, use whatever type you feel appropriate
  var someNumber = 10;
  someNumber = 15;
  // someNumber = 3.14159; // type safety still applies

  // Constants
  // const constants - compile-time constants
  const myConstant = 10; // like using type inference
  // myConstant = 0; // not allowed as its constant

  // final cosntants - run-time constants
  final hoursSinceMidnight = DateTime.now().hour;
  print(hoursSinceMidnight);
  // hoursSinceMidnight = 0; // again not allowed - can only be set once

  // Using meaningful names
  // lowerCamelCase for variable names

  // Mini-exercise
  // 1. Declare a const of type int call myAge and set to my age:
  print('');
  const int myAge = 48;
  print(myAge);

  // 2. Declare a variable of type double called averageAge. Initially, set
  //    the variable to my own age. Then st it to the average of my age and
  //    my best friend's age.
  double averageAge = 48;
  print(averageAge);
  averageAge = (48 + 50) / 2;
  print(averageAge);

  // Create a constant called testNumber and intialize it with whatever integer
  // I'd like. Next create another constant call evenOdd and set it equal to
  // testNumber modulo 2. Now change testNumber to various Numbers. Notice what
  // happens with evenOdd?
  const testNumber = 77;
  const evenOdd = testNumber % 2;
  print(evenOdd);
  print('');

  // Increment and decrement
  var counter = 0;
  print(counter);
  counter += 1;
  print(counter);
  counter += 1;
  print(counter);
  counter -= 1;
  print(counter);
  counter -= 1;
  print(counter);
  print('');

  // same as
  var counter2 = 0;
  print(counter2);
  counter2 = counter2 + 1;
  print(counter2);
  counter2 = counter2 + 1;
  print(counter2);
  counter2 = counter2 - 1;
  print(counter2);
  counter2 = counter2 - 1;
  print(counter2);
  print('');

  // only increment/decrement by 1 ++ --
  var counter3 = 0;
  print(counter3);
  counter3++;
  print(counter3);
  counter3++;
  print(counter3);
  counter3--;
  print(counter3);
  counter3--;
  print(counter3);
  print('');

  // other assignment inc/dec
  double myValue = 10;
  myValue *= 3;
  print(myValue);
  myValue /= 2;
  print(myValue);
  print('');

  // Challenges
  // Challenge 1: Variables
  // Declare a constant int called myAge and set it equal to my age. Also declare
  // an int variable called dogs and set that equal to th enumber of dogs I own.
  // Then imagine I bought a new puppy and increment the var by 1
  const int myAge2 = 48;
  int dogs = 1;
  dogs++;
  print(dogs);
  print('');

  // Challenge 2: Make it compile
  // Make the given compile
  int age = 16;
  print(age);
  age = 30;
  print(age);
  print('');

  // Challenge 3: Compute the answer
  const x = 46;
  const y = 10;
  const answer1 = (x * 100) + y;
  print(answer1);
  const answer2 = (x * 100) + (y * 100);
  print(answer2);
  const answer3 = (x * 100) + (y / 10);
  print(answer3);
  print('');

  // Challenge 4: Average rating
  // declare 3 constants called rating1, rating2,rating3
  // of type double and assign each value. Calculate the
  // average of the three and store the result in a constant named averageRating
  const rating1 = 9;
  const rating2 = 7;
  const rating3 = 10;
  const averageRating = (rating1 + rating2 + rating3) / 3;
  print(averageRating);
  print('');

  /*
  Key Points:
    • code comments are denoted by a line starting with //, or multiple
      lines bookended with /* and */.
    • Documentation comments are denoted by a line starting with ///.
      or multple lines bookended with /** and  */.
    • I can use 'print' to write to the debug console
    • The arithmetic operators are:
      • Addition: +
      • Subtraction: -
      • Multiplication: *
      • Division: /
      • Truncating Division: ~/
      • Modulo (remainder): %
    • Dart has many functions including min, max, sqrt, sin, and cos. I'll learn
      many more throughout this book
    • Constants and variables give names to data
    • Once I've declared a constant, I can't change its data, but I can change a 
      variable's data at any time
    • If a variable's type  can be inferred, I can replace the type with the 'var'
      keyword
    • The 'const' keyword is used for compile-time constants while 'final' is used
      for runtime constants
    • Always give variables and constants meaningful names to save myself and my
      colleagues headaches later
    • Operators that perform arithmetic operations, and then assign back to the 
      variable are:
      • Add and assign: +=
      • Subtract and assign: -=
      • Multipy and assign: *=
      • Divide and assign: /=
      • Increment by 1: ++
      • Decrement by 1: --

  */
}
