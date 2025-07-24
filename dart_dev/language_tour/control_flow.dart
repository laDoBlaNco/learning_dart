/**
 * CONRROL FLOW STATEMENTS:
 * 
 * Dart supports the expected control flow statements
 */

var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flyByObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};

void main() {
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
  print('');

  for (final object in flyByObjects) {
    print(object);
  }
  print('\n');

  for (int month = 1; month <= 12; month++) {
    print(month);
  }
  print('');

  while (year < 2016) {
    year += 1; // so this syntax works, unlike in lua
    print(year);
  }
}
