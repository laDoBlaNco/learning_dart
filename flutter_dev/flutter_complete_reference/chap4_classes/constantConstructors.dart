// ignore_for_file: unused_local_variable

/*4.2.3 - CONSTANT CONSTRUCTORS

  When all instance class variables don't need to change, I should make them all final
  and add a constant constructor. For example Point1.

  A Dart class is said to be IMMUTABLE when it has a const constructor and all of its
  instance variables are 'final' (See the point class, for example). To create a
  compile-time constant object, I must use the const keyword before the constructor's
  name; otherwise, I would create a normal, non-const object. For example in main

  Note, the compiler NEVER automatically uses a constant constructor. If I want to use
  it, I must EXPLICITLY write down the 'const' keyword before its assignment. I don't 
  need to repeat the keyword twice because its automatically deduced. for example
  (constVariable1 and constVariable2)

  I can of course use 'var' or 'final' and invoke a constant constructor of an object
  (if any), but it will not make those variables constant too. For example (notConstVariable1
  and notConstVariable2)

  In this case, both variables hold a reference to a constant object, but the variables 
  themselves are not constant. No real valid  use-case where a non-constant 
  variable is initialized with a const constructor. When a constant constructor is 
  available, its recommended to ALWAYS initialize the variable with 'const'.
  For example (notConstVar1, notConstVar2, constant)

  Of course, a constant constructor can only be initialized with const values. 
  (main x and y)

  In general, I should always try to add a 'const' constructor to my class, if that's
  possible, so that the compiler can make some optimizations. For example, consider
  this case where I have a class with a constant constructor (Example)

  The comparison between one and two returns false since the equality operator (by
  default) checks if the two variables hold a reference to the same object. However,
  look what happens when I compare the same class but with two constant objects (Example2)

  Constant objects are created only once and then stored in a special lookup table by 
  the compiler for reuseability. In this example, three and four reference the SAME
  object in memory, so the comparison will always return true. I can see this myself
  using the 'identical method.

  The identical method, part of the Dart SDK, checks if two variables reference the 
  same object in memory. Since it returns true, I can see tha the three and four 
  variables point to the same object. 

    NOTE: Compile-time constants are CANONICALIZED and re-used as much as possible. 
          For example, it doesn't matter how often I call const Example2(1) since 
          that object will be created only ONCE (and then reused). Different 
          configurations produce different constant objects. For example:

            const one = Example2(1);
            const two = Example2(1);
            const three = Example2(3);

          In this case, one and two hold a reference to the same object on the heap.
          three instead holds a reference to another constant object since Example2
          was built with a different configuration there (I passed 3 instead of 1)

  When I don't define a constructor, the compiler generates a default one (with no
  parameters) that is NOT constant. In this case, I should define a constant constructor
  rather than create a class without a constructor. For Example (Bad and Good)

  Other than a consistent equality behavior, constant objects also bring in other 
  advantages: less memory cluttering, possibility of imposing a meaningful sorting
  order (generally on collections) and improvements in the efficiency of various
  algorithms by eliminating repeated calculations.
*/
class Point1 {
  final double x;
  final double y;

  const Point1(this.x, this.y); // constant constructors must have NO body
}

class Example {
  final int value;
  Example(this.value);
}

class Example2 {
  final int value;
  const Example2(this.value);
}

// Has a default, non-constant constructor
class Bad {}

// Has a const constructor and so it can become a compile-time constant
class Good {
  const Good();
}

void main() {
  // OK - the variable is 'const' and it automatically calls the constant
  // constructor of 'Point1'
  const constVariable = Point1(1, 5);

  // WARNING - The variable is NOT 'const' and the constant constructor is
  // NOT called
  final notConstVariable = Point1(1, 5);

  // OK
  const constVariable1 = Point1(1, 5);

  // OK but the 'const' in front of Point1 can be removed (its redundant)
  const constVariable2 = const Point1(1, 5);

  var notConstVariable1 = const Point1(1, 5);
  final notConstantVariable2 = const Point1(1, 5);

  // Bad
  var notConstVar1 = const Point1(1, 5);
  final notConstVar2 = const Point1(1, 5);

  // Good
  const constant = Point1(1, 5);

  const x = 1.0;
  final y = 1.0;
  const Point1(x, 10); // OK, x is 'const'
  // const Point1(x, y); // Error: Arguments of a constant creation must be constant expressions

  final one = Example(1);
  final two = Example(1);

  print('');
  print(one == two);
  print('');

  const three = Example2(1);
  const four = Example2(1);
  print(three == four);
  print(identical(three, four));
  print('');
}
