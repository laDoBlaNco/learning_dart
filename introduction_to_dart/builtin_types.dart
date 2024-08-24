// import 'package:characters/characters.dart';

/// Dart has special support the following types
///   - Numbers (int,double)
///   - Strings (String)
///   - Records ((value1,value2))
///   - Lists (List, also known as arrays)
///   - Sets (Set)
///   - Maps (Map)
///   - Runes (Runes, often replaced by the characters API)
///   - Symbols (Symbol)
///   - The value null (Null)
///
/// this includes the ability to create type literals. 'this is a string'
///
/// There are other types also that have special roles in Dart
///   - Object - like js is the superclass of all dart classes except Null
///   - Enum - The superclass of all enums
///   - Iterable - Used in for-in loops and in sychronous generator funcs
///   - Future and Stream - used in async support
///   - Never - indicates tha an expression can never finish evaluating successfully
///     Normally used with functions that always throw exceptions
///   - dynamic - indicates that we want to disable static checking. Better to use
///     OBject or Object?
///   - void - indicates that a value is never used. Often used as a return type

// NUMBERS have 2 flavors - int and double (doubles are floating point)
var x = 1;
var hex = 0xDEADBEEF;

// when a number has a decimal its a double
var y = 1.1;
var exponents = 1.42e5;

// if we use 'num' then teh compiler will infer the type
num z = 1; // x can have both ints and doubles
void main() {
  z += 2.5;

  // Let's convert strings and numbers here:
  // String -> int
  var one = int.parse('1');
  assert(one == 1);
  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);
  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');
  // double -> String
  String piAsString = 3.14159.toString();
  assert(piAsString == '3.14'); // this asserted true even though its not 100%
  print(piAsString);

  // we also have bitwise operators with int types (<<,>>,>>>), compliment (~),
  // and (&), or (|), xor (^).
  print(3 << 1); // 0011 << 1 == 0110
  print(3 | 4); // 0011 | 0100 == 0111
  print(3 & 4); // 0011 & 0100 == 0000

  // Literal numbers are compile-time constants just like in Go
  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
  print(msUntilRetry);

  // STRINGS - utf16 code units that can be created with '' or ""
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to sue the other delimiter.";
  print(s1);
  print(s2);
  print(s3);
  print(s4);

  // String interpolation is use with $ or ${} for exprs. To get the string rep
  // dart calls .toString() method on the object if it  has one
  var s = 'string interpolation';
  print('Dart has $s, which is very handy.');
  print('That deserves all caps '
      '${s.toUpperCase()} is very handy!');

  // We can concat with adjacent strings or with +
  var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
  print(s5);

  var s6 = 'The + operator ' + 'works, as well.';
  print(s6);

  // we can also use ''' just like in python
  var s7 = '''
You can create
multi-line strings like this one.
''';
  print(s7);

// raw strings are created with a prefix r''
  print(r'In a raw string, not even \n gets special treatment.');

  // Booleans are of type bool and work pretty much as expected
  // Because of darts null safety we can't check for empty values like in other langs
  // with asserts or if(''). We have to use these methods

  // check for empty string
  var fullName = '';
  print(fullName.isEmpty);

  // check for zero
  var hitPoints = 0;
  print(hitPoints <= 0);

  // Check for null
  var unicorn = null;
  print(unicorn == null);

  // check for NaN
  var iMeantToDoThis = 0 / 0;
  print(iMeantToDoThis.isNaN);

  // To use individual Unicode chars we need to import the char package
  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  // print('The last character: ${hi.characters.last}');
}

/// SYMBOLS - object that reps an operator or identifier declared in a dart
/// program. We might never need to use symbols, but they are invaluable for 
/// apis that refer to identifiers by name, because minification changes identifier
/// names but not identifier symbols.  To get the symbol for an identifier, use
/// a symbol literal, which is just # followed by the identifier
/// #radix
/// #bar
/// 
/// Symbol literals are compile-time constants as well.
