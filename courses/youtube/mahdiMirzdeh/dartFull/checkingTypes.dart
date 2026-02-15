/**
 * CHECKING TYPES AT RUNTIME
 */

void main() {
  // I would think he was going to  talk about .runtimeType but its about the 'is' keyword
  var age; // this actually sets age to 'dynamic' since we didn't give it a value and Dart
  // can't infer

  age = 20; // here age is still dynamic 🤦🏾

  print(age.runtimeType);
  print(age is int);
  print('');

  age = 'hello';
  print(age.runtimeType);
  print(age is! int); // I didn't know that is! == is not 🤯

  // But I need to remember that this is a runtime check and its better to rely on Dart's Strict
  // Typing System rather than runtime checks. (compile-time vs run-time)
}
