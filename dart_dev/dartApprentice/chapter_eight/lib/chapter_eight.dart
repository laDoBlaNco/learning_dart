// ignore_for_file: avoid_function_literals_in_foreach_calls, dead_code, equal_elements_in_set

/*Chapter 8: Collections
  In almost every application I make, I'll be dealing with collections of data.
  Data can be organized in multiple ways, each ith a different purpose. Dart
  provides multiple solutions to fit my collection's needs and in this chapter
  I'll learn about 3 of the main ones:
    ▪ lists
    ▪ sets
    ▪ maps
 */

void main() {
  /*Lists
    For very large collections of objects of a single type that have an ordering
    associated with them should be in a list - similar to arrays in other languages
  */

  // creating a list literal
  print('===Creating a list===');
  var desserts = ['cookies', 'cupcakes', 'donuts', 'pie']; // inferred String
  print(desserts);
  desserts = [];
  print(desserts.runtimeType);
  desserts = ['cookies', 'cupcakes', 'donuts', 'pie']; // inferred String
  print('');

  var snacks = []; // since Dart can't tell this one is dynamic
  print(snacks);
  print(snacks.runtimeType);
  print('');

  List<String> snacks2 = []; // if empty I need to assign the type
  var snacks3 = <String>[]; // a slighly better syntax for empty lists
  print(snacks2);
  print(snacks2.runtimeType);
  print('');
  print(snacks3);
  print(snacks3.runtimeType);
  print('');

  print('===Accessing elements===');
  final secondElement = desserts[1];
  print(secondElement);
  final index = desserts.indexOf('pie'); // when I don't know the index
  print(desserts[index]);
  print('');

  print('===Assigning/Changing values to list elements===');
  print(desserts);
  desserts[1] = 'cake';
  print(desserts);
  print('');

  print('===Adding elements to a list===');
  print(desserts);
  desserts.add('brownies');
  print(desserts);
  print('');

  print('===Removing elements from a list===');
  print(desserts);
  desserts.remove('cake');
  print(desserts);
  print('');

  print('===Mutable and immutable lists===');
  // using 'var' on a list has nothing to do with the list itself being immutable or not
  // It only means that I can swap out different lists in desserts
  // Now let me use 'final'
  final dessertsFinal = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // dessertsFinal = []; // Error: final variable can only set once
  // dessertsFinal = ['cake', 'ice cream']; // name error here
  // using 'final' means I'm not allowed to sue the assignment operator to give desserts
  // a new list...BUT
  print(dessertsFinal);
  dessertsFinal.remove('cookies'); // ok
  dessertsFinal.remove('cupcakes'); // ok
  dessertsFinal.add('ice cream'); // 🤔🤔🤔 So what's up??? check story below
  print(dessertsFinal);
  print('');

  print('===Creating deeply immutable lists with const===');
  // that is every element of the list must also be compile-time constant
  const dessertsConstant = ['cookies', 'cupcakes', 'donuts', 'pie'];
  // dessertsConstant.add('brownie'); // Error: Cannot add to an unmodifiable list
  // dessertsConstant.remove('pie'); // Error: same error as above
  // dessertsConstant[0] = 'fudge'; // Error: same error as above
  print(dessertsConstant);
  print('');

  // Very interestingly if for some reason Dart won't let me use 'const' with the var name
  // I can get the same effect putting const before the actual list literal 🤯🤯
  final dessertsConstant2 = const ['cookies', 'cupcakes', 'donuts', 'pie'];
  // dessertsConstant2.add('brownie'); // Error: Cannot add to an unmodifiable list
  // dessertsConstant2.remove('pie'); // Error: same error as above
  // dessertsConstant2[0] = 'fudge'; // Error: same error as above
  print(dessertsConstant2);
  print('');

  // finally if I can't use const before the var or the list literal, o sea, I don't
  // know the list elements until runtime, I can create oen with List.unmodifiable
  // named constructor
  final modifiableList = [DateTime.now(), DateTime.now()];
  final unmodifiableList = List.unmodifiable(modifiableList);
  print(modifiableList);
  print(unmodifiableList);
  print('');

  /* NOTE:
  Trying to modify an unmodifiable list will cause a runtime error -- not a compile
  time error. So while mutable data can be unsafe, so too can unmodifiable lists. A 
  good practice is to write tests to ensure my code works as intended. 
  */

  print('===List Properties===');
  const drinks = ['water', 'milk', 'juice', 'soda'];
  print('===Accessing first and last elements===');
  print(drinks.first);
  print(drinks.last);
  print('');
  print('===Checking to see if a list contains any elements===');
  print(drinks.isEmpty);
  print(drinks.isNotEmpty);
  print('');

  print('===Looping over the elements of a list===');
  // I use for-in for iterating over lists
  print('===For-In===');
  for (var dessert in desserts) {
    print(dessert);
  }
  print('');
  // or with forEach (with an anony function)
  print('===forEach===');
  desserts.forEach((dessert) => print(dessert));
  print('');

  // since for forEach, the input is the same as the output for 'print', Dart allows
  // me to use a 'tear-off' syntax, o sea I tear off the unnecessary syntax which is
  // the anony function syntax.
  print('===tear-off===');
  desserts.forEach(print);
  print('');

  print('===Spread Operator===');
  // starting with 2 lists
  const pastries = ['cookies', 'croissants'];
  const candy = ['Junior Mints', 'Twizzlers', 'M&Ms'];
  print(pastries);
  print(candy);
  // with spread operator (...) I can expand these list to other lists
  const moreDesserts = ['donuts', ...pastries, ...candy];
  print(moreDesserts);

  // there's also the null spread operator (...?) This was the last of the list from
  // chapter  7 where I didn't see an example. So here I go now.
  // It will omit a list of the list itself is null
  List<String>?
  coffees; // I almost got hit with the big difference of <String?> vs <String>?
  final hotDrinks = ['milk tea', ...?coffees];
  print(hotDrinks);
  print('');

  print('===Collection If===');
  // for a list I use a COLLECTION IF to determine whether an element is included
  // based on some condition. This seems close to list comprehensions in other languages 🤔
  const peanutAllergy = true;
  const candy2 = ['Junior Mints', 'Twizzlers', if (!peanutAllergy) 'Reeses'];
  print(candy2);
  // Also interestingly COLLECTION IF  doesn't prevent a list from being a compile-time
  // constant, as demonstrated by the presence of the const keyword
  print('');

  print('===Collection For===');
  // if I have a list I can use COLLECTION FOR to iterate over the list and generate
  // another lis. This is definitely a comprehension 🤓🤓🤓 yeap, definitely the
  // Dart list comprehension
  const deserts = ['gobi', 'sahara', 'arctic'];
  var bigDeserts = [
    'ARABIAN',
    for (var desert in deserts) desert.toUpperCase(),
  ];
  // Note in our new list its the final 3 elements, as the first element was place
  // in explicitly. This has 1up on pythons list comprehensions
  print(bigDeserts);
  print('');

  print('===Mini-exercise 1===');
  /*Create an empty list of type String. Name it 'months'. Use the add method
  to add the names of the twelve months.
  */
  List<String> months = [];
  months.add('January');
  months.add('February');
  months.add('March');
  months.add('April');
  months.add('May');
  months.add('June');
  months.add('July');
  months.add('August');
  months.add('September');
  months.add('October');
  months.add('November');
  months.add('December');
  print(months);
  print('');

  print('===Mini-exercise 2===');
  /*2. Make an immutable list with the same elements as in Mini-exercise 1 */
  const months2 = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  print(months2);
  print('');

  print('===Mini-exercise 3===');
  /*3. Use collection for to create a new list with the month names in all uppercase */
  final months3 = [for (var month in months2) month.toUpperCase()];
  print(months3);
  print('');

  print('===Sets===');
  /*Sets
    Usee to create a collection of unique elements. Sets in Dart are similar to their
    mathematical counterparts. Duplicates are not allowed in a set, in contrast to
    lists, which do allow duplicates

    Its like a bag of elements with no particular ordering, unlike lists, which do
    maintain a specific order. Because order doesn't matter in a set, sets can be
    faster than lists, especially when dealing with large datasets
  */
  print('===Creating a Set===');
  // like lists we can start with the Set type (class)
  final Set<int> someSet = {};
  print(someSet);

  // or like this, shorter but the same
  final someSet2 = <int>{};
  print(someSet2);

  // there are also set literals with {}
  final anotherSet = {1, 2, 3, 1};
  print(anotherSet.runtimeType);
  print(anotherSet);
  print('');

  print('===Operations on a set===');
  print('===Checking the contents==');
  print(anotherSet.contains(1));
  print(anotherSet.contains(99));
  print('');

  print('===Adding single elements===');
  // I can add and remove like lists
  print(someSet);
  someSet.add(42);
  someSet.add(2112);
  someSet.add(42);
  print(someSet);
  print('');

  print('===Removing elements===');
  print(someSet);
  someSet.remove(2112);
  print(someSet);
  print('');

  print('===Adding multiple elements===');
  print(someSet);
  someSet.addAll(([1, 2, 3, 4]));
  print(someSet);
  print('');

  print('===Intersections and Unions===');
  // intersections show common elements
  print('===Intersections===');
  final setA = {8, 2, 3, 1, 4};
  final setB = {1, 6, 5, 4};
  print(setA.intersection(setB));
  print(setB.intersection(setA));
  print('');

  print('===Unions===');
  // union shows all the unique values by combining both sets
  print(setA.union(setB));
  print(setB.union(setA));
  print('');
  // NOTE I don't need to run both, I just do to make sure I understand the implications
  // of running a method off one set on another and vice verse
  /*Other operations
    Almost everything that I learned earlier about lists also applies to sets.
    Specifically with the collection operations such as:
      ▪ collection if
      ▪ collection for
      ▪ for-in loops
      ▪ forEach loops
      ▪ spread operators
  */

  print('===Maps===');
  /*Maps 
    In Dart maps are the data structure used to hold key-value pairs. Similar to 
    HashMaps and Dicts in other languages. The key and value in each pair are separated
    by colons, and consecutive key-value pairs are separated by commas */

  print('===Creating an empty map===');
  // same as List and Set we have the generic type/class, but Map takes two
  // type params
  final Map<String, int> emptyMap = {}; // also using {}
  // same shorter way
  final emptyMap2 = <String, int>{};
  print(emptyMap);
  print(emptyMap2);
  print('');

  // so since both are with {} what's is inferred by just that?
  final emptySomething = {};
  // map literals coem before set literals in Dart's history, so Dart infersthis to Map
  // <dynamic,dynamic>
  print(emptySomething);
  print(emptySomething.runtimeType);
  // need to specific for an empty set
  final mySet = <String>{};
  print(mySet);
  print(mySet.runtimeType);
  print('');

  // like lists, maps have a length with tells me the number of pairs
  print(emptyMap.length);
  print('');

  print('===Initializing a Map with Values===');
  // Dart infers key and value types and knows its a map cuz it sees the colon separated
  final inventory = {'cakes': 20, 'pies': 14, 'donuts': 37, 'cookies': 141};
  print(inventory);
  print('');

  // the key isn't required to be a string.
  final digitToWord = {1: 'one', 2: 'two', 3: 'three', 4: 'four'};
  print(digitToWord);
  print('');

  print(inventory.runtimeType);
  print(digitToWord.runtimeType);
  print('');

  print('===Unique keys===');
  // keys in a map must be unique. If there's ever a need for more than one value
  // to a certain key, then I will need to starting mapping lists or other structures
  // to the key.
  // Values do not need to be unique
  final treasureMap = {
    'garbage': ['in the dumpster'],
    'glasses': ['on your head'],
    'gold': ['in the cave', 'under your mattress'],
  };
  print(treasureMap);
  print(treasureMap.runtimeType);
  print('');

  print('===Operations on a map===');
  print('===Accessing elements from a map===');
  print(inventory);
  print(inventory['cakes']);

  // A map will return null if the key doesn't exist. Because of this, accessing
  // an element from a map always gives a NULLABLE value. These must be treated as
  // any other nullable value and thus the use of null-aware operators is a good
  // idea when working with Dart maps
  print(inventory['cakes']?.isEven); // i get an error if I don't use ?.
  print('');

  print('===Adding elements to a map===');
  // just by assigning to elements not yet in the map
  print(inventory);
  inventory['brownies'] = 3;
  print(inventory);
  print('');

  print('===Updating an element');
  print(inventory);
  inventory['cakes'] = 1;
  print(inventory);
  print('');

  print('===Removing elements from a map===');
  print(inventory);
  inventory.remove('cookies');
  print(inventory);
  print('');

  print('===Map Properties===');
  // Maps have properties just as lists do.
  print(inventory.isEmpty);
  print(inventory.isNotEmpty);
  print(inventory.length);
  print(inventory.keys);
  print(inventory.values.runtimeType);
  print('');

  print('===Checking for key or value existence===');
  // I can use 'containsKey()'
  print(inventory.containsKey('pies'));
  print(inventory.containsValue(42));
  print('');

  print('===Looping over elements in a map===');
  /*NOTE unlike lists you CAN'T iterate over a map with a FOR-IN 🤔🤔
    it will give us the following error:
    The type 'Map<type,type>' used in 'for' loop must implement Iterable 
    
    Iterable is a type that knows how to move sequentially, or iterate, over its
    elements. List and Set both implement Iterable, but Map doesn't implement that
    type. i'll get to 'implementing' stuff in chapter 9 when I hit OOP, I'm sure
    
    There is a solution though, for looping over a map. The keys and values 
    properties of a map are in fact iterables, so I can loop over them. */
  for (var item in inventory.keys) {
    print(inventory[item]);
  }
  print('');
  // 🤔🤔 This brings me back to the type of the result of inventory.keys and inventory.values
  // _CompactValuesIterable<int> What is that? 🤔🤔🤔 Apparently it just an instance
  // of Iterable?

  // I can also use forEach to iterate over the elements of a map, which gives me both
  // keys and values
  inventory.forEach((key, value) => print('$key -> $value'));
  print('');

  // same as this for-in off of the .entries property, instead of keys and values
  print(inventory.entries);
  print(inventory.entries.runtimeType);
  for (final entry in inventory.entries) {
    print('${entry.key} -> ${entry.value}');
  }
  print('');

  print('===Mini-exercise 1===');
  /*1. Create a map with the following keys: name, profession, country and city.
    for the values add my own information */
  final myInfo = {
    'name': 'Kevin Whiteside',
    'profession': 'Flutter/Dart Dev',
    'country': 'Dominican Republic',
    'city': 'Santo Domingo',
  };
  print(myInfo);
  print(myInfo.runtimeType);
  print('');

  print('===Mini-exercise 2===');
  /*2. I suddenly decide to move to Toronto, Canada. Programmatically update
    the values for country and city */
  print(myInfo);
  myInfo['country'] = 'Canada';
  myInfo['city'] = 'Toronto';
  print(myInfo);
  print('');

  print('===Mini-exercise 3===');
  /*3. Iterate over the map and print all the values */
  for (var key in myInfo.keys) {
    print('$key :--: ${myInfo[key]}');
  }
  print('');

  print('===Higher order methods===');
  print('===Mapping over a collection===');
  // mapping over a collection means I'm performing an action on each element of the
  // collection as if I were running it through a loop. Collections has a higher order
  // method 'map' that takes an anony function as a parameter and returns another
  // collection based on what the function does to the elements
  // NOTE: The map method is in this section is different from the MAP type/class I
  // studied earlier. List, Set, and Map ALL have a map method.
  const numbers = [1, 2, 3, 4];
  final squares = numbers.map(
    (number) => number * number,
  ); // similar to forEach
  print(squares);
  print(squares.runtimeType);
  print('');

  /*NOTE the result here, same as I questioned above '(1,4,9,16)'. The numbers make sense
    but what's with the ()s. What type is this. Set and Map use {} and List uses [].
    So this result is an Iterable of int, rather than a List of int. That's why when I
    print it I see ()s rather than []s. If I really want a list I can call to toList
    method */
  print(squares.toList());
  print('');
  /*NOTE: Its a common mistake to forget that map produces an Iterable rather than
    a list. In fact I've run into that similar issue in other languages like Python
    which return some internal types that I need to run a method on before being able
    to actually use it. There's a similar method called toSet() if I need a set instead
    of a list. */

  print('===Filering a collection===');
  // I can filter an iterable collection like list or Set using .where() method
  final evens = squares.where((square) => square.isEven);
  print(evens);
  // NOTE: I can use .where() with List and Set but not with Map
  print('');

  print('===Consalidating a Collection===');
  // Some higher order  methods will take all the elements of an iterable collection
  // and consolidate them into a single value using the anony function I provide.
  // There are two ways I can do that:
  print('===Using reduce===');
  const amounts = [199, 299, 299, 199, 499];
  final total = amounts.reduce(
    (sum, element) => sum + element,
  ); // similar to JS
  print(total);
  print('');

  print('===Using fold===');
  // Calling reduce on an empty list will give me an error. For that reason, I can also
  // use .fold() which may be more reliable in certain situations. Such as when the
  // collection has the possibility of containing zero elements. The fold method works
  // like .reduce(), but it takes an extra parameter that provides the function with a
  // starting value
  final total2 = amounts.fold(0, (int sum, element) => sum + element);
  print(total2);
  // 🤔🤔seems like in JS this is one method .reduce() with an optional parameter. Here in
  // Dart its two (reduce or fold)
  print('');

  print('===Sorting a list===');
  /*While where(), reduce(), and fold() all work equally well on lists or sets, I can 
    only sort() on a list. That's because Sets are by definition unordered, so it 
    wouldn't make any sense to sort them
    
    Calling sort() on a list sorts the elements based on their data type */
  print(desserts);
  desserts.sort();
  print(desserts);
  // The sorting is done in-place, o sea sort() mutates the input list itself. This means
  // that if I try to sort a 'const' list, I'll get an error
  print('');

  print('===Reversing a list===');
  var dessertsReversed = desserts.reversed;
  print(desserts);
  print(dessertsReversed);
  /*NOTE: Using reversed doesn't re-sort the list in reverse order. It just returns
    an Iterable that starts at the last element of the list and works forward.*/
  print('');

  print('===Performing a custom sort===');
  
}

