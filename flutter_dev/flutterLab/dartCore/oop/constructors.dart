/*
Dart Core - Object Oriented Programming - Constructors

constructors are special methods (functions) used to initialize objects 
(class instances) when they are created. Dart supports default  construtors
and named constructors
*/

class Person {
  String name;
  // without a construtor I would need to use String? to ensure its nullable
  int age;

  // default constructor
  Person(this.name, this.age);

  // Named constructor (this is new to me 🤔)
  // Person.fromName(String name) {
  //   this.name = name; // requires a name arg
  //   this.age = 0; // this defaults age to 0,
  // }

  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

void main() {
  Person person1 = Person('Ladoblanco', 48);
  Person person2 = Person('Odalis', 50);

  person1.sayHello();
  person2.sayHello();
}

// Again not how the constructor ensures that we don't have a null
// argument so we don't need to use String? or int?
