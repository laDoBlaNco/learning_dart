// ignore_for_file: unused_local_variable

/*5.1 - INHERITANCE

  Being that Dart is an OOP programming language, any class can inherit properties from
  another class. This bond creates a dependency where the "parent" class is called the
  SUPERCLASS and the "child" class is called the SUBCLASS. For example (class A,B, and C)

  In these examples the 'extends' keyword indicates that B is a subclass of A and C is
  a subclass of B. Dart DOES NOT ALLOW multiple inheritance. For exmaple the following 
  is a compile time error (classes D,E, and F)

  A class can have one or more superclasses along the hierarchy though, but only ONE can
  be the DIRECT parent. Aside from constructors, all members of a class can be overridden
  It is good practice to decorate the overridden member in a subclass with the @override
  annotation as I've seen from the beginning. For example (class G,H)

  Method overriding occurs when a subclass has the same method as the superclass. In this
  example, we're overriding the 'test' method in class H to give it a different implementation
  While 'this' gets a reference to the current class, 'super' gets a reference to the 
  superclass. For example, it could be used to call the superclass implementation of a
  method I'm actually overriding: (class I,J)

  In this example, the super.test(a) call invokes the superclass test(int) method and returns
  its value. In general, 'super' is used to access any member of the superclass. Both 'this'
  and 'super' have NO access to static members.

    NOTE: From Dart 2.9 onwards implicit up-casts are always allowed, but implicit down-
    casts are FORBIDDEN. For example: (classes A & B casting in main)

    Up-casting is a "safe" operation that casts a subytype into a supertype. Down-casting
    is "unsafe" since it's not guaranteed to always succeed and thus it requires type
    checks.
  
  Now with a general overview of how Dart supports inheritance I can dig a bit deeper.


*/

// superclass of 'B'
class A {}

// subclass of 'A' and superclass of 'C'
class B extends A {}

// subclass of 'C' (and, transitively, subclass of 'A' as well)
class C extends B {}

class D {}

class E {}

// class F extends D,E{}// Error: Each class def can have at most one extends clause

class G {
  double test(double a) => a * 0.5;
}

class H extends G {
  @override
  double test(double a) => a * 1.5;
}

class I {
  double test(double a) => a / 2;
}

class J extends I {
  @override
  double test(double a) {
    final original = super.test(a);
    return original *
        2; // remember that above I don't need the 'return' since => is
    // implicit 'return'
  }
}

void main() {
  final value = J().test(5);
  print('value = $value');
  print('');

  A a = A();
  // B b = a; // Error: A value of type  'A' can't be assigned to a var of type 'B'
  // the above was allowed from Dart 2.8 and older. From Dart 2.9 and newer its a error
}
