/*
Dare Core - Data Types

In dart like many programming languages, data types define the type of data that a variable
can hald. Dart is a statically typed language, which means that variable types are known
at compile-time. Dart supports various built-in data types, and each data type serves a specific
purpose

'dataType variableName = value;


*/

/* 
* int - This data represent a 32-bit signed integer. It is a fundamental daat type used to store 
* whole numbers that do not have a fractional part, such as -2, 0, 42, or 1000
*/
int a = 5;

/**
 * double - This data type represents a 64-bit double-precision floating-point number. It is used
 * to store numeric values that can have both a integral and fractional part, making it suitable
 * for handling decimal numbers.
 */
double b = 10.5;

/**
 * String - This data type represents a sequence of chars, which can include letters, symbols, and
 * whitespace. Strings are used to store textual data and are one of the fundamental data types
 * in dart and really any other programming language.
 */
String name = 'Lado Productions';

/**
 * bool - This data type represents a boolean value, which can only have two possible values (true or false).
 * Booleans are used to express logical values, where true represents a positive or affirmative condition,
 * and false represents a negative or negative condition.
 */
bool isShow = true;

/**
 * List - This data type is used to represent an ordered collection of elements. It is similar to arrays
 * in other programming languages but offers more functionality and flexibility (probably since its a 
 * class) Lists can contain elements of the same or different data types and can dynamically grow or
 * shrink in size as needed.
 */
List items = ['Orange', 'Mango'];

/**
 * Map - This data type is used to represent a collection of key-value pairs. Each key in the map must be
 * unique, and the keys and values can be of differnt data types. Maps are also known as associative
 * arryas (like php?), dictionaries (like python), or hash tables in other programming languages. 
 */
Map alpha = {'a': 'apple', 'b': 'ball'};

// NOTE: Some of the types have capital lettes and other don't. Not sure if this is similar to the same reason
// I see this in C++. Some types are direct copies of the c or c++ versions and the  capitals aren't, or
// maybe just inconsistencies in the language to keep consistancy with programming environments. 

