/*
FUNCTIONS AND METHODS IN DART:
▪ Essential building blocks for reusable and maintainable code 
▪ Foundation for efficient dart applications

What is a function?
  ▪ Reusable blocks of code that perform a task
  ▪ Define a function using the void keyword for functions that don't return
    anything and the return type for functions that do
  ▪ 

Function parameters in Dart
  ▪ Providing default values
  ▪ Naming specific arguments
  ▪ There are four types of parameters in dart:
    ▪ required
    ▪ optional
    ▪ named
    ▪ default

Required parameters:
  ▪ Must be provided when calling the function
  ▪ Positional

Optional parameters:
  ▪ can be either positional or named
  ▪ some arguments can be omitted when call a function are are notated with
    '[param]' to denote optional params

Named parameters:
  ▪ Specified using curly braces
  ▪ Required or default values using '{}' to denote named params
  
Default parameters:
  ▪ Default values for parameters
  ▪ Can be used with both positional and named optional parameters

Arrow Functions:
  ▪ Dart also allows for concise syntax using array (=>) functions, mainly
    used for anony functions or one-liners


What are methods?
  ▪ Functions associated with an object
  ▪ Defined inside of a class
  ▪ Operate on the instances of that class
  ▪ Perform actions on data contained within objects
  ▪ An example is the List class and the methods used to work with list data
    (example below in main)


Closures (anony functions) and lexical scope:
  ▪ Allows functions to capture and store references to variables
  ▪ Variables remain accessible to the function (like freezing my own little
    universe) (example below in main)
*/

// Defining functions examples

void greet() {
  print('Hello, World!');
}

int add(int a, int b) {
  return a + b;
}

// required parameter example
int multiply(int a, int b) {
  // required parameters
  return a * b;
}

// optional parameters example
String fullName(String firstName, [String? middleName, String? lastName]) {
  // note the [] as well as the '?' as they must be nullable (value or null)
  return '$firstName ${middleName ?? ''} ${lastName ?? ''}';
  // I believe ?? is the null coalescing operator, like ternary, but if var is null
  // then I get whatever comes after it. This was something new for PHP 8
}

// Name parameters example
void greet2({required String name, String greeting = 'Hello'}) {
  print('$greeting, $name!');
}

// Default parameters example
String describe(String name, {int age = 30, String city = 'Unknown'}) {
  return '$name is $age years old and lives in $city.';
}

void main() {
  greet(); // output: Hello, World!
  int sum = add(5, 3);
  print(sum); // output: 8
  print('');

  // required parameters example
  print(multiply(3, 4)); // both parameters MUST be provided
  print('');

  // optional parameters example
  print(fullName('John', 'Doe'));
  print(fullName('John', 'Paul', 'Doe'));
  print('');

  // Named parameter  example
  greet2(name: 'Alice');
  greet2(name: 'Bob', greeting: 'Hi');
  print('');

  // Default parameter example
  print(describe('Alice'));
  print(describe('Bob', age: 25, city: 'New York'));
  print('');

  // Arrow functions
  // can they be defined in 'main'?
  int square(int x) => x * x; // yes they can
  print(square(4));
  print('');

  // List class method examples
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];

  // using the add method to add an element
  fruits.add('Date');
  print(fruits);

  // using the remove method to remove an element
  fruits.remove('Banana');
  print(fruits);

  // using the contains method to check for an element
  bool hasApple = fruits.contains('Apple');
  print(hasApple);
  print('');

  // closures example
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  var add2 = makeAdder(2);
  var add5 = makeAdder(5);
  print(add2(3));
  print(add5(3));
  print('');
}

/*
Recap:
  ▪ Functions are reusable blocks of code that perform a specific task
  ▪ Required parameters must be provided when calling the function, and
    optional parameters can be omitted when calling a function
  ▪ Named paramers can be required or given default values, and default 
    parameters provide default values for parameters.
  ▪ Methods are functions that are associated with an object, such as the
    list class
  ▪ Closures allow functions to capture and store references to variables
    in their scope

*/
