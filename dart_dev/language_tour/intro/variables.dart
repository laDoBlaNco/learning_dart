/**
 * VARIABLES
 * 
 * Even in type-safe dart, I can declare most vars without explicitly specifying
 * the type using 'var'. With type inference, these variables are determined
 * by their initial values
 */

var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flyByObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};

// pretty simple. I do like the formatting with the dart plugin. Very much
// go format like.

void main() {
  print(name);
  print(year);
  print(antennaDiameter);
  print(flyByObjects);
  print(image);
}
