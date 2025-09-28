// ignore_for_file: unused_local_variable

void main() {
  /*3.4.1 -- THE FUNCTION TYPE  

    In Dart EVERYTHING is an object, and function are no exception. The Function
    class is the supertype of all kinds of functions. I'll focus on the someFunction
    variable for this example:
  */

  //The 'someFunction' var has the 'bool Function(int,int)' type:
  bool Function(int, int) someFunction;

  //'someFunction is first used to get the remainder
  someFunction =
      hasRemainder; // my only question I suppose is "why do this??? 🤔"
  print(someFunction(10, 5));

  //someFunctino then used to check for numbers equality
  someFunction = areEqual;
  print(someFunction(5, 5));
  print('');
  /*It's nothing different from the usual: I'm delcare a type (bool Function(int,int))
    and its name (someFunction). the syntax is particular because the complete function
    signature is required but it is nothing new. It reminds me of function declarations
    in C and C++ actually. For example, compare the following declarations:

      ▪ int year = 2025;  The type is int and the value is 2025
      ▪ String name = 'Ladoblanco';  The type is String and the value is 'Ladoblanco'
      ▪ bool Function(int,int) fn = areEqual;  The type is bool Function(int,int) and
        the value is a function with a MATCHING signature

    When I write a function, Dart automatically converts it into a Function object. 
    I can check this by calling runtimeType on the function and seeing that it 
    returns the signature. For example:
  */
  print(hasRemainder.runtimeType);
  print(areEqual.runtimeType);
  print(printName.runtimeType);
  print('');

  /*Its ALWAYS recommended defining the function's return type cuz, if absent, the
    compiler assigns 'dynamic' by default. I should prefer using void rather than
    omitting the return value. For example:
  */
  void Function(int?) good = printValue1;
  Function(int?) bad =
      printValue2; // even putting void on the function type, its
  // still dynamic from the declaration. Also the dynamic return still fits the signature
  // for the assignment above. But I'll remove so the other point is made.

  print(good.runtimeType);
  print(bad.runtimeType);
  print('');

  // I still don't get why I would use this, but I'll probably see it later. 
  // In chapter 4 - Section 4.1 "The call() method" I'll see how classes can behave
  // like functions.
}

bool hasRemainder(int dividend, int divisor) => dividend % divisor > 0;
bool areEqual(int first, int second) => first == second;
void printName(String name) => print(name.toUpperCase());
void printValue1(int? value) => print(value);
printValue2(int? value) => print(value);
