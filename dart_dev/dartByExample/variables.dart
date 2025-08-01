/**
 * Dart by Example: Variables
 */

void main() {
  // 'var' declares a variable. dartanalyzer infers the type.
  var a = 'initial';
  print(a);

  // the type can also be declared
  num b = 42;
  print(b);

  // final variales cannot be changed once declared
  final num c = 99;
  print(c);

  // const variables are compile-time constants
  const double d = 44.80;
  print(d);
}
