/// COLLECTIONS IN DART - Dart has support for
/// Lists
/// Sets
/// Map
/// collections. There are also Types Collections, but we'll see about those
/// when we talk about generics.

/// LISTS are pretty simple. The most common collection in almost all programming
/// langs. All of them are based on Arrays in some way. In dart the array is
/// the List Object.
var list = [1, 2, 3]; // inferred as type List<int>. So if we now try to add
// something that's a non-int, it'll error
// Its convention to add a trailing comma to prevent bugs with copy-paste, etc
// Ive seen this in Go and Odin as well.
var list2 = [
  'Car',
  'Boat',
  'Plane',
];
// lists are 0-indexed as expected and we get the length with the property
// length. Remember that this is a full OOP lang.
void main() {
  print('LISTS COLLECTIONS:');
  print(list.length);
  print(list[1]);
  list[1] = 1;
  print(list[1]);
  print('');

  // we can also create compile-time constant lists by putting const before
  // the list literal
  var constantList = const [1, 2, 3];
  print(constantList);
  print('');

  print('SET COLLECTIONS:');
  // sets in dart are also as expected. Unordered collection of unique items.
  // We have set literals {} and the Set type
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
  // again its inferred that the type is Set<String>
  // we can make an empty type by adding the type on explicitly or using Set with type
  var names = <String>{};
  Set<String> names2 = {};
  var names3 = {}; // this is a map not a set. Similar to Python
  print(names.runtimeType);
  print(names2.runtimeType);
  print(names3.runtimeType);
  print('');

  // we add items to existing sets with .add or .addAll methods
  var elements = <String>{}; // this is an empty Set named elements
  elements.add('fluorine');
  print(elements);
  elements.addAll(halogens);
  print(elements);
  print(elements.length); // Sets have a .length prop as well
  // similiarly to get a constant Set we do a const literal
  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  print(constantSet);
  print('');

  print('MAP COLLECTIONS:');
  // So in general a map is also as expected in Dart, keys and values can be
  // any type. Each key occurs only once, and values doesn't matter. We can
  // use Map literals {} and Map()
  var gifts = {
    // key : value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  }; // inferred to be type Map<String,String>
  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  }; // inferred to be Map<int,String>

  print(gifts);
  print(nobleGases);

  // We can do the same as above with the Map constructor as well but with
  // the type as we did with sets
  var gifts2 = Map<String, String>();
  var nobleGases2 = Map<int, String>();

  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';
  print(gifts2);

  nobleGases2[2] = 'helimum';
  nobleGases2[10] = 'neon';
  nobleGases2[19] = 'argon';
  print(nobleGases2);
  print(nobleGases2[25]); // a key that doesn't exists results in 'null'
  // you get the number of keys with the .length prop
  print(gifts.length);
  // And the same thing with compile-time constants

  // One last thing with collections are the operators that can be used with
  // them.
  // Spread Operators:
  // in dart we have have ... and null-aware ...? used in list, map, and set
  // literals. As with other langs this is a concise we to insert multiple
  // values into a collection.
  var list2 = [0, ...list];
  print(list2);
  List<int> list3 = [];
  ;
  var list4 = [0, ...?list3];
  print(list4);

  // CONTROL FLOW OPERATORS
  // we also have collection-if  and collection-for with lists, maps, and sets
  // heer is collections-for
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  print(listOfStrings);
}
