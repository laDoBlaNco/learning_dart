/**
 * Dart Core  - Printing Varibles
 * 
 * In this dart program, I declare four variables age, height, name, and isStudent of different
 * data types (int, double, String, and bool). I then use string concatenation '+' to 
 * include the variable values within the printed messages
 */

void main() {
  // my variable declarations
  int age = 48;
  double height = 1.85;
  String name = 'Ladoblanco';
  bool isStudent = true;

  // printing variables
  print('Age: ' + age.toString());
  // apparently without  .toString(), this doesn't work anymore in new dart 3
  print('Height: ' + height.toString());
  print('Name: ' + name);
  print('Is Student?: ' + isStudent.toString());
  print('');

  // In flutter, string concatentation can be done using the '+' operator OR
  // by using string interpolation with the '$' symbol. String interpolation
  // is a more concise and readable way to concatenate strings. It allows me
  // to embed expressions  or variable values directly within a string using
  // the $ symbol. Does it automatically convert types? 🤔 Let's see
  print('Age: $age'); // yes it does the conversion automatically
  print('Height: $height');
  print('Name: $name');
  print('Is Student?: $isStudent');
  print('');

  // I can also interpolation to insert directly the values of firstName and
  // lastName into a fullName string
  String firstName = 'Kevin';
  String lastName = 'Whiteside';
  String fullName = '$firstName $lastName'; // this is interesting
  print(fullName);
}
