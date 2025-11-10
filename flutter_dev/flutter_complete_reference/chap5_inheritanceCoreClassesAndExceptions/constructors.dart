// ignore_for_file: unused_field, unused_local_variable

/*5.1.1 - CONSTRUCTORS

  I already know that, when a Dart class doesn't define a constructor, the compiler will
  automatically generate a default one with no params. The same thing also happens along
  a class hierarchy. Remembering that the generated constructor is NOT a constant one:

    What I write:

      class A{}

      class B extends A{}

    What the compiler actually does:

      class A{
        A();
      }

      class B extends A{
        B() : super(); // automatically creating a constructor for B that forwards to super
      }

  The compiler automatically adds constructors to the classes along the hierarchy because
  I didn't define them. However, when the superclass DOES have a constructor, I must
  reference it using 'super' in the initializing format (class Example)

  Note that 'super' calls always go last in the initializer list order. If I had assignments
  or assertions, they MUST be declared  before 'super' otherwise the compiler will throw
  an error. (AnotherSubExample):

  If the superclass defined a lot of instance members, there would be a lot of repetitions.
  The same variable would have to be declared in the construtor and the initializer list.
  For example: (Example2 & SubExample2)

  Notice the repetition of a,b,c a lot of times. To solve this issue and make the code 
  shorter, I can directly use the super in the parameter list. For example, (AnotherSubExample2)

  The syntax has no performance implications, it's just a syntactic sugar. A subclass can
  define a constant constructor ONLY if the superclass already has one. The 'constness'
  of a construtor is NOT inherited along the hierarchy. For example (Example3)

  The compile-time error is caused by the fact that SubExample3 doesn't define a const 
  constructor. To make the example work, I would need to add 'const' to the subclass.

  If a superclass does NOT have a const constructor, then the subclass is NOT allowed
  to define a constant constructor. Since constructor bodies are always executed after
  the initialization phase, I can't call the super-constructor from there. 

    This is OK:

      SubExample(super.a);
      SubExample(int a) : super(a);

    This is NOT:

      SubExample(int a){
        super(a);
      }

  If Dart allowed calling a super-constructor from bodies, ti would have no way to fully
  initialize the object when created. Of course, I can invoke named or redirected 
  constructors of a superclass using the same notation. For example (Example4):

  The only exception tot hat is that I can't call a 'factory' constructor using 'super'.
*/

class Example {
  final int value;
  Example(this.value);
}

class SubExample extends Example {
  SubExample(int value)
    : super(value); // calling 'super' explicitly with fwd'd arg
}

// class AnotherSubExample extends Example {
//   int _doubleValue;
//   AnotherSubExample(int value)
//     : _doubleValue = value * 2,
//       super(value), // 'super' call must be last - ERROR
//       assert(value >= 0, 'Value must be positive');
// }

class Example2 {
  final int a;
  final double b;
  final String c;
  const Example2(this.a, this.b, this.c);
}

class SubExample2 extends Example2 {
  // a lot of repetition here for types and var names
  const SubExample2(int a, double b, String c) : super(a, b, c);
}

class AnotherSubExample2 extends Example2 {
  const AnotherSubExample2(super.a, super.b, super.c); // 🤯
}

class Example3 {
  final int value;
  const Example3(this.value);
}

class SubExample3 extends Example3 {
  SubExample3(super.value);
}

class Example4 {
  final int value;
  const Example4.zero() : value = 0;
}

class SubExample4 extends Example4 {
  const SubExample4() : super.zero();
}

void main() {
  // this one is OK
  const example = Example3(10);

  // This throws an error since SubExample3 doesn't inherit the 'constness' of Example3
  // const subExample3 = SubExample3(10); // Error: The constructor being called isn't a
  // const constructor.
}
