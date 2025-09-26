// ignore_for_file: unused_local_variable

void main() {
  /*DEEP DIVE: LANGUAGE SPECIFICATION DETAILS 

    The section contains some interesting language features that are covered in
    the Dart specification document. The contents of the document are very 
    rigorous and formal, but here the author has extracted and rephrased some
    curiosities about variables and type assignments.

      ▪ I can initialize one or more variables in the seame declaration site.
        In this case, they can either hold a value or not. For example:
  */
  var x, y = 1;
  print(x.runtimeType);
  print(y.runtimeType);
  /*    Since x isn't initialized with a value, the compiler initializes it as a
        Null type. It is compile-time error if I use final or const to declare a
        variable without initializing it. For example
  */
  final a = 10, b = true;
  final xx, yy = 1;
  print(a.runtimeType);
  print(b.runtimeType);
  // print(xx.runtimeType); // Error: The final variable 'xx' can't be read cuz its potentially
  // unassigned at this point.

  /*    The outcome would have been the same if I had used const instead of final

      ▪ In the same declaration site, I can initialize two or more variables with a
        defined type without using the compiler's inference. For example:
  */
  double xxx = 1.34, yyy = 10;

  /*  ▪ The runtime type of every object is rep'd as an instance of the Type class, 
        which can be obtained using the runtimeType method. For example:
  */
  Type type = true.runtimeType;
  print(type);
  /*    The Type class only defines operator==,hashCode, and toString() but it doesn't
        have any particular purpose. It's only used to rep the type of an object and
        converts the type name into a String object. 
        
        I looked up in Google a bit more detail: https://www.google.com/search?q=dart+where+does+the+Type+class+fall+into+Dart%27s+type+hierarchy&rlz=1C1CHZN_enDO995DO995&oq=dart+where+does+the+Type+class+fall+into+Dart%27s+type+hierarchy&gs_lcrp=EgZjaHJvbWUyBggAEEUYOdIBCTE2NjAzajBqN6gCALACAA&sourceid=chrome&ie=UTF-8
        and accordingly in Dart's type hierarchy, the Type class is a direct subclass of
        Object. This is the reason that Type inherits only the methods and propertiers
        defined in the Object class, namely, toString(), hashCode, and operator==.

        The Type class represents the runtime type of an object. When I use 
        object.runtimeType, the value returned is an instance of the Type class describing
        the actual type of object at runtime. 

        All classes in Dart, except Null, ultimately descend from Object, making Object
        the root of the non-nullable class hierarchy. Type falls directly under this root
        as a specialized class only for reprsenting type information

      ▪ I can use Type in regular exprssions, like:

        final Type boolType = bool

      ▪ A variable declaration can include the covariant modifier, which I'll see later
        in chapter 5 - Section 1.7 "The covariant keyword".
  */
}
