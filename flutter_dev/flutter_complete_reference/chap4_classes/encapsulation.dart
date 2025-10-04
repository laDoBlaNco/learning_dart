// ignore_for_file: unused_local_variable

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
part 'my_app.dart';

void main() {
  // OK, 'Example' is imported
  Example().run();

  // compiler error here since '_Demo' is not imported
  // _Demo().printDemo();// The function _Demo isn't defined

  // using part and part of
  final ex1 = Example2();
  final ex2 = _HiddenExample();
}

/*4.1.2.1 PART AND PART OF

  So I've just seen that library-private members are only accessible within the same
  library (which is the same as saying 'within the same Dart file). The 'part' directive
  is used to import both public and library-private members). for exaample above in the 
  main example. 

  The 'part of' directive is used to allow the specified library to access its library-
  private members. The 'part' directive is used on the file that needs to use the
  library-private members  of the other library. These two identifiers are a "less strict"
  version of import. Now in practice:

    ▪ import is used to import PUBLIC members

    ▪ part (along with part of) is used to import public AND library-private members

  In general, part and part of are only used by code generation libraries. They could
  also be used to split a library into multiple Dart files to better organize the code
  but this is not recommended by the Dart team. I should avoid splitting up code using
  'part' and prefer creating mini-libraries instead, even if they contain a single
  class or function. When using libraries, prefer import over part.
  
*/
