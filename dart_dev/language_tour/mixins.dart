/// MIXINS:
///
/// Mixins ar a way of reusing code in multple class hierarchies. At the bottom
/// is a mixin declaration and extending the class with the mixin

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

class Orbiter extends Spacecraft {
  // so this is subclassing in reality. So what I saw before, not sure
  double altitude;

  // note how we use  superclasses in dart. There is also an optional
  // @override annotation that I'll see later
  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, DateTime super.launchDate);
  // something to note, if I get an error saying that I need a function body
  // its probably cuz I forgot a semicolon somewhere and dart is waying for
  // the '{}' after the '()' since I didn't put '();'
}
