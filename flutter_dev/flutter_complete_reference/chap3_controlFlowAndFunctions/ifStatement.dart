// ignore_for_file: unused_local_variable, unnecessary_null_comparison

void main() {
  /*3.1 - THE IF STATEMENT

    This is probably the most famous statement of any programming language, and it
    works exactly as expected in Dart. It evaluates a bool value or expression and
    splits the execution flow two or more branches using the if and the optional else
    keywords:
  */
  final value = 0;

  // using both branches
  if (value >= 0 && value != null) {
    print('Good');
  } else {
    print('Bad');
  }

  // using a single branch, without else
  if (value == 0) {
    print('Zero!');
  }

  /*While in c++ the if(0) construct is valid because 0 evaluates to false, in Dart
    this is not valid because ONLY boolean values are allowed. I could also avoid 
    using {} but, as the official Dart guidlines suggest, its recommended to not do
    that. I can chain if statements as much as I want with the 'else if' syntax:
  */
  var value2 = 'Dart';
  void doSomethingWithDart() => print('Something with Dart');
  void doSomethingWithJava() => print('Something with Java');
  void doSomethingWithGo() => print('Something with Go');
  if (value2 == 'Dart') {
    doSomethingWithDart();
  } else if (value2 == 'Java') {
    doSomethingWithJava();
  } else if (value2 == 'Go') {
    doSomethingWithGo();
  } else {
    print('Error');
  }
  print('');

  /*CONDITIONAL EXPRESSIONS are used to select one or two values based on a bool condition.
    They let me concisely evaluate expressions that might otherwise require an if-else
    statement. In Dart, there are two operators for conditional expressions:

      ▪ valueA ?? valueB: evaluates the first value (or expression) and returns the second
        if it resolves to null (null-aware conditional). To better understand when ?? 
        operator can be helpful, here's an example:
  */
  // tryParse returns null if the conversion fails
  var number = '66';
  final int? value3 = int.tryParse(number);
  int year;

  if (value3 != null) {
    year = value3;
  } else {
    year = 0;
  }
  print(year);

  // an equivalent but less verbose version would be the following
  final year2 = value3 ?? 0;
  print(year2);

  /*    The ?? operator provides a default value when the left-hand value is null.
        Note that in this example, year/year2 is only 0 if value3 is null. Furthermore,
        year/year2 does NOT need to be nullable because it's guaranteed to either be
        the parsed value or zero and the Dart analyzer can see that.

      ▪ condition ? valueA : valueB: this expression (also known as the ternary expression
        or operator in other languages) is just syntactic sugar that replaces the if with
        a ? and the else with a :. Prefer using this with one-liner statements to preserve
        readability (instead of if statements with no {}s )
  */
  // this is verbose
  final someNumber = 0;
  String sign1;
  if (someNumber >= 0) {
    sign1 = '+';
  } else {
    sign1 = '-';
  }

  // here's the same but with the ternary expression
  final sign2 = someNumber >= 0 ? '+' : '-';
  //Ternary operators can be used in sequence but the longer the chain, the lower
  //code readability. For example:
  int getId() => 3824;
  bool getAdminStatus() => true;

  final id = getId();
  final isAdmin = getAdminStatus();

  final canAccess = isAdmin
      ? true
      : id < 0
      ? true
      : false;
  print(canAccess);
  /*    At first glance I can't tell how canAccess is being built because of the
        nested ternary operators not being very expressive. In these cases, I should
        prefer the normal if-else statements

    The if statement is also useful to crate a "safe scope" for nullable variables, as
    I learned in the previous chapter. When a null-check succeeds, for example, the 
    compiler undestands it and gives for granted that the variable can never be null
    within that branch scope. for example:
  */
  void doSomething(int value) {
    print(value);
  }

  final int? value4 = int.tryParse('');
  if (value4 != null) {
    doSomething(value4);
  }

  /*Even if value4 has a nullable integer type, inside the scope of the if statement
    it CANNOT be null and the compiler understands that. As such, the above example 
    compiles because value4 is treated as an int inside the if statement scope. This
    next example raises a compiler error though:
  */
  // doSomething(value4); // The argument type 'int?' can't be assigned to the param type 'int'

  /*Since value4 is not "protected" by an if guard (nullcheck) anymore, the compiler can't
    be sure that the variable will never be null
  */
}
