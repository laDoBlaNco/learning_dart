/*DEEP DIVE: ANNOTATIONS AND MIRRORS

  In Dart, ANNOTATIONS are metadata that bive additional information about a piece
  of code. Any class with a 'const' constructor can be used as an annotation 
  anywhere in the code. for example (SomeAnnotation,AnotherAnnotation,YetAnotherAnnotation)

  Annotations can be used brefore the following keywards: libary, class, typedef, import,
  and export. They can also appear before constructors, functions, function type parameters
  and variable declarations. When I need to create an annotation, I should put the class in
  a dedicated file and make it library-private. Then, expose a constant variable with an
  instance of that class. For example, this is in the annotations.dart file from the SDK:

    class _Override{
      const _Override();
    }
    const averride = _Override();

  This is how the Dart SDK defines the @override annotation, which I use to annotate
  overidden members. The class itself is library-private but there is a public, constant
  variable that can be used anywhere in the code. Annotations themselves do nothing. 
  They are generally used to give more information about a class, a function, or a member
  to other Dart code (or external tools).

    NOTE: The analyzer tool for example, (invoked by the dart analyze command) is a 
          program that parses my Dart code. Among many other things, it can recognize
          annotations and emit warnings or alerts under certain circumstances.

  If I want to write a tool that analyzes Dart code, I need the dart:mirrors library
  (which is part of the core Dart SDK). A MIRROR is an object that reflects another
  object. Thanks to mirrors, I can write Dart code that inspects itself. For example
  (MyAnnotation, Example, refectClass from mirrors in main):

  Reflection in Dart is made with mirrors. The reflectClass method returns a ClassMirror
  object with much information about the Example class. In particular, the metadata getter
  returns a list with all the annotations (if any) associated with the Example object. In 
  this example, I get a reference to MyAnnotation and all of its members using 
  annotation.reflectee. Reflection can extract more data about the class being inspected.
  For example, I could also tell how many instances and static memmbers the Example
  class had (even if it's not annotated):(classTypeData loops in main)

  Even if 'Example' only declares a single variable (exampleValue), it also inherits 
  other members from the Object supertype (as seen in the loops). I can also easily
  verify that Object is a supertype of example: (classTypeData.superclass in main)

  To make a concrete example, I could use reflection and annotations to create a 
  code generation tool that builds web servers. I'll start by creating some
  annotations that will be used to describe the HTTP server configuration

  Since I want these classes to be used as annotations, I must give them a constant
  constructor. My tool uses the dart:mirrors library to inspect a class (HttpServer)
  that is decorated with the annotations I created. For example (HttpServer)

  Now since HttpServer class is decorated with various annotations, I can write a 
  Dart function (or create a separate program) that uses dart:mirrors to read 
  annotations and generate other Dart code. Note that I will print the generated
  code to the console to simplify the example (rather than saving everything on
  a .dart file in the local filesystem). Here's a possible implementation of the
  code generation tool below: (generate)

  Our HttpServer class only has abstract methods (functions with no body) that are
  decorated with an annotation. The declaration getter returns a list of all members
  of a class. I iterate over them and use the  metadata getter to read the associated
  annotation. I can see what's printed below in main. 

  I started from an annotated class and I ended up with the generation of new Dart
  code, using the dart:mirrors library. Another example of how annotation can be useful
  comes directly from Flutter. 

    @mustCallSuper
    void initState();

  The Dart analyzer tool inspects my Dart code and since it finds the @mustCallSuper 
  annotation, it emits a warning if I didn't call super.initState() when overriding 
  initState. In this example, annotations are used by an external tool (the Dart analyzer)
  to inspect my code and emit warnings or errors. In summary:

    ▪ Annotations are used to "decorate" Dart code and add more information. Any class
      with a const constructor can be used as an annotation. 

    ▪ Annotations are often used with the dart:mirrors library to either generate other
      Dart code or retrieve metadata about classes to inspect them (as the Dart analyzer
      does, for example).

  The MINIFICATION process compresses identifiers in the program to reduce the download
  size. This practice causes issues when using the mirrors library with strings to refer
  to pieces of code. What it means is that, for example, I could duse a String to refer
  to a class that the minification process will remove 🤔🤯. To solve this problem,
  Dart uses SYMBOLS. For example: (Symbol in main)

  A symbol can be create either explicitly, with Symbol default constructor, or implicitly,
  with a symbol literal that is the name prefixed by a #. In the example, both variables
  hold a reference to the SAME symbol since the string in the constructor matches the
  literal name.

    NOTE: All instances of Symbol are guaranteed to be STABLE with respet to minification.
          This means that symbols won't be "removed" in the minification process, as might
          happen with strings. Note that symbols are NOT meant to be used as "unique"
          keys.

  In general, symbols are useful when using the dart:mirrors library or when working with
  dynamic invocations. For example, symbols are used by the Function.apply method to
  represent all named parameters in the invocation. For example: (sumValues)

  Dart internally uses the apply static method of Function to make function calls. It 
  uses symbols rather than strings to represent named parameters to avoid the minification
  issue described above. Note that the symbol literal names match the names of the optional
  parameters. If I didn't pass a literal that matched the parameter name, I would have
  gotten an error: (runtime exception at the bottom of main)

  Another case where symbols are used is the Invocation class, which is passed to
  noSuchMethod when an object doesn't support the member invocation that was attempted
  on it. I saw that method inherited from Object when working with reflection and 
  listing members. As can be seen, unless I'm working with dart:mirrors or low-level Dart
  features, I won't be using symbols much at all in my projects.
*/
import 'dart:mirrors';

