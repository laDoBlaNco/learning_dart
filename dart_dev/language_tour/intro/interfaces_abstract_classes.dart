/// INTERFACES AND ABSTRACT CLASSES:
///
/// All classes implicitly define an interface. Therefore, I can implement
/// ANY class

class Spacecraft {
  String name;
  DateTime? launchDate;

  // Read-only non-final property
  int? get launchYear => launchDate?.year;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  // Method.
  void describe() {
    print('Spacecraft: $name');
    // Type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

/// Commented out. I get the point that an implementation needs a contract
/// implementation of all the pieces in the original class, but not doing that
/// here

// class MockSpaceship implements Spacecraft {
//   String get name => '';
//   DateTime get launchDate => DateTime.now();
//   DateTime get launchYear => DateTime.now();
//   void describe() => print('something');
// }

/// Here's an example of an abstract class to be extended (or implemented) by
/// a concrete class. Astract classes can contain abstract methods (with empty
/// bodies)

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('==============');
    describe();
    print('==============');
  }
}

// so now any class extending Describable has the describeWithEmphasis() meth
// which calls the extender's implementation of describe since its not 
// defined here
