/**
 * Dart by Example: Exceptions
 */

class FoodSpoiledError extends StateError {
  FoodSpoiledError(String msg) : super(msg);
}

class Potato {
  int age;

  Potato(this.age); // so for classes optional constructor is using the same
  // class name with params or with the super class as above

  String peel() {
    if (age > 4) {
      throw new FoodSpoiledError('your potato is spoiled rotten');
    }
    return 'peeled';
  }
}

void main() {
  var p = new Potato(7);

  try {
    p.peel();
  } on FoodSpoiledError catch (_) {
    print('nope nope nope');
  }

  // any non-null object can be thrown
  try {
    throw ('potato');
  } catch (_) {
    print('caught a flying potato');
  }

  // exceptions halt execution
  p.peel();
  print('not reached');
}
