/**
 * Dart Core - Object Oriented Programming - 'super' Keyword
 * 
 * The super keyword is used to call methods and constructors from the 
 * superclass (parent class). It is particularly useful when I have 
 * overridden a method in a subclass and want to call the superclass's
 * implementation.
 */

class Person {
  String name;

  Person(this.name);

  void sayHello() {
    print('Hello, my name is $name.');
  }
}

class Student extends Person {
  String university;

  Student(String name, this.university) : super(name);

  @override
  void sayHello() {
    super.sayHello();
    // first time calling a superclass method directly 🤔
    print('I study at $university.');
  }
}

void main() {
  Student student = new Student('Odalis', 'The UASD');
  student.sayHello();

}

// recap:
// using superclass not only passes the original args through ':'
// but I can reduce retyping methods by simply running the super method
// as part of an @overridden method and then add only what's needed
// additionally 🤯 NICE!
