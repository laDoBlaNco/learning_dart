// ignore_for_file: unused_local_variable

/*
  2.2 DATA TYPES

  Now in most cases, Dart types can be initialized with literals, such as 'true' (a boolean literal),
  19 (an integer literal), or 'hello dart' (a String literal). In chapter 6 -- "Generics and 
  collections" I'll learn generic data types used for containers like lists, maps, and sets. In
  chapter 5 -- section 2.2 "Records" I'll see records (which are particular data types that map
  to classes).

  2.2.1 NUMBERS
  In Dart, there are only two types that represent numbers:

    • int. On the web, integers are represented using JavaScript so values range from -2^53 to 
      2^53-1. On native platforms instead, values can range from -2^63 to 2^63-1.

    • double. Double precision, 64-bit floating point numbers that follow the popular IEEE 754
      standard.

  Both int and double are classes that descend from num, an abstract supertype that includes
  various operators and basic math functions such as abs(), floor(), ceil(), round() and much
  more. I should note that int and double are abstract types as well 🤯, because the compiler
  provides their concrete impelmentation according to the platformfor which the application was
  built (which is why its important to recognize that different platforms have diffent 
  implementations for int (for example web vs native)).

                                  ========> INT =======> NATIVE INT
      OBJECT =======> NUM =======>
                                  ========> INT =======> NATIVE INT
  
  For native targets (mobile and desktop), itn is a 64-bit int and double is a 64-bit IEEE floating
  point number. One the web, Dart interoperates with JavaScript and so in both cases the 64-bit
  IEEE format is used. num, double, and int can't be extended or implemented by regular Dart 
  classes. 

    NOTE: These implementation detaisl are handled internally by the compiler so I shouldn't
          worry about them too much. I do need to remember that integers and floating-point values
          are platform specific for performance and size reasons.

*/
void main() {
  // As I've already seen, integers are inferred from literals without decimal points:
  // final a = 1;
  // final b = 0xa5;
  // final c = -3e5;

  // the  hex representation is prefixed with 0x. Whenever a number includes a decimal, then
  // it's treated as a double:
  // final d = 7.63;
  // final e = 1.5e-1;

  // I can also declare variables using num and, since  it's  the supertype of ints and doubles, it
  // can hold both:
  // num f = 12.534;
  // print(f.runtimeType);
  // f = 6;
  // print(f.runtimeType);

  /*It's recommended to stick with int or double or, even better, using type inference with final/var
  to let the compiler decide how to resolve types. Literals are compile-time constants, and they
  produce constant expressions as well*/

  // const g = 10.5;
  // const h = 12;
  // const i = g * h; // i is const too

  // const j = 10.5;
  // final k = 12;
  // const l = j * k; // Error: Not a constant expression

  /*in the second code block, since k isn't a constant, the result of the operation can't be 
  determined at compile-time and so l can't be const (which makes sense due to how const and final
  both work. const is compile-time and final run-time. So technically the value of k isn't known
  until run-time and thuse l can't be determined as constant since the compiler can't be sure what
  k is, even though it was initialized already). The type inference machinery never infers num; it
  always assigns either int or double*/

  /*2.2.2 STRINGS
  Strings are represented by the String object, which is a sequence of UTF-16 code units. They can
  be initialized with either single or double quotes:
  */
  const name = 'Kevin';
  const surname = "Ladoblanco";

  /*The general rule is that i shoudl alway use single quotes unless the string itself already 
  contains one, in which case a double quote is required. For example
  */
  print("O'Neil");
  // print('O'Neil'); // Error

  /*Since O'Neil already has a single quote, I must use double quotes to build the string correctly.
  The second example confuses the compiler since the apostrophe conflicts with the single quote
  sign. Dart has no char type to hold single characters; they are represented by the String class
  as well:
  */
  // const hello = 'Hi';
  // final String h = hello[0];
  // final String e = hello[1];
  // print(hello[2]); // Error: Unhandled exception: RangeError (index): Invalid value

  // Identifiers and expressions can be interpolated in a string using the dollar sign:

  // interpolate an identifier into a string
  const age = 49;
  print('I am $age years old');

  // Expressions need '{' and '}' after '$'
  const actualAge = 49.2;
  print('I am ${actualAge.round()} years old');

  // '$' already calls 'toString()' so this is not required
  print('I am ${actualAge.toString()} years old');

  /*The ${expr} syntax already calls the toString() method so I don't need to call it explicitly.
  Dart also allows defining multiline strings, which are initialized with triple quotes (like
  Python), and still follow the interpolation rules just seen. For example:
  */
  const singleQuotes =
      '''
    SELECT name, surname, age
    FROM people
    WHERE name = $name
''';
  const doubleQuotes = // note that they tabs are included in the multiline strings
      """
SELECT name, surname, age 
FROM people
WHERE name = $name
""";
  print(singleQuotes);
  print(doubleQuotes);

  /*In this case, single or double quotes make no difference. String concatenation also heppens 
  with the + operator, which is optional on new lines, but interpolation with $ should be preferred;
  */
  // preferred way
  print('I am $age years old');

  // good, but '$age' is preferred
  print('I am ' + age.toString() + ' years old');

  /*To get a newline or add tabulation I use the \n or \t symbols, respectively. They can be 
  escaped in row strings, which are prefixed by an r in front of the quotes (I believe also 
  similar to Python):
  */
  print('');
  print('I am\n49 years old');
  print('I am\t49 years old');

  /*The r in front of the string basically evaluates the \ as a regular character, so no special
  formatting is applied. It also disables string interpolation:
  */
  print('');
  print('I am $age years old');
  print(r'I am $age years old');

  // raw strings are also handy when working with regular expressions.

  /*2.2.2.1 GOOD PRACTICES:
  String is an immutable object so whenever the content needs to be changed, a new instance is
  always created. For this reason, using the + operator to concatenate a lot of strings might
  be very inefficient since a lot of instances are re-created on each evaluation of +. For example:
  */
  // var value = '';
  /*   
  for (var i = 0; i < 9000000; ++i) {
    value += '$i, \n';
  }
 */

  // print(value);

  /* Each time the + operator  is called, value is assigned with a new instance containing the old
  value plus the newly appended number. In other words, the above code creates 9,000,000 new String
  objects, one per iteration! A more efficient approach is the following: */
  /* 
  final value2 = StringBuffer();
  for (var i = 0; i < 9000000; ++i) {
    value2.writeln('$i, ');
  }
 */
  // the string is built for teh first time here
  // print(value2.toString()); still commenting out cuz it takes pila de tiempo to print out
  // 9 million lines

  /*A StringBuffer is used to efficiently concatenate strings. It incrementally builds strings
  without creating new instances on each concatenation and thus is recommended by the Dart team.
  The String object is only created when the buffer is then converted to a string using toString()
  or interpolation.
  
  The language also has built-in support for number-to-string and string-to-number converstions. For
  example, the static method parse is used to convert a string into a number:
  */
  const value = '12';

  // using 'tryParse' for String-to-number conversions
  final a = int.tryParse(value);
  final b = int.tryParse(value, radix: 5);
  final c = double.tryParse(value);

  // invalid conversions return null
  final d = int.tryParse('');
  final e = double.tryParse('');
  print('$a $b $c $d $e');
  print('');

  /*The tryParse method converts the given String into an int or a double and returns null if the
  conversion fails. The optional radix parameter converts the given integer from a specific base:
  in the  example, I'm parsing 12 in base 5 (which is 7). Alternatively, I could also use the parse
  method, which returns a non-nullable value (meaning it would error our rather than returning null.
  This makes perfect sense as the names are 'parse' and 'tryParse', implying that it may not be
  able to parse)
  */
  print(int.parse('12'));
  print(double.parse('-5.76'));
  print('');
  /*
  // runtime errors
  print(int.parse('')); // unhandled exception: FormatException: Invalid number
  print(double.parse(''));
*/

  /*On the other hand, the string-to-number conversions are also straightforward. There are multiple
variants of the toString methods: (so is there no String.parse or String.tryParse 🤔🤔🤔 GUESS
NOT)
*/
  print(100.toString());
  print(3.44.toString());
  print((-3.44).toString());
  print('');
  // conversion that rounds or adds trailing spaces
  print(5.126.toStringAsFixed(2));
  print(5.126.toStringAsFixed(5));
  print(5.126.toStringAsFixed(7));
  print('');
  // conversion that only considers the given significant digits
  print(5.126.toStringAsPrecision(2));
  print(5.126.toStringAsPrecision(5));
  print(5.126.toStringAsPrecision(7));
  print('');

  // exponential notation
  print(5.126.toStringAsExponential(2));

  // converting from base 10 to other bases:
  print(53.toRadixString(2));
  print(53.toRadixString(8));
  print(53.toRadixString(12));
  print('');

  /*Other recommendations are:

    • prefer interpolation with $ and ${expr}
    • avoid concatenating strings using +
    • prefer using StringBuffer for composing long strings

  The API of the String object is HUGE: it has the length getter to retrieve the string length,
  trimming methods, replace methods and much much more. Its a good idea for me to visit the docs
  for an exhaustive overview of the String api
  */

  /*2.2.2.2 Runes
  Unicode is an encoding system that associates an integer value (called 'code unit') to 
  each character, digit, and symbol that humans use in all the world's writing systems.
  The unicode standard  can be implemented using various transformation formats such as
  UTF-8, UTF-16, and UTF-23. For example, in UTF-16:

    • The letter a is associated with 97 (61 in hex) code unit;
    • The number 5 is associated with 53 (35 in hex) code unit;
    • The Japanese symbol (I can't copy 🤦🏾) is assocated with '26412' (672c in hex) code unit
  
  The 'a5' string, for exaample, in UTF-16 is represented as \u0061\u0035 because the
  letter a is associated with the 0x0061 code unit, and the digit  5 is associated with
  0x0035.

  A String object in Dart is a sequence of Unicode UTF-16 code units that are called
  runes. Each string has the codeUnitAt(int index) function to get the 16-bit UTF-16 code
  unit at the given index. For example:
  */
  const string = 'Hi';
  print(string.codeUnitAt(0));
  print(string.codeUnitAt(1));
  print('');

  // Considering the above example, I can also build the Hi string by only using the
  // fromCharCode constructor function, which asks for a code unit value
  print('${String.fromCharCode(72)}${String.fromCharCode(105)}');
  print('');

  /*I can always use the runes property to return all of teh runes (code units) as base
  ten integer values. They can directly be used in the fromCharCode constructor to 
  build the string, but if I watn to use the \u escape  character, then they must be
  converted into base 16 since one latter returns base 10 and the previa accepts hex:
  */
  // code points for the 'Dart' string
  print('Dart'.runes.toList());
  print('');

  // Printing 'Dart' from its integer, base 10 code points
  print(String.fromCharCode(68));
  print(String.fromCharCode(97));
  print(String.fromCharCode(114));
  print(String.fromCharCode(116));
  print('');

  // printing 'Dart' from the hex code points
  print('\u0044'); // not sure why the book puts them in '\u{0044}' as they work without
  print('\u0061');
  print('\u0072');
  print('\u0074');
  print('');

  // emojis can also be exprssed using UTF-16! For example, the laughing oens is \u1f606.
  // Runes are for low-level string manipulation and I'll hardly ever need to work with them
  // in the wild

  /*2.2.3 BOOLEANS
  The bool type represents boolean values, which can only hold the 'true' or 'false' literals.
  Both are compile-time constants:
  */
  print(5 == 0);
  print(!(5 == 0));
  print('');

  // Unlike C++, in Dart I can't assign 0 and 1 to a bool type; for example, 'bool test = 0'
  // is not valid in Dart since a bool can only hold 'true' or 'false'. The literal 0
  // doesn't convert to 'false'. (This means there is no boolean converstion as in other
  // languages where null = false and everything else true, for example?)

  /*2.2.4 ENUMERATED TYPES
  Also known as enums, enumerated types are containers for constant values declared with 
  the enum keyword. here's a simple example:
  */

  const blueberry = Fruit.blueberry;
  print('$blueberry');
  print('${blueberry.name}');
  print('${blueberry.index}');

  /*Each item in the enumeration has an index, which corresponds to the zero-based position
  of the value in the declaration list. In the above  example, Fruit.blueberry.index returns 1
  because it is the 2nd items in the 0-index declaration list. I can also build enumerations
  from a string but an exception is thrown if the name doesn't match the value:
  */
  const blueberry2 = 'blueberry';
  const watermelon = 'watermelon';
  print('${Fruit.values.byName(blueberry2)}');
  print('${Fruit.values.byName('strawberry')}'); // works even though its a string in ''
  // print('${Fruit.values.byName(watermelon)}'); // unhandled exceptions
  // print('${Fruit.values.byName('')}'); // unhandled exception: Invalid argument (name):

  /*An enum in Dart an also have variables and methods to enhance the capabilities of the
  values. For example, I could decide to add a 'color' property to the Fruit enumeration
  to associate a color with each value:
  */
  print('${Fruit.apple.color}');
  print('');
  /*As seen here, they may remind me of a Class but they're not the same thing. Enumerations
  can't be abstract, inheritance doesn't work on them, they can only have a single const
  constructor and enumeration values always need to be declared first. 
  (So what's the point, o sea, what's the benefit in using them with this complexity 🤔🤔🤔)

    NOTE: The const keyword can also be used in front of a class constructor declaration. 
          I'll see this in detail in Chapter 4 -- Section 2 "Construtcors"

  Without member variables in the enum, I would need to manually write the conversion 
  logic maybe using a switch statement
  */
  String enumValueColor(Fruit fruit) {
    switch (fruit) {
      case Fruit.apple:
        return 'green';
      case Fruit.blueberry:
        return 'blue';
      case Fruit.strawberry:
        return 'red';
      case Fruit.lemon:
        return 'yellow';
      case Fruit.melon:
        return 'lime';
    }
  }

  print('${enumValueColor(blueberry)}');

  /*Rather than creating helper functions like this to convert enumeration values, using
  member variables is less verbose (though harder to grasp) and more maintainable. Enumerations
  an define static methods and proerties as well 🤯:
  */
  Test.hello();
  print('');

  /*2.2.5 LISTS
  Any kind of container in Dart is represented by a generic type, which I'll see in detail
  in chapter 6 - "Generics and collections". In Dart an "array" is a "list", and its 
  represented by the generic Type List<T>.

    NOTE: The T in the List<T> declaration is a generic placeholder for any type. For
          this reason they are generic. So for example, I could replace T with String to
          create a List<String> type.

  Lists are 0-indexed collections of items that can be accessed using the [] operator. A 
  list can be declared using square brackets as a literal
  */
  const integerList = [1, 2, 3];
  const stringList = ['a', 'b', 'c']; // inferred as expected
  print('$integerList');
  print('${integerList[2]}');
  print('');

  print('$stringList');
  print('');

  // print('${stringList[5]}'); // Unhandled Exception: RangeError (length): Invalid value

  /*A runtime error is thrown if the index value is not within the array bounds. Generic 
  collections, including lists, have a lot of interesting properties which I'll see later.
  For now, it's enough to be aware that 'arrays' in Dart are in reality List<T> objects
  and they can be declared using [].
  */

  /*2.2.6 DART'S ENVIRONMENT VARIABLES
  Any Dart application can initialize strings, numbers, or booleans from variables being
  declared from 'outside' the program itself. The --define flag can be added to the 
  dart run command to create ENVIRONMENT variables. For example:

    dart run --define=api-key=abcdefgh

  Using this command, I can read the content of the api-key variable from our Dart program
  using a special constructor called String.fromEnvironment:
  */
  /* 
  final apiToken = String.fromEnvironment('api-key');
  print(apiToken); // need to run this from commandline
 */

  /*In the same way, environment variables can also be loaded from numbers and booleans.
I can even define default values in case the key wasn't associated to a value when running
the code, using that optional parameter in from Environment. (In the following examples
I'm using the defaults everywhere so as not to have to run from commandline)
*/
  final intValue1 = int.fromEnvironment('age', defaultValue: -1);
  final intValue2 = int.fromEnvironment('age', defaultValue: 18);
  final boolValue = bool.fromEnvironment('status');
  print(intValue1);
  print(intValue2);
  print(boolValue);
  print('');

  /*To define multiop Dart environment variables at once, I just need to repeat the
  --defin command with the same format.

  hardcoding the strings into the app is no different and no less secure than environmental
  variables. There is a Dart linter rule that suggests avoiding environment variables since
  they create a hidden global state, which leads to less readability and more challenging
  maintenance of the project. ITs recommended reading command-line arguments or reading data
  from a configuration file inside the application itself.
  */
}

// And I just remembered an Enum can't be inside a function, not even 'main'
enum Fruit {
  apple('green'),
  blueberry('blue'),
  strawberry('red'),
  lemon('yellow'),
  melon('lime');

  // Enum fields must always be 'final'
  final String color;
  // only one constructor is allowed and it MUST be constant
  const Fruit(this.color);
}

enum Test {
  someValue;

  static const int number = 0;
  static void hello() => print('Hello Dart');
}
