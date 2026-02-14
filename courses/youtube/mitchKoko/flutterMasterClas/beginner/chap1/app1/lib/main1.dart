import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // VARIABLES: I can store different types of info into variables
  String name = 'Kevin ladoblanco Whiteside';
  int age = 49;
  double pi = 3.14159;
  bool isBeginner = true;

  /*

 P R O G R A M M I N G  F U N D A M E N T A L S

BASIC MATH OPERATORS
1 + 1 -> 2, add
4 - 1 -> 3, subtract
2 * 3 -> 6, multiply
8 / 4 -> 2, division
9 % 4 -> 1, remainder (modulo)
5++ -> 6, increment by 1
5-- -> 4, decrement by 1

COMPARISON OPERATORS:
5 == 5 -> true, EQUAL TO
2 != 3 -> true, NOT EQUAL TO
3 > 2 -> true,  GREATER THAN
3 < 2 -> false, LESS THAN
5 >= 5 -> true, GREATER THAN OR EQUAL TO
3 <= 7 -> true, LESS THAN OR EQUAL TO

LOGICAL OPERATORS:
AND operator, returns true if both sides are true
isBeginner && (age < 18) -> returns true

OR operator, returns true if at least one side is true
isBeginner || (age < 18) -> return true

NOT operator, returns the opposite value
!isBeginner -> returns false

--------------------------------------------------------------------------------------------------

C O N T R O L   F L O W - telling the computer how to get things done

if(condition){
  do something
}

if(condition){
  do something
}else{
  if not, do something else
}

if(condition){
  do something
}else if(another condition){
  do something else
}else{
  if nothing, do something default
}

switch (expression){
  case value:
    do something;
    break;
  case value:
    do something else;
    break;
  case value: (as many as needed)
    do something else;
    break;
  default:
    do something default;
}

for loops

imagine that we have a box of 10 different crayons and we want to draw a circle
with each one. Instead of saying:

"Draw a circle with the 1st crayon, then draw a circle with the 2nd crayon, etc.,"

It's much easier to say:

"For each crayon in the box, draw a circle"

for (initialization; condition; iteration){
  do some stuff
}

break    -> break out of loop
continue -> skip current iteration and continue to the next

In a for loop we must specify the number of times to loop. But if we don't know
how many times to loop, we can use a while loop to keep looping until a 
certain condition is met

while(condition){
  do some stuff;
  (adjust our condition object to avoid infiinite loops unless that's what
  we want)
}

--------------------------------------------------------------------------------------------------

F U N C T I O N S / M E T H O D S (just associated functions)

We just looked at some cool blocks of code that gets stuff done! 
We can organize these blocks of code into functions to that we can reuse
them easily, like our 'main' function that we've been working with up until now.

'void' means that the function returns nothing. Soon we'll see functions that do
return stuff. This one for now just executes the code in the function.

*/

  // greet function
  void greet() {
    print('Hello, ladoblanco!');
  }

  // function with parameters
  void greetPerson(String name, int age) {
    print('Hello, $name. You are $age years old!');
  }

  // function with return type
  int add(int a, int b) {
    int sum = a + b;
    return sum;
  }

  /*
---------------------------------------------------------------------------------------------------

D A T A   S T R U C T U R E S

*/
  // LIST: ordered collection of elements, can have duplicates
  List<int> numbers = List<int>.from([1, 2, 3]);
  // I had to do something that the course didn't mention. According to Google, the Dart Type
  // system prevents the direct assignment of a dynamically typed list to a specifically
  // typed list variable. I need to explicitly convert or cast the list to ensrue type safety 🤔🤔🤔
  // numbers[0] -> 1
  // numbers[1] -> 2
  // numbers[2] -> 3

  List<String> names = ['Kevin', 'Odalis', 'Kelen', 'Xavier', 'Xavier'];
  // names[0] -> Kevin
  // names[1] -> Odalis
  // names[2] -> Kelen
  // names[3] -> Xavier
  // names[4] -> Francisca

  // SET: unordered collection of unique elements
  Set<String> uniqueNames = {
    'Kevin',
    'Odalis',
    'Kelen',
    'Xavier',
  }; // tried to dup 'Xavier' and the
  // compiler wouldn't let me.

  // MAP: stores key-value pairs
  Map user = {'name': 'Ladoblanco', 'age': 49, 'height': 185};
  // user['name']   -> Ladoblanco
  // user['age']    -> 49
  // user['height'] -> 185

  void printNumbers() {
    for (int i = 0; i < numbers.length; i++) {
      print(numbers[i]);
    }
  }

  void printNames() {
    for (int i = 0; i < names.length; i++) {
      print(names[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    // FYI I moved these from main to the widget so that hot reload works. When in
    // the main function I need to restart the app to get the result.
    print('hi there Flutter');
    print(1 + 1);
    print(4 - 1);
    print(2 * 3);
    print(8 / 4);
    print(9 % 4);
    print(5 == 5);
    print(2 != 3);
    print(3 > 2);
    print(3 < 2);
    print(5 >= 5);
    print(3 <= 7);
    print(isBeginner && (age > 18));
    print(isBeginner || (age > 18));
    print(!isBeginner);
    if (age >= 18) {
      print('You are an adult!');
    }

    if (age >= 18) {
      print('You are an adult!');
    } else {
      print('You are not an adult!');
    }

    if (age < 13) {
      print('You can only what G rated movies.');
    } else if (age < 18) {
      print('You can watch G and PG13 rated movies.');
    } else {
      print('You can watch anything you want!');
    }

    // what if we get to use too many 'ifs'
    String grade = 'B';
    if (grade == 'A') {
      print('Outstanding');
    } else if (grade == 'B') {
      print('Good');
    } else if (grade == 'C') {
      print('Fair');
    } else if (grade == 'D') {
      print('Need help');
    } else if (grade == 'F') {
      print('You suck!');
    } else {
      print('Not a valid grade');
    }

    // use switch statement
    switch (grade) {
      case 'A':
        print('Excellent');
        break;
      case 'B':
        print('Good');
        break;
      case 'C':
        print('Fair');
        break;
      case 'D':
        print('Needs help');
        break;
      case 'F':
        print('You suck!');
        break;
      default:
        print('');
    }

    for (int i = 0; i <= 8; i++) {
      if (i == 6) break;
      print(i);
    }
    for (int i = 0; i <= 8; i++) {
      if (i == 6) continue;
      print(i);
    }

    int countDown = 10;
    while (countDown > 0) {
      print(countDown);
      countDown--;
    }

    greet(); // calling our greet function/method in our build function/method
    greetPerson('Odalis', 51);
    int mySum = add(12, 13);
    print(mySum);

    printNumbers();
    printNames();
    print(user['name']);
    print(user['age']);
    print(user['height']);

    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
