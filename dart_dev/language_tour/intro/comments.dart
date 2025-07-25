/**
 * COMMENTS:
 * 
 * dart comments usually start with // but are as expected
 * 
 * 
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

  // This is a normal, line comment

  /// This is a documentation comment, used to document libraries, classes
  /// and their members. Tools like IDEs and dartdoc treat doc comments
  /// specially
  
  /* Comments like these are also supported 
  But from the looks of it, maybe /// should be what I used instead of 
  What I'm using above. 🤔
   */

  /// As per google dart offers 3 types of comments. Single-line, multi-line
  /// and documentation. But both /// and /** */ are considered documentation
  /// so I can use /// in dart instead of /** */
}

