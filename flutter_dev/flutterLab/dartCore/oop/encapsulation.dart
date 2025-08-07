/**
 * Dart Care - Object Oriented Programming - Encapsulation
 * 
 * Encapsulation is the principle of bundling data and methods together
 * within a class and controlling access to the internal state of an 
 * object (class instance). In Dart, I can use access modifiers
 * (public, private, and protected) to constrol access to class
 * members.
 */

class Person {
  String _name;
  // Private variable (starting with _), accessible only within the class
  int age;

  Person(this._name, this.age);
  // require both args on instantiation

  // a getter - the only way to access this property from an instance
  String getName() {
    return _name;
  }

  void sayHello() {
    print('Hello, my name is $_name, and I am $age years old.');
  }
}

void main() {
  Person person = Person('Odalis', 50);
  print(person.getName()); // using my getter
}
