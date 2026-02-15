// ignore_for_file: unused_local_variable

/**
 * VARIABLES
 */

void main() {
  // var just a name I give to a value in the program, like a sticky note on a box
  // 'type variableName'
  int myValue = 1;

  // we use '=' to assign values to a varible
  /*
    Types in Dart:
      • int - holds all whole numbers
      • double - holds all floats
      • String - holds text data like 'hello world'
      • bool - holds true or false
  */
  print(myValue);

  num myInteger = -1;
  double myDouble = 1.2;
  print(myInteger);
  print(myDouble);

  String myString = 'Kevin Whiteside';
  print(myString);

  bool myBool = true;
  print(myBool);

  // variables can have values changed as long as they are the same type
  // Dart is type safe
  myInteger = 1000;
  print(myInteger);
  myInteger = 1000.0; // this is an error with type 'int', but with 'num' its ok as it handles
  // both

  print(myInteger);

  // we can use 'var' and Dart will infer the data type
  var noType = 1;
  print('$noType - ${noType.runtimeType}');
  print(noType.runtimeType);
  print('');

  // Calculator Challenge
  int n1 = 5;
  int n2 = 8;
  print(n1 + n2);
  print(n1 - n2);
  print(n1 / n2);
  print(n1 * n2);
  print(n1 ~/ n2);
  print(n1 % n2);
}
