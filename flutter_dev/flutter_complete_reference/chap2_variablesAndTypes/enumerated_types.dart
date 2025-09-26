// ignore_for_file: unused_local_variable

/*2.2.4 - ENUMERATED TYPES

  Also known as enums, enumerated types are containers for constant values declared
  with the enum keyword. Here's a simple example:
*/
enum Fruit { apple, blueberry, strawberry, lemon, melon }

/*NOTE: LOOKS LIKE ENHANCED ENUMS WERE CHANGED AFTER THE RELEASE OF THIS BOOK. SO I
        HAVE SOME ADJUSTMENTS BELOW BASED ON 'DART.DEV/LANGUAGE/ENUMS'
*/

enum Fruit2 {
  // elements always go first
  apple(color: 'green'),
  blueberry(color: 'blue'),
  strawberry(color: 'red');

  // Enum fields must ALWAYS be final, included those added by mixins
  final String color;

  // Only one constructor is allowed and it MUST be constant
  // Factory constructors can only return one of the fixed, known enum instances
  // No other class can be extended as Enum is automatically extended
  // There can't be overrides for index, hashCode, or the equality (==) operator
  // A member named 'values' can't be declared in an enum, as it would clash with the
  // ...automatically generated static values getter
  // All instances of the enum must be declared in the beginning of the declaration, and
  // ...and there must be at least one instance declared
  const Fruit2({required this.color});
}

enum Test {
  someValue;

  static const int number = 0;
  static void hello() => print('Hello world!');
}

void main() {
  const blueberry = Fruit.blueberry;

  print('$blueberry');
  print('${blueberry.name}');
  print('${blueberry.index}');
  print('');

  /*Each item in the enumeration has an index, which corresponds to the zero-based
    position of the value in the declaraiton list. In the above example, 
    Fruit.blueberry.index returns 1 cuz blueberry is the 2nd item in the 0-indexed
    list. I can also build an enumeration from a string, but an exception is thrown
    if the name doesn't match the value
  */
  const blueberry2 = 'blueberry';
  const watermelon2 = 'watermelon';

  print('${Fruit.values.byName(blueberry2)}');
  print('${Fruit.values.byName('strawberry')}');

  // print('${Fruit.values.byName(watermelon2)}'); //Unhandled exception (which by this time
  // I recognize means 'Runtime error': Invalid argument (name): No enum value with that
  // name: "watermelon"
  // print(
  //   '${Fruit.values.byName('')}',
  // ); //Unhandled exception: Invalid argument (name):
  // No enum value with that name: ""
  print('');

  /*An enum in Dart an also have variable and methods to enhance capabilities 🤔🤯
    of the values. This is very interesting. For exaample, I could decide to add
    a color property to the Fruit enumeration of the previous example to associate
    a color with each value:
    NOTE: I had to make a lot of adjustments to the enum above, probably due to some
          enhancements after the release of this book. I try to "enumerate" 😁 them
          below:
            ▪ elements have to have NAMED PARAMETERS (REQUIRED IF NON-NULLABLE)
            ▪ so in the constructor I again have to use required named parameters

    As seen, this reminds me of a class, but its not the same thing. Enhanced enumerations
    can't be abstract, inheritance doesn't work on them as they are automatically extended,
    they can only have a single const constructor, though it can be a Factory constructor,
    and enumeration values always have to be declared first.

      NOTE: The const keyword can also be used in front of a class constructor declaration,
            I'll see this in detail in chapter 4 -- Section 2 "Constructors"

    Without the member variables in the enum, I can still get the result, but it wouldñ
    be manually writing the conversion logic. for example:

      String enumValueColor(Fruit fruit){
        switch(fruit){
          case Fruit.apple: return 'green';
          case Fruit.blueberry: return 'blue';
          case Fruit.strawberry: return 'red';
        }
      }

    Rather than creating helper functions to convert enumeration values, using member
    variables is less verbose and more maintainable. Enumerations can define static
    methods and properties

    Dart also allows defining of non-static methods, getters, and variables but they're
    useless since an enum can't be instantiated as if it were a class. 🤔
  */
  print('${Fruit2.apple.color}');
  print('');

  Test.hello();
  print(Test.number);
}
