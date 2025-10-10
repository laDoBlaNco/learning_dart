// ignore_for_file: unused_local_variable

/*4.4.1 - THE CALL METHOD

  Any Dart class that I create can be called as if it was a function when it implements
  the call method. Very intuitively, a CALLABLE class is a class that implements the 
  call method. This method supports the same functionalities of regular functions, such
  as return types and parameters. For example (Demo)

  The demo.call(5) syntax is the equivalent of demo(5) since they both invoke the call
  method with the given argument. This is useful, for example, when I need to invoke a
  nullable  function without writing too many checks. Consider the following code:
  (SuccessCallback)

  The Function type is a callable class and thuse I can ALWAYS invoke the call method
  on a function. Here is another example that shows how I can 'hide' a class behind
  a function. Consider this library (age_printer.dart)

  This is how I would normally create a function (printAge in the example). But with
  callable classes, I can keep the same syntax inside main() while reworking the 
  definition of the printAge function itself. The 'trick' is to hide a callable
  class behind a variable. for example: (age_print2.dart)

  Here I've made the callable class _AgePrinter library-private (so that noone can
  see it) and created a top-level printAge2 constant. The main file didn't change:
  I have only reworked the function implementation, but the public API is still 
  consistent.

  NOTE that call can return any type and take zero or more parameters. The only
  "special" thing about this function is taht it can be called in various ways
  (object.call() and object()).

*/
import 'age_printer.dart';
import 'age_printer2.dart';

class Demo {
  final int value;
  const Demo(this.value);

  void call(int other) => print('$value + $other = ${value + other}');
}

typedef SuccessCallback = void Function(int code);

void someFunction(SuccessCallback? onSuccess) {
  if (onSuccess != null) {
    onSuccess(1);
  }
}

void main() {
  final demo = Demo(10);
  // why did I use 'const' here. I thought I didn't have to. I didn't so I removed it
  // in front of const Demo(10)

  // use it as a normal function call...
  demo.call(5);

  // ... or invoke 'call' directly on the instance itself!
  demo(5);
  print('');

  printAge(48);
  print('');
  printAge2(48);
  print('');


}
