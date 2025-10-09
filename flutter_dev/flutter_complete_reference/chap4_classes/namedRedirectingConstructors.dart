// ignore_for_file: unused_element

/*4.2.4 - NAMED AND REDIRECTING CONSTRUCTORS

  Since Dart has no method overloading, I have to use named constructors if I want
  to create multiple constructors for the same class. They are in a 

    ClassName.name(parameter?) form. Here's an example (Fraction)

  Constructords can be NAMED, such as Fraction.zero or Fraction.whole, or UNNAMED such
  as Fraction (which is also knows as 'default constructor'). Named constructors allow
  classes to hav as many constructors as they want. they are also used to create library-
  private constructors, which make a class IMPOSSIBLE to be instantiated.(Example) Which is why
  they are used for singletons in combination with factory constructors

  This syntax makes  the class impossible to be instantiated since it hides the default
  Example() constructor. If I declare another named constructor, i could use it 
  instead (Example2).

  Named constructors can of course have a body as well. Both generative and factory 
  constructors can be named or unnamed. for example: (Constants)

  This is another common use-case for factory constructors: they create instances of a
  class with a PARTICULAR CONFIGURATION. If Constants was a supertype, the factory 
  constructor could also return an object whose type is a subtype of Constants

  A REDIRECTING constructor is generally used when my class has multiple constructors
  that share the same internal implementation but require a different name. For example:
  (Fraction2)

  In this case, Fraction.oneHalf() is just another way of calling Fraction(1,2). They 
  are called "redirecting" since their behavior is "redirected" to antoher already
  existing constructor. The only case where a factory constructor can be const is when
  it's a redirecting one. I'll see an example of this use-case in chapter 5 - Section 1.8
  "Good practices".

  NOTE - Redirecting constructors CANNOT have a body.
*/
import 'dart:math';

class Fraction {
  final int num;
  final int den;

  // default (or unnamed) constructor
  const Fraction(this.num, this.den);

  // Named constructors (note I can have more than one.)
  const Fraction.zero() : num = 1, den = 0;
  const Fraction.whole(this.num)
    : den = 1; // Note a mix on initialization formal and list
}

class Example {
  // NOTE the '._()' syntax
  const Example._();
}

class Example2 {
  const Example2._();
  const Example2.named();
}

class Constants {
  final double value;
  final String name;

  const Constants({required this.value, required this.name});

  factory Constants.euler() =>
      Constants(value: e, name: 'Euler constant'); // e - dart:math
  factory Constants.pi() => Constants(value: pi, name: 'PI');
}

class Fraction2 {
  final int num;
  final int den;
  const Fraction2(this.num, this.den);

  // a named constructor
  const Fraction2.whole(this.num) : this.den = 1;

  // redirecting constructors
  const Fraction2.oneHalf() : this(1, 2);
  const Fraction2.one() : this.whole(1);
}
