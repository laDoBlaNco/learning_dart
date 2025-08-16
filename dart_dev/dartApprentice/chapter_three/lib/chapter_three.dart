/* Chapter 3: Types & Operations

The root of all types is the Object type. This type defins a few core operations
such as testing for equality and describing the object in text (.toString()). Every
other type in Dart is a subtype (subclass) of Object, and as a subtype shares 
Object's basic functionality.
*/

import 'package:characters/characters.dart';

void main() {
  // Annotating variables explicitly (type annotation)
  int myInteger = 10;
  double myDouble = 3.14;
  print('$myInteger $myDouble');

  // to  make the above immutable just add const or fnal
  const int myInteger2 = 10;
  const double myDouble2 = 3.14;
  final int myInteger3 = 10;
  final double myDouble3 = 3.14;
  print('$myInteger2 $myDouble2');
  print('$myInteger3 $myDouble3');

  // NOTE: Mutalble data is conventient to work with because I can change it
  // any time I like. However, many experience softward engineers have come to
  // appreciate the benefits of immutable data. When a value is immutable, that
  // means I can trust that no one will change that value after I create it. Limiting
  // my data in this way prevents many hard-to-find bugs from creeping in, and also
  // makes the program easier to reason about and to test.

  // Letting the compiler infer the type
  const myInteger4 = 10;
  const myDouble4 = 3.14;
  print('$myInteger4 $myDouble4');

  /*
  NOTE: There are times when I'll waant (or need) to explicitly include the type
  either because Dart doesn't have enough information to figure it out, or because
  I want my intent to be clear to the reader. However, I'll see type inference used
  for most code examples in the book and in the wild.
  */

  // Checking the type at runtime using the 'is' keyword
  num myNumber = 3.14; // remember that int and double are subtypes of num
  print('${myNumber is double}  ${myNumber is int}');

  // another wayt to check the type at runtime - '.runtimeType'
  print(myNumber.runtimeType);

  // Type Conversion
  // Implicit conversion is a frequent source of bugs and often hurts code
  // performance. Dart disallows me from assigning a value of one type to
  // another and avoids these issues. If I want the conversion to happen,
  // I have to say so! Explicit conversion
  num myNewNumber = myNumber.toInt();
  print(myNewNumber);

  /*
  NOTE: In this case, assigning the decimal value to the integer results in a LOSS 
  OF PRECISION: The integer variable ends up with the value 3 instead of 3.14. This
  is why it's important to be explicit. Dart wants to make sure that I know what I'm
  doing and that I may end up losing data by performing the type conversion
  */

  // Operators with mixed types
  const hourlyRate = 19.5;
  const hoursWorked = 10;
  const totalCost = hourlyRate * hoursWorked;
  // Dart will do what is safest and preserve precision
  print(totalCost.runtimeType);
  // If I want an int I need to explicitly convert it
  final totalCost2 = (hourlyRate * hoursWorked).toInt();
  // Note I had to use 'final' since const can't be intiialized with a runtime method
  print(totalCost2.runtimeType);

  // Casting down
  num someNumber = 3;
  // print(someNumber.isEven); // error since there is no .isEven for supertype 'num'
  // num is too general a type to know anything about even or odd numbers. Only
  // ints can be even or odd; so the issue is that num could potentially be a double
  // at runtime, since num includes both double and int (generic). In this case, though,
  // I'm sure that 3 is an int, so I can 'type cast' it to int
  final someInt = someNumber as int;
  print(someInt.isEven);

  // Be careful though to avoid runtime errors
  // final someDouble = someNumber as double; // it compiles!
  // but as soon as I run the file I get "type 'int' is not a subtype of type 'double' in type cast"

  // NOTE: In Dart you can only cast down. You can't cast to a sibling type as in
  // int to double, etc. for that you use toDouble() or toInt()

  // Mini-exercises:
  /*
  1. Create a constant call age1 and set it to 42. Create another const called age2
     and set it to 21. Check both types by hovering or using .runtimeType
  */
  const age1 = 42;
  const age2 = 21;
  print('${age1.runtimeType}  ${age2.runtimeType}');

  /* 2. Create a const called averageAge and set it to the average of age1 and age2
        using the operation (age1+age2)/2. Hover over to check the type or use 
        runtimeType
  */
  const averageAge = (age1 + age2) / 2;
  print(averageAge.runtimeType);

  // Strings
  // At its base, a computer needs to be able to translate a character into the
  // computer's own language, and it does this by assigning each character a
  // different number. This forms a two-way mapping from char to number that's
  // called a CHARACTER SET

  // Unicode - defines the character set mapping that almost all computers use
  // today

  // The number associated with each character is called a CODE POINT, so for
  // example 'c' uses code point 99, 'a' uses code point 97, etc

  // NOTE: The workd 'emoji' comes from the Japenese 絵⽂字, where 'e' means
  // picture and 'moji' means character

  // The numbers for characters are sometiems written in decimal notation, but
  // usually I'll see them in hexadecimal format. Using base-16 makes the
  // numbers more compact, easier to find in the Unicode character code charts
  // and generally nicer to work with in programming

  // Working with strings in Dart
  print('');
  print('Hello, Dart!'); // a string literal
  var greeting = 'Hello, Dart!';
  print(greeting.runtimeType);

  // Strings are immutable in Dart.

  // Getting characters
  // Dart doesn't have characters or char type in itself. So 'a' is still a String
  // Dart strings are a collection of UTF-16 code units. UTF-16 is a way to encode
  // Unicode values by using 16-bit numbers. If I need to find out what those codes
  // are, I can do so like this:
  var salutation = 'Hello!';
  print(salutation.codeUnits);

  // UTF-16 has a special way of encoding code points higher than 65,536 (16-bits)
  // by using two code units called surrogate pairs
  const dart = '🎯';
  print(dart.codeUnits);

  // The code point for 🎯 is 127919, but the surrogate pair for that in UTF-16 is
  // 55356 and 57263. Since no one wants to mess wwith surrogate pairs, there is a
  // nicer way to get Unicode points directly. Like in Go, Dart calls them RUNES

  print(dart.runes);

  // Language is messy, and so is Unicode
  // With some emojis even .runes will give me two Unicode code points. Because
  // Unicode doesn't create a new code point every time there is a new country flag
  // It uses a pair of code points called REGIONAL INDICATOR SYMBOLS to represent
  // a flag.

  // And they can get big!
  const family = '👨‍👩‍👧‍👦';
  print(
    family.runes,
  ); // this list of code points is a man, a woman, a girl, and a boy
  // all glued together with a Zero Width Joiner (ZWJ) 8205

  // So what would the length of that be?
  print(family.length);
  print(family.codeUnits.length);
  print(family.runes.length);
  // the first is each surrogate pair (4*2) and the 3 zwj which = 11
  // the last one gives us the 7 unicode points that make up the emoji
  // one for each (man, woman, girl, boy) and the zwjs = 7

  // When a string with multiple code points looks like a single character, this
  // is known as a 'user perceived character'. In tech terms its called a
  // Unicode extended grapheme cluster, or just a grapheme cluster

  // Adding the characters package to help. Add chracters to the pubspec
  // Now I can handle grapheme clusters
  print(family.characters.length);
  // The characters package (type or class) extends String to include a collection
  // of grapheme clusters called characters

  // Single quotes vs double quotes
  print('');
  print('I like cats');
  print("I like cats");
  print("my cat's food");
  print('my cat\'s food');

  // concatenation
  var message = 'Hello ' + 'my name is ';
  const name = 'Ladoblanco';
  message += name;
  print(message);

  // NOTE: if I find myself doing a lot of concatenation, a StringBuffer is more efficient
  final message2 = StringBuffer();
  message2.write('Hello');
  message2.write(' my name is ');
  message2.write(name);
  print(message2.runtimeType);
  final message3 = message2.toString();
  print('"$message3" is a ${message3.runtimeType}');

  // Interpolation
  const name2 = 'Kevin';
  const introduction = 'Hello my name is $name2';
  print(introduction);

  const oneThird = 1 / 3;
  final sentence = 'One third is ${oneThird.toStringAsFixed(3)}';
  print(sentence);

  // NOTE: Here we are requesting a string with only 3 decimal places, Also since
  // I'm perofrming an OPERATION on oneThird, I need to surround the expression with
  // {} after the $. This let's dart know that the dot after oneThird isn't just a period.
  // Finally the sentence variable needs to be 'final' instead of 'const' since
  // .toStringAsFixed(3) is a runtime calculation

  // Multi-line strings
  // Same as python
  const bigString = '''
I can have a string
that contains multiple
lines
by
doing this.'''; // can also use """"
  print('');
  print(bigString);
  print('');

  // I can also do this if I don't want the \n but still use multi-lines in the code
  // Dart figures it out since its ignores whitespace and justs looks for the ';'
  const oneLine =
      'This is only '
      'a single '
      'line '
      'at runtime.';
  print(oneLine);

  // Also like Python we have rawstrings
  const rawString = r'My name is \n is $name2';
  print(rawString);

  // Inserting characters from their codes
  print('I \u2764  Dart\u0021'); // 🤯

  // if the code point is higher than FFFF (4 digits) then I need
  // to surround them with {}
  print('I love \u{1f3af}');

  // Mini-exercises
  /*
  1. Create a string constant called firstName and intialize it to my first name.
     Also create a string const call lastName and initialize to my last name
  */
  const firstName = 'Kevin';
  const lastName = 'Whiteside';

  /*
  2. Create a string constant called fullName by adding the firstName and lastName
     constants togeter, separated by a space
  */
  const fullName = firstName + ' ' + lastName;

  /*
  3. Use interpolation, create a string constant called myDetails that use the fullName
     const to create a string introducing myself. 
  */
  print('Hello, my name is $fullName!');
  print('');

  // Object and Dynamic types
  // While Dart is statically typed at heart and with good reason after programming
  // in JS for a while. I can also choose to write programs in a dynamically-type
  // fashion. Dart has a 'dynamic' type
  dynamic myVariable = 42;
  myVariable = 'hello';
  print(myVariable); // and this is perfectlly OK at runtime

  // NOTE: this is the default if you use var and don't initialize the var
  var myVariable2;
  myVariable2 = 42;
  myVariable2 = 'hello there';
  print(myVariable2);

  // Its still better to avoid dynamic and use static typing. If I need to explicitly say
  // that any type is allowed (generic) then I should use Object?
  Object? myVariable3 = 42;
  myVariable3 = 'hello generics';
  print(myVariable3);

  /*
  At runtime, Object? and dynamic behave nearly identical. However, when I explicitly
  declare a variable as Object?, I'm telling the world that I've generalized the variable
  on purpose, and that they'll need to check its type at runtime if they want to do 
  anything specific with it. Using dynamic, I'm telling that world that I don't know 
  what the variable type is and they can use it however they want to, but it's 
  completely on them if their code crashes. JS anyone?!

  NOTE: That '?' at the end of Object? means that the type can include a null value.
  I'll get into nullability in chapter 7
  */

  // Challenges:
  /*
  Challenge 1: Teacher's grading

  I'm a teacher an din my class attendance is worth 20% of the grade, the homework is
  worth 30% and the exam is worth 50%. My student got 90 points for the attendance, 80
  for her homework and 94 on the exam. Calculate her grade as an integer percentage
  rounded down.
  */
  const attWeight = .20;
  const hwWeight = .30;
  const exWeight = .50;
  const studentAtt = 90;
  const studentHw = 80;
  const studentEx = 94;

  final grade =
      (attWeight * studentAtt + hwWeight * studentHw + exWeight * studentEx)
          .toInt();

  print('My student has a final grade of $grade');
  print('');
  /*
  Challenge 2: Same same, but different
  This string has two flags that look the same, but they aren't. One of them is
  the flag for Chad and the other is the flag for Romania
  */
  // As of right now I can't print these flags in my editor, so not sure how to
  // programatically get the differences 🤔🤔🤔

  /*
  Challenge 3: How many?
  Given the following string: 
  const vote = 'Thumbs up! 👍🏾';

  How many UTF-16 code units are there? 15
  How many Unicode code points are there? 13
  How many Unicode grapheme clusters are there? 12
  */
  const vote = 'Thumbs up! 👍🏾';
  print(vote.length);
  print(vote.codeUnits.length);
  print(vote.runes.length);
  print(vote.characters.length);
  print('');

  /*
  Challenge 4: Find the error
  What's wrong with the following code?
  const aName = 'Ray';
  aName += ' Wenderlich';

  You can't change a const. 
  */
  var aName = 'Ray';
  aName += ' Wenderlich';
  print(aName);
  print('');

  /*
  Challenge 5: What type?
  Whats the type of value? double
  */
  const value = 10 / 2;
  print(value.runtimeType);
  print('');

  /*
  Challenge 6: In Summary
  What is the value of the constant named 'summary'? '10 x 5 = 50'
  */
  const number = 10;
  const multiplier = 5;
  final summary = '$number \u00d7 $multiplier = ${number * multiplier}';
  print(summary);
}

/*
Key points:
  ▪ Type conversion allows me to convert values of one type to another
  ▪ When doing operations with basic arithmetic operators (+,-,*,/) and 
    mixed types, the result will be a double
  ▪ Type inference allows me to omit the type when Dart can figure it out
  ▪ Unicode is the standard representation for mapping characters to 
    numbers
  ▪ Dart uses UTF-16 values known as code units to encode Unicode strings
  ▪ A single mapping in Unicode is called a code point, which is known as
    a rune in Dart (and Go)
  ▪ User perceived characters may be composed of one or more code points
    and are called grapheme clusters
  ▪ I can combine strings by using the addition (+) operator (concatenation)
  ▪ I can make multi-line strings using three single or double quotes
  ▪ I can use string interpolation to build a string in-place
  ▪ Dart is an optionally-typed language. While it's preferable to choose
    statically-typed variables, I may write Dart code in a dynamically-typed way 
    by explicitly adding the 'dynamic' type annotation in front of variables
    or using Object? to make them generic. 

*/