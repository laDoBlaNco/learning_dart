/**
 * Dart Core - Arithmetic Operators
 */

void main() {
  // Addition (+) is used to add two or more numbers (as well as concatenation)
  int num1 = 10;
  int num2 = 5;
  int sum = num1 + num2;
  print(sum);

  // Subtraction (-) is used to subtract one number from another
  int difference = num1 - num2;
  print(difference);

  // Multiplacation (*) is used to multiply two or more numbers
  int product = num1 * num2;
  print(product);

  // Division (/) is used to divide one number by another.
  double quotient = num1 / num2;
  print(quotient); // note result is a float

  // Modulo (%) calculates the remainder when one number is divided by another.
  num2 = 3;
  int remainder = num1 % num2;
  print(remainder);

  // Integer division (~/) performs division and returns the result as an integer
  // by truncating the decimal part.
  int quotient2 = num1 ~/ num2;
  print(quotient2);

  // Arithmetic operations in dart follow standard precedence, where multiplication
  // and division are evaluated before addition and subtraction. I can use ()s to
  // change that order.
  int result = (10 + 5) * 2;
  print(result);
}
