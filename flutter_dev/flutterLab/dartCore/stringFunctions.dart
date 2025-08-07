/*
Dart Core - String Functions
In Dart, strings are just objects (instances) of the String class,
and the dart standard library provides a rich set of built-in
and methods  to work with strings.

  ▪ length: returns the number of chars in the string
  ▪ toUpperCase: converts the string to uppercase
  ▪ toLowerCase: converts the string to lowercase
  ▪ contains: checks if the string contains a specific substring
  ▪ indexOf: finds the index of a specific substring in the string
    Returns -1 if the substring isn't found
  ▪ substring: extracts a portion of the string
  ▪ split: splits the string into a list of substrings based on a delimiter
  ▪ trim: removes leading and trailing whitespace from the string
  ▪ isEmpty: checks if the string is empty (has zero characters)
  ▪ replaceAll: replaces all occurrences of a substring with another string
*/

main() {
  String message = 'Hello, Dart Flutter';

  print(message.length);
  print(message.toUpperCase());
  print(message.toLowerCase());
  print(message.contains('Dart'));
  print(message.indexOf('Dart'));
  print(message.substring(7, 12));
  print(message.split(', '));
  print(message.trim());
  print(message.isEmpty);
  print(message.replaceAll('Hello', 'Hi'));
}
