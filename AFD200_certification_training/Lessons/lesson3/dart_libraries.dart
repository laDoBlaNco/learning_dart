// dart sdk comes with a stdlib as do other langs and we can also create out own
// libraries as we need.  we do this witm 'import'
import 'dart:math' as math;
import 'my_library.dart' as mylib;
// we 'as math' to use math as a reference so we don't have to right dart:math
// everywhere

void main() {
  print('');
  print(math.max(5, 30));
  // we use libraries like this so that we don't have to re-invent the wheel
  // and do our own calculations cada rato.

  // we can also use our own external files as we import above and use below:
  print(mylib.sumNumbers(10, 50));
  print(mylib.multiplyNumbers(2, 4));
}
