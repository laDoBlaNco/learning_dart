/**
 * Dart by Example: Function Types
 */

typedef bool Validator(int n); // typedefs??? really??? 🤔🤔🤔

bool positive(int n) => n >= 0;
bool lessThan100(int n) => n < 100;

bool bothValid(int n, Validator v1, Validator v2) {
  return v1(n) && v2(n);
}

void main() {
  Validator both = (int n) => bothValid(n, positive, lessThan100);
  print('${both(5)}');
  print('${both(1000)}');
}