/*NOTE:
  ▪ List is the data type, or class name
  ▪ The angle brackets <> are the notation for GENERIC TYPES in Dart. 🤓🤓🤓
    A genenric list means I can ahve a list of anything. I just put the type  I
    want inside the <>. In the case above I have a list of strings (List<String>) but
    I can put any other type as well. For example
      ▪ List<int>
      ▪ List<bool>
      ▪ etc

*/

/*
The Hours on Wenderlich Way:

Imagine I live in a house at 321 Lonely Lane. All I have at home are a few brownies,
which I absentmindedly munch on as I score the internet looking for work. Finally, I
get a job as a senior Flutter  dev, so I buy a new house at 122 Wenderlich Way. Best
of all, my neighbor  Ray brings over some cookies, cupcakes, donuts, and pie as a 
house warming gift!  The brownies are still at my old place, but in my excitement
about the move I've forgotten all about them. 

Using 'var' is like giving me permission to move houses. The first house had brownies.
The second house had cookies, cupcakes, donuts and pie. Different houses, different
desserts. 

Using 'final', on the other hand, is like saying, "Here's my house, but this is the
last place I can ever live." However, just because I live at a fixed location doesn't
mean that I can't change what's INSIDE the house. I might live permanently at 122 
Wenderlich Way, but its fine to eat all the cookies and cupcakes in the hosue and then 
go to the store and bring home some ice cream. Well, its fine in that it's permissable,
but maybe i should pace myself a bit on the sweets

So too with a 'final' list. Even though the memory address is constant, the values
at that address are still mutable. Mutable data is nice and all, but when I open my
cupboard expecting to find donuts but instead discover the neighbors kids traded them
for slugs, 🤢🤮 it's not to pleasant. It's the same list -- sometimes i just won't
appreciated the surprise. So to avoid this I need to create a DEEPLY IMMUTABLE LIST

This is done with 'const'

*/

