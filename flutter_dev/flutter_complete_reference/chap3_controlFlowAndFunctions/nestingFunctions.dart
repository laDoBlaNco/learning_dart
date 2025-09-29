// ignore_for_file: unused_local_variable, unused_element

void main() {
  /*3.4.4 NESTING FUNCTIONS

    The language allows me to declare functions inside other functions. i've been
    doing this up until now putting functions inside of main. They are visible 
    only in the scope in which they're declared. In short, nested functions can 
    only be used by the function that contians them. For example:
  */
  int nestedFn1(int value) {
    // Nested in main
    int nestedFn2() => 2022 + value; // Nested in nestedFn1
    return value * nestedFn2();
  } // This is ... WOW 🤯🤯🤯

  final test1 = nestedFn1(10); // this is ok
  // final test2 = nestedFn2(); // this is an Error as function not defined in this scope

  /*The nestedFn2 isn't even seen. I can only be accessed within the scope in which it's
  declared. As such, only nestedFn1 can use it. The main function can't see nestedFn2. In
  the other direction, a nested function CAN ACCESS ALL enclosing variables:
  */
  const a = true;
  void nestedFunction() {
    const b = true;

    void moreNestedFunction() {
      // can use vars from all enclosing scopes
      const c = true;

      print('$a');
      print('$b');
      print('$c');
    }
  }

  // print(b); // Error: Undefined name 'b'. 'b' is not in scope

  /*The moreNestedFunction function can access its members (c) and the ones from the
    enclosing functions scope (b and c). The last print call raises a compiler error
    since b is not in the main scope, so the var can't be referenced
  */
}
