// ignore_for_file: unused_local_variable

/*4.3 - GETTERS AND SETTERS

  When I want to expose a variable to other libraries but I don't want its value
  to be changed (global), I can make it final. In a similar way, I could make 
  a variable non-final so that it can be read and changed at any time. For exaample:
  (Example)

  In this example, the value of readAndWrite can be read an manipulated at any time.
  The class cannot control how the variable value is changed from outside. This 
  isn't generally the desired behavior. Getters and setters are particular methods
  that provide read-and-write rules for a member. For example: (Example2)

  The getter, implemented with the 'get' keyword, provides read-only access to the
  value of a variable. A setter, implemented with the 'set' keyword, controls how
  the variable value changes. The library-private _readAndWrite member is protected
  by getters and setters. They now control how the variable is changed from the 
  outside. For example: (Example2 in main)

  In general, getters and setters are used to control the status of a variable. In
  some cases, they may make my code more verbose or just be useless. For example:
  (Example3 and 4)

  In this example, the getter and the setter are not needed since they don't add any
  validation logic or checks to the variables. A normal instance variable produces 
  the same result and requires less maintenance. Here are some recommendations for
  getters and setters:

    ▪ A getter and a setter should have the same name fi they refer to the same 
      variable. This is not required by the language, but it's more intuitive for
      the user. For example (Example5 and 6)

      Reading and writing the  SAME variable is more intuitive than working with
      different names.

    ▪ A getter should return a value as-it-is or make some short operations that 
      can easily be read at a glance. for example, the following are good:

        double get  radians=>_angleRadians;
        double get degrees=>_angleRadians*180/3.14;

      I immediately understand that the first getter returns an angle (in radians) and
      the other one converts radians to degrees. if the getter requires computations
      or, in general, time-consuming calls, I should prefer using a formal method.
      For example

        double degrees(){
          final angle = computeAngle();
          final somethingElse = somethingElse();
          return angle + somethingElse * 2;
        } 

    ▪ Rather than creating a read-only value with a getter, prefer using a final instance
      variable. It has the same effect and requires less code. for example (Example7)

      This code complies but doesn't make much sense. A final variable is already read-only
      so I can remove the getter and make _value public: (Example8)

      So a final instance variable is a sort of "implicit getter" that exposes a value
      without allowing modification

  Getters and setters can be prefixed with the static modifier as well. 


*/
import 'dart:math';

class Example {
  final double readOnly;
  int readAndWrite;
  Example(this.readOnly) : readAndWrite = 0;
}

class Example2 {
  final double readOnly;
  int _readAndWrite;

  Example2(this.readOnly) : _readAndWrite = 0;

  int get readAndWrite => _readAndWrite;
  set readAndWrite(int value) {
    _readAndWrite = max<int>(0, value);
  }
}

// Good example
class Example3 {
  String value = '';
}

// Bad example - 'get' and 'set' are not helpful here
class Example4 {
  String _value = '';

  String get value => _value;
  set value(String value) => _value = value;
}

// Good practice
class Example5 {
  String _value = '';

  String get value => _value;
  set value(String value) => _value = value.isEmpty ? 'None' : value;
}

// Not a good practice
class Example6 {
  String _value = '';

  String get readValue => _value;
  set newValue(String value) => _value = value.isEmpty ? 'None' : value;
}

class Example7 {
  final String _value;
  const Example7(this._value);

  String get value => _value;
}

class Example8 {
  final String value;
  const Example8(this.value);
}

void main() {
  final example = Example(66);

  example.readAndWrite = 100; // this is ok
  // example.readOnly = 10; // Error: 'readOnly' can't be used as a setter cuz its final

  final example2 = Example2(66);

  print(example2.readOnly);
  print(example2.readAndWrite); // here I'm using the getter to print 0

  example2.readAndWrite = 40; // Here I'm using the setter
  print(example2.readAndWrite); // Here I'm using the getter again to print 40

  example2.readAndWrite = -24; // again using the setter
  print(
    example2.readAndWrite,
  ); // here i'm using the getter to print 0 according to the logic
  print('');
}
