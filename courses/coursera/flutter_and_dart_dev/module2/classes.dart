// ignore_for_file: unused_field

/*
CLASSES IN DART:

Introduction
  ▪ A class defines properties and behaviors
  ▪ An object is a specific instance of a class
  ▪ Each object has a unique state

What are Classes?
  ▪ Real-world entities become objects
  ▪ Attributes represent data
  ▪ Methods implement behavior
  ▪ Classes are blueprints that describe how an object behaves
    ▪ Truck Class properties might be:
      ▪ payload capacity
      ▪ cargo bed size
      ▪ towing capacity
      ▪ ground clearance
    ▪ Truck class methods might be:
      ▪ accelerate
      ▪ start
      ▪ stop

Public vs private properties
  ▪ Defines the object access, giving access to the object's data
    ▪ Public Property: Allows external access
    ▪ Private Property: Restricts access

Defining methods in classes
  ▪ Objects are lifeless without methods
  ▪ Methods define an object's behavior

Getters and Setters
  ▪ Control access to an object's properties
    ▪ Getters perform calculations or formatting before retrieving property data
    ▪ Setters validate input or trigger actions on setting/updating a property value

Static methods
  ▪ Different from the methods described above
  ▪ Do not belong to object instances
  ▪ Are used for utility functions
  ▪ Do not require object access

  Examples:
    ▪ Utility conversions
    ▪ Mathematical calculations

Anonymous Functions
  ▪ Ideal for short operations
  ▪ Offers flexibility in varioius scenarios
    ▪ Can be passed to other variables and functions
  ▪ Promotes clean code for complex programs

Encapsulation
  ▪ Imagine World's most valuable jewelry
  ▪ Safely guarded with a key
  ▪ Treasure Chest = Class's Objects
  ▪ the key = Getters and Setters

Inheritance
  ▪ Child class inherits from the parent class
    ▪ Animal is a parent class
      ▪ dog, cat, and horse would be child classes
    ▪ Sleep and eating would be inherited from the parent class
    ▪ Breed or lifespan would be properties of the child class directly
  ▪ Hierarchal structure to help organize complex code
  ▪ Establishes relationships between parent and child classes
 
*/

// example Person class
class Person {
  // Public properties
  String name;
  int age;

  // Private property
  String _ssn;

  // Constructor
  Person(this.name, this.age, this._ssn);

  // Method
  void displayInfo() {
    print('Name: $name\nAge: $age\nSSN: $_ssn');
  }

  int yearsUntilRetirement() {
    return 65 - age;
  }
}

// example of getters and setters:
class Circle {
  double radius;

  Circle(this.radius);

  double get area => 3.14 * radius * radius;
}

class Rectangle {
  double _width = 0;
  double _height = 0;

  void set width(double value) {
    if (value > 0) {
      _width = value;
    }
  }

  void set height(double value) {
    if (value > 0) {
      _height = value;
    }
  }

  double get area => _width * _height;

  // note setters are void as they don't return anything but they
  // do need to have args, as opposed to getters that must return
  // something but don't need args.
}

/**
 * Examples of static methods and properties
 */
class Math {
  static double pi = 3.14;

  static int square(int x) {
    return x * x;
  }
}

/**
 * Encapsulation Example
 */
class BankAccount {
  String _accountNumber;
  double _balance;

  // Constructor
  BankAccount(this._accountNumber, this._balance);

  // Getter
  double get balance => _balance;

  // Setter
  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
    }
  }

  // method
  void withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
    } else {
      print('Insufficient funds');
    }
  }
}

/**
 * Inheritance Examples: 
 */
class Animal {
  void eat() {
    print('Animal is eating');
  }
}

class Dog extends Animal {
  void bark() {
    print('Dog is barking');
  }
}

void main() {
  print('Property/Method Example:');
  Person person1 = Person('Odalis', 50, '123-45-6789');
  person1.displayInfo();
  print(person1.yearsUntilRetirement());
  print('');

  print('Getter and Setter Examples:');
  Circle c = Circle(5);
  print(c.area);

  Rectangle r = Rectangle();
  r.width = 10;
  r.height = 20;
  print(r.area);
  print('');

  print('Static Properties and Methods Examples:');
  // used without instances of the Math class
  print(Math.pi);
  print(Math.square(4));
  print('');
  // Wow I think I just had a 🤯🤯🤯 moment. So everytime I use class.method or class.property
  // in different languages like lua and php and js, its really just static properties and
  // methods 🤯🤯🤯

  /**
   * Example of Anony Functions
   */
  print('Anony Function Example:');
  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print(item);
  });
  print('');

  print('Encapsulation Example:');
  BankAccount account = BankAccount('123456789', 1000.00);
  print('Balance: \$${account.balance}');
  print('');

  print('Inheritance Example:');
  Dog dog = Dog();
  dog.eat();  // .eat() method inherited from Animal class
  dog.bark(); // .bark() method from the dog class directly
  print('');

   
}

/**
 * Recap:
 * ▪ Classes define how an object will behave
 * ▪ Public properties allow access, while private properties offer protection
 * ▪ Methods define an object's actions (associative functions)
 * ▪ Getters perform calculations, while setters validate  input
 * ▪ Static methods are used for utility functions
 * ▪ Anony functions are used for short operations (as well as callbacks and closures)
 * ▪ Encapsulation protects an object's data
 * ▪ Inheritance helps organize complex code
 * 
 */
