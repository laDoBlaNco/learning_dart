/**
 * Dart by Example: For
 */

void main() {
  // a standard for loop in dart
  for (var i = 0; i < 3; i++) {
    print(i);
  }
  print('');

  // 'for-in' can be used on any class that implements iterable
  var collection = [3, 4, 5];
  for (var x in collection) {
    print(x);
  }
  print('');

  // closures will capture the value of the index (dart is lexically scoped)
  var callbacks = [];
  for (var i = 6; i < 8; i++) {
    callbacks.add(() => print(i));
  }
  callbacks.forEach((c) => c()); // invoke each callback with forEach
}
