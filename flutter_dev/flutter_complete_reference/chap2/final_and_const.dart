/*2.1.1 FINAL AND CONST
*/

void main() {
  /*2.1.1 FINAL AND CONST

    When I know that the value of a variable is NOT going to change over time, I should 
    use 'final' instead of 'var'. So determining factor is if its going the change or be
    constant. 

    If the value of the varible will never change AND it can be determined at compile-time,
    prefer the 'const' keyword. Let's see some examples
  */

  print('===2.1.1 final and const===');
  // When using 'var', the value of the variable can be changed, but NOT THE TYPE
  var age = 18;
  var isBirthday = true;
  if (isBirthday) {
    age = 19;
    // age = '19'; // Error: value of type String can't be used
  }
  print(age);
  print('');

  // When using final, the value of teh varible can't be changed
  final age2 = 18;
  if (isBirthday) {
    // age2 = 19; // Error: final variable can only be set once
    // age2 = '19'; // Error: final variable can only be set once
  }
  print(age2);
  print('');

  // when using const, the value of the variable can't be changed AND it must be
  // a compile-time constant value (such as a number, a string, or an enum)
  const age3 = 18;
  final newAge = 19;

  if (isBirthday) {
    // age3 = 19;  //Error: constant  variables can't be assigned a value after initialization
    // age3 = newAge; // Error: constant variables can't be assigned a value after initialization
  }

  print('$age3 and $newAge');
  print('');

  /*In any case, thanks to Dart's strong typing system, after I assign the type to a 
    variable it will never change. A const variable is implicitly final too. Most of 
    the time, I will be using either 'var' or 'final'. The static analysis tools 
    (or the IDE) will produce warnings to remind me to prefer one over the other 

    NOTE: final doesn't provide any performance benefit when compared to var. They
          do the same thing, with the only difference that the former disallows
          re-assigning the variable. So there's no benefit to me trying to only use
          final everywhere, when it makes sense to use var.

    I can also explicitly write down the type of varible when using const, final, or
    even var 🤯. This is useful when I want to 'override' the default type-inference
    rules of the compiler. for example:
  */
  const integer = 18;
  const double notInteger = 18;
  print(integer.runtimeType.toString());
  print(notInteger.runtimeType.toString());
  print('');

  /*Here the compiler is smart enough to figure out that 18 is a whole number so the int 
    type fits perfectly. The const double syntax instead disables type inference and 
    tells the compiler the exact type I want to use. The 'runtimeType' property (since
    it's inherited from Object) is available for any and all types and gives information
    about the runtime type of a variable. I can obtain the same output with a small
    trick:
  */
  const integer2 = 18;
  const notInteger2 = 18.0; // note the .0 at the end
  print(integer2.runtimeType.toString());
  print(notInteger2.runtimeType.toString());
  print('');

  /*Here the compiler treats 18 and 18.0 diffently because, in the second case, there is
    a decimal digit (the zero) and thsue the value doesn't fit int an int anymore. Since
    18 is a literal an dalso a compile-time constant, I used const but final would have
    worked as well */

  final integer3 = 18;
  final double notInteger3 = 18;
  print(integer3.runtimeType.toString());
  print(notInteger3.runtimeType.toString());
  print('');

  /*Since const values are also final, constant values can be assigned to final variables
    However, a final value can't be assigned to a const variable. For example
  */
  const constVal = 1;
  final finalVal = constVal; // this is ok
  print(finalVal);

  final finalVal2 = 1;
  // const constVal2 = finalVal2; //Error: const variable must be initialized with a const value
  print(finalVal2);
  print('');

  /*In other words, cosnt is a stricter version of final. From all of the information
    I've covered up until now, I want to underline the most important parts to
    remember:

      ▪ If the value is never going to change, prefer initializing variables using 
        const (for compile-time values) or final (for non-compile-time values). When
        possible, use const because its more efficient than final (I'll see that in more
        detail in Chapter 4 - Section 2.3 "Constant constructors")

      ▪ If the value may change after its intialization, use var

      ▪ When using var, final and const I can still manually define the type to "disable"
        the type-inference machinery and assign the type I want

    Now moving on to talk about variable initialization and null safety
  */
}
