// ignore_for_file: unused_local_variable

/*2.2.5 LISTS:

  Any kind of container in Dart is rep'd by a generic type, which I'll see in 
  details in chapter 6 -- "Generics and collections". What I know as an array
  in Dart is called a "list", and it's rep'd by the generic type List<T>

    NOTE: The T in List<T> is a generic placeholder for any type. For exmaple
          I could replace T with String to create a List<String> type

  so lists are 0-indexed collections of items that can be accessed using the []
  operator, as expected. A list can be declared using [] as well
*/

void main() {
  const integerList = [1, 2, 3];
  const stringList = ['a', 'b', 'c'];

  print('$integerList');
  print('${integerList[2]}');

  print('$stringList');
  // print('${stringList[5]}'); // Unhandled exception: RangeError (length): Invalid value
  // Not in inclusive range 0..2: 5
  /*A runtime error is thrown if the index is not within the array bounds. Generic
    collections, including lists, have a lot of interesting properties I'll see later.
    For now, it's enough for me to be aware that 'arrays' in Dart are in reality List<T>
    objects and they can be declared using []s
  */
  print('');
}
