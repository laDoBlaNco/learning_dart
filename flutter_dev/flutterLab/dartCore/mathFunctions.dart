/*
Dart Core - Math Functions

In Dart, the dart:math library provides a set of math-related functions
and constants for performing various mathematical operations. This 
library includes functions for common arithmetic operations, 
trigonometry, logarithms, rounding, and more. To use the math
functions, I need to import the dart:math library
*/

import 'dart:math';

void main() {
  // pi: A constant representing the value of pi (3.14159)
  print('The value of pi: $pi');

  // here are some basic aritmetic operations
  double num = 5.5;

  // rounding functions
  print('.ceil() - $num -> ${num.ceil()}');
  print('.floor() - $num -> ${num.floor()}');
  print('.round() - $num -> ${num.round()}');

  // absolute value
  print('.abs() - $num -> ${num.abs()}');

  // square root
  print('sqrt(num) - $num -> ${sqrt(num)}');
  // NOTE since I use ${} I don't need to use $num just num

  // power
  print('pow(num) - $num -> ${pow(num, 2)}');
  print('');

  // Trigonometric Functions
  double angleInDegrees = 45;
  double angleInRadians = angleInDegrees * pi / 180;

  // sine
  print('sin(num) - $angleInRadians -> ${sin(angleInRadians)}');

  // cosine
  print('cos(num) - $angleInRadians -> ${cos(angleInRadians)}');

  // tangent
  print('tan(num) - $angleInRadians -> ${tan(angleInRadians)}');
  print('');

  // Logarithmic Functions:
  double number = 10;

  // natural logarithm (base e)
  print('Natural Logarithm - log(number) - $number -> ${log(number)}');

  // Logarithm with a specified base (e.g., base 10)
  print('Log base 10 - $number -> ${log(number) / ln10}');
  // ln10 is a constant that comes from dart:math - its the natural logarithm of 10
  // as we see above its the same as log(number)
  print(ln10);
}
