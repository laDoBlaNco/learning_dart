// ignore_for_file: unnecessary_null_comparison, dead_code, unused_local_variable

/*
  2.1 VARIABLES

  All variables in Dart have a type. I can either decide to explicitly declare the type or just 
  let the compiler determine it. The syntax is very similar to other high-level programming
  languages:
*/
void main() {
  var name = 'Alberto';
  var age = 25;

  /**
   * In the above example, the name variable stores a reference to a String object whose value is
   * 'Alberto'. In this case, the type is inferred because  the compiler is able to automatically
   * determine the type by looking at the value. Any variable declared with 'var' can later be
   * re-assigned with a different value of the same type. 
   */

  String name2 = 'Alberto';
  int age2 = 18;

  /**
   * This is equivalent to the previous example, with the only difference being that we have 
   * explicitly declared the types rather than letting the compiler figure them out. (this also
   * means that we can change the variable or reassign if we want as long as its the same type).
   * All types in Dart descend from the 'Object' supertype so I could have also done the 
   * following:
   */
  Object name3 = 'Alberto';
  Object age3 = 18;

  // There is also a 4th way to initialize a variable, but its the least recommended way since
  // it has no type safety:
  dynamic name4 = 'Alberto';
  dynamic age4 = 18;

  /**
   * They dynamic keyword is a sort of 'wild card' for all types: its evaluation happens at 
   * runtime when the variable is created, so static analysis tools can't do any checks. This
   * also means that the compiler and the IDE can't detect type errors since they won't be
   * discovered until runtime. According to the official Dart guidelines its recommended
   * to do the following:
   * 
   *    • prefer initializing varibles using var or final (or const, which I'll cover soon)
   * 
   *    • whenever I see that the type of a variable might not be trivial to guess, avoid
   *      type inference and write downt he type itself
   * 
   *    • avoid  using 'Object' and 'dynamic' whenever possible
   * 
   * There are a few cases wherre the 'Object' type is worth using, and I'll see an example
   * in chapter 9 - Section 1.1 "The conversion library". Regardless, I'll hardly ever work
   * with it directly and the same also goes for dynamic.
   */
  /*
    2.1.1 FINAL AND CONST

    When I know that the value of a variable is not goign to change over time, I should use
    'final' instead of 'var'. If the value of the variable will never change and it can be
    determined at compile-time, I should prefer 'const'. Here some examples:
  */
  // • When using var, the value of the variable can be changed
  var age6 = 18;
  var isBirthday = true;
  if (isBirthday) {
    age6 = 19; // this is ok since its the same type
    // age6 = '19'; // this is an error since its a String type and not the inferred 'int'
  }

  // • When using 'final', the value of the variable can't change after its set
  final age7 = 18;
  if (isBirthday) {
    // age7 = 19; // error: the final variable can only be set once
    // age7 = '19' // error: the final variable can only be set once and a value of type String can't be an int
  }

  // • When using 'const', the value of the variable can't change and it must be a
  //   compile-time constant value (such as a number, string, or an enum literal):
  const age8 = 18;
  final newAge = 19;
  if (isBirthday) {
    // age8=19; // Error: constant vars can't be reassigned
    // age8 = newAge; // Error: constant vars can't be assigned a value after initialization
  }

  /*
    In any case, thanks to Dart's strong typing system, afer I assign the type to a var it'll
    never change. A 'const' variable is implicitly 'final' too. Most of the time, I'll be using
    either 'var' or 'final'. The static analysis tools (or the IDE) will produce warnings to
    remind me to prefer one over the other (if it's the case)

      NOTE: The 'final' doesn't provide any performance benefits when compared to 'var'. They
      do the same thing, with the only difference being that the former disallows re-assigning
      the variable

    I can also explicitly write down the type of a variable when using 'final', 'const', or var.
    This is useful when I want to "override" the default type-inference rule of the compiler. For
    example:
  */

  const integer = 18;
  const double notInteger = 18;

  print(integer.runtimeType.toString());
  print(notInteger.runtimeType.toString());
  print('');

  /*
    The compiler is smart enough to figure out that 18 is a whole number so the 'int' type fits
    perfectly. The const double syntax instead disables type inference and tells the compiler
    the exact type that I want to use. The 'runtimeType' property (since its inherited from
    Object) is available on any type and gives information about the runtime type of a variable.
    I can obtain the same output with a small trick as well. By adding a .0 (18.0) to the 18
    The compiler treats 18 and 18.0 differently because in the second case, there is a decimal
    digit (the zero) and thuse the value doesn't fit into an 'int' anymore. Since 18 is a 
    literal and also a compile-time constant, I can use 'const', but 'final' would work
    as well.

    Since 'const' values are also 'final', constant  values can be assinged to 'final' variables.
    However, a 'final' value can't be assigned to a const variable.
  */

  // const values can be assigned to a 'final' variable
  const constVal = 1;
  final finalVal = constVal; // this is ok no issues

  // 'final' values CANNOT be assigned to 'const' variables
  final finalVal2 = 1;
  // const constVal2 = finalVal2; // error: Const variable MUST be initialized with a const value

  /*
    In other words, 'const' is a stricter version of 'final'. From all of the information I've
    covered up to now, the following are the most important to remember:

      • If the value is never going to change, I should prefer initializing variagles using 'const'
        (for compile-time values) or 'final' (fon non-compile-time values). When possible, use 'const'
        since it's more efficient than 'final' (I'll see why in Chapter 4 - Section 2.3 "Constant 
        Constructors");

      • If the value may change after its initialization, use 'var';

      • When using 'var', 'final' and 'const' I can still manually define the type to "disable" the
        type-inference machinery and assign the type I want to.

    Now, I'll move on to see variable initialization and null safety.

    2.1.2  NULLABILITY AND NON-NULLABILITY

    As I've seen already from the definitions, a NULLABLE variable can either be null or have a
    value of it's type. On the other side, a NON-NULLABLE variable can never hold the null value. For
    example:
  */
  int? nullAge = 25; // a 'nullable' variable (because it COULD be 'null')
  nullAge = null;

  String? nullName; // 'nullName' is automatically initialized with 'null'
  // String? nullName = null; // this is ok, but its redundant

  /*
    The ? after the type name (int?) denotes a nullable type and so 'nullAge' could either be
    an integer or null. If I didn't add the question mark, then the variable would have been
    non-nullable and thus never null:
  */

  int nonNullableAge = 25; // a 'non-nullable' variable (since it will NEVER be 'null')
  // nonNullableAge = null; // Error1 nonNullableAge is 'int' and not 'int?' so it can't be 'null'

  /*
    From Dart 2.12 onwards, the language enables non-nullability by default. A local non-nullable
    variable doesn't need to be initialized immediately, but I must assign it a value
    before using it. For exaample, the following is valid since I'm only using cartItems AFTER
    it's been initialized with a value:
  */
  int cartItems;
  var cartIsEmpty = false;
  int getCartSize() {
    return 5;
  }

  if (cartIsEmpty) {
    cartItems = 0;
  } else {
    cartItems = getCartSize();
  }
  print(cartItems); // this is ok since 'cartItems' was initialized

  // on the other side, it is a compile error trying to access a non-nullable before its
  // initialized.
  int cartItems2;
  // print(carItems2); // error: undefined name, wasn't initialized before use

  /*
    This is very safe because I'm getting the error at compile-time (and really before with vscode).
    In addition, I'm guaranteed that a value will NEVER be 'null' so there is no need to make 
    manual nullability checks on the code:
  */
  int value;
  value = 10;
  if (value != null) {
    // Warning: Unnecessary null comparison; operand can't be null
    print(value);
  }

  /*
    Note that this initialization rull is ONLY valid for local variables. For top-level and
    class variables instead require the 'late' modifier, which is used in 2 cases:

      • to declare a non-nullable (top-level or class) variable that is initialized after its
        declaration;
      • to lazily evaluate functions (more on this in chapter 3 - "Control flow and functions");

    The 'late' keyword has a lot of interesting cases where it can be used, and I'll see them all
    in the next chapters. For now, here is how it can be used to initialize variables:
  */
  //  • Ive just seen that, in the case of local variales, no 'late' keyword is required. The
  //    Dart analyzer can automatically detect whether the variable has already initialized or
  //    not:
  int a;
  a = 10;
  print(a);

  //  • In the case of top-level variables, I need the late keyword to initialize the lazily
  //    (top level 'b' declared outside of main below)
  b = 10;
  print(b);

  /*
        In this case, the analyzer can't determine whether the variable was already initialized or
        not. As such, I need to use 'late' and MANUALLY ensure (as I did) that it's initialized
        before using it. I pay attention to call b=10, before printing b. If not, I get a runtime
        error:
  */
  //    print(c);  // note this doesn't error at compile-time, hence vscode doesn't catch it. But
  //    when I run it I get: Unhandled Exception: LateInitializationError: Field 'c'...

  /*
        The runtime  exception is thrown because a 'late' non-nullable variable is accessed before
        being set. In other words, 'late' disables some compile-time type checks and gives me
        the responsibility of correctly initializing variables. This isn't a bad thing but I need
        to pay more attention to the code I write if using 'late'.

      • I can add the 'final' modifier in front of 'late' for one-time initialization of the
        variable.
    
    The recommendation is to always initialize a varible immediately when possible and avoid
    top-level variables, which are basically just global variables (and we all know how dangerous
    those can be). Its also recommended to use 'late' only when needed.

    When I declare a nullable variable, it is 'null' by default (technically already initialized)
    so I can always use it even without assigning it a value:
  */
  int? value2;
  // value2 = 66;
  print(value2);

  // here we can use null-checks
  if (value2 != null) {
    print('value2 is not null');
  }

  /*
    Keep in mind that there is absolutely NOTHING wrong with 'null'. It is extremely useful to
    represent teh absence of a value. The problem is not 'null' itself but rather the fact that
    it might lead to certain situations that I don't expect. Nullable variables may be harder
    to maintain, but sometimes they're just the right choice. In general, the recommendation is:

      • Try to use non-nullable variables as much as possible. for example, if I want to indicate
        that the cart of my shopping app may be empty, prefer 'int cartCount = 0;' rather than
        'int? cartCount;'

      • When I need to represent the "absence" of a value and using a default one doesn't sense,
        then use a nullable variable.

    Before moving on, I need to spend some time on the conversions I can make between nullable
    and non-nullable. (I remember the first time I learned this it was a little confusing). Any
    non-nullable variable can be assigned to a nullable variable but the contrary is not allowed.
    For example:
  */

  // this function returns a nullable integer and accepts no values
  int? value3() {
    return 5;
  }

  int? nullable = value3(); // this is ok
  // int notNullable = value3(); // Error: a value of type int? can't be assigned to a variable 'int'

  /*
    The last line doesn't compile since the function 'value3()' returns a nullable integer, which
    can't be assigned to a non-nullable variable. On the other hand, if the function returned an
    'int', then both lines will work. for exaample:
  */

  // note that this function returns 'int' rather than 'int?'
  int value4() {
    return 66;
  }

  int? nullable4 = value4(); // good to go
  int notNullable4 = value4(); // and good to go

  // I can manually use the ! operator to convert a non-nullable var into a nullable one.
  // note the line that didn't compile from above
  int notNullable = value3()!; // now its ok because of the '!' operator

  /*
    The function's return type is int?, a nullable value, but I know its returning a non-nullable
    value so I'm use 'value3()!' to tell the compiler: "Hey, I know what i'm doing. Convert the
    result to a non-nullable value". If it did return null... I'd get a runtime error rather
    than a compile-time error. The bang operator throws a runtime error because it makes a runtim
    cast. As such, the compiler won't be able to help me; I will need to manually check if the cast
    is safe or not.

    Now that I've completed an overview of variable initialization and null safety, I can start
    to look at Dart's data typs.
  */
}

late int b;
late int c;
