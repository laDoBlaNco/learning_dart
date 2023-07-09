/**
 * Before we can really learn Flutter, we need to understand or at least refresh
 * ourselves with the OOP concepts of objects, classes, inheritance, interfaces,
 * and packages. 
 * 
 * OBJECTS:
 * Understanding objects are the key to understanding OOP. Everything in the
 * real-world is an object: my car, my desk, my work, me, etc. Real-world objs
 * have 2 characteristics:
 *  - state
 *  - behavior
 * Computers for example have a state (type, color, speed, capacity, etc) and
 * behavior (processing, playing media, browsing, etc.). Another good example
 * is a Car. It has state (current gear, current pedal cadence, current speed,
 * etc.) and behavior (changing gear, changing pedal cadence, applying brakes,
 * etc.).Thinking about how we identify state and behavior in the real-world is
 * a great way to start to think about OOP.
 * 
 * CLASS:
 * A class is a blueprint or prototype (template) from which objects are
 * created. So the class would define an object that models the state and
 * behavior of a real-world object. Classes are characterized by functions and
 * properties. For example looking again at a car class. It might have
 * properties like:
 *  - price
 *  - type
 *  - max speed
 *  - number of seats
 * And it could have some functions to tell us its state:
 *  - numberOfSeats()
 *  - numberOfWheels()
 *  - getYearBuilt() 
 * 
 * let's start looking at how we would create a class
 */

// we use 'class' keyword. Remember that the style convention is that class
// stuff is capital camel case and lower camel case for funcs, methods, identifiers
// etc.
class Car {
  // then we add some properties to it to model its state
  String?
      type; // using '?' to make it nullable so I don't need to assign a value
  String? color;
  int? maxSpeed;
  int numOfSeats = 4; // without the '?' we can give it a default value

  // the constructor as I've seen in other oop langs is like a method but it
  // has the same name as the class and is run when we run 'new Car(...)'
  // It constructs the new instance of our object initializing the props.
  // Also they can't have a return type, not even a 'void'
  // Car(type, color, maxSpeed, numOfSeats) {
  //   this.type =
  //       type; // 'this' stands for the current instance, just like in other langs
  //   this.color = color;
  //   this.maxSpeed = maxSpeed;
  //   this.numOfSeats = numOfSeats;
  // }
  // and yet another way of doing the construtor and taking up less space, which
  // is a new one for me. Wonder if this would work in other langs ;)
  // We can also add a special name such as below we added .initialize(...)
  Car.initialize(this.type, this.color, this.maxSpeed, this.numOfSeats);

  // we also have the use of GETTERS and SETTERS using the kws get and set
  // these are used to protect our data when creating classes. Allowing each
  // instance a way to return its value or update it.

  set setType(String value) => this.type = value; // setter
  String? get getType => this.type; // getter NOTE: these aren't methods

  // we can also add methods just by adding functions directly to the class body
  void carSpeed() {
    print('Car Speed is: $maxSpeed');
  }
}

// CLASS INHERITANCE
// inheritance in dart is simple but powerfull. When creating a new class and there
// is already a class taht includes some of the code that you need, you can derive
// or create derivatives for a new class from the existing class (called a parent
// or superclass). While doing this, you can reuse the props and methods of the
// exisiting class without having to write them again.

// Let's create an example
class Student {
  String? name;
  String? address;
  int? telNumber;
  String? email;
}

// now if we  want a new class call Teacher with the same props, we can just
class Teacher extends Student {}
// now Teacher has the same attributes of Student and create a trainer in
// main

// We can also create what is call an Abstract class, which means that at least
// one method/function doesn't have an implementation (function body). It is the
// responsibility of the derived/child to provide the implementation of the
// abstract members of the parent class. We need to to qualify this with the
// 'abstract' keyword. An abstract class can't be instantiated, just extended
// or inherited. This reminds me of interfaces a little bit with Gos method list
// but the item fulfill the interface has to worry about how they are implemented.
// As an example this class UnderGrad errors if we try to put just an empty method
abstract class UnderGraduate extends Student {
  // but if I add 'abstract' all good ;)
  contactInfo();
  // we can also have normal methods in the abstract as well
  courseInfo() {
    print('Flutter Application Development Course');
  }
}

// Since we can't instantiate abstract classes, to use them we need to create subtypes
// or extend them as we did before, but also filling in the abtract methods or we
// get another error
class ITStudent extends UnderGraduate {
  @override
  contactInfo() {
    print('Dart fundamentals');
  }
}

void main() {
  // we then create an instance with 'new' adding values to the state props
  // after adding the constructor I now need to have positional args for new Car()
  var toyota =
      new Car.initialize('Camry', 'red', 200, 7); // and don't need below now
  // toyota.maxSpeed = 200;
  // toyota.color = 'red';
  // // toyota.numOfSeats = 7;
  // toyota.type = 'Camry';

  print('Car Type is: ${toyota.type}');
  print('Number of Seats is: ${toyota.numOfSeats}');
  toyota.carSpeed(); // calling a method on the object

  toyota.setType = 'Bus';
  print(toyota.getType);

  var trainer = new Teacher();
  trainer.email = 'test@gmail.com';
  trainer.telNumber = 123456789;
  print('Email Address: ${trainer.email}');
  print('Telephone Number: ${trainer.telNumber}');

  // now I can create a software student from the subclass of my abstract class
  var softwareStudent = new ITStudent();
  softwareStudent.contactInfo();
  softwareStudent.courseInfo();

}
