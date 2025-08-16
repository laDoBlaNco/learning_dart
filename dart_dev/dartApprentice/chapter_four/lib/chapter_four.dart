// ignore_for_file: dead_code, avoid_function_literals_in_foreach_calls

/* Chapter 4: Control Flow

When writing a computer  program, I need to be able to tell the computer
what to do in different scenarios. for example, a calculator app would
need to perform one action if the user taps the addition button, and 
another  if the user taps the subtraction button.

In computer programming terms, this concept is known as control flow, because
I can control the flow of decisions that code makes at multiple points. In this 
chapter, I'll learn how to make decisions and repeat tasks in my Dart
programs
*/
import 'dart:math';

// variable scope example global
const global = 'Hello, World';

void main() {
  // Making Comparisons
  print('====Making Comparisons====');

  const bool yes =
      true; // true and false are keywords that set the state of the bool
  const bool no = false;
  print('$yes or $no');
  print('');

  print('====Testing Equality====');
  const doesOneEqualTwo = (1 == 2); // equality operator '=='
  print(doesOneEqualTwo);
  print('');
  // NOTE: in Dart you can use == on ints and doubles since they both come from
  // the 'num' type

  print('====Testing Inequality====');
  const doesOneNotEqualTwo = 1 != 2; // inequality operator '!='
  print(doesOneNotEqualTwo);
  const alsoTrue = !(1 == 2); // using the bang/not-operator alone
  print(alsoTrue);
  print('');

  print('====Testing Greater Than and Less Than====');
  const isOneGreaterThanTwo = 1 > 2; // greater than
  const isTwoGreaterThanOne = 1 < 2; // Less than
  print('$isOneGreaterThanTwo  $isTwoGreaterThanOne');
  print(
    '${1 <= 2}   ${2 <= 2}',
  ); // Less than or equal to / greater than or equal to
  print('');

  print('====Boolean Logic====');
  const isSunny = true;
  const isFinished = true;
  const willGoCycling = isSunny && isFinished;
  print(willGoCycling);

  const willTravelToAustrailia = true;
  const canFindPhoto = false;
  const canDrawPlatypus = willTravelToAustrailia || canFindPhoto;
  print(canDrawPlatypus);

  /* Order precedence in Dart
        !
    >= > <= <
      == !=
        &&
        ||
  */

  const andTrue = 1 < 2 && 4 > 3;
  const andFalse = 1 < 2 && 3 > 4;
  const orTrue = 1 < 2 || 3 > 4;
  const orFalse = 1 == 2 || 3 == 4;
  print('$andTrue  $andFalse  $orTrue  $orFalse');
  print(3 > 4 && 1 < 2 || 1 < 4);
  print(3 > 4 && (1 < 2 || 1 < 4)); // overriding precedence with ()S
  print((3 > 4 && 1 < 2) || 1 < 4);
  print('');

  print('====String Equality====');
  // In dart I can use == with strings the same as I would numbers
  const guess = 'dog';
  const dogEqualsCat = guess == 'cat';
  print(dogEqualsCat);
  print('');

  print('====Mini Exercises====');
  /*
    Create a const called myAge and set it to my age. Then create a const
    named isTeenager using boolean logic to determine if age is in the
    range of 13 to 19
  */
  const myAge = 48;
  const isTeenager = myAge >= 13 && myAge <= 19;
  print('Am I a teenager? $isTeenager');

  /*
    Create another const named maryAge and it to 30. Then create a const
    named bothTeenagers that uses boolean logic to see if both Mary and I
    are teenagers
  */
  const maryAge = 30;
  const bothTeenagers =
      myAge >= 13 && maryAge >= 13 && myAge <= 19 && maryAge <= 19;
  print('Are both Mary and I teenagers? $bothTeenagers');

  /*
    Create a String const named reader and set it to my name. Create
    another String const named ray and set it to 'Ray Wenderlich'. Create
    a boolean const named rayIsReader that uses string equality to
    determine if reader and ray are equal
  */
  const String reader = 'Kevin Whiteside';
  const String ray = 'Ray Wenderlich';
  const bool rayIsReader = reader == ray;
  print('Are Ray and the reader the same? $rayIsReader');
  print('');

  print('====The IF statement====');
  if (2 > 1) {
    print('Yes, 2 is greater than 1.');
  }
  print('');

  print('====The Else Clause====');
  const animal = 'Fox';
  if (animal == 'Cat' || animal == 'Dog') {
    print('Animal is a house pet.');
  } else {
    print('Animal is not a house pet.');
  }
  print('');

  print('====Else-If Chains====');
  const trafficLight = 'yellow';
  var command = '';
  if (trafficLight == 'red') {
    command = 'Stop';
  } else if (trafficLight == 'yellow') {
    command = 'Slow Down';
  } else if (trafficLight == 'green') {
    command = 'Go';
  } else {
    command = 'INVALID COLOR';
  }
  print(command);
  print('');

  print('====Variable Scope====');
  const local = 'Hello, main';
  if (2 > 1) {
    const insideIf = 'Hello, anybody?';
    print(global);
    print(local);
    print(insideIf);
  }

  print(global);
  print(local);
  // print(insideIf); // error: Undefined name 'insideIf'
  print('');

  print('====Ternary Conditional Operator====');
  const score = 83;
  String message;
  if (score >= 60) {
    message = 'You passed';
  } else {
    message = 'You failed';
  }
  print(message);

  const message2 = score >= 60 ? 'You passed' : 'You failed';
  print(message2);
  print('');

  print('====Mini Exercises====');
  /*
    Create a const named myAge and intialize it with my age. Write an if
    statement to print out 'Teenager' if my age is between 13 and 19, and
    'Not teenager' if my age is not between 13 and 19
  */
  if (myAge <= 19 && myAge >= 13) {
    print('Teenager!');
  } else {
    print('Not teenager!');
  }

  /*
    Use a ternary conditional operator to replace the else-if statement that
    I used above. Set the result to a variable named answer
  */
  const answer = myAge <= 19 && myAge >= 13 ? 'Teenager!' : 'Not teenager!';
  print(answer);
  print('');

  print('====Switch statements====');
  const number = 3;
  if (number == 0) {
    print('zero');
  } else if (number == 1) {
    print('one');
  } else if (number == 2) {
    print('two');
  } else if (number == 3) {
    print('three');
  } else if (number == 4) {
    print('four');
  } else {
    print('something else');
  }

  // now with switch
  switch (number) {
    case 0:
      print('zero');
      break;
    case 1:
      print('one');
      break;
    case 2:
      print('two');
      break;
    case 3:
      print('three');
      break;
    case 4:
      print('four');
      break;
    default:
      print('something else');
  }
  // NOTE: In Dart, switch statements don't support ranges like number > 5
  // only == comparisons.
  print('');

  print('====Switching on Strings====');
  const weather = 'cloudy';
  switch (weather) {
    case 'sunny':
      print('Put on sunscreen.');
      break;
    case 'snowy':
      print('Get your skis.');
      break;
    case 'cloudy':
    case 'rainy':
      print('Bring an umbrella.');
      break;
    default:
      print('I am not familiar with that weather.');
  }
  print('');

  print('====Enumerated Types====');
  const weatherToday = Weather.cloudy;
  switch (weatherToday) {
    case Weather.sunny:
      print('Put on sunscreen');
      break;
    case Weather.snowy:
      print('Get your skis.');
      break;
    case Weather.cloudy:
    case Weather.rainy:
      print('Bring an umbrella.');
      break;
  }
  // with enums, no need for 'default' cases
  print('');

  print('====Enum Values and Indexes====');
  print(Weather.cloudy);
  // unlike other languages, enums in Dart are NOT numbers 🤯🤯🤯
  // although I can get one if that's what I want
  print(Weather.sunny.index);
  print(Weather.snowy.index);
  print(Weather.cloudy.index);
  print(Weather.rainy.index);
  print('');

  print('====Mini exercises====');
  /*
    Make an enum called AudioState and give it values to represent
    'playing','paused',and 'stopped' states
  */
  print(AudioState.values);

  /*
    Create a const called audioState and give it an AudioState
    value. Write a switch statement that prints  a message based on
    the value
  */
  const audioState = AudioState.paused;
  switch (audioState) {
    case AudioState.playing:
      print('Your tunes are playing now');
      break;
    case AudioState.paused:
      print('Your tunes are paused for now');
      break;
    case AudioState.stopped:
      print('What happened? Are you done listening?');
      break;
  }
  print('');

  print('====Loops====');
  print('====While Loops====');
  var sum = 1;
  while (sum < 10) {
    sum += 4;
    print(sum);
  }
  print('');

  print('====Do-while Loops====');
  sum = 1;
  do {
    sum += 4;
    print(sum);
  } while (sum < 10);
  print('');

  print('====Comparing while and do-while Loops====');
  sum = 11;
  while (sum < 10) {
    sum += 4;
  }
  print(sum);
  print('');

  sum = 11;
  do {
    sum += 4;
  } while (sum < 10);
  print(sum);
  print('');

  print('====Breaking Out of a Loop====');
  sum = 1;
  while (true) {
    sum += 4;
    if (sum > 10) {
      break;
    }
  }
  print('');

  print('====A random interlude====');
  // import 'dart:math'; for this one

  final random = Random();
  while (random.nextInt(6) + 1 != 6) {
    // .nextInt(n) gives a random number from 0 to 1 less than n
    // that's why I need to do + 1 to make it 1 to 6
    print('Not a six!');
  }
  print('Finally, you got a six!');
  print('');

  print('====For Loops====');
  for (var i = 0; i < 5; i++) {
    print(i);
  }
  print('');

  print('====The continue keyword====');
  for (var i = 0; i <= 5; i++) {
    if (i == 2) {
      continue;
    }
    print(i);
  }
  print('');

  print('====For-in Loops====');
  // for running loops in collections
  const myString = 'I ❤ Dart';
  for (var codePoint in myString.runes) {
    print('$codePoint -> ${String.fromCharCode(codePoint)}');
  }
  print('');

  print('====For-each Loops====');
  // simplified for-in loop available to collections
  const myNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  myNumbers.forEach((n) => print(n));
  print('');

  print('====Mini-exercises====');
  /*
    Create a variable named counter and set it to 0. Create
    a while loop with the condition 'counter<10. The loop body
    should print out 'counter is ...'. Incrementing by 1
  */
  var counter = 0;
  while (counter < 10) {
    print('counter is $counter');
    counter += 1;
  }
  print('');

  /*
    Write a for loop starting at 1 and ending with 10
    inclusive. Print the square of each number
  */
  for (var i = 1; i <= 10; i++) {
    print(i * i);
  }
  print('');

  /*
    Write a for-in loop to iterate over the following collection
    of numbers. Print the square root of each number
  */
  const numbers = [1, 2, 4, 7];
  for (var n in numbers) {
    print(sqrt(n));
  }
  print('');

  /*
    Repeat exercise 3 using a forEach loop
  */
  numbers.forEach((n) => print(sqrt(n)));
  print('');

  print('====CHALLENGES====');
  /*
    Challenge 1: Find the error
    What's wrong with the following code? 
    There is no 'lastName' until runtime, and
    its possible it won't be declared. Need to
    declare before the IF
  */
  const firstName = 'Bob';
  var lastName = '';
  if (firstName == 'Bob') {
    lastName = 'Smith';
  } else if (firstName == 'Ray') {
    lastName = 'Wenderlich';
  }
  final fullName = firstName + ' ' + lastName;
  print(fullName);
  print('');

  /*
    Challenge 2: Boolean challenge
    In each of the following statements, what is the value
    of the bool exression? true, false, true, true
  */
  print(true && true);
  print(false || false);
  print((true && 1 != 2) || (4 > 3 && 100 < 1));
  print(((10 / 2) > 3) && ((10 % 2) == 0));
  print('');

  /*
    Challenge 3: Next power of two
    Given a number, determine the next power of two above or
    equal to that number. Powers of two are the numbers in
    the sequence of binary 2^1, 2^2, 2^3, etc. 1,2,4,8,16,...
    I'm sure they wanted me to use some kind of if...else or loop
    But I went the mathematical way
  */
  double givenNumber = 17;
  print((log(givenNumber) / log(2)).ceil());
  print('');

  /*
    Challenge 4: Fibonacci
    Calculate the nth fibonacci number. The fib sequence starts with 1,
    then 1 again, and then all subsequent numbers in the sequence are simply
    the previous two values added together.
  */
  int nthFib = 4;
  int a = 0;
  int b = 1;
  int res = 0;
  for (var i = 1; i < nthFib; i++) {
    res = a + b;
    a = b;
    b = res;
  }
  print(res);
  print('');

  /*
    Challenge 5: How many times?
    In the for loop, what will be the value of sum, and how
    many iterations will happen?
    It runs 6 times and the sum2 = 15

  */
  var sum2 = 0;
  for (var i = 0; i <= 5; i++) {
    sum2 += i;
  }
  print(sum2);
  print('');
  /*
    Challenge 6: The final countdown
    Print a countdown from 10 to 0
  */
  for (var i = 10; i >= 0; i--) {
    print(i);
  }
  print('');

  /*
    Challenge 7: Print a sequence
  */
  double res2 = 0.0;
  for (var i = 0; i <= 10; i++) {
    print(res2.toStringAsFixed(1));
    res2 += 0.1;
  }
}

