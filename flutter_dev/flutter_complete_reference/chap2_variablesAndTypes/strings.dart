// ignore_for_file: unused_local_variable

/*2.2.2 STRINGS

  Strings are rep'd by the String object, which is a sequence of UTF-16 code units.
  They can be initialized with either single or double quotes:
*/
void main() {
  const name = 'Alberto';
  const surname = "Miola";

  /*The general rule is that I shoudl always use single quotes unless the string
    itself doesn't already contain one, in which case a double quote is required
  */
  print("O'Neil");
  // print('O'Neil'); // this would error out

  /*Since O'Neil already has a single quote, I must use double quotes to build the
    string correctly. The second example confuses the compiler becasue the ' conflicts
    with the single quote sign. Dart has no char type to hold single characters: they
    are rep'd by the String class/type as well
  */
  const hello = 'Hi';

  final String h = hello[0];
  final String i = hello[1];
  // print(hello[2]); // Error: RangeError (index): Invalid value: Not in inclusive range 0..1: 2

  // Identifiers and expressions can be interpolated in a string using the $
  const single = 'Single quote';
  const doublee = "Double quote";

  // Interpolate an identifier into a string
  const age = 25;
  print('I am $age years old');

  // Expressions need '{' and '}' after '$'
  const actualAge = 25.5;
  print('I am ${actualAge.round()}');

  // '$' already calls 'toString()' so this is not required
  print('I am ${actualAge.toString()}');
  print('');

  /*The ${expr} sytnax already calls the toString() method so I don't need to call it
    explicitly. Dart also allows defining multiline strings, which are initialized with
    triple quotes, and still follow interpolation rules.
  */
  const singleQuotes =
      '''
  SELECT name,surname,age
  FROM people
  WHERE name = $name
''';

  const doubleQuotes =
      """
  SELECT name, surname, age
  FROM people
  WHERE name = $name
""";

  /*In this case, singel or double quotes make no difference. String concatentation 
  also happens with the + operator, which is optional on new lines, but interpolation
  with $ should be the preferred method
*/

  // preferred way
  print('I am $age years old');

  // good, but '$age' should be preferred
  print('I am ' + age.toString() + ' years old');

  /*To go to a new line or add a tabulation use the normal escape sequences \n or \t,
    respectively. They can be escaped in raw strings, with are prefixed by an 'r' in 
    front of the quotes
  */

  print('');
  print('I am\n25 years old');

  print(r'I am\n25 years old');

  print('I am\t25 years old');
  print('');
  // The r inf ront of the string basically evaluates the \ as a regular character, so
  // no special formatting is applied. It also disables string interpolation.
  print('I am $age years old');
  print(r'I am $age years old');

  /*2.2.2.1 GOOD PRACTICES
    String is an immutable object so whenever the content needs to be changed, a new
    instance is ALWAYS created. For this reason, using the + operator to concatenate 
    a lot of strings might be very inefficient because a lot of instances are 
    re-created each time. For exaample:
  */
  /*
  var value = '';
  for (var i = 0; i < 9000000; ++i) {
    value += '$i, \n';
  }
  print(value);*/

  /*Each time the + operator is called, value is assigned with the NEW instance containing
    the old value plus the newly appended number. In other words, the above code creates
    9000000 new String objects, one per iteration! A more efficient approach is the 
    following
  */
  // final value = StringBuffer();

  // for (var i = 0; i < 9000000; ++i) {
  //   value.writeln('$i, ');
  // }

  // The string is build for the first time here, and since I'm not creating 9 million
  // instances, I actually get to this line without freezing or crashing
  // print(value.toString());

  /*A StringBuffer is used to efficiently concatenate strings. it incrementally build
    strings without creating a new instance on each concatentation and thus is the
    recommended method by the Dart team. The String object is only created when the
    buffer is converted using toString or interpolation. So its a lazy operation as
    well.

    The language also has built-in support for number-to-string and string-to-number
    conversions. For example the static method parse is used to convert a string 
    into a number
  */
  print('');
  print('===Good Practices===');
  const val = '12';
  print('');
  // using 'tryParse' for String-to-number conversions
  print(int.tryParse(val));
  print(int.tryParse(val, radix: 5)); // base 5 system
  print(double.tryParse(val));
  print(int.tryParse(''));
  print(double.tryParse(''));

  /*The tryParse method converts the give String into an int or a double and returns
    null if the conversion fails. The optional radix param converts the given integer
    from a specific base: in the example, I'm parsing 12 in base 5 (which is 7).
    Alternatively, I could also use the parse method, which returns a non-nullable value,
    but it throws an exception if the conversion fails
  */
  print('');
  print(int.parse('12'));
  print(double.parse('-5.76'));
  // print(int.parse('')); // Error: Unhandled exception: FormatException: Invalid number
  // print(double.parse('kevin')); // Error: Unhandled exception: FormatException: Invalid double

  /*On the other hand, the string-to-number conversion is also straightforward. There are
    multiple variants of the toString method
  */
  print('');
  print(100.toString());
  print(3.44.toString());
  print((-3.44).toString());
  print('');

  // Conversion rounds or adds trailing zeros
  print(5.126.toStringAsFixed(2));
  print(5.126.toStringAsFixed(5));
  print(5.126.toStringAsFixed(7));
  print('');

  // Conversion only considers the given significant digits
  print(5.126.toStringAsPrecision(2));
  print(5.126.toStringAsPrecision(5));
  print(5.126.toStringAsPrecision(7));
  print('');

  // Exponential notation
  print(5.126.toStringAsExponential(2));
  print('');

  // Converting from base 10 to other bases
  print(53.toRadixString(2));
  print(53.toRadixString(8));
  print(53.toRadixString(12));
  print('');

  /*Other recommendations to follow are:

    ▪ Prefer interpolating strings with $ or ${expression}

    ▪ Avoid cancatenating strings using the + operator

    ▪ Prefer using StringBuffer for composing long strings

  The API of the String object is huge: it has the 'length' getter to retrieve the string
  length (and as I  remember, getters, are just simple methods as well), trimming methods,
  replace methods, and much much more. I should consider visiting the official documentation
  for an exhaustive overview of the String API
  */

  print('');
  print('===Runes===');
  /*Unicode is an encoding system that associates an integer value (called a code unit) to
    each character, digit, and symbol that humas use in all the world's writing systems. The
    unicode standard can be implemented using various transformation formats such as UTF-8,
    UTF-16, and UTF-23. For example:

      ▪ The letter a is associated with 97 (61 in hex) code unit
      ▪ The number 5 is associated with 53 (35 in hex) code unit
      ▪ The Japanese symbol 本 is associated with the '26412' (672c in hex) code point

    The a5 string, for example, in UTF-16 is rep'd by \u0061\u0035 because the letter
    a is associated with 0x0061 code unit, and the digit 5 is associated with 0x0035

    A string object in Dart is a sequence of Unicode UTF-16 code units that are called
    runes. Each string has the codeUnitAt(int index) function to get the 16-bit UTF-16
    code unit at the given index. 
  */
  const string = 'Hi';
  print(string.codeUnitAt(0));
  print(string.codeUnitAt(1));
  print('');

  // Considering the above, I can also build the string from the codepoint with fromCharCode
  print('${String.fromCharCode(72)}${String.fromCharCode(105)}');
  print('');

  /*From these examples, I can understand that 72 is the integer UTF-16 coe unit for the 
    letter H and 105 instead is associated with the letter i. If I converted these to
    hex, I could still use code points to build the string using the \u escape values
  */
  print('\u{0048}\u{0069}');

  /*I can always use the runes property in Dart to return all of teh runes (code units)
    as base ten integers. They can directly be used in the fromCharCode constructor to
    then build the string, but if i want to use the \u escape character, then I need to
    convert them into base 16 (hex)
  */

  // code points for the string 'Dart'
  print(
    'Dart'.runes.toList(),
  ); // the .toList converts the interator result to a real list
  print('');

  // printing 'Dart' from its integer, base 10 code points
  for (final c in 'Dart'.runes) {
    print(String.fromCharCode(c));
  }
  print('');
  // using the hex code points
  print('\u{0044}');
  print('\u{0061}');
  print('\u{0072}');
  print('\u{0074}');
  print('');

  /*Emojis can also be expressed using UTF-16. For example, the laughing one is \u{1f606}.
    Runes are for low-level string manipulations and I'll hardly ever need to work with 
    them.
  */
  print('\u{1f606}');
}
