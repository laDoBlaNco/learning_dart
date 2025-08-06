// ignore_for_file: unused_local_variable

/*
Module 2: Libraries in Dart

The impact of libraries
  ▪ Many around world use Flutter to build cutting-edge products
  ▪ Libraries steamline coding and development


The dart:core library
  ▪ Provides essential building blocks for coding
  ▪ Handles basic data types, collections, and utility functions
  ▪ Imported by default

The dart:math library
  ▪ provides things such as cosine and sine functions
  ▪ pi and e constants
  ▪ random number generation
  ▪ probability-based and statistical calculations

The dart:async library
  ▪ Creates asynchronous code (streams and future classes)
  ▪ Helps perform multiple tasks without blocking other operations

  Futures:
    ▪ Accessible in the future
    ▪ Essential for async operations like
      ▪ fetching online data
      ▪ lengthy computations
    ▪ 'await' pauses computation until the Future returns a value

  Streams:
    ▪ Series of asynchronous events
      ▪ manage data flows from users or servers
    ▪ Subscribe to a Stream and react to individual events

The dart:convert library
  ▪ provides converters for UTF-8 and JSON
  ▪ helps apps communicate with exterior apis
  ▪ essential for connecting with external systems

The http package
  ▪ contains high-level classes and functions
  ▪ simplifies HTTP connections
  ▪ download or transfer data
  ▪ interact with RESTful APIs

The intl package
  ▪ resolves a unique and widespread problem
  ▪ helps apps expand their geographical reach
  ▪ provides localization and internationalization support
  ▪ helps apps adapt to different reqions

The path package
  ▪ critical for the resolution of paths for files and directories
  ▪ helps organize entities efficiently
  ▪ provides splitting, joining, and normalizing, etc
  ▪ manipulates files and directory paths

Creating my own library
  ▪ Encapsulates resuable code
  ▪ Boosts maintainability and modularity



*/

// import statements for any library other than dart:core
import 'dart:math';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
// using my own library
import 'math_utils.dart';

void main() async {
  // I had to add 'async' to main in order to use await down below
  // these types are part of dart:core
  String greeting = 'Hello, Dart!';
  int number = 42;
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  Map<String, int> scores = {'Alice': 90, 'Bob': 85};

  print(greeting);
  print(number);
  print(fruits);
  print(scores);
  print('');

  // types and functions in dart:math lib
  const double e = 2.718281828459045;
  const double pi = 3.1415926535897932;

  double angle = pi / 4;
  double sine = sin(angle);
  double cosine = cos(angle);
  Random random = Random();
  int randomNumber = random.nextInt(100);

  print('Sine: $sine');
  print('Cosine: $cosine');
  print('Random Number: $randomNumber');
  print('');

  // these lines are for dart:async
  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2)); // simulate data delay
    return 'Data fetched!';
  }

  String data = await fetchData();
  // so with 'await' the assignment isn't made till the data is availabe 🤯
  print(data);
  print('');

  // these lines are for dart:convert
  String jsonString = '{"name":"Alice","age":30}'; // json
  Map<String, dynamic> user = jsonDecode(jsonString); // json -> dart map
  Map<String, dynamic> newUser = {'name': 'Bob', 'age': 25}; // dart map
  String newJsonString = jsonEncode(newUser); // dart map -> json

  print(jsonString);
  print(user);
  print(newUser);
  print(newJsonString);
  print('');

  // these lines use http package imported with our pubspec.yaml file
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  var response = await http.get(url); // get request

  if (response.statusCode == 200) {
    print('Response data: ${response.body}'); // NICE to work with 🤓
  } else {
    print('Request failed with status: ${response.statusCode}');
  }
  print('');

  // these lines use intl package imported with our pubspec.yaml file
  var now = DateTime.now();
  var formatter = DateFormat('yyyy-MM-dd');
  String formattedDate = formatter.format(now);
  print('Formatted date: $formattedDate');
  print('');

  // lines for using the path package
  var fullPath = p.join('directory', 'file.txt');
  print('Full path: $fullPath');
  print('');

  // using my library
  int sum = add(10, 5);
  int difference = subtract(10, 5);
  double product = multiply(10, 5);
  double quotient = divide(10, 5);

  print('Sum: $sum');
  print('Difference: $difference');
  print('Product: $product');
  print('Quotient: $quotient');
}


/*

Recap:
  ▪ The dart:core library handles core programming essentials
  ▪ The dart:async library handls tasks that involve delays
  ▪ The dart:convert library enables JSON handling
  ▪ The http package works with data or RESTful APIs
  ▪ The intl package provides localization and internationalization support
  ▪ The path package manipulates file and directory paths
  ▪ Creating my own library boosts project maintainability and modularity
    ▪ To create a library
      ▪ create a new dart file
      ▪ define the library with the 'library' keyword
      ▪ define all the variables, functions, classes, etc I want to use
    ▪ Use the import keyword to
      ▪ use a library in another file
      ▪ access functions, classes, and variables without duplicating code
*/