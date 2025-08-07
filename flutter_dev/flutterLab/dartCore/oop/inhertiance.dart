/**
 * Dart Core - Object Oriented Programming - Inheritance
 * 
 * Inheritance: allows a class (subclass) to inherit proertiees and 
 * methods from anotehr class (superclass). The subclass can then
 * extend or override the behavior of the superclass.
 */

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print('Hello, my name is $name and I am $age years old.');
  }
}

class Student extends Person {
  String university;

  Student(String name, int age, this.university) : super(name, age);
  // so this is first time I'm seeing the subclass : superclass syntax
  // the subclass will require the args for the superclass and then pass
  // them over through the ':' to super(arg,arg)

  @override // here override is when we want to override a method  from
  // a super class? 🤔
  void sayHello() {
    print(
      'Hello, my name is $name, and I am $age years old. I study at $university.',
    );
  }
}

void main() {
  Student student1 = Student('Ladoblanco', 48, 'University of Michigan');
  student1.sayHello();
}

// recap: 
// subclass uses the ':' to pass original args to  the superclass
// When I see @override it means that a superclass method is being 
// overridden