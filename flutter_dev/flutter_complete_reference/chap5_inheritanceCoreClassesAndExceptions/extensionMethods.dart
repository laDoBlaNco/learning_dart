/*5.1.6 - EXTENSION METHODS

  Extension methods provide a way to add functionalities to a library without changing
  its internal implementation. For example, imagine I created a Fraction class to work
  with rational numbers such as 1/3. (Fraction):

  (TOOK A LONG TIME BUT IT FINALLY WORKED USING AN EXCEPTION and returning Fraction with
  the right parts)
  As seen in chapter 4 - Section 2.5 "Good Practices", this is a good approach since I'm
  using 'factory' to make some computations an then building an immutable object. For 
  ease of use, I should also be able to initialize a Fraction object directly from a
  string.
    final  fraction = '1/3'.toFraction();

  The issue is that String is located inside the Dart sdk, and I can't add or remove
  methods from it. However, I can use the 'extension' keyword to add methods from the
  OUTSIDE, without changing the internal class definition, which is the whole point
  of this section (FractionExtension):

  As seen, it looks like String class contains a toFraction() method. In reality, I have
  just added a sort of "patch" from the outside using an extension method. In general,
  extension methods are used to add functionality to libraries whose code can't be 
  modified by me.

    Note: here 'this' refers to the object on which the method is called. In my example,
    'this' is holding the '2/5' string object. 

  Extension methods can have more than a single method. They can also define variables,
  getters, setters, operator overloads, and static members.
*/

class Fraction {
  final int num;
  final int den;
  const Fraction(this.num, this.den);

  factory Fraction.fromString(String value) {
    // parse a string and return, if possible, a 'Fraction' object
    final parts = value.split('/');
    final partN = int.tryParse(parts[0]);
    final partD = int.tryParse(parts[1]);
    if (partN != null && partD != null) {
      return Fraction(partN, partD);
    }
    throw Exception();
  }
}

extension FractionExtension on String {
  Fraction toFraction() => Fraction.fromString(this);
}

void main() {
  final fraction = Fraction.fromString('1/3');
  print(fraction.num);
  print(fraction.den);
  print('');
  final Fraction fraction2 = '2/5'.toFraction();
  print(fraction2.num);
  print(fraction2.den);
}
