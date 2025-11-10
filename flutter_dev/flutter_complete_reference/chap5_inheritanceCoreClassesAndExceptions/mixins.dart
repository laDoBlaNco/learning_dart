/*5.1.5 - MIXINS

  If abstract classes and interfaces were "brothers", mixins would be their "cousin". A
  'mixin' is a class that can be "merged" with other classes to reuse methods without 
  using inheritance. For example, imagine I had these two classes in two separate
  hierarchies (volleyball_team.dart & planet.dart):

  As can be seen in those files, they share the same sphereVolume and lowercase methods.
  However, a volleyball team and a planet have nothing in common, so creating a superclass
  wouldn't make much sense. At the same time, I would also like to avoid code repetition

  In such cases, where I want to reuse methods without using inheritance, a 'mixin' is the
  way to go. It basically is a class, WITHOUT constructor, that can be "merged" with any
  other class to share its members. For example: (SphereUtils)

  I've collected "common" methods inside 'SphereUtils' and I can now mix it with other
  types to automatically 'import' all of its members. I can rework the original classes
  to use the 'with' keyword and associate the mixin: (volleyball_team.dart and planet.dart)

  Even if I can't see them, VolleyballTeam and Planet can now use both 'sphereVolume' and
  'lowerase' as if they were regular class members. With this approach, I have avoided
  inheritance and reused existing code. For example, I could use VolleyballTeam now
  in the following way: (in volleyball_team.dart)

  In this example, note that it is a compile-time error if I try to use 'with' on a 
  class. I can only mix types whose declaration contains the 'mixin' modifier, as it 
  happens in the first example. Since mixins shouldn't be instantiated, it is a 
  compile-time error if I create a constructor in a mixin. More information about the
  'mixin' modifier is in chapter 7 - Section 1.5 "mixin class". A class can mix with
  more than a single mixin. For example (Walking, Breathing, Coding):

  I can also constrain the usage of a 'mixin' to a specific subtype with the 'on'
  keyword. For example, I could force 'Coding' to be only mixed with the 'Developer'
  subclasses (Coding2):

  With this change, only those classes that subclass 'Developer' can be mixed with
  'Coding2'. I would get a compiler error if I tried to mix Coding2 with Developer
  itself or any other class doesn't descend from it. For example (Developer2, Student2):

  The 'on' modifier can specify one or more types.
*/

import 'dart:math';

mixin SphereUtils {
  double sphereVolume(double radius) {
    const constants = 4 / 3 * 3.14;
    return constants * pow(radius, 3);
  }

  String lowercase(String name) {
    return name.toLowerCase();
  }
}

mixin Walking {
  void walk() {}
}

mixin Breathing {
  void breath() {}
}

mixin Coding {
  void code() {}
}

mixin Coding2 on Developer {
  void code2() {}
}

// 'Human' has 'walk' and 'breath'
abstract class Human with Walking, Breathing {}

// 'Developer' has 'walk', 'breath' and 'code'
class Developer extends Human with Coding {}

// 'Student' has 'walk', 'breath' and 'code'
class Student extends Developer {}

// Error
// class Developer2 extends Human with Coding2 {}

// This should be ok since 'Student2' is a 'Developer' subclass so 'Coding2' can
// be mixed 
class Student2 extends Developer with Coding2 {}

