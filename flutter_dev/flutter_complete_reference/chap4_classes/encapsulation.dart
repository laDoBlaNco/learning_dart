/*4.1.2 ENCAPSULATION

  I've already seen that Dart doesn't use the widespread public, protected, and private
  modifiers that so many other OOP languages use. Consequently, I can't make comparisons
  with those languages. There only are two encapsulation rules in the language:

    1. All members in a library are public, meaning that they can be used by other
       libraries.
    
    2. Members whose name start with an underscore (_) are library_private, meaning 
       that they can only be used within the library (file) in which they're defined. 

  Here's a couple of examples to better understand the  encapsulation rules and what
  library_private means in practice. 

  Since Example doesn't start with an underscore, it's public and it can be imported by
  other libraries. The _Demo class instead is a library_private type (because its name
  starts with an underscore) and so it cannot be imported by other libraries. _Demo
  can only be used my members in the SAME library/file. That's why when I use Example.run
  I also get the result of _Demo.printDemo()

  The import directive does NOT import members that start with an _, so its not defined
  in this file. The term is 'library_private" and not just "private" to emphasize the
  fact that members are private for other libraries but not the one that declares them.
  The underscore can alos be used on functions, variables, and any other identifier.

  Outside of encapsulation_example.dart, _hello and _printAgain() are not imported since
  they start with the _. The only special cases where I can access a library-private
  member from another library is when I use 'part' and 'part of'
*/
import 'encapsulation_example.dart';

void main() {
  // OK, 'Example' is imported
  Example().run();

  // compiler error here since '_Demo' is not imported
  // _Demo().printDemo();// The function _Demo isn't defined
}

/*4.1.2.1 PART AND PART OF

  
*/
