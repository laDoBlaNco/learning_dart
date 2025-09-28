// ignore_for_file: unused_element

void main() {
  /*3.4 -- FUNCTIONS

    Functions in Dart are define with the return type, the name, an (optional) list of
    parameters and a body. More formally, a function consists of a SIGNATURE and a BODY
    with a scope. Here's an example
  */
  bool hasRemainder(int dividend, int divisor) {
    // function signature
    return dividend % divisor > 0; // function body
  }

  /*When the function body contains a single line, I can use the arrow syntax (which
    only works with expressions, not with statements). In the following example, there
    is a compiler error in the second function because the arrow syntax is used with a
    statement and not with an expression:
  */
  // OK - the arrow => replaces the return statement
  bool hasRemainder2(int dividend, int divisor) => dividend % divisor > 0;

  // Error -- can't use statements wiht the arrow syntax
  // bool hasRemainder3(int dividend, int divisor) =>if(dividend>divisor)return true;

  /*Because of its type-safe nature, in Dart any function must always have a return
    type. If I don't declare it, the compiler will automatically assign dynamic:
  */
  // GOOD - use 'void' when no return value are needed
  void helloWorld() => print('Hello world!');

  // BAD - The return type here is 'dynamic' because I haven't provided one
  helloWorld2() => 'Hello world';
  print(helloWorld.runtimeType);
  print(
    helloWorld2.runtimeType,
  ); // it says 'void' not dynamic 🤔, ok but that was
  // because I was return void, now I have void but return a string and it changes
  // to String. That means it actually is dynamic since it changes automatically.
  // The first one doesn't change has its set to void from the signature,so even if
  // I try to return a string, it continues to say Void.
  print('');

  /*Its recommended to ALWAYS specify the return type and to use void when I don't 
    need to return a value. Interestingly, I can also the arrow syntax in one-liner
    void functions (which I already did above 🤓🤓 cuz I'm that smart) too, but the
    returned value (if any) is ignored if I use 'void'

    The second example above looks a bit weird so it'd be better to use the arrow
    syntax in void functions that call other void functions (as in the first example). 
    In chapter 2 -- "Top and bottom types" I was introduced the particular Never type
    saying that it's rarely used. One of the few use-cases for that type is when a 
    function doesn't return normally. Here is how I should work with functions and 
    return types

      ▪ When a function has to return a value to the caller, use the 'return' keyword.
        for example:
  */
  String snakeCase(String value) {
    if (value.contains(' ')) {
      return value.toLowerCase().replaceAll(' ', '_');
    }
    return value;
  }

  /*  ▪ When a function does not have a value to return to the caller, use the void
        return type. For example:
  */
  void snakeCase2(String value) {
    if (value.contains(' ')) {
      print(value.toLowerCase().replaceAll(' ', '_'));
    } else {
      print(value);
    }
  }

  /*    Note that return can also be used with void but without a value. This is 
        generally used to 'exit' the function before the program flow arrives at the
        end. For example, I could have re-written the previous example in this form:
  */
  void snakeCase3(String value) {
    if (value.contains(' ')) {
      print(value.toLowerCase().replaceAll(' ', '_'));
      return;
    }
    print(value);
  }

  /*    This return is used to exit the function earlier to avoid executing the other
        instructions. it is a compile-time error trying to return a value from a void
        function.

      ▪ When a function never normally returns, use the Never return type. For example:
  */
  Never testFunction(String value) {
    throw FormatException(value);
  }

  /*    The return keyword cannot be used when the return type is Never. Since testFunction
        always throws an exception, it never returns a value and it never entirely 
        executes until the end. I could have written an equivalent version using void
        instead:
  */
  void testFunction2(String value) {
    throw FormatException(value);
  }

  /*    There is no practical difference between the two version actually. From a formal
        point of view, the Never version would logically be a bit more correct because
        void implies that the function always successfully terminates. This is a sort of
        edge case so feel free to not give it too much weight.

    Always return either a type or void. The official Dart documentation says that Never
    is "most often used for functions that always throw an exception". Its recommended
    avoiding Never, unless I know it is needed. 

      NOTE: As I know a bit of C and C++, I wonder if Dart parameters can be passed
            by reference as they can in those langs, by value or which is the default
            "passing" strategy. The answer is "NONE!" Since the language doesn't allow
            me to work with pointers or references to variables, the question doesn't
            make sense.

    Function parameters could ahve the final modifier, but I should avoid usint it
    because it can be either dangerous or useless:
  */
  // 1. Both 'first' and 'second' have the 'dynamic' type
  bool areEqual1(final first, final second) => first == second;
  /*In the areEqual1 function, the compiler has no clue about the parameters' types
    so it just assigns dynamic to defer the evaluation at runtime. As guessed, this
    is NOT type safe and also isn't the recommended way of declaring function 
    parameters. The areEqual2 function is fine but the final does nothing so I can
    remove it. Functions can always have a comma at the end of the parameter list
    (this is mostly for style reasons when using the dart format tool):
  */
  bool areEqual2(int first, int second) => first == second;
  /*In chapter 5 -- section 2.2 "Records" I'll see that records are often used to 
    return multiple values from a function (like tuples???). In chapter 8 -- "Futures,
    Streams and isolates" i'll learn that a function could also have the async
    modifier in the signature (which I've seen before)
  */
}
