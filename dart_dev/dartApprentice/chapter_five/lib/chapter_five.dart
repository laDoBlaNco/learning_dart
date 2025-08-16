// ignore_for_file: unused_local_variable, prefer_function_declarations_over_variables, avoid_function_literals_in_foreach_calls

/*
  Chapter 5: Functions

  Each week, there are taks that I repeat over and over: eat breakfast, brush my
  teeth, write my name, read books about Dart, and so on. Each of these tasks
  can be divided up into smaller  tasks. Brushing my teeth, for example, includes
  putting toothpaste on the brush, brushing each tooth and rinsing my mouth out
  with water. 

  The same idea exists in computer programming. A function is one small task
  or sometimes a collection of several smaller, related tasks that I can use in 
  conjunction with other functions to accomplish a larger task.

  In this chapter, I'll learn how to write functions in Dart, including both 
  named functions and anony functions.
*/

void main() {
  print("===Don't Repeat Yourself===");
  const input = 12;
  final output = compliment(input);
  print(output);
  print('');
  // NOTE: its easy to get the words parameter and argument mixed up. A parameter
  // is the name and type that I define as an input for my function. An argument
  // on the other hand, is the actual value that I pass in. A parameter is
  // abstract, while an argument is concrete.

  print('===Using Multiple Parameters===');
  helloPersonAndPet('Chris', 'Fluffy');
  print('');

  print('===Making parameters optional===');
  // To indicate a parameter is optional, I surround it with
  // []s and a ? after the type
  print(fullName('Kevin', 'Whiteside'));
  print(fullName('Kevin', 'Whiteside', 'Master Dart Hacker'));
  print('');

  print('===Providing default values===');
  print(withinTolerance(75));
  print(withinTolerance(75, 50, 100));
  print('');

  print('===Naming parameters===');
  print(withinTolerance2(9, max: 11, min: 7));
  print(withinTolerance2(9, min: 7, max: 11));
  print(withinTolerance2(5));
  print(withinTolerance2(15));
  print(withinTolerance2(5, min: 7));
  print(withinTolerance2(15, max: 20));
  print('');

  print('===Making named parameters required===');
  print(withinTolerance3(value: 15));
  print('');

  print('===Avoidng side effects===');
  hello();
  print(hello2());
  print(anInnocentLookingFunction('Ladoblanco'));
  print('Look at your precious data now: $myPreciousData');
  print('');

  print('===Option types===');
  print(compliment2(66));
  print('');

  print('===Mini exercises===');
  /*
    Write a function named youAreWonderful, with a String parameter called name
    It should return a string using name, and say something like "You're wonderful, $name"
  */
  print(youAreWonderful('Odalis'));
  /*
    Add another int parameter to that function called numberPeople so that
    the function returns something like "You're wonderful, $name. $numberPeople people think so."
  */
  print(youAreWonderful2('Kelen', 12));
  /*
    Make both inputs named parameters. Make name required and set numberPeople to have
    a default of 30.
  */
  print(youAreWonderful3(name: 'Xavier'));
  print('');

  print('===Anonymous functions===');
  print('===Assigning functions to variables===');
  int number = 4;
  String greeting = 'hello';
  bool isHungry = true;
  Function multiply = (int a, int b) {
    // just like any variable assigning
    return a * b;
  };
  // Function is a type just like String or int
  print('$number  $greeting  $isHungry  $multiply');
  print('$number  $greeting  $isHungry  ${multiply(9, 9)}');
  print('');

  print('===Passing in and Returning functions from functions===');
  Function myAnonyFunc = namedFunction(() {
    print('Hello from Func');
  });
  myAnonyFunc(); // using the func returned from namedFunction
  print('');

  final triple = applyMultiplier(3); // this returns another function
  // triple is a constant variable of type function
  // applyMultiplier is also an example of a CLOSURE which I have notes on
  // below
  print(triple.runtimeType);
  // the anony function hasn't been run yet, just stored in 'triple'
  print(triple(6));
  print(triple(14.0));
  print('');

  print('===Anonymous functions in forEach loops===');
  const numbers = [1, 2, 3];
  numbers.forEach((number) {
    final tripled = number * 3;
    print(tripled);
  });
  // This example above shows one of the main benefits of anony functions,
  // which is packaging up logic that I don't need in multiple areas as
  // I would with a named function. I simply need to pass the logic around
  // either as input to or as output from another function
  print('');

  print('===Closures and scope===');
  /*
    Anonymous functions in Dart act as what are known as CLOSURES. In fact
    if I print an anony function it comes out as 
    'Closure: (type,type,...) => return type

    The term closure means that the code "closes around" the surrounding 
    scope, and therefore has access to variables and functions defined
    within that scope
  */
  var counter = 0;
  final incrementCounter = () {
    counter += 1;
  };
  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  incrementCounter();
  print(counter);
  print('');

  // with this next example, each function returned by countingFunction
  // will have its own version of the counter.
  final counter1 = countingFunction();
  final counter2 = countingFunction();
  print(counter1());
  print(counter2());
  print(counter1());
  print(counter1());
  print(counter2());
  print('');

  print('===Mini-Exercises===');
  /*
    change the youAreWonderful function in the first mini-exercise into an
    anony function. Assign it to a variable call wonderful.
  */
  final wonderful = (String name) {
    print("You're wonderful, $name");
  };
  wonderful('Kelen');
  /*
    Using forEach, print a message telling the people in the following list
    that they're wonderful
  */
  const people = ['Chris', 'Tiffani', 'Pablo'];
  people.forEach((person) {
    wonderful(person);
  });
  print('');

  print('===Arrow Functions===');
  // arrow syntax or arrow notation for one liner functions
  int add(int a, int b) => a + b;
  print(add(5, 10));
  print('');

  // we can also use with anony function one-lines: (parameters) => expression;
  // Below are some refactoring examples. I put the body of the functions right here
  // in main rather than abajo to keep them together. All of these are one-liners so
  // they can be refactored to arrow functions
  print('===Refactoring Example 1===');
  // final multiply2 = (int a, int b) {
  //   return a * b;
  // };
  final multiply2 = (int a, int b) => a * b;
  print(multiply2(2, 3));
  print('');

  print('===Refactoring Example 2');
  // also for the returned anony function
  // Function applyMultiplier2(num multiplier) {
  //   return (num value) {
  //     return value * multiplier;
  //   };
  // }
  Function applyMultiplier2(num multiplier) {
    return (num value) => value * multiplier;
  }

  final testMultiplier = applyMultiplier2(5);
  print(testMultiplier(6));
  print('');

  print('===Refactoring Example 3===');
  // we can't use it on the forEach example as its more than one line. But
  // if we refactor it down to a one-liner, then we can
  // numbers.forEach((number){
  //   return number*3;
  // });
  numbers.forEach((number) => print(number * 3));
  print('');
  print('===Mini-Exercise');
  /*
    change the forEach loop in the previous "You're wonderful" to use arrow syntax
  */
  people.forEach((person) => wonderful(person));
  // this is an interesting example, cuz it shous that I can create a complex named
  // function, or anony function assigned to a variable, and use it as a one liner
  // => function 🤓🤯🤯
  print('');

  print('===Challenges===');
  print('===Challenge 1: Prime time===');
  /*
    Write a function that checks if a number is prime
  */
  bool primeTime(int n) {
    if (n < 2) return false;
    for (var i = 2; i < n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  print(primeTime(66));
  print(primeTime(101));
  print(primeTime(102));
  print(primeTime(13));
  print(primeTime(17));
  print('');

  print('===Challenge 2: Can you repeat that?===');
  /* Write a function named repeatTask with teh following def:
  int repeatTask(int times, int input, Function task)
  It repeats a given task on input for times number of times

  Pass an anony function to repeatTask to square the input of
  2 four times. confirm that I get  the result 65536 */
  int repeatTask(int times, int input, Function task) {
    for (var i = 0; i < times; i++) {
      input = task(input);
    }
    return input;
  }

  print(repeatTask(4, 2, (n) => n * n));
  print('');

  print('===Challenge 3: Darts and arrows===');
  /*Update challenge 2 to use arrow syntax. Actually I did in it in
  arrow syntax to start with, so already done. 🤓🤓🤓 */
}

// function with 1 parameter
String compliment(int number) {
  return '$number is a very nice number.';
}

// functions with more than one parameter
void helloPersonAndPet(String person, String pet) {
  print('Hello, $person, and your furry friend, $pet!');
}

// function with optional parameter
// NOTE: technically speaking, the ? in String? is not written after
// the type; its an integral part of the type, that is, the nullable
// String? type. more on that in chap 7
String fullName(String first, String last, [String? title]) {
  if (title != null) {
    return '$title $first $last';
  } else {
    return '$first $last';
  }
}

// function with default values
// Dart gives me the power to change the default value of
// optional or named parameter in the function by using the assignment
// operator
bool withinTolerance(int value, [int min = 0, int max = 10]) {
  return min <= value && value <= max;
}

// function with named parameters
// to create a named parameter, I surround it with {}s
// instead of square brackets.
bool withinTolerance2(int value, {int min = 0, int max = 10}) {
  return min <= value && value <= max;
}

/*
  NOTE:
    ▪ min and max are surrounded by braces, which means I MUST use 
      the parameter names when I provide their argument values to 
      the function
    ▪ Like square brackets, curly braces make the parameters inside 
      optional. Since value isn't inside the braces, it's still required
*/

// function with REQUIRED named parameters
// I can make 'value' required instead instead of optional while
// still keepint it as a named parameter. I do this by including it
// inside the curly braces and adding the 'required' keyword in front:
bool withinTolerance3({required int value, int min = 0, int max = 10}) {
  return min <= value && value <= max;
}

// functino with side affects
void hello() {
  print('Hello1');
}

var myPreciousData = 5782;
String anInnocentLookingFunction(String name) {
  myPreciousData = -1;
  return 'Hello, $name. Heh, heh, heh.';
}

// remove side effects (functions without side effects = Pure Functions)
String hello2() {
  return 'Hello!';
}

/*
Choosing good names:
  ▪ use noun phrases for pure functions; that is, ones without side effects
    For example, use averageTemperature instead of getAverageTemperature
    and studentNames instead of extractStudentNames

  ▪ use verb prhases for functions with side effects. For example
    updateDatabase or printHello

  ▪ Also use verb phrases if I want to emphasize that the function does
    a lot of work. For example, calculateFibonacci or parseJson

  ▪ Don't repeat parameter names in the function name. For example
    use cube(int number) instead of cubeNumber(int number), or 
    printStudent(String name) instead of printStudentName(String name)
*/

// function with optional type
// Dart can infer return types as well as parameter variables. But it has to fall
// back on dynamic for the unknown parameter type
compliment2(number) {
  return '$number is a very nice number.';
}

// Dart sees:
// String compliment(dynamic number){...}

// exercise 1
String youAreWonderful(String name) {
  return "You're wonderful, $name";
}

// exercise 2
String youAreWonderful2(String name, int numberPeople) {
  return "You're wonderful, $name. $numberPeople people think so.";
}

// exercise 3
String youAreWonderful3({required String name, int numberPeople = 30}) {
  return "You're wonderful, $name. $numberPeople people think so.";
}

// So why all the stealth of being anony functions? Sometimes I only
// need functions in one specific spot, for one specific reason, and
// there's no reason to give that function a name. We just remove
// the return type (it'll be inferred) and the name
// (int number){ return '$number is a very nice number.';}
// In Dart functions are first-class citizens, meaning they can be
// used like any other type

// just as I can write a function to take an int or String I can write
// a function to take another function as a parameter
/*
  void namedFunction(Function anonyFunction){
    ...
  }
*/

// I can also return them as output
Function namedFunction(Function anonyFunc) {
  return anonyFunc;
}
// Functions that return or accept functions are called HIGHER ORDER FUNCTIONS

// Returning a function
Function applyMultiplier(num multiplier) {
  // note my return type is 'Function' and my parameter is of type 'num'
  // meaning it can be either an int or double
  return (num value) {
    return value * multiplier;
  }; // we need this ';' since this is a return statement
}
// its like a machine that makes other machines (function that returns other
// functions)

// Using a closure as a function return value, and, count the number of
// times a function is being called
Function countingFunction() {
  var counter = 0;
  final incrementCounter = () {
    counter++;
    return counter;
  };
  return incrementCounter;
}

/*
  Key Points:
    ▪ Functions package related blocks of code into reusable units
    ▪ A function signature includes the return type, name and params.
      The function body is the code between the {}s
    ▪ Parameters can be positional or named, and required or optional
    ▪ Side effects are anything, besides the return value, that change
      the world outside of the function body.
    ▪ To write clean codoe, use functions that are short and only do
      one thing
    ▪ Anonymous functions don't have a function name, and the return 
      type is inferred
    ▪ Dart functions are first-class citizens and thus can be assigned
      to variables and passed around as values
    ▪ Anonymous functions act as closures, capturing any variables or 
      functions within its scope
    ▪ Arrow syntax is a shorthand way to write one-line functions.

*/
