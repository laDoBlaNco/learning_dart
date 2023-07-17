// Operators

/* 
 * dart has a lot of the normal operators we are used to seeing
 * and some additional ones that I'm not used to. below is a 
 * quick list of them all:
 * Unary postfix      expr++  expr--  () [] ?[] . ?. !
 * Unary prefix       -expr !expr ~expr ++expr --expr await expr
 * Multiplicative     * / % ~/ (* assuming this is floor/integer division) 
 * Additive           + -
 * Shift              << >> >>>
 * Bitwise AND        &
 * Bitwise XOR        ^
 * Bitwise OR         |
 * Relational / Types >= > <= < as is is! (* some new ones here)
 * Equality           == !=
 * Logical AND        &&
 * Logical OR         ||
 * If null            ??  (* this one is new)  
 * Conditional        expr1 ? expr2 : expr3
 * Cascade            .. ?..  (* not sure what this one is) 
 * Assignment         = *= /= += -= &= ^= etc.
 * 
 */

// Operators in dart create expressions.

// So with operator precedance, each operator in the table above
// has higher precedence then the operator in the rows that follow
// it.

// OPERATOR PRECEDENCE:
// ()s improve readability - these are the same but one is harder to read
// if((n%i==0)&&(d%i==0)) ...
// if (n%i==0 && d%i==0) ... less ()s but more cognative effort

// ARITHMETIC OPERATORS:
// + Add
// - Subtract
// -expr Unary minus, also known as negation
// * Multiply
// / Divide
// ~/ Integer division
// % Modulo (remainder division)
// Examples in main

// PREFIX and POSTFIX OPERATORS:
// Dart supports both prefix and postfix increment and decrement
// Examples in main

// EQUALITY AND RELATIONAL OPERATORS:
/// lot of the norm here
/// == Equal - testing whether to objects represent the same thing. In the cases
///            where you need to know whether two objects ARE the exact same object
///            we should use 'identical()'
/// != Not equal
/// > Greater than
/// < Less than
/// > Greater than or equal to
/// <= Less than or equal to
/// (examples in main)

/** TYPE TEST OPERATORS
 * S we use 'as', 'is', 'is!' which are handy for checking types at runtime.
 * as -- typecasting (also used to specify library prefixes)
 * is -- true if object has the specified type interface
 * is! -- true if object doesn't have the specified type interface
 * 
 * 
 */
class Person {
  String firstName = '';
}
// Example of when to use 'as', if you are SURE that they object is a certain type:
// (employee as Person).firstName = 'Kevin';
// if you aren't sure then we can do the following using 'is':
// if(empoyee is Person){
//  // type check
//   employee.firstName = 'Kevin';
// }
// With the above, if employee is null or not a Person, then we get an error
// the second doesn't do anything in that case.

// ASSIGNMENT OPERATORS:
// we use = to assign and ??= to assign only if the var is null
// a = val;
// b ??= val; only if b is null it becomes val, otherwise its stays the same
// We also have typical compound assignment:
// +=, -=, *=, /=, ~/=, %=, <<=, >>=, >>>=, &=, ^=, |=

// LOGICAL OPERATORS:
// all the usual suspects: !expr inverts the bool expr, || or, && and

// BITWISE AND SHIFT:
// & and
// | or
// ^ xor
// ~expr unary bitwise complement (0s become 1s and 1s 0s) seems line inversion !
// << shift left
// >> shift right
// >>> unsigned shift right

// CONDITIONAL EXPRESSIONS:
// There are 2 operators that do conditional stuff to let us reduce the if/else
// statements. ?: and ??
// ?: is the simple ternary stuff we know and love 'condition ? expr1 : expr2'
// ?? is along the same lines as ??=. it returns expr1 if its non-null, otherwise we
//    get expr2. 'expr1 ?? expr2'
// so when should we use? If we are assigning an item based on a bool expr
// Or if we are testing for null with a bool expression.

