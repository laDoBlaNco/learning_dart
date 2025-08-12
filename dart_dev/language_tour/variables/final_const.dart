// ignore_for_file: unused_local_variable, unnecessary_type_check

/*
  FINAL AND CONST

  If you never intend to change a variable, use 'final' or 'const', either
  instead of 'var' or in addition to a type. A final variable can be set
  only once; a const variable is a compile-time constant. (Const variables
  are implicitly final).

  NOTE: instance variables can be final but not const.

  Let's look at some examples of creating and setting a final variable

*/

void main() {
  final name = 'Kevin'; // without a type annotation
  final String nickname = 'Ladoblanco';

  // you can't change the value of a final variable
  // name = 'Alice'; // error: a final variable can only be set once.

  /*
  Use const for variables that you want to be compile-time constants. If the
  const variable is at the class level, mark it 'static const'. Where you 
  declare the variable, set the value to a compile-time constant such as a
  number or string literal, a const variable, or the result of an arithmetic
  operation on constant numbers
*/

  const bar = 1000000; // unit of pressure (dynes/cm2)
  const double atm = 1.01325 * bar; // standard atmosphere

  /*
  Now the const keyword isn't just for declaring constant variables 🤔
  You can also use it to create constant values, as well as to declare 
  constructors that create constant values. Any variable can have a constant
  value
*/

  var foo = const [];
  final bar2 = const [];
  const baz = []; // equivalent to 'const []'

  // we can also omit const from the initializing expression of a const
  // declaration, like for baz above.
  // You can change the reference of a non-final, non-const variable, even if
  // it used to have a const value:
  foo = [1, 2, 3]; // this was const [] but we can still change it

  // baz = [42]; // this is an error since we declare baz directly as a const

  // we can also define constants that use type checks and casts (is and as),
  // collection if, and spread operators (... and ...?)

  const Object i = 3; // where i is a const Object with an int value ...
  const list = [i as int]; // use a typecast
  const map = {if (i is int) i: 'int'}; // use 'is' and collection if.
  const set = {if (list is List<int>) ...list}; // ...and a spread
  // so the collection if seems to be like the collection comprehensions

  // NOTE: Although a final object can't be modified, its fields can be changed
  // In comparison, a const object and its fields can't be changed: they're 
  // immutable.
}
