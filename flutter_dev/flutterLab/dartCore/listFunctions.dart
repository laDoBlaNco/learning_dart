/*
Dart Core - List Functions
A list function in Dart refers to a metho provided by the List class
for manipulating list data

  ▪ add() - appends an lmeent to the end of a list
  ▪ addAll() - Appends elemetns from another iterable to the list
  ▪ insert() - inserts an element at a specified index
  ▪ remove() - removes the first occurence of a specified element
  ▪ removeAt() - removes an element at a specified element
  ▪ removeLast() - removes and returns (🤔) the last element - little inconsistent I think
  ▪ clear() - removes all elements from a list
  ▪ length - returns the number of elements in the list (not a method)

*/

void main() {
  // create a list of integers
  List<int> nums = [1, 2];

  nums.add(7);
  print(nums);

  nums.addAll([8, 9]);
  print(nums);

  nums.insert(0, 10);
  print(nums);

  nums.remove(7);
  print(nums);

  nums.removeAt(3);
  print(nums);

  print(nums.removeLast());
  print(nums);

  nums.clear();
  print(nums);
  print(nums.length);

  print('');

  // create a list of strings now
  List<String> fruits = ['apple', 'banana', 'orange', 'grape'];
  print(fruits);

  fruits.add('kiwi');
  print(fruits);

  fruits.insert(2, 'pear');
  print(fruits);

  fruits.remove('orange');
  print(fruits);

  fruits.removeAt(0);
  print(fruits);  
}