// CASCADE NOTATION (.. or ?..) - not actually an operator but more just Dart syntax
// This is new to me. This allows us to make a sequence of operations on the same
// object. In addition to accessing instance memebers, we can also call instance
// methods on that same object. This saves us from having to create temp vars
// and allows us to write more fluid code. If the object we are working on
// is nullable than we use ?.. on  the first operation which guarantees that 
// none of the  cascade operations are attempted on that null object. 
// .. can also be nested.
// NOTE cascades only work on functions that return something. If you have a func
// that returns 'void' than it can't be cascaded
class Paint {
  String? color;
  String? strokeCap;
  num? strokeWidth;
}

// OTHER OPERATORS:
// some other operators for dart are:
// () for function calling or application
// [] for subscript access - indexing lists, etc
// ?[] for concditional subscript access - null safety with lists
// . for member access - referring to the property of an expr
// ?. for conditional member access - null safety for properties
// ! for null assertion - casts an expression to its underlying non-nullable type
// throwing a runtime error if the cast fails. Its basically tell Dart not to worry
// about the null-safety cuz we are sure it won't be null. If we are wrong it all
// explodes. 

////////////////////////////////////////////////////////////
// MAIN
////////////////////////////////////////////////////////////

void main() {
  print('MATH OPERATORS:');
  print(2 + 3 == 5);
  print(2 - 3 == -1);
  print(5 / 2 == 2.5); // result is a double
  print(12 ~/ 7 == 1); // Result is an int, and it doesn't round up
  print(5 % 2 == 1); // Remainder
  print('5/2 = ${5 ~/ 2} r ${5 % 2}');
  print('');

  print('POSTFIX AND PREFIX OPERATORS:');
  int a;
  int b;
  a = 0;
  b = ++a; // Increment a before b gets its value
  print(a == b);

  a = 0;
  b = a++; // Increment a after b gets its value
  print(a == b);

  a = 0;
  b = --a; // Decrement a before b gets its value.
  print(a == b);

  a = 0;
  b = a--; // Decrement a after b gets its value.
  print(a == b);
  print('');

  print('EQUALITY AND RELATIONAL OPERATORS');
  print(2 == 2); // true
  print(2 != 3); // true
  print(3 > 2); // true
  print(2 < 3); // true
  print(3 >= 3); // true
  print(2 <= 3); // true
  print('');

  print('TYPE TEST OPERATORS:');
  // print('kevin' is String);
  print('kevin' is int);
  print('kevin' is! int);
  // print('kevin' is! String);
  print('');

  print('ASSIGNMENT OPERATORS');
  String? kevin;
  String odalis = 'lorenzo';
  print(kevin); // null
  print(odalis); // lorenzo
  kevin ??= 'whiteside'; // since is null it takes the new value
  // odalis ??= 'whiteside'; // since its not null it doesn't take the new value
  print(kevin); // now whiteside
  print(odalis); // still lorenzo

  var c = 2; // assign using =
  print(c);
  c *= 3; // assign and multiply: c = c * 3
  print(c);
  print('');

  print('BITWISE AND SHIFT:');
  final value = 15; // 1111
  final bitmask = 6; // 0110
  print(value & bitmask); // 6
  print(value & ~bitmask); // 9
  print(value | bitmask); // 15
  print(value ^ bitmask); // 9
  print(value << 4); // 240
  print(value >> 4); // 0
  print(value >>> 4); // 0
  print(-value >> 4); // -1 not sure I get this one
  print(-value >>> 4); // 1152921504606846975 or this one.
  print('');

  print('CONDITIONAL EXPRESSIONS - OPERATORS');
  // bool isPublic = false;
  // var visiblity = isPublic ? 'public' : 'private';
  // print(visiblity);
  String? name; // this is null
  String playerName(String? name) => name ?? 'Guest'; // here we use ??
  print(playerName(name)); // so it returns 'Guest'
  // This could have been done in these longer ways:
  String playerName2(String? name) => name != null ? name : 'Guest';
  print(playerName2(name));
  String playerName3(String? name) {
    if (name != null) {
      return name;
    } else {
      return 'Guest';
    }
  }

  print(playerName3(name));
  print('');

  print('CASCADE NOTION:');
  var paint = Paint()
    // ?..color = 'black'
    ..strokeCap = 'round'
    ..strokeWidth = 5.0;
  print(paint);
}