/*Code as UI - (Flutter enters into the picture)

  The Flutter framework chose Dart because of its unique characterstics. However,Flutter
  has also influenced the development of Dart 🤔 One area I can see this is with the
  addition of the SPREAD OPERATOR, COLLECTION IF and COLLECTION FOR. 

  They make it easier for Flutter devs to compose user interface layouts completely in 
  code, without the need for a separate markup language. The secret of Flutter.

  Flutter UI code is composed of classes (types) called WIDGETS. Three common Flutter
  widgets are rows, columns and stacks, which all store their children as List collections.
  Being able to manipulate lists using the SPREAD OPERATOR, COLLECTION IF and COLLECTION FOR
  makes its easier  to build the UI with code.

  The examples above in 'main' use strings, but in a Flutter app I would see the same
  things with lists of Text, Icon, ElevatedButton and other Widget elements. Which I've
  already seen in Coursera, and YouTube, etc.

*/

/*Higher Order Methods
  There are a number of collection operations common to many programming languages
  including transforming, filtering and consolidating elements of the collection. 
  These operations are known as HIGHER ORDER METHODS, because they take functions
  (usually anony functions) as parameters. I learned about this in Chapter 5, so now
  its time to see it in action.
    ▪ map
    ▪ where/filter
    ▪ reduce/fold
    ▪ sort  
   */

/*NOTES: IMPORTANT
  ▪ I shoul use a COMMANDING VERB for a method that produces a side effect. The sort() 
    method mutates itself, which is a side effect. Also notice the parenthesis on the
    sort method; they clearly say that this is a method, not a property, and as such
    may be doing some potentially expensive and/or dangerous work

  ▪ In comparison, reversed is a getter property, which I recognize because it doesn't
    have any ()s. Thsi indicates that the work is lighter, usually since getters only
    return a value. Additionally, reversed is an ADJECTIVE, not a COMMANDING VERB. That's
    because there are no side effects as it doesn't mutate the collection. 

These are just general guidlines as some don't follow this convention.*/

/*NOTE
  One interesting characteristic of iterables is that they're lazy. That means they
  don't do any work until I ask them to. Since reversed returns an iterable, it doesn't 
  actually reverse the elements of the collection until I try to access those elements,
  such as by printing the collection or converting it to a list using .toList(). 
  Understanding this can help me put off work that doesn't need to be done yet*/
