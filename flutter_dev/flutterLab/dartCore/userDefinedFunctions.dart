/*
Dart Core - User Defined Functions

In dart, a user-defined function is a set a code blocks that perform a specific  task or a 
series of tasks. Functions are essential building blocks of any programming language, and
they help in organizing code, promoting reusability, and making the code more modular and
manageable. I can define functions in dart using the 'void' keyword for functions that 
don't return any value, or I can specify the return type for functions that return a
value

  returnType functionName(parameterType parameter){
    // function body with code blocks
    // code to perform the desired tasks
    // optionally, I can return a value using the 'return' keyword for non-void functions
  }

*/

void main() {
  // no return  type, no parameters: a function with no return value and no parameters is a simple function
  // that performs a task without taking any inputs or returning any value. it is defined using the 'void'
  // keyword
  void sayHello() {
    print('Hello, how are you?');
  }

  sayHello();

  // No return type with parameters: A function with no return type and parameters is used to perform
  // a task that requires inputs but doesn't return any value. Parameters are specified within
  // parenthesis, and their data types can be defined
  void greetPerson(String name) {
    print('Hello, $name');
  }

  greetPerson('LadoBlanco');

  // Return type and no parameters: A function with a return type but no parameters takes no input but does
  // return a value after performing its tasks
  int getRandomNumber() {
    return 42; // not a random number really, but just for demo
  }

  int number = getRandomNumber();
  print('Random Number: $number');

  // Both return type and parameters: A function with both a return type and parameters takes input values,
  // processes them, and returns a result based on the provided inputs.
  int addNumbers(int a, int b) {
    return a + b;
  }

  int result = addNumbers(5, 10);
  print('Sum: $result');
}
