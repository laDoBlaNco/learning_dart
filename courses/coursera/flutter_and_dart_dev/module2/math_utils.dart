// math_utils.dart
library math_utils; // define the library with 'library'

int add(int a, int b) {
  return a + b;
}

int subtract(int a, int b) {
  return a - b;
}

double multiply(double a, double b) {
  return a * b;
}

double divide(double a, double b) {
  if (b == 0) {
    throw ArgumentError('Cannot divide by zero');
  }
  return a / b;
}
