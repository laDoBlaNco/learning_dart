/*
Dart by Example: Values

*/

void main() {
  // Strings can be appended using +
  print('dart' + 'lang');

  // integers and floats with interpolation
  print('1+1=${1 + 1}');
  print(('7.0/3.0 = ${7.0 / 3.0}')); // note the interpolation in ${}

  // booleans
  print(true && false);
  print(false || true);
  print(!true);
}
