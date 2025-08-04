/**
 * Dart Core - Increment and Decrement Operators:
 * 
 * In Dart, I can use the increment (++) and decrement (--) operators to increase or decrease
 * the value of a numeric variable by one, respectively. These operators are often used to
 * perform simple aritmetic operations where I need to add or subtract 1 from a variable (loops
 * for example)
 */

void main() {
  // prefix increment increases the value by 1 before its current value is used
  // in an expression
  int x = 5;
  print(x);
  int y = ++x;
  print(y);
  print('');

  // postfix increment increases the value by 1 after its current value is used
  x = 5;
  print(x);
  y = x++;
  print(y);
  print('');

  // prefix decrement decreases the value by 1 before its current value is used
  x = 5;
  print(x);
  y = --x;
  print(y);
  print('');

  // postfix decrement decreases the value by 1 after its current value is used
  x = 5;
  print(x);
  y = x--;
  print(y);
  print('');
}

/**
 * The increment and decrement operators can be handy in various situations, such as loops,
 * conditionals, and iterative operations, where I need to modify the value of a variable
 * in a controlled manner.
 */
