// ignore_for_file: unused_local_variable

/*2.2 DATA TYPES

  In most cases, Dart types can be initialized with LITERALS, such as 'true'
  (a bool literal), 19 (an integer literal), or 'Hello Dart' (a String literal).
  In chapter 6 - 'Generics and collections', I'll cover generic types used for 
  containers likes lists and maps. In chapter 5 - section 2.2 'Records' I'll
  see records (particular data types that map to classes). Haven't worked with 
  those yet 🤔

  NUMBERS

  In Dart, there are only two types that represent numbers:

    ▪ int: On the web, integers are represented using JS, so value range from
      -2^53 to 2^53-1. On native platforms instead, values can range from
      -2^63 to 2^63-1

    ▪ double: Double precision, 64-bit floating point numbers that follow the 
      popular IEEE 754 standard

  Both int and double are classes/types that descend or extend from num, an abstract
  supertype/class that includes various operators and basic math functions such as
  abs(), floor(), ceil(), round() and much more. Note that int and double are ALSO 
  abstract types, because the compiler provides their concrete implementation
  according to the platform for which the application was built.

      Object ==> num ==> double ==> native double
                 num ==> int ==> native int

  For native targets (mobile and desktop), int is a a 64-bit int an double is
  a 64-bit IEEE floating point number. On the web, Dart interoperates with JS
  and so in both cases the 64-bit IEEE format is used. num, double, and int
  can't be extended or implemented by regular Dart classes

    ▪ NOTE These implementation details are handled internally by the compiler
      so I shoudln't worry about them. Just need to remember that integers and
      floating point values are platform specific for performance and size
      reasons.
*/

void main() {
  // as seen, integers are inferred from literals without decimal points:
  final a = 1;
  final b = 0xa5;
  final c = -3e5;

  // The hexadecimal representation is prefixed with 0x. Whenever a number includes
  // a decimal, then it's treated as a double:
  final e = 7.63;
  final f = 1.5e-1;

  // i can also declare variables usign num and, since its the supertype of ints and doubles
  // it can hold BOTH values:
  num g = 12.534;
  print(g.runtimeType);

  g = 6;
  print(g.runtimeType);
  print('');

  /*But the recommendation is to stick with int and double, even better, using type
    inference with final/var to let the compiler resolve types. Literals are compile-time
    constants, and they produce constant expressions as well:
  */
  const h = 10.5;
  const i = 12;
  const j = h * i; // 'j' is const too

  const k = 10.5;
  final l = 12;
  // const m = k * l;//Error: const varaible must be initialized with a const value

  /*So in the second block, since l isn't a constant, the result of the operation
    cannot be determined at compile-time, being that its final which is a run-time
    assignment/initialization, and so 'm' can't be a const. The type inference machinery
    never infers num; it always assigns either int or double.
  */
}
