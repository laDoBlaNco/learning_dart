/**
 * Dart by Example: List
 */

void main() {
  // specifying the length crets a fixed-length list
  var list = ['a', 'b', 'c'];
  print(list);

  //  a growable list?
  var growable = [];
  growable.addAll(['grow', 'able']);
  print(growable);

  // lists can be defined using bracket literals
  var list2 = ['also', 'growable'];
  list2.add('42');
  print(list2);

  // modifying growable list during iteration can cause concurrentmodificationerrors
  var list3 = [47, 3, 25];
  try {
    for (var item in list3) {
      if (item < 10) {
        list3.remove(item);
      }
    }
  } catch (e) {
    print('error: $e');
  }
}
