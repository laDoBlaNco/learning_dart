// ignore_for_file: unused_local_variable

/*4.2.2 - FACTORY CONSTRUCTORS AND STATIC MEMBERS 

  The 'static' keyword declares class variables or class methods. All instances share
  the SAME static members because they are similar to global variables, but of
  the class. For example: (Fraction1)

    NOTE: For the first example in order to clear a compiler error I had to make the 
          constructor a const constructor otherwise it wouldn't let me use it for
          my static const zero. But making the constructor const, I then had to 
          set both parameters as 'final' since I can't have a const constructor unless
          its params are also const or final.

  Notice in Fraction1 that printZero() is not called from an object instance; it's 
  invoked directly from the class type itself. Consequntly, a static member does
  NOT have access to 'this'. an object instance cannot access static memebers. 
  For example (Example1)

  In our exaample, value can only be accessed from the type itself (Example1.value) 
  and not from instances (example1.value). However, non-static members of a class
  (such as printValue) can read static content.

  A FACTORY constructor is very similar  to a static method 🤔, and thus has no access
  to 'this'. It's used when I need to implement a constructor that doesn't always create
  a new instance. For example, an excellent use-case for a factory constructor is the
  implementation of a singleton: (Singleton1)

  Factory constructors are prefixed with the factory keyword and are used as any other
  constructor. The Singleton1._() syntax creates a library-private constructor (I'll see
  that later in Section 2.4 - "Named and redirecting constructors"). The syntax to call
  a factory constructor is the same I would use for any other constructor.

  Here I'm calling the factory constructor of the Singleton1 class. It doesn't always
  create a new Singleton1 object: it only does once, and then it always returns the
  same instance. In Section 2.5 - "Good practices" I'll see another case where factory
  constructors are useful.
*/
class Fraction1 {
  final int num;
  final int den;

  const Fraction1(this.num, this.den);

  static const ZERO = Fraction1(0, 1);
  static void printZero() {
    print('num = ${ZERO.num}, den = ${ZERO.den}');
  }
}

class Example1 {
  // static members can be placed anywhere in the class
  static int value = 0;

  Example1();
  void printValue() => print('$value');
}

class Singleton1 {
  static final _instance = Singleton1._();
  factory Singleton1() => _instance;

  Singleton1._(); // library-private constructor
}

void main() {
  // 'zero' holds 'Fraction1(0,1)'
  const zero = Fraction1.ZERO;

  // prints 'num = 0, den = 1'
  Fraction1.printZero();
  print('');

  Example1.value = 10;

  final example1 = Example1();
  final example2 = Example1();

  // both print '10'
  example1.printValue();
  example2.printValue();
  print('');

  // example1.value = 0; // Error: The static setter 'value' can't be accessed through
  // an instance.

  final singleton = Singleton1();
  final singleton2 = Singleton1();
  final singleton3 = Singleton1();
  // No matter how many times I run it, 'Singleton()' only returns the same _instance
  // that was created, not a new one since it was static and final
}
