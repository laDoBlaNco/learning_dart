/// CLASSES:
///
/// Here's an example of a class with 3 props, two construtors, and a
/// method. One of the props can't be set directly, so its defined using a
/// getter method (instead of a variable). The method uses string interpolation
/// to print vars' string equivalents inside of string literals.

var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flyByObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};

class Spacecraft {
  String name;
  DateTime? launchDate;

  // read only non-final property
  int? get launchYear => launchDate?.year; // interesting syntax. shorthand func
  // as a getter method? even with '.year' we still need the nullable '?'

  // the constructor with syntactic sugar for assignment to meembers
  Spacecraft(this.name, this.launchDate) {
    // Initialization code would go here
  }

  // named constructor that forwards to the default one
  Spacecraft.unlaunched(String name) : this(name, null);
  // seems like it almost works like subclassing in the same class??? 🤔🤔🤔

  // the method
  void describe() {
    print('Spacecraft: $name'); // NOTE: interpolation works with ''

    // /type promotion doesn't work on getters
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      // Love the chaining here practical syntax, but wht is '~/' 🤔🤔🤔
      // ok so '~/' is 'truncating division' like floor division rounding to 0
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

// then I can use this class in the following way
void main() {
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unlaunched('Voyager III');
  // that's exactly what it is, its a subclass built into the same class def
  // 🤯🤯🤯
  print('');
  voyager3.describe();
}
