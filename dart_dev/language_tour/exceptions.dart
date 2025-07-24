/// EXCEPTIONS:
///
/// To raise an exception, we use 'throw' as expected
import 'dart:io';

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

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, DateTime super.launchDate);
}

// To catch an exception, use a try statement with 'on' or 'catch' (or both)
Future<void> describeFlybyObjects(List<String> flybyObjects) async {
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
  // Note that the code above is asynchronous; try works for both asynchronous
  // and synchronous code in an async function.
}

void main() {
  var voyager = PilotedCraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  voyager.describeCrew();
  voyager.astronauts = 0;

  // now I can use the exceptions
  if (voyager.astronauts == 0) throw StateError('No astronauts');

  // Note two things here.
  // 1. I did the if without {} for one liner
  // 2. The error thrown is 'Bad state: No astronauts' as expected
}
