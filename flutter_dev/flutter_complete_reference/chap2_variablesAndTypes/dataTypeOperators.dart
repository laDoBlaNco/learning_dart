// ignore_for_file: unused_local_variable

void main() {
  /*2.3 - DATA TYPE OPERATORS

  Dart builds expressions using operators, such as + and -, on primitive data
  types. The language also supports operator overloading but I'll see that in 
  chapter 4 - "Classes"

  2.3.1 - ARITHMETIC OPERATORS

  Arithmetic operators are commonly used on ints or doubles to build numerical
  expressions. They may also be use somewhere else, as it happens with the operator
  + to concatenate strings.

      SYMBOL === MEANING === EXAMPLE

      + === Add two values === 2+3 // 5
      - === Subtract two values === 3-5 // -2
      * === Multiply two values === 6*3 // 18
      / === Divide two values === 9/2 // 4.5
      ~/ === Integer division of two values === 9~/2 // 4
      % === Remainder (modulo) of an int division === 5%2 // 1

  Prefix and postfix increment or decrement operators work as I'm used to seeing in 
  the most popular programming languages:
*/

  print('===Arithmetic Operators ===');
  var a = 10;
  print(++a);
  print(a++);
  print(a);
  print('');

  var b = 5;
  print(--b);
  print(b--);
  print(b);
  print('');

  var c = 6;
  print(c += 6);

  // print(a++++); // Error: Illegal assignment. Postfix operators can't be chained
  // print(++++a); // Error: Illegal assignmet. Prefix operators can't be chained

  /*The prefix operator (++a) first increments the value and then returns it, but
    the postfix (a++) operator returns the value immediately and increments it 
    after
  */

  /*2.3.2 - RELATIONAL OPERATORS

    Equality and relational operators are used in boolean expressions, which are 
    generally found in if,for,or while statements, which will be covered in the next
    chapter

        SYMBOL === MEANING === EXAMPLE

        == === Equality test === 2==6 // false
        != === Inequality test === 2!=6 // true
        > === Greater than === 2>6 // false
        < === Less than === 2<6 // true
        >= === Great than or equal to === 2>=6 // false
        <= === Less than or equal to === 2<=6 // true

    The operator == logic only works with objects of the same type. A warning is 
    emitted when I try to compare two objects with unrelated types
  */

  /*2.3.3 TYPE TEST OPERATORS

    These operators are used to make runtime checks on object instances

        SYMBOL === MEANING === EXAMPLE
        
        as === Cast to another type === obj as String
        is === True if the object is aa specific type === obj is String
        is! === True if the object isn't of a specific type === obj is! String

    The as operator performs a CAST, so it returns a new type, but is and is! make
    a CHECK, so they return a bool
  */

  /*2.3.4 - LOGICAL OPERATORS

    Logical operators are commonly used inside if statements to create bool expressions

        SYMBOL === MEANING === EXAMPLE
        ! === Changes true to false and vice versa === !true // false
        && === Returns true if both sides are true === true&&true // true
        || === Returns true if at least one side is true === true||false // true

    Keep in mind that the ! operator could be used in two completely different cases:

    ▪ When used IN FRONT of a BOOL variable, it returns the negation

    ▪ When used AFTER a NULLABLE varible, it tries to cast it (at runtime) to a
      non-nullable type (like disabling null safety and telling the compiler, "Don't
      worry, I know what I'm doing. This isn't null")
  */
  const isEven = 20 % 2 == 0;
  const isOdd = !isEven;

  int? value = 1;
  int newValue = value!;

  // Even if they confused, the analyzer will help me remember the difference

  /*2.3.5 - BITWISE AND SHIFT OPERATORS

    Unless I'm working with bit manipulation or low-level code, I'll hardly ever
    need to use these operators (but great to know that Dart has me covered at that
    level as well 🤓🤓🤓). Bit manipulation should always be documented because
    long-series of low-level operations are hard to read and understand

        SYMBOL === MEANING === EXAMPLE
        & === AND === 0xf & 0xa // 10
        | === OR === 0xf | 0xa // 15
        ^ === XOR === 0xf ^ 0xa // 5
        ~ === AND === ~0xf // -16
        << === Shift left (SHL) === 0xac << 2 // 2b0
        >> === Shift right (SHR) === 0xac >> 2 // 2b
        >>> === Triple (SHR) === 42 >>> 2 // a
  */

  /*2.3.6 - COMPOUND ASSIGNMENT OPERATORS

    Compound assignment operators are used to perform an action and return a result
    at the same time. For example, the *= operator multiplies the left and right values
    storing the result on the left variable

        SYMBOL === MEANING === EXAMPLE

        += === Sum and assign === var a=2; a+=2; // a = 4
        -= === Subtract and assign === var a=2; a-=2 // a = 0
        *= === Multiply and assign === var a=2; a*=2 // a = 4
        /= === Divide and assign === var a=5.0; a/=2 // a = 2.5
        ~/= === Integer divide and assign === var a=5.0;a~/=2 // a=2
        %= === Remainder and assign === var a=5; a%=2; // a = 1.0
        ??= === Assign only when null === int? a; a??=10; // a = 10

    In addition to the operators above, there are also bitwise  compound assignment 
    operators that workt he same way
  */
  var aaa = 0x3;
  // double shift
  aaa <<= 0xea;
  print(aaa);
  aaa >>= 0xea;
  print(aaa);

  aaa >>>= 0x1;
  print(aaa);

// These operators can't be used on const or final variables
}
