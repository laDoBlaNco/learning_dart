// ignore_for_file: dead_code

/**
 * Dart Core - Conditional Statements:
 */

void main() {
  // if statement: allows me to execute a block of code if a given condition is true. If the condition
  // is false, the block of code inside the if statement is skipped altogether, and the program
  // continues to the next statement
  int x = 10;

  if (x > 5) {
    print('x is greater than 5');
  }

  // if-else statement: allows me to execute one block of code if the condition is true and a different
  // block of code if the condition is false
  x = 3;
  if (x > 5) {
    print('x is greater than 5');
  } else {
    print('x is not greater than 5');
  }

  // if-else-if statement: allows me to test multiple conditions and execute different blocks of code
  // based on which condition is true. It is useful when I have multiple cases to handle
  x = 10;
  if (x < 0) {
    print('x is negative');
  } else if (x == 0) {
    print('x is zero');
  } else {
    print('x is positive');
  }

  // Nested if-else statements: In dart, I an use nested if-else to create multiple levels of conditions
  // based on different scenarios. A nested if-else statement is an if-else statement that is nested
  // inside another if or else block. This allows me to perform more complex decision-making based on
  // multiple conditions or cases
  int age = 30;
  bool isStudent = false;

  if (age > 18) {
    print('You are an adult');
    if (isStudent) {
      print('You are a student');
    } else {
      print('You are not a student');
    }
  } else {
    print('You are a minor');
  }
}
