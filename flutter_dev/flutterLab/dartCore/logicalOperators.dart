// ignore_for_file: dead_code

/**
 * Dart Core - Logical Operators
 */

void main() {
  // logical not (!) reverses the boolean value of its operand. It returns true if the operand
  // is false and false if the operand is true.
  bool a = true;
  bool b = false;
  print(!a);
  print(!b);
  print('');

  // logical and (&&) returns true if both of its operands are true; otherwise false. It evalutes
  // the second operand ONLY if the first operand is true (short-circuit). If the first operand
  // is false, the second operand isn't evaluated because the result of the expression is already
  // determined to be false.
  print(a && b);
  print(a && !b);
  print('');

  // logical or (||) returns true if at least one of the operands is true; otherwise, it returns
  // false. it evaluates the second operand only if the first operand is false. If the first
  // operand is true, the second operand is not evaluated becasue the result of the expression
  // is alrady determined to be true
  print(a || b);
  print(!a || b);
}
