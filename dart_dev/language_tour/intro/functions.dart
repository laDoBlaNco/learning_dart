/**
 * FUNCTIONS:
 *  
 * Its recommended to specify the types of each function arg and the return
 * value
 * 
 * There is a shorthand syntax 🤓 handy for functions that contain a single
 * statement. this is especially good for anony functions as I imagined
 */

var name = 'Voyager I';
var year = 1977;
var antennaDiameter = 3.7;
var flyByObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
var image = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.jpg',
};

int fibonacci(int n) {
  // nice recursive example
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  var result = fibonacci(20);

  print(result);

  // heres the example of the shorthand function
  flyByObjects.where((name) => name.contains('turn')).forEach(print); // I love
  // this chaining stuff. Very functional 🤓🤯
}
// besides showing an anony function (the argument to where()), this code shows
// that I can use a function as an argument: the top-level print() function 
// is an arg of forEach()

