void main() {
  /*DEEP DIVE LANGUAGE SPECIFICATION DETAILS

  This section contains some interesting language features that are covered in the Dart
  specification document. The contents of the document are very rigorous and format, but
  here are some extracted and rephrased curiosities about variables and type assignments.

  • I can initialize one or more variables in the same declaration site. They can hold a value
    or not:*/
  var x, y = 1;
  print(x.runtimeType);
  print(y.runtimeType);
  print('');
  /*
    Since x isn't initialized with a value, the compiler initializes it as null. It is a 
    compile-time error if I use final or const to declare a variable without initializing
    it. For example: */
  final a = 10, b = true;
  final c, d = 1;
  print(a.runtimeType);
  print(b.runtimeType);

  // print(c.runtimeType); // ctime Error: Final variable 'c' must be  assigned before it can be used
  print('');
  /*
    The outcome would have been the same if I had used 'const' instead of 'final'
    
  • In the same declaration site, I can initialize two or more variables with a defined type 
    without using the compiler's inference. For example: */
  double xx = 1.34, yy = 10;
  print(xx.runtimeType);
  print(yy.runtimeType);
  print('');

  /*
  • The runtime type of every object is represented as an instance of the Type class, which can
    be obtained using the same runtimeType method. (so basically .runtimeType isn't as I thought,
    a property with a string value, but more like a dart getter, its actually a method/function
    that returns a and instance of Type. And since we print it, its like running .tostring on it) */
  Type type = true.runtimeType;

  // same as doing 'print(type.toString());
  print(type);
  print('');

  /*
    The Type class defines operator==, hashCode, and toString(), but it doesn't have any
    particular purpose. It's only used to represent the type of an object and converts the
    type name into a String object. (so it might as well be a prop with a string value 🤔)
    
  • I can use Type in regular expressions, like 'final Type boolType = bool'
  
  • A variable declaration can include the 'covariant' modifier, which I'll see described later
    in chapter 5 - Section 1.7 "The covariant keyword" */
}
