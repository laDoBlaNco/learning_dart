/**
 * Dart Core - Assignment Operators
 */

void main() {
  // assigment (=) is used to assign a value to a variable
  int x = 10;
  print(x);

  // compound addition (+=) adds a value to the variable and assigns the result back to the variable
  x = 5;
  x += 3;
  print(x);

  // compound subtraction (-=) subtracts a value from the variable and assigns the result back to the variable
  x = 10;
  x -= 4;
  print(x);

  // compound multiplcation (*=) multiplies the variable by a value and assigns the result back to the variable
  x = 2;
  x *= 5;
  print(x);

  // compound division (/=) divides the variable by a value and assigns the result back to the variable
  double z = 20;
  z /= 4; // I had to use 'double z' cuz / results in a float and x is an int
  print(z);

  // compound modulo (%=) calcualtes the remainder of dividing the variable by a value and assigning the
  // result back to the variable for use
  x = 15;
  x %= 7;
  print(x);

  // compound integer division (~/=) performs integer division on the variable and assigns the result
  // back to the variable
  x = 17;
  x ~/= 3;
  print(x);
}
