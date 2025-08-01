/**
 * Dart by Example: Map
 */

void main() {
  // adding keys
  var colors = new Map();
  print(colors); // an empty map is just '{}'

  colors['blue'] = false;
  colors['red'] = true;
  print(colors);

  // curly bracket literals can also be used:
  var shapes = {'square': false, 'triangle': true};
  print(shapes);

  // keys and values can be iterated
  // Hashmap iterates in arbitrary order, while LinkHashMap, and SplayTreeMap
  // iterate in the order they were inserted into the map
  for (var key in shapes.keys) print(key); // so one-liners don't need {}
  for (var value in shapes.values) print(value);
}
