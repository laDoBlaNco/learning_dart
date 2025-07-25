/*
  WILDCARD VARIABLES

  Version Note - this feature is available in Dart >=3.0

  A wildcard variable with the name '_' declares a local variable or parameter
  that is non-binding; essentially, a placeholder. The initializer, if there 
  is one, is still executed, but the value isn't accessible. Multiple 
  declarations named _ can exists in the same namespace without a collision
  error. 

  Top-level declarations or membes where library privacy might be affected
  are not valid uses for wildcard variables. Declarations local to a block
  scope, such as the following examples, can declare a wildcard:

*/

// generic type and function type parameters
class T<_> {}

void genericFunction<_>() {}
// takeGenericCallback(<_>()=>true);

void main() {
  // Local variable declaration:
  var _ = 1;
  int _ = 2;

  // for loop variable declaration
  var list = ['a', 'b', 'c'];
  for (var _ in list) {}

  // catch clause parameters
  try {
    throw '!';
  } catch (_) {
    print('oops');
  }

  // Function parameters
  // Foo(_,this._,super._,void _()) {}
  list.where((_) => true);
  // void f(void g(int _, bool _)) {}
  // typedef T = void Function(String _, String _);
}

/*
  TIP: Enable the lint 'unnecessary_underscores' to identify where a single
  non-binding wildcard variable _ can replace the previous convention of
  using multiple binding underscores (__,___,etc) to avoid name collisions.

*/
