/*
Dart Core - Object Oriented Programming - Classes

A class is a blueprint that defines the structure and behavior of objects
It encapsulates data (attributes) and methods (functions) that operate
on that data 

*/

class Person {
  String? name;
  int? age;

  void sayHello() {
    print('Hello, my name is $name, and I am $age years old.');
  }
}

// An object is an instance of a class, created using the 'new' keyword
// or by simply invoking the class constructor. Objects represent real-world
// entities and have attributes and behaviors defined by their class
void main() {
  Person person1 = Person();
  person1.name = 'Odalis';
  person1.age = 50;
  person1.sayHello();

  Person person2 = Person();
  person2.name = 'Kevin';
  person2.age = 48;
  person2.sayHello();
}
