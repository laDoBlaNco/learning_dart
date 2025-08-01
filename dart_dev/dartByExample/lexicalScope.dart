/**
 * Dart by Example: Lexical Scope
 * 
 * Dart is lexically scoped. Loops that declare their variable will have
 * a new version of that variable for each iteration
 */

void main() {
  var functions = [];

  for (var i = 0; i < 3; i++) {
    functions.add(() => i);
  }

  functions.forEach((fn) => print(fn()));
}
// this same code would print 3 3s 
