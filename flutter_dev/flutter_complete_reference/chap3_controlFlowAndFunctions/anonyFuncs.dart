// ignore_for_file: unused_local_variable

void main() {
  /*3.4.2 - ANONYMOUS FUNCTIONS

    Up to this point, I've only seen NAMED functions in this book because each
    function object always had a name. Dart also allows me to create nameless
    functions, also known as ANONYMOUS FUNCTIONS or "CLOSURES". An anony function
    looks similar to a named funtion: 

      ▪ zero or more parameters
      ▪ parameters separated by commas
      ▪ option type annotations between ()s
    
    For example:
  */
  final areEqual = (int a, int b) => a == b;
  print(areEqual(3, 7));
  print(areEqual(7, 7));
  print('');

  /*With this syntax, I can create functions on the fly that are direclty assigned
    to a variable. An equivalent version of the previous would be the following:
  */
  final bool Function(int, int) areEqual2 = (int a, int b) => a == b;
  print(areEqual2(3, 7));
  print(areEqual2(7, 7));
  print('');

  /*The => syntax is often used for one-liner statements. In case of multiple lines,
    I could make the code more readable by using curly braces. But I wonder if like 
    other languages, the => works with {} 🤔🤔 - NOPE!
  */
  final namePrinter = (int version) {
    final name = 'Flutter Complete Reference';
    return '$name $version.0';
  };
  print(namePrinter(2));
  print('');

  /*There are many ways to define an anonymous function. for example, all of these
    definitions are equivalent:
  */
  bool Function(int, int) areEqual3 = (int a, int b) => a == b;
  bool Function(int, int) areEqual4 = (final a, final b) => a == b;
  bool Function(int, int) areEqual5 = (var a, var b) => a == b;
  bool Function(int, int) areEqual6 = (a, b) => a == b;
  /*I've already seen that using final (or var) in the parameters list is unnecessary.
    In some cases, the anony function may not be well-defined. For example, consider
    this case:
  */
  //This is bad cuz 'a' and 'b' are dynamic!
  final areEqual7 = (a, b) => a == b;
  print(areEqual7.runtimeType);
  print(
    areEqual6.runtimeType,
  ); // so that doesn't have with areEqual6 due to the Funtion type
  print('');

  /*The problem is that he compiler doesn't know the parameters' types and thus it assigns
    dynamic to both a and b. To solve this problem (where type safety is lost), I should 
    always make sure to have the types defined by either:

      1.Writing down the type explicitly

        final bool Function(int,int) areEqual7 = (a,b) => a == b;

      2.Writing down the types in the function's parameter list:

        final areEqual7 = (int a, int b) => a == b;

    The compiler has enough information here to infer int rather than dynamic in both
    cases. The second version is equivalent to the first one, but it's shorter 
    (and generally recommended)

    NOTE: So I'm seeing that its good to know the Function type but not necessary or 
          even beneficial to use in the day to day unless I need to be explicit about
          the function type just like any other type I use. I can use final or var
          and let Dart infer, if I give enough info, as see in the last example. Also
          the Function type is simply 'returnType Function(param,param)' and this
          matches what's return by .runtimeType which just switches it around showing:

            (param, param) => returnType
  */
  final areEqual8 = (int a, int b) => a == b;
  print(areEqual8.runtimeType);
  print('');
}
