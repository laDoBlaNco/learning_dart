// DART DATA TYPES:
// strings
// booleans
// numbers
// lists
// maps

// STRINGS:
// Used to store words or sentances and can be rep'd using '' or ""

// BOOLEANS:
// two possible values, true or false. used to make decisions, nothing out of
// the ordinary aqui

// NUMBERS:
// we have int and double (int 32bit vs float 64bit)
// we can also use 'num' to use either or, declared implicitly

// LISTS:
// dart reps arrays in the form of list objects. All items in the list must
// have the same data type.
// We can also use specific type of a list of ints List<int>

// MAPS:
// dart maps is an object that assoc keys to values. In dart, maps is an interface
// designed to manipulate a collection of keys which points to values. Maps can
// be declared in two ways, using maps literals and using a map constructor:
// '{}' or 'new Map()'

// EXPLICITLY AN IMPLICITLY DATA TYPE
// for variables we can declare data both explicitly and implicitly

// DATA TYPE CONVERSIONS
// sometimes we want to or need to convert from one type to another and we can
// do this such as with .toString()

// INPUT OF INFORMATION TO A DART PROGRAM
// for io we need to import dart:io
// Although the training doesn't say anything, I get an error if I don't cast the
// input to a string with .toString(). Also to change it to a number I need to use
// int.parse, but not x.int.parse() its int.parse(x). I know the error on the
// readLineSync() without the .tostring() is caused by the null safety, but not
// sure what the clean fix is rather than the ugly solution I have:
// int.parse(stdin.readLineSync().toString()) ...eewwwwwww ... and I'm back
// Coming back to this and thinking about the error and the casue of the error, all dart was telling
// me is that we need to stay null safety. I avoid all that ugliness above simply by adding '?' after
// the type. So instead of String I use String? y ya. 

// WRITING COMMENTS - comments are pretty boring. just use // or /**/

/** DART CONDITIONALS - dart has many of the normal conditionals and then some
 * == equal to
 * != not equal to
 * < less than
 * <= less than or equal to
 * > greater than
 * >= greater than or equal to
 * ? return value of two expressions (not sure what this is) ok ya. Its the ternary
 *   operator, actually fully this: x > y ? something:somethingElse;
 * ?? return the value which is not equal null of two expressions. So its similar
 *    to the above but returns whatever isn't equal to null
 * is is
 * is! is not 
 * 
 */

// THE IF/ELSE/LOGIC STATEMENTS:
// the if statement for dart is the same as  most. seems we  don't have to have a
// then clause obligado but we do need to use ()s which I got use to not using
// in Go
// We also have the logical operators && and || just like Go which work as
// expected

// FOR LOOPS
// Very C-like and with the ()s

// WHILE LOOPS;
// Same thing, super predictable, very c-like

// DO WHILE LOOPS
// Though I don't have much experience with do/while, its again just as it would
// be expected. Guaranteed to iterate at least once

// BREAK STATEMENTS - work as they should

// SWITCH CASE STATEMENT:
// same as other languages to simply multiple if/else branches. Unlike with Go
// and Odin, here we need to use 'break'. and we use 'default' to catch all

// import 'dart:io';

main() {
  // strings
  String Name = 'Willam';
  print(Name);

  // boolean
  bool xyz;
  xyz = 12 > 5;
  print(xyz);

  // numbers (int & double)
  int x = 3;
  int y = 2;
  int z = x + y;
  print(z);

  double height = 1.5;
  double width = 2.6;
  double area = height * width;
  print(area);

  num a = 1;
  num b = 1.5;
  num c = a * b;
  print(c);

  // Lists
  var test_list = [7, 3, 100, 50, 9, 30, 8, 11, 6, -4];
  print(test_list[2]);
  List<int> test_list2 = [7, 3, 100, 50, 9, 30, 8, 11, 6, -4];
  print(test_list2[2]);
  print(test_list);

  // there are also some methods we can use with lists, such as .add
  test_list.add(400);
  print(test_list);
  // or length
  print(test_list.length);
  // or .forEach((){})
  test_list.forEach((element) {
    print(element);
  });

  // Maps
  var info = {'UserName': 'Kevin@androidatc.com', 'Password': 'pass123'};
  print(info);

  var info2 = new Map();
  info2['UserName'] = 'kevin@androidatc.com';
  info2['Password'] = 'Canada@123';
  info2['Country'] = 'Canada';
  info2['City'] = 'Toronto';
  print(info2);

  // Implicit vs explicit declarations
  var d = 10; // implicitly int number
  int e = 20; // explicitly int number
  var city = 'Toronto'; // implicitly String
  String country = "Canada";
  print(d);
  print(e);
  print(city);
  print(country);

  // Conversions
  var f = 3;
  var g = f.toString();
  print(g);

  // Input from stdin
  // print('=================================');
  // print('Please enter your full name:');
  // String Full_Name = stdin.readLineSync().toString();
  // print('Hello: $Full_Name');
  // print('=================================');
  // print('');
  // print('Please enter the first number:');
  // int num1 = int.parse(stdin.readLineSync().toString());
  // print('Please enter the second number;');
  // int num2 = int.parse(stdin.readLineSync().toString());

  // var sum = num1 + num2;
  // print('The sum result = $sum');

  // here are some boring comments

  // Conditionals
  int h = 3;
  int i = 5;
  print(h == i);
  var age = 20;
  var j = age > 18 ? "Allow" : "Deny";
  print(j);

  var k = null;
  var l = 10;
  var m = k ?? l;
  print(m);

  int n = 5;
  print(n is bool); // could use to typecheck then

  // If/else/logical Statements
  int o = 10;
  if (o > 5) {
    print("Hello, I am If statement running now......");
  }
  print('The end');

  if (o > 30) {
    print("Hello, I am If statement running now .......");
  } else {
    print("Hello, I am Else statement running now ........");
  }

  var score = 85;
  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 80) {
    print('Grade: B');
  } else if (score >= 70) {
    print('Grade: C');
  } else if (score >= 50) {
    print('Grade: D');
  } else {
    print('Grade: F');
  }

  age = 16;
  var dob = 1998;
  if (age >= 18 || dob >= 1998) {
    print('He is authorized');
  } else {
    print('He is not Authorized');
  }

  // For Loops
  for (var i = 0; i < 5; i++) {
    print("i = $i");
  }

  // While Loops
  var p = 1;
  while (p <= 5) {
    print("p = $p");
    p++;
  }

  // Do/While Loops
  var q = 10;
  do {
    print('q = $q');
    q++;
  } while (q <= 5);

  var r = 1;
  do {
    print('r = $r');
    r++;
    if (r == 3) break;
  } while (r <= 5);

  //switch case
  int day = 9;
  String? today = null;
  switch (day) {
    case 1:
      today = 'Sunday';
      break;
    case 2:
      today = 'Monday';
      break;
    case 3:
      today = 'Tuesday';
      break;
    case 4:
      today = 'Wednesday';
      break;
    case 5:
      today = 'Thursday';
      break;
    case 6:
      today = 'Friday';
      break;
    case 7:
      today = 'Saturday';
      break;
    default:
      today = 'Invalid Day';
  }
  print("Today is: $today");
}
/**
 * So my initial opinion is that this is very much a C like language. A lot like
 * Go but at the same time a lot not like Go. 
 * 
 */
