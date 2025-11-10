/*5.1.2 - ABSTRACT CLASSES

  Abstract classes, declared with the 'abstract' keyword, can ONLY be instantiated
  by a subclass. They can contain abstract methods, getters, or setters. For 
  example (Example):

  The 'abstract' keyword can ONLY be used in the class definition; abtract methods and
  getters have no body. In this example, SubExample is said to be a CONCRETE class 
  since it overrids all of the superclass' abstract methods. If I have an abstract
  superclass and I don't override all of its abstract members, my subclass must be
  'abstract' as well (Example2):

  If I don't use 'abstract' with SubExample2 I get an error stating that my class 
  isn't concrete and it tells me what's missing. In this case, SubExample2 must be
  an abstract type since I don't override all abstract methods of the superclass. 
  If I continued to extend the hierarchy, I would have to override the remaining
  abstract members to create a concrete class (ConcreteExample2):

  The 'ConcreteExample' type is a CONCRETE class because it inherits the processValue()
  definition from its superclass and it also overrides the 'value' getter. Constructors
  CANNOT be abstract.

*/

abstract class Example {
  void processValue(); // This is an abstract method as it has no body
  int get value; // this is an abstract getter (method) as it has no body
}

class SubExample extends Example {
  @override
  void processValue() => value * 2;

  @override
  int get value => 10;
}

abstract class Example2 {
  void processValue();
  int get value;
}

abstract class SubExample2 extends Example2 {
  @override
  void processValue() => value * 2;
}

class ConcreteExample2 extends SubExample2 {
  @override
  int get value => 10;
  // Note that I only have to complete one of the methods since the other is already
  // concrete above and I'm extending SubExample2 and not Example2
}
