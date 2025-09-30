// ignore_for_file: unused_local_variable

import 'example.dart' as second;
// import 'my_library.dart' show Example;
import 'my_library.dart' hide Test;

void main() {
  /*4.1.1 - LIBRARIES AND VISIBILITY

    A LIBRARY is a collection of classes, functions, and variables inside the
    file with the .dart extension. A PACKAGE is a group of libraries that are
    organized and published together for reuse by other projects. to access
    teh public contents of a library, such as classes or functions, I use the
    import keyword. for example:
  */
  const example1 = second.Example(10);
  print(example1);
  print('$example1'); // I guess it does work the same.🤔
  /*Here I have two different files (example.dart and libsAndVisibility.dart), both
    of which are libraries. Thanks to import i can use the Example1 class (from the 
    example library) in the libsAndVisibility library. The public members term
    indicates all members (classes, functions, variables, ...) that are visible to 
    other files when using import. Dart's built-in libraries have a unique prefix:

      ▪ import 'dart:math';
      ▪ import 'dart:io';
      ▪ import 'dart:html;

    The dart: prefix tells te compiler that the given library is located in the Dart
    SDK. Anything else outside of the SDK, could either use a package token or not.
    For example:

      ▪ I can import Dart files within my local project using a relative or an absolute
        path:

          // Reference a file in the same directory
          import 'example.dart';

          // Reference a file in a sub-directory
          import 'sub-directory/example2.dart';

          // Reference a file located one level above
          import '../example3.dart';

          // Absolute path to a file
          import '/usr/myuser/projects/data/example.dart';

      ▪ When the Dart file I want to import comes from an external dependency, 
        declared in the pubspec.yaml file, I just use the package prefex:

          import 'package:fraction/fraction.dart';

          The fraction package is declared in the pubspec.yaml file and it's imported
          using the package notation. In chapter 20 - "Creating and maintaining a 
          package" i'll learn what packages are and how they're created.

    By default, import gives me access to ALL public members of a library. I can change 
    this behavior though with selective imports. To understand what they are, consider
    this simple library that defines three classes (my_libary.dart created in this
    same folder)

    The show and hide directives are used to decide which library members can be
    imported by other libraries and which cannot. Here are some example imports above:

      ▪ The 'show' directive imports one or more public members and discards ALL the
        others that are not declared
  */
  // Ok to use 'Example' as its visible since its listed after show
  final example = Example();

  // Error, since 'Test' and 'Demo' are not listed after 'show'
  // final test = Test(); // The function Test isn't defined
  // final demo = Demo(); // The function Demo isn't defined

  /*    Since Test and Demo are not declared by show, they are NOT imported (and can't 
        be used)

      ▪ The 'hide' directive imports all public members EXCEPT the ones I have defined.
        for example:
  */
  final demo = Demo(); // now this is ok
  // final test = Test(); // this is still not seen

  /*I will generally use 'show' and 'hide' when creating library packages (more on them
    in chapter 20 - "Creating and maintain packages") or, less frequently, to solve 
    naming conflicts. I can use a prefix to avoid ambiguity if two libraries have 
    conflicting identifiers (both declare the same class name, for example). Using the
    'as' keyword to prefix a library (I adjusted the first Example file to use second.Example)

    Any public member of that library with the 'second' prefix can be accessed with 
    'second.'. This also removes the ambiguity for all other names that are in both files.
    Library prefixes create something like an 'alternative namespace' with the purpose
    of removing redundant names.
  */

}
