// ignore_for_file: unused_local_variable

/**
 * Type CONVERSION
 */

void main() {
  // using the same examples we move to type conversion.
  int age;
  age = 20;
  // double age2 = age; // Error: a value of type 'int' can't be assigned toa  variable type 'double'
  // we need to convert
  double age2 = age.toDouble();
  print(age2);
  // just as there is an toDouble() we have a toInt(). But 'toInt() truncates rather than
  // rounding.
}
