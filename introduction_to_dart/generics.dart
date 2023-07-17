/**
 * GENERICS:
 * In dart api documentation, when we see <...> it notates a generic or
 * parameterized type. Everything I know about generics thus far are from
 * Go. for example the List<E> marks list as a generic type - a type that has
 * formal type parameters. By convention, most type variables have single-letter
 * names, such as E,T,S,K, and V.
 * 
 * Generics are often required for type safety, but they have more benefits than
 * just allowing you  code to run:
 *  - Properly specifying generic types results in better generated code
 *  - You can use generics to reduce code duplication. 
 */

// For example if we want a list of only strings we would do this
void main() {
  var names = <String>[]; // List<String> list of strings
  names.addAll(['Seth', 'Kathy', 'Lars']);
  print(names);

  // but then this would give us an error
  // names.add(42); 'The argument type int can't be assigned to a PARAMETER TYPE String

// GENERIC COLLECTIONS AND THE TYPES THEY CONTAIN
// Dart's generic types are reified, which means that they carry their type
// info around at runtime.
  var names2 = <String>[];
  names2.addAll(['Seth', 'Kathy', 'Lars']);
  print(names2);
  print(names is List<String>);

  print(foo);
}

// Another reason for using generics is to reduce code duplication. As with
// other langs we can share a single interface and implementations between
// many types, while still taking advantage of static analysis. For example:
// creating an interface for caching an object.
abstract class ObjectCache {
  Object getByKey(String key);
  void setByKey(String key, Object value);
}

// but then you decide you want one for string
abstract class StringCache {
  String getByKey(String key);
  void setByKey(String key, String value);
}

// Now we want one for number. This is going to get complex very quickly
// Generic types save us all the trouble of creating all these interfaces,
// instead we create a single interface that takes a type parameter
// Sounds similar to Go interfaces and the parameterized types
abstract class Cache<T> {
  // here T is the standin type, a placeholder that we can think of as a type
  // that a developer woll define later.
  T getByKey(String key);
  void setByKey(String key, T value);
}

// Now lets look at COLLECTION LITERALS. List,set, and map literals can be
// parameterized. Parameterized literals are just like the literals we've
// already seen, except that we can add <type> (for lists and sets) or
// <keytype,valuetype> for maps. I did this when creating empty lists, maps,
// and sets.
var names = <String>['Seth', 'Kathy', 'Lars'];
var uniqueNames = <String>{'Seth', 'Kathy', 'Lars'};
var pages = <String, String>{
  'index.html': 'Homepage',
  'robots.txt': 'Hints for web robots',
  'humans.txt': 'We are people, not machines'
};

// USING PARAMETERIZED TYPES WITH CONSTRUCTORS
// To specify one or more types when using a constructor, put the types
// in angle brackets (<...>) just after the class name/constructor
var nameSet = Set<String>.from(names);
// here we have a map of int->View type values
// var views = Map<int, View>();

// RESTRICTING THE PARAMETERIZED TYPES
// So it looks like started to talk about generics, but since the generic type
// syntax as such a close relationship with collections, we needed to diverge
// a bit. But now back to the implementation of generic types.

/// When implementing a generic type, we might want to limit the types that can
/// be provided as args. This sounds a little like Go interfaces with their
/// method and type lists. This guarantees that the subtype must be of a particular
/// type. We do thsi with 'extends'
///
/// A common case is ensuring that a type is non-nullable by making it a subtype
/// of Object (instead of the default Object?)
class Foo<T extends Object> {
  // any type provided to Foo for T must be non-nullable now.
}

// We can also use 'extends' with other types besides Object. Here's an example
// of extending Cache (from above), so that members of Cache can be called
// on objects of type T
class Foo2<T extends Cache> {
  // Implemenation goes here...
  String toString() => "Instance of 'Foo2<$T>'";
}

var foo = Foo2();
// print(foo); this is run up in 'main'

// Let's finish up with GENERIC METHODS
// Methods and funcs also allow type arguments.
T first<T>(List<T> ts) {
  // do some initial work or error checking, then...
  T tmp = ts[0];
  // do some more additional checking or processing
  return tmp;
}
// Here the generic type parameter on first<T> allows us to use the type T
// argument in several places. 
//  - in the functions return type T
//  - in the type of argument List<T>
//  - in the type of a local variable T tmp
// So the real key generic is the one after the function name 'first<T>' that
// allows the use everywhere else. That's the generic key.
