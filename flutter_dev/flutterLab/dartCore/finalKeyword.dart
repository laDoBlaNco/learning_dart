/**
 * Dart Core - final keyword
 * 
 * In dart, the 'final' keyword is used to declare a variable whose value cannot be changed
 * after it has been assigned a value once. Once a variable is declared as 'final', it 
 * becomes a constant, and its value remains constant throughout the program's execution. 
 * The 'final' keyword is typically used when I want to ensure that a variable's value
 * remains unchanged once it is initialized.
 */

void main() {
  // in this example, I declare 3 final variables: age, pi, and name
  // Once these variables are assigned values, their values can't be modified or
  // reassigned thoughout the program's execution. If I attempt to reassign a
  // value to a final variable, it will result in a compilation error
  final int age = 48;
  final double pi = 3.14;
  final String name = 'LadoBlanco';

  // error: This will cause a compilation error - "The final variable 'age' can only be set once"
  // age = 50;

  print('Name: $name, Age: $age, PI: $pi');

  // It's important to note that the final keyword only guarantees that the variable's reference
  // cannot change. It DOES NOT make the variable's content immutable. For example, in the case
  // a final List, I can still modify the content to the list, but I can't reassign the list
  // to a new list
  final List<int> numbers = [1, 2, 3];

  // this is allowed since e are not changing the reference of 'numbers'
  numbers.add(4);
  print(numbers);

  // this will error: The final variable 'numbers' can only be  set once
  // numbers = [5, 6, 7];
}
