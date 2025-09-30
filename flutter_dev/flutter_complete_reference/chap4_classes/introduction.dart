void main() {
  /*4.1 - INTRODUCTION

    Dart is an object-oriented programming language with classes, inheritandce, and 
    mixins. Every object is an instance of a class and all types (except for Null) 
    descend from Object. The syntax is similar to the most popular languages. For
    example:
  */
  const myself = Person('Kevin', 'Whiteside');
  print('$myself');
  print('${myself.upperCaseName()}');
  print('');

  /*Here I've created the Person class, given it a const constructor since all of its
    fields are final and overridden the toString method. The example only wants to give
    a first glance at how classes are defined. I'll analyze everything in detail in 
    coming sections. Dart implements classes with the following properties:

      ▪ there is NO multiple inheritance. A class cannot inherit features from more 
        than one parent

      ▪ there are NO access modifiers like public, protected, or private. All members
        can either be 'public' (which means being visible from outside the class) or
        'private' (which means being only visible within the class scope)

    In Dart I can OVERRIDE a method (re-define its implementation in a sub-class), but there
    is method OVERLOAD. As such, there CANNOT be two functions with different signatures
    and the same name.

    In the Example2 below I have a compiler error since two methods have the same name. To
    solve the problem, I must use a different method name to avoid ambiguity. Before moving
    on, I'll touch on cascades are with an example3
  */
  final example3 = Example3();
  example3.one();
  example3.two();
  example3.three();
  example3.four();
  print('');

  /*Here I'm calling four methods in sequence on the same object. This can be redone with
    CASCADE NOTATION
  */
  // The .. notation is known as cascade
  example3
    ..one()
    ..two()
    ..three()
    ..four();
  print('');

  /*Cascades, whose usage is officially recommended, allow me to make an ordered sequence
    of operations on the same object. The NULL-AWARE cascade operator has the same 
    functionality, but it works with nullable objects. If the variable is not null, all 
    methods in the cascade are executed
  */
  // note I put a ? on my class without changing the class. Interesting
  final Example3? example33 = Example3();
  example33
    ?..one() // NOTE the ? on the first line only
    ..two()
    ..three()
    ..four();
  print('');

  /*Cascades invoke multiple methods, in sequence, but IGNORE the return value (if any).
    They should only be used to make assignments or to invoke functions that don't 
    return a value. For example: (Example4). looking at the below example, it seems
    to be like chaining then since ..printAll includes the 'name' added in ..name = 'kevin'
  */
  final example4 = Example4()
    ..name = 'kevin'
    ..printAll()
    ..compute();
  // the returned value is ignored

  print(example4.runtimeType);
  print('');

  /*I've mixed in variable assignments and method calls in the same cascade. Notice that
    I have used the cascade right after the object creation as well. The Example4 object
    is created, then assigned to the variable, and finally the cascade is executed. 
    They can also be nested. PersonBuilder / AddressBuilder
  */
  final person = PersonBuilder()
    ..name = 'Kevin'
    ..address =
        (AddressBuilder() // the nested cascade MUST be wrapped in ()s
          ..city = 'Santo Domingo'
          ..street = 'Proyecto');

  print(person.runtimeType);
  print(person); // 🤯🤯🤯🤯 It worked!!! I'M STARTING TO GET THIS DART STUFF
  print('');
}

// This class implicitly is an 'Object' subtype
class Person {
  final String name;
  final String surname;
  const Person(this.name, this.surname);

  @override
  String toString() => '$name $surname';

  String upperCaseName() => name.toUpperCase();
}

// Can't have two methods with the same name
// OK
class Exaample {
  void test1(int a) {}
  void test2(int a, int b) {}
}

// Compiler error
class Example2 {
  void test(int a) {}
  // void test(int a, int b) {} // the name 'test' is already defined
}

// Cascades
class Example3 {
  void one() => print('one');
  void two() => print('two');
  void three() => print('three');
  void four() => print('four');
}

class Example4 {
  String name = '';
  int age = 48;
  int compute() => 45;
  void printAll() => print('$name, $age');
}

class PersonBuilder {
  String name = '';
  AddressBuilder? address;

  @override
  String toString() => 'My name is $name and I live at $address';
}

class AddressBuilder {
  String city = '';
  String street = '';

  @override
  String toString() => 'Calle $street in $city';
}
