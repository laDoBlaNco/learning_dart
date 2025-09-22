// ignore_for_file: unused_local_variable, dead_code, unnecessary_null_comparison

/*2.1.2 NULLABILITY AND NON-NULLABILITY*/

void main() {
  /*As I can deduce from the name, a nullable variable can either be null or have a 
    value of its type. On the other side, a non-nullable variable can never hold 
    the null value
  */
  int? age = 25; // a 'nullable' variable (because it COULD be 'null')
  age = null;

  String? name; // 'name' is automatically initialized with 'null'
  String? name2 = null; // This is redundant but allowed

  /*So the question mark after the type/class name (int?) denotes a nullable type
    so age could either be an integer or null. If I didn't add the question mark,
    then the variable would have been nonnullable and thus never null
  */

  int age2 = 25; // a non-nullable var (because it will NEVER be null)
  // age2 = null; // error: a value of type null can't be assigned to var of type int

  /*From Dart 2.12 onwards, the language enables non-nullability be default. A local
    non-nullable var doesn't need to be initialized immediately, but I must assign it
    a value before its used. for example, te following is valid since I'm only using
    cartItems AFTER its been initialized with a value:
  */
  int cartItems;
  int getCartSize() {
    return 7;
  }

  var cartIsEmpty = false;

  if (cartIsEmpty) {
    cartItems = 0;
  } else {
    cartItems = getCartSize();
  }

  print(cartItems); // OK because cartItems was initialized
  print('');

  // On the other hand, it is a compile error trying to access a non-nullable before
  // its initialized
  int cartItems2;
  // print(cartItems2); // The non-nullable var must be assigned before use

  /*This is very safe because I'm geting the error at compile-time and not at runtim.
    In addition, I'm guaranteed that a value will NEVER be null so there is no need
    to make manual nullability checks on the code

    NOTE that this initialization rule is ONLY valid for local variables. For top-level
    and class variables instead REQUIRE the late modifier, which is used in 2 cases:

      ▪ to declare a non-nullable (top-level or class) variable that is initialized 
        after its declaration

      ▪ lazily evaluating functions (more on this in Chapter 3 - "Control flow and 
        functions")

    The late keyword has a lot of interesting cases where it can be used, and I'll
    see all of them in the next chapters. For now, here is how to use it with variable
    initialization:

      ▪ In the case of local variables, no late keyword is required. The Dart analyzer
        can automatically detect whether the var was already initialized or not:
  */
  int a;
  a = 10;
  print(a);

  /*  ▪ In the case of top-level vars, I need to use late to initialize them lazily
  */
  aLate = 10;
  print(aLate);

  /*Now in this case the analyzer can't tell whether the variable was already
    intialized or not. As such, I need to use late and MANUALLY ensure (as done) that
    it's initialized before being used. I paid attention to call aLate=10, before 
    printing the value. If not, I would have a runtime error
  */
  // print(aLate2); // No error when I compile, but when I run... I get an
  // Unhandled exception: LateInitializationError: Field 'aLate2' hasn't been initialized

  /*The runtime exceptin is thrown because a late non-nullable variable is accessed before
    being set. In other words, late DISABLES SOME COMPILE-TIME CHECKS and gives me the
    responsibility of correctly initializing variables. This isn't a bad thing but I 
    indeed have to pay more attention to the code I write.
  */

  /*  ▪ I can add final in front of late as well for a one-time initialization of the 
        variable
    
    It's recommended to always initialize a variable immediately whenever possible
    and avoid top-level (global) variables. Also use the late keyworl only when
    needed.

    When I declare a nullable  variable, it is null by default, so technically 
    initialized already. So I can always use it even without assigning it a value
  */
  int? value; // this initializes it to null
  print(value); // prints the null

  // i can do this null check to make sure its not null before using it for something
  // specific
  if (value != null) {
    print(value);
  }

  /*I should keep in mind that there absolutely is NOTHING wrong with null. It is 
    extremely useful to represent the absence of value. Its not el cuco or anything
    as some people try to portray. the probelem is not null itself but rather the 
    fact that it might lead to certain situations that I don't expect. Nullable 
    variables may be harder to maintain, but sometimes they're just the right 
    choice. In general, the recommendation is:

      ▪ Try to use non-nullable variable as much as possible. For example, if I want
        to indicate that a cart of my shopping app may be empty, prefer 
        int cartCount = 0; instead of int? cartCount;

      ▪ When I need to represent the 'absence' of a value and using a default one
        doesn't do it for me, then use a nullable variable

    Before moving on, I need to spend a little time on the conversions I can make 
    between nullable and non-nullable. Any non-nullable variable can be assigned a
    nullable variable but the contrary is not allowed
  */

  // This is a function that returns a nullable integer and accepts no values
  int? value2() {
    return 5;
  }

  int? nullable = value2(); // this is ok
  // int notNullable = value2(); // Error: A value of type int? can't be assigned to a
  // variable of type int

  /*This example above doesn't compile because the function value2() returns a nullable
    integer, which can't be assigned to a non-nullable value. On the other side, if the
    function return an int, then it could be given to both vars, as it returns an actual
    value. So these checks are all at the type/class level
  */
  int value3() {
    return 5;
  }

  int? nullable3 = value3(); // no issues
  int notNullable3 = value3(); // again no issues

  /*I can also usually use the bang operator to convert a non-nullable variable into a 
    nullable variable. 
  */
  int? value4() {
    return 5;
  }

  int? nullable4 = value4(); // as expected no issues
  int notNullable4 = value4()!; // this is what errored before, but now...

  /*The function's return type is still int?, a nullable value, but I know its returning
    a value, so I can use value()! (with the ! at the end) to tell the compiler: "Hey!
    I know what I'm doing. Convert the result of this function to a non-nullable type". 
    If it would have return null though when we told the compiler it wouldn't...
  */
  int? value5() {
    return null;
  }

  int? nullable5 = value5();
  // int nonNullable5 = value5()!; // It'll allow it to compile fine, but...
  //When run I get Unhandled exception: Null check operator used on a null value

  /*NOTE that the ! throws runtime errors because it makes a RUNTIME CAST. As such
    the compiler won't be able to help me; I'll need to manually check if the cast
    is safe or not.

    Now that I have a complete overview of varibvle initialization and null safety,
    I can proceed to look at some of the Dart types
  */
}

late int aLate; // Dart would error if I don't have 'late' here
late int aLate2;
