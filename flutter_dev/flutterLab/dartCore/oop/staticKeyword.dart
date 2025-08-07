// ignore_for_file: unused_local_variable

/**
 * Dart Core - Object Oriented Programming - 'static' Keyword
 * 
 * In Dart, the 'static' keyword is used to define class members (variables and methods)
 * that belong to the class itself rather than to an instance (object) of the class.
 * (math.pow is a good example from lua). It means that static members are shared
 * across all instances of the class and can be accessed directly without creating
 * an instance of the class.
 * 
 * A static variable is a class-level variable that is shared by all instances of the
 * class. I declare a static variable using the 'static' keyword before its data type.
 * 
 * A static method is a class-level method (function) that can be called directly on the 
 * class without creating an instance of the class. I declare a static method using 
 * the 'static' keyword before its return type.
 */

class MyClass {
  static int count = 10;
}

class MathUtils {
  static int add(int a, int b) {
    return a + b;
  }
}

void main() {
  // using static variables
  print(MyClass.count);
  MyClass.count = 20; // we also set it through the class
  print(MyClass.count);
  print('');

  // using a static method
  int result = MathUtils.add(5, 10);
  print(result);

  // but can they be used through an instance? 🤔🤔🤔
  // NOPE, I get the error: The static method 'add' can't be accessed through an instance
  MathUtils myAdd = MathUtils();
  // print(myAdd.add(3, 4));
}
