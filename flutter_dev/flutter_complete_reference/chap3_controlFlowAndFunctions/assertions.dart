// ignore_for_file: unused_local_variable

main() {
  /*3.4.5 - ASSERTIONS

    Assertions are use to throw exceptions while developing an application. An assertion
    throws an exception whenver its condition evaluates to false. For example:
  */
  final str1 =  '"key1":"value1","key2":"value2","key3":"value3"';
  final str2 = '';
  String getJson() =>str2;
  void parseJson(jsonString) => print(jsonString);
  final String json = getJson();
  assert(!json.isEmpty, "String can't be empty"); // 🤔🤔🤔 Not working as I think it
  // should 🤔🤔🤔
  // I figured it out. The code in the book is wrong. it shouldn't be using .isEmpty since
  // that will return true if empty, but false when it has a value. In this case that's 
  // the opposite of the behavior we are looking for. On top of that, I need to run 
  // Dart run with the --enable-asserts flag or assertions don't work.--So I negate
  // it with ! and now it works as it should. 
  parseJson(json);
  print(json.isEmpty);
  print(json);

  /*The assert statement takes a bool value and an error message, which will be logged in
    the console whenever the exception is thrown. It basically is a void function that
    throws an exception and logs the error to the console if the condition evaluates to
    true. Assertions only work in specific cases:

      1. In Flutter, assertions only work in debug mode (which is the default)

      2. The dart run command evaluates exceptions only with the --enable-asserts flag
         NOTE--I tried to turn this on in vscode coderunner but it doesn't work. To use
               it I'll need to manually put in Dart --enable-asserts

      3. Some specific, development-only Dart tools enable them by default

    NOTE: Assertions are ignored when the application is build in release mode.
  */
}
