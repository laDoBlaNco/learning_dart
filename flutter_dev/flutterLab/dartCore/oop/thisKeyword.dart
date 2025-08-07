/**
 * Dart Core - Object Oriented Programming - 'this' Keyword
 * 
 * The this keyword refers to the current instance (object) of my
 * class. It is used to access class members (varibles and methods)
 * and avoid naming conflicts between local variables and instance
 * variables. When a class member's name is the same as a local variable's
 * name, using 'this' ensures that I'm referring to the class member. 
 */

class Person {
  String name;

  Person(this.name);

  void printName() {
    print('Name: $name'); // note I'm not saying '$this.name'
  }
}

void main() {
  Person person = new Person('Kevin');
  // first time I see 'new' in action, meaning its
  // possible to use but not used much in the wild
  // I wonder if there are any benefits from using or not using 🤔
  person.printName();
}