class SomeAnnotation {
  const SomeAnnotation();
}

class AnotherAnnotation {
  final String one;
  final bool two;

  const AnotherAnnotation(this.one, this.two);
}

@SomeAnnotation()
class SomeOtherAnnotation {
  @SomeAnnotation()
  final int numValue;

  @AnotherAnnotation('test', true)
  const SomeOtherAnnotation(this.numValue);
}

class YetAnotherAnnotation {
  final int arg;
  const YetAnotherAnnotation(this.arg);
}

// this class can be used as annotation because it has a 'const' constructor
class MyAnnotation {
  final int number;
  final String string;
  const MyAnnotation(this.number, this.string);

  @override
  String toString() => 'number = $number | string = $string';
}

@MyAnnotation(10, 'hello!')
class Example {
  final double exampleValue;
  const Example({this.exampleValue = 0});
}

// CODE GENERATION EXAMPLE - ANNOTATIONS
// defines the path and the static HTML contents of the website
class Route {
  final String path;
  final String contents;
  const Route(this.path, this.contents);
}

// http server configuration
class Https {
  final String certPath;
  final bool autoRedirect;
  const Https({required this.certPath, required this.autoRedirect});
}

// compression configurations for my server
class Compression {
  final bool useGzip;
  const Compression(this.useGzip);
}

@Compression(true)
@Https(certPath: '/path/to/cert', autoRedirect: true)
abstract class HttpServer {
  @Route('/', '<html><body>Home page</body></html>')
  void home();

  @Route('/contents', '<html><body>Contents page</body></html>')
  void contents();

  @Route('/about', '<html><body>About page</body></html>')
  void about();
}

// THE CODE GENERATION TOOL ITSELF:
void generate() {
  final classTypeData = reflectClass(HttpServer);
  final buffer = StringBuffer();

  // iterate over all members in the 'HttpServer' class
  for (final getters in classTypeData.declarations.entries) {
    // the METADATA getter returns a list of all ANNOTATIONS
    final metadata = getters.value.metadata;
    final route = metadata.isNotEmpty ? metadata.first.reflectee : null;

    // generate a 'RouteEntry' by reading the 'Route' annotation data
    if (route != null && route is Route) {
      buffer.writeln(
        "       RouterEntry('${route.path}', '${route.contents}'),",
      );
    }
  }

  Compression? compression;
  Https? https;
  for (final annotation in classTypeData.metadata) {
    if (annotation.reflectee is Compression) {
      compression = annotation.reflectee;
    }
    if (annotation.reflectee is Https) {
      https = annotation.reflectee;
    }
  }

  // The generated Dart code
  print('''
Future<void> main() async {
  await SomeServer(
    hasHttps: ${https != null},
    compression: ${compression?.useGzip ?? 'true'},
    routes: [$buffer],
  ).start();
}
''');
}

void sumValues(bool isSum, {required int a, required int b}) =>
    isSum ? print(a + b) : print(a - b);

@YetAnotherAnnotation(1)
void main() {
  print('Hello world');
  print('');

  final classTypeData = reflectClass(Example);

  print(classTypeData);
  print(classTypeData.isAbstract);
  print(classTypeData.isEnum);
  print(classTypeData.isTopLevel);
  print('');

  // here I read all annotations (if any) associated with the 'Example' class
  for (final annotation in classTypeData.metadata) {
    print('${annotation.reflectee}');
  }
  print('');

  // prints all instance members of the 'Example' class
  for (final instanceMember in classTypeData.instanceMembers.entries) {
    print('Name: ${instanceMember.key}');
  }
  print('');
  // prints all static members of the 'Example' class
  for (final instanceMember in classTypeData.staticMembers.entries) {
    // empty list (there are no static members)
    print('Name: ${instanceMember.key}');
  }
  print('');

  // returns the superclass type
  if (classTypeData.superclass != null) {
    print('Super type: ${classTypeData.superclass!.reflectedType}');
  }

  // an alternative way to tell if A is a subtype of B
  final isSubtype = classTypeData.isSubtypeOf(reflectClass(Object));
  print('"Example" a subtype of "Object": $isSubtype');
  print('');
  generate();
  print('');

  // create a symbol using the 'Symbol' class
  const symbol = Symbol('symbolName');
  // create the same symbol using a literal
  const symbol2 = #symbolName; // another way to create a symbol

  print(symbol == symbol2);
  print(identical(symbol, symbol2));
  print('');

  // invoke the function in the normal way
  sumValues(true, a: 10, b: -6);

  // invoke the function using the low-level 'apply' method
  Function.apply(sumValues, [true], {#a: 10, #b: -6});
  print('');

  // throws a runtime exception since '#b' is missing
  Function.apply(
    sumValues,
    [true],
    {#a: 10, #c: -6},
  ); // compile time error, but...

/*
  Unhandled exception:
  NoSuchMethodError: Closure call with mismatched arguments: function 'sumValues'
  Receiver: Closure: (bool, {required int a, required int b}) => void from Function 'sumValues': static.  
  Tried calling: sumValues(true, a: 10, c: -6)
  Found: sumValues(bool, {required int a, required int b}) => void
*/
}
