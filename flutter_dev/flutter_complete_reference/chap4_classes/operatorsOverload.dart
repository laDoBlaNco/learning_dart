// ignore_for_file: unused_local_variable

/*4.4 - OPERATORS OVERLOADING 

  When an operator appears in an expression involing two types, the compiler
  internally converts the symbol into the associated function call to evaluate
  the result. In simpler terms, some symbols (such as + and -) can call special
  functions to execute an operator. This feature is widely known as OPERATOR
  OVERLOADING. for example (Fraction)

  In our example, thanks to operator overloading, I have enhanced my class to support
  + and - operators. As such, objects can be used in expressions and evaluate to 
  other objects. For example (Fraction in main)

  Operator overloads are special functions whose name must be "operator" followed by
  a symbol. They either require one or two non-optional params and have no restrictions
  on the return type. For example, this is how I could implement subtraction AND negation
  for my Fraction class (Fraction2)

  The third overload is used when a type requires the negation sign in front of it. For
  example, 'a - b' would invoke operator-(other) while -a would invoke operator-(). I
  could have returned different types from the various operators as well. For example:
  (Fraction3)

  Operators CANNOT be static and take a predefined number of params. Here is a list
  of all supported operators:

    ▪ Operators that take 2 parameters: []=

    ▪ Operators that take 1 parameter: <,>,<=,>=,==,-,+,/,~/,*,|,^,&,<<,>>,>>>,% and []

    ▪ Operators that take 0 or 1 parameters: - (the negation operator)

    ▪ Operators that take 0 parameters: ~ (unary bitwise complement, which swaps 0s and 1s)

  The 'operator []=(index,value)' operator is used to set the value at the given index in
  the list to value. The operator== is used to test for object equality but its implementation
  is not trivial and requires some considerations, which I'll see in Chapter 5 - Section 2
  "The Object Class". 
*/

class Fraction {
  final int num;
  final int den;
  const Fraction(this.num, this.den);

  @override
  String toString() => '$num/$den';

  // overload the '+' operator
  Fraction operator +(Fraction other) {
    return Fraction(num * other.den + den * other.num, den * other.den);
  }

  // overload the '-' operator
  Fraction operator -(Fraction other) {
    return Fraction(num * other.den - den * other.num, den * other.den);
  }
}

class Fraction2 {
  final int num;
  final int den;
  const Fraction2(this.num, this.den);

  @override
  String toString() => '$num/$den';

  // overload the '+' operator
  Fraction2 operator +(Fraction2 other) {
    return Fraction2(num * other.den + den * other.num, den * other.den);
  }

  // overload the '-' operator
  Fraction2 operator -(Fraction2 other) {
    return Fraction2(num * other.den - den * other.num, den * other.den);
  }

  // this is used to negate the value of a fraction (expects only 1 operand) as
  // nothing is in the ()s
  Fraction2 operator -() => Fraction2(-num, den);
}

class Fraction3 {
  final int num;
  final int den;
  const Fraction3(this.num, this.den);

  @override
  String toString() => '$num/$den';

  Fraction3 operator +(int other) {
    return Fraction3(num + other, den + other);
  }

  double operator -(Fraction other) {
    return (num / den) - (other.num / other.den);
  }
}

void main() {
  final sum = Fraction(1, 2) + Fraction(2, 3); // 1/2 + 2/3
  final sub = Fraction(1, 2) - Fraction(2, 3); // 1/2 - 2/3

  print('$sum');
  print('$sub');
  print('');
}
