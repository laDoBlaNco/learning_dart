/** In dart we use metadata to give additional information about our code.
 * A metadata annotation begins with the @ char followed by either a ref
 * to a compile time constant (such as deprecated) or a call to a constant
 * constructor. 
 * 
 * Only 3 annotations are available to all dart's code: 
 * @Deprecated
 * @deprecated
 * @override
 * 
 * Below are examples of their use
 */

class Television {
  /// Use [turnOn] to turn the power on instead
  @Deprecated('Use turnOn instead')
  void activate() {
    turnOn();
  }

  /// Turns the TV's power on
  void turnOn() {}
}

// We can define our own metadata anotations as well. Here's an example of
// defining a @Todo annotation that takes two arguments.
class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);
}

// Then we just put an @ in front of it and use it as an annotation
@Todo('Dash', 'Implement this function')
void doSomething() {
  print('Do something');
}

// Metadata can appear before a library, class, typedef, type parameter,
// constructor, factory, function, field, parameter, or variable declaration
// and before an import or export directive. You can retrieve metadata at
// runtime using reflection.
