// ignore_for_file: unused_element

void main() {
  /*3.4.3 - OPTIONAL PARAMETERS

    Function parameters can be OPTIONAL because if I don't give them a value, the 
    compiler assigns a default one. The following subsections describe how optional
    parameters of functions are handled in Dart

      NOTE: I need to pay close attention here as this gets into the different syntaxes
            that confused me a bit going through 'Dart Apprentice' and Flutter tuts. 
            There is also some similarity, I believe, to Go here.

    3.4.3.1 - OPTIONAL NAMED PARAMETERS

    "Optional named parameters" are declared INSIDE CURLY BRACES and, as the name 
    suggests, they are optional. When an optional parameter is NOT intialized with a
    value, the default one is returned. The order in which they are called doesn't
    matter. For example
  */
  void test({int a = 0, int b = 0}) {
    print('$a');
    print('$b');
  }

  test(a: 2); // param entered with 'name:value'
  print('');
  /*When default value of an optional named parameter is not give, the variable MUST
    be nullable. In this case, the compiler automatically intitializes the variable
    with null fi it's not assigned. For example
  */
  void test2({int? a, int? b}) {
    print('$a');
    print('$b');
  }

  test2(b: 2);
  print('');

  /*Despite the 'optional' nature, any optional named parameter can also be required
    by adding the 'required' keyword It forces a parameter to always be defined and 
    does NOT allow default values. For example:
  */
  void test3({required int? a, int? b}) {
    print('$a');
    print('$b');
  }

  test3(a: 2, b: -3);
  test3(a: null, b: -3);
  test3(a: 5);
  // test3(b: -3);//Error: The named parameter 'a' is required

  /*As I can see, even if 'a' is nullable, I must always intialize it. The main reason
    why I should use optional named parameters is readability. Here's another example:
  */
  double doSomething(int val) => 66.0;
  void computeValue({
    required int value,
    required void Function(double) onSuccess,
    void Function(String)? onError,
  }) {
    final result = doSomething(value);

    if (result >= 0) {
      onSuccess(result);
    } else if (onError != null) {
      onError('Error code: $result');
    }
  }

  /*This function performs some calculations and then uses two callbacks (onSuccess and
    onError) to report the results. Thanks to named params, it's clear which callback
    is triggered in case of success and which one in case of error, and Note onError
    Function type is nullable 🤔
  */
  print('');
  computeValue(
    value: 10,
    onSuccess: (double value) => print('Result: $value'),
    onError: (String errorMsg) => print(errorMsg),
  );

  /*A TEAR-OFF closure takes the same parameters and return type as the function. I've
    heard of this before. In our example, the signature of onError matches the signature
    of print because they both return void and accept a String parameter. I guess this 
    just means that its a named function that we just drop in where the callback would 
    go since has the same signature as in the following
  */
  print('');
  void successCallback(double value) => print('Result: $value');
  computeValue(value: 10, onSuccess: successCallback, onError: print);
  /*Since successCallback has the same signature as onSuccess, I have used a "tear-off"
    to assign the function directly to the parameter. This is just syntactic sugar
    because I could have indeed attached an anony function. it seems like its again
    just to make it more readable and easier to work with. 

    The official documentation recommends to prefer function tear-offs when possible
    since they make the code more concise. I can mix "regular" unnamed and optional 
    params together, but optional ones ALWAYS go last in the declaration list:
  */
  // This is ok - Unamed first, anmed optional last
  void function1(int a, {int? b, required int c}) => print('$a $b $c');

  // ERROR - Named must be last. Expected to find ')' after the optional named params.
  // void function2({int? b, required int c},int a)=>print('$a $b $c');

  // In Dart 2.7 and lower versions, the required keyword didn't exist

  /*3.4.3.2 - OPTIONAL POSITIONAL PARAMETERS:

    Optional positional params are defined inside square brackets and are optional.
    They share most of named parameters' properties. When an optional positional
    parameter is not initialized with a value, the default one is returned
  */
  void test4([int a = 0, int b = 0]) {
    print('$a');
    print('$b');
  }

  print('');
  test4(2);
  /*The main difference from named parameters is that the order MATTERS. Consider the
    test4 function above. Since params' values are no longer assigned by name, I can
    only initialize them by giving each one (in order) a value. for example, there is
    no way to only initialize b without giving a a value. 
  */
  print('');
  test4(4);
  test4(0, 4);
  print('');
  /*There is no way to ONLY assign b because a is declared first and thus the initialization
    order DOES matter. When a default if not given, the variable MUST be nullable:
  */
  void test5([int? a, int? b]) {
    print('$a');
    print('$b');
  }

  test5(null, 2);
  print('');
  /*There is no required keyword for optional positional parameters. Positional params
    can be mixed with regular ones but (as it happens with named ones) they must be 
    defined at the end:
  */
  // ok -- unnamed first, positioned last
  void function3(int a, [int? b, int c = 0]) {
    print('$a $b $c');
  }
  //Error - Positional must go last - Expected ')' end of signature after positionals so
  //int a not even seen and remains undefined.
  // void function4([int? b, int c=0],int a){
  //   print('$a $b $c');
  // }

  /*Optional named parameters are more commonly used than positional ones (especially 
    in Flutter) because the order doesn't matter.
  */
}
