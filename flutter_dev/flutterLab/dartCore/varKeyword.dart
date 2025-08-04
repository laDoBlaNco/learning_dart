/**
 * Dart Core - Var Keyword
 * 
 * In Dart, the 'var' keyword is used to declare a variable without explicitly
 * specifying its data type. When I use 'var', dart infers the type of the variable
 * from the value assigned to it. This is known as type inference.
 */


void main() {
  // In this example, I declare three variables (age, pi, and name) using 'var'. Dart
  // will infer the type based on teh intial values assigned to them. The inferred
  // types for these variables will be int, double, and String resprectively
  var age = 48;
  var pi = 3.14;
  var name = 'LadoBlanco';

  print('Name: $name\nAge: $age\nPI: $pi');

  // While 'var' provides flexibility in variable declaration, it's worth noting that
  // the actual data type is determined at compile time. Once a variable is assigned
  // a value and its type is inferred, the type can't be changed. If I need a 
  // variable to have a specific type that cannot change, I can use 'final' with
  // 'var' to create a constant variable

  // final var age2 = 48; 🤔 this gives me an error so apparently its not permitted
  // to use both final and var together in recent versions of dart. Which makes sense
  // because it doesn't seem very intuitive to use both for any real reason
}

/**
 * In general, when I want to be explicit about the variable's type or if the type
 * is not immediately evident from the value, it's better to use explicit type 
 * annotations like int, double, String, etc., instead of relying on 'var'.
 */
