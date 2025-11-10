/*5.1.3 - INTERFACES

  By default, an Dart class can be used as an interface. This may seem a bit weird
  at first, but I'll quickly get used to it. In chapter 7 - section 1 "Class modifiers"
  I will see how to restict a class to be ONLY used as an interface. As a good practice,
  It is recommended using abstract classes to create interfaces. 
  For example (MyInterface):

  The 'implements' keyword, differently from 'extends', forces Example to override
  ALL members of MyInterface (abstract and non-abstract ones). Furthermore, a class
  is allowed to implement one or MORE interfaces. I could have gotten the same result
  using a regular class, but it's generally not recommended to do so. (MyInterface2):

  Since MyInterface2 is a concrete class, I need to give 'method()' an empty body and
  the getter must return something too. Interfaces should only provide the method 
  signature and don't care about the implementation. This example compiles but it 
  feels wrong since the class I'm using as an interface has members with a body, 
  which goes against the nature of an interface.

    GOOD PRACTICE:
    Interfaces are sort of "templates" used to define how the structure of a class should
    be. For this reason, it's recommended that an interface shouldn't be instantiated and
    thus I should prefer abstract classes over regular classes. 

  It's also very important to keep in mind that 'extends' only allows single superclass,
  since Dart doesn't support multiple inheritance. When using 'implements' I have no 
  such limitation and I can implement as many classes as I want. For example (Interface2,
  Interface2,Example3): 

  Now a class can also use both 'extends' and 'implements' together, but THE ORDER in 
  which they are declared DOES matter. For example: (Example4 and 5)

  When using 'implements' on a class, constructors do not matter because I need to 
  override all public members EXCEPT constructors

*/

// this abstract class is used as an interface
abstract class MyInterface {
  void method();
  int get getter;
}

// to treat a class type as if it was an interface, I need to use the 'implements'
// keyword
class Example implements MyInterface {
  @override
  void method() {}

  @override
  int get getter => 10;
}

class MyInterface2 {
  void method() {}
  int get getter => 0;
}

class Example2 implements MyInterface2 {
  @override
  void method() {}

  @override
  int get getter => 10;
}

abstract class Interface1 {
  void method1();
}

abstract class Interface2 {
  void method2();
}

class Example3 implements Interface1, Interface2 {
  @override
  void method1() {}

  @override
  void method2() {}
}

// this is OK, extend first and the implement
class Example4 extends Interface1 implements Interface2 {
  @override
  void method1() {}
  void method2() {}
}

// But this is an ERROR - The 'extends' clause must be before the implements clause
// class Example5 implements Interface2 extends Interface1{
//   @override
//   void method1(){}
//   void method2(){}
// }