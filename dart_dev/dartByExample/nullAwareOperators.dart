// ignore_for_file: dead_code

/**
 * Dart by Example: Null-Aware operators
 */

void main() {
  // the ?? operator returns the first expression 'if' it is not null
  var monday = 'doctor';
  var tuesday;
  var next = tuesday ?? monday;
  print('next appointment: $next');

  // the ??= operator assigns a value 'if' it is not null
  var wednesday;
  next ??= wednesday;
  print('next appointment: $next');

  // the ? operator calls a function if the object is not null
  String? thursday;
  var length = thursday?.length;
  print('length: $length');
}
