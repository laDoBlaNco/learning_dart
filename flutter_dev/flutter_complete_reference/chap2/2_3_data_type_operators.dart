/*2.3 DATA TYPE OPERATORS
Dart builds expressions using operators, such as + and -, on primitive data types. The
language also supports operator overloading but I'll see that in chapter 4 - "Classes".

2.3.1 ARITHMETIC OPERATORS
Arithmetic operators are commonly used on int or double to build numerical expressions.
They may also be used somewhere else, as it happens with operator + to concatenate strings.

    +   <=>   Add two values                          <=>   2 + 3
    -   <=>   Subtract two values                     <=>   3 - 5
    *   <=>   Multiply two values                     <=>   6 * 3
    /   <=>   Divide two values                       <=>   9 / 2
    ~/  <=>   Integer division of two values          <=>   9 ~/ 2
    %   <=>   Remainder (modulo) of an int division   <=>   5 % 2

Prefix and postfix increment or decrement operators work as expected and as seen in
most other languages:
*/
void main() {
  var a = 10;
  ++a;
  a++;
  print(a);

  var b = 5;
  --b;
  b--;
  print(b);

  var c = 6;
  c += 6;
  print(c);
  print('');

  // postfix and prefix operators cannot be chained.

  /*The prefix operator (++a) first increments the value and then returns it, but the
  postfix (a++) operator returns the value immediately and increments it afterward.

  2.3.2 RELATIONAL OPERATORS
  Equality and relational operators are used in boolean expressions, which are generally
  found in if, for, or while statements, which will be covered in the next chapter.

      ==    <=>   Equality test             <=>   2 == 6
      !=    <=>   Inequality test           <=>   2 != 6
      >     <=>   Greater than              <=>   2 > 6
      <     <=>   Less than                 <=>   2 < 6
      >=    <=>   Greater than or equal to  <=>   2 >= 6
      <=    <=>   Smaller than or equal to  <=>   2 <= 6

  The operator == logic only works with objects of the same type. A warning is
  emitted if I try to compare two objects with unrelated types.

  2.3.3 TYPE TEST OPERATORS
  These operators are used to make runtime checks on object instances:

      as    <=>   Cast to another type                        <=>   obj as string
      is    <=>   True if the object is of a specific type    <=>   obj is String
      is!   <=>   True if the object isn't of a specific type <=>   obj is! String

  The as operator performs a CAST, so it returns a NEW TYPE, but is and is! make a
  CHECK, so they return a boolean value.

  2.3.4 LOGICAL OPERATORS
  Logical operators are commonly used inside if statements to create boolean expressions.

      !     <=>   Changes true to false and vice versa    <=>   !true
      &&    <=>   Returns true if both sides are true     <=>   true && true
      ||    <=>   Returns true if at least one is true    <=>   true || false

  Now I need to keep in mind that the ! operator could be used in two completely
  different cases:

       • When used in front of a boolean variable, it returns the negation: 
  */
  const isEven = 20 % 2 == 0;
  const isOdd = !isEven;
  print(isEven);
  print(isOdd);
  print('');

  //  • When used after a nullable variable, it tries to cast it (AT RUNTIME) to a
  //    non-nullable type:
  int? value;
  value = 1;
  int newValue = value;
  print(newValue);
  // (seems like this is an issue of Dart's analyzer automatically promoting the
  // nullable to non-nullable. I'm not 100% sure why its doing it here, but it is.🤔🤔🤔
  // maybe since its a literal assignment. regardless, the author's explanation of what
  // should happen is off.)

  /*2.3.5 BITWISE AND SHIFT OPERATORS
  Unless I need to work with bit manipulation ro low-level code, I'll probably hardly
  use these in the wild, but its good to know them. Bit manipulation should always be
  documented because long-series of low-level operatiosn are hard to read and understand.

      a & b   <=>   AND               <=>   0xF & 0xA
      a | b   <=>   OR                <=>   0xF | 0xA
      a ^ b   <=>   XOR               <=>   0xF ^ 0xA
      ~       <=>   AND               <=>   ~0xF
      a << b  <=>   Shift left (SHL)  <=>   0xAC << 2
      a >> b  <=>   Shift right (SHR) <=>   0xAC >> 2
      a >>> b <=>   Triple SHR        <=>   42 >>> 2

  2.3.6 COMPOUND ASSIGNMENT OPERATORS 
  Compound assignment operators are used to perform an action and return a result
  at the same time. For example, the *= operator multiplies the left and right values
  storing the result on the left variable.

      +=    <=>   Sum and assign              <=>   a += 2
      -=    <=>   Subtract and assign         <=>   a -= 2
      *=    <=>   Multiply and assign         <=>   a *= 2
      /=    <=>   Divide and assign           <=>   a /= 2
      ~/=   <=>   Integer divide and assign   <=>   a ~/= 2
      %=    <=>   Remainder and assign        <=>   a %= 2
      ??=   <=>   Assign only when null       <=>   a ??= 10

  In addition to the the operators above, there are also bitwise compound assignment
  operators that work in the same way. 
  These operators can't be used on 'const' or 'final' variables as they are CHANGING
  the originial variable.

  
  */
}