enum Weather { sunny, snowy, cloudy, rainy }

enum AudioState { playing, paused, stopped }

/*
Key Points:
  ▪ I use boolean data type bool to represent true and false
  ▪ the comparison operators, all of which return a bool, are:
    ▪ equal ==
    ▪ not equal !=
    ▪ less than <
    ▪ greater than >
    ▪ less than or equal <=
    ▪ greater than or equal >=
  ▪ I can use boolean logic (&& and ||) to combine comparison 
    conditions
  ▪ I use if statements tomake simple decisions based on a 
    condition
  ▪ I use else and else-if within an if state to extend the
    decision making beyond a single condition
  ▪ Variables and constants belong to a certain scope, beyond
    which I can't use them. A scope inherits variables and 
    constants from its parent
  ▪ I can use the ternary operator (a ? b : c) in place of simple 
    if statements
  ▪ I can use switch statements to decide which code to run 
    depending on the value of a variable or constant
  ▪ Enumerated types define a new type with a finite list
    of distinct values
  ▪ while loops perform a certain task repeatedly as long as 
    a condition is true
  ▪ do-while loops always execute the loop at least once
  ▪ The break statement lets me break out of a loop
  ▪ for loops allow me to perform a loop a set number of times
  ▪ The continue statement ends the current iteration of a loop
    and begis the next iteration
*/
