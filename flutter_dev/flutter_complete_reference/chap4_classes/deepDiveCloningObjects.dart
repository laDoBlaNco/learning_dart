// ignore_for_file: unused_local_variable

/*DEEP DIVE: CLOSING OBJECTS

  Even if not explicitly mentioned by the official documentation, there is a standard
  pattern to follow when it comes to closing objects. When I want to create a clone
  (or a "copy") of an object, I can create a SHALLOW or a DEEP copy.

    NOTE: The difference between a SHALLOW and DEEP copy is only relevant for compound
          objects (objects that contain other objects, liks lists or class instances).
          This isn't a Dart-specific feature: all programming languages need to clone
          objects Some have built-in ways to do it, others don't.

  A shallow copy creates a new object that shares the same memory with the original 
  object. If the original object contains any references to other objects, the new 
  object will also reference the same objects as the original one. Here is an example
  to clarify the idea: (Person and Name)

  The copy variable holds a reference to a new Person object that is initialized with
  an existing Name object(person.name). In practice, I'm creating a new Person object
  by REUSING some existing ones, such as person.name. This causes side-effects since
  the two object are not independent of one another. For Example (changes in main)

  here I changed the name property on the copy object and the original (person) ALSO
  changed. This is a typical side-effect of shallow copies since they only create
  a clone of the "outer" object and leave internal references to the "old" object. 

  A DEEP copy constructs a new object and also copies all internal objects with new
  instances. In other words, all properties and fields of the original objects are
  copied into the new one; no references are moved. Deep copies in Dart are created
  with the copyWith method. Here's how to add deep copy support to the class (Person2)

  The copyWith method (whose name is a popular convention, not a requirement) is used
  to create deep copies of Dart objects. It can either create an exact (deep) or
  modified (deep) copy of the object. In the example, I've created a standard
  implementation of the copyWith method, which:

    ▪ has the same parameters as the constructor, but makes all of them nullable, and

    ▪ returns a new object with either the given values or creates new ones

  Here are some examples of how this method would work: (Person2 in main)

  The copyWith method makes deep copies because it creates new clones of the object
  itself and all of its internals. In the example, changing the name value in copy2 does
  NOT change the name value of the original person2 object. This is because person2 and
  copy2 are two different objects that do no share references. Another example
  (final person3 in main)

  In this example, copyWith still creates a deep copy of the person3 object but uses a
  different value for the age. When I have to clone a collection (Chapter 6 - Section2
  "Collections"), such as a list, I have to pay attention to clone everything correctly
  For example (People)

  If the user provides a list from the outside, its passed to the new object. Otherwise, 
  I create a new list to make a deep copy and then I iterate over all the existing
  elements to call copyWith. In this way, I'm guaranteed that everything is new and no
  references are shared. This version (People2) is equivalent, but more efficient:

  In chapter 6 - Section 2 "Collections" I'll see why the generate constructor, in this
  case, is a better choice. Regardless, the point is that I must iterate over all items
  to make a deep copy and either call copyWith or manually make a clone.

  When I create my own classes, I need to consider adding a copyWith method for deep
  cloning. In case it wasn't available, I have two options:

    1. Manually create a clone every time I need to deep copy an object. This isn't ideal
       in terms of maintenance because it increases code duplication and testing efforts

    2. If I had no access to the class's source code, I need to consider adding copyWith
       using extension methods (chpater 5 - Section 1.6 "Extension methods")

  When I clone collections (such as lists), I must traverse  all elements and deep copy them.
  If the other object had a copywith method, I could recursively use it. For example
  (Example)

  Assume that the Other class had a copyWith method of its own. In this case, I could
  directly use it rather than manually cloning the object. This the same thing I'd do
  when making a deep copy of an object in a collection. 
*/

class Person {
  final Name name;
  final int age;
  const Person(this.name, this.age);
}

class Name {
  String name;
  Name(this.name);
}

class Person2 {
  final Name name;
  final int age;
  const Person2(this.name, this.age);

  Person2 copyWith({Name? name, int? age}) {
    return Person2(name ?? Name(this.name.name), age ?? this.age);
  }
}

class People {
  final List<Person2> personList;
  const People(this.personList);

  People copyWith({List<Person2>? personList}) {
    if (personList != null) {
      return People(personList);
    }

    // Deep copy Logic
    final deepList = <Person2>[];
    for (final person in this.personList) {
      deepList.add(person.copyWith());
    }

    return People(deepList);
  }
}

class People2 {
  final List<Person2> personList;
  const People2(this.personList);

  People2 copyWith({List<Person2>? personList}) {
    final list =
        personList ??
        List<Person2>.generate(
          this.personList.length,
          (index) => this.personList[index].copyWith(),
          growable: false,
        );

    return People2(list);
  }
}

/* commented this one out instead of going through createing a Other class
class Example {
  final int a;
  final Other other;
  const Example(this.a, this.other);

  Example copyWith({int? a, Other? example}) {
    return Example(a ?? this.a, example ?? this.other.copyWith());
  }
}
*/

void main() {
  final person = Person(Name('Kevin'), 48);

  // This is a shallow copy
  final copy = Person(person.name, person.age);

  copy.name.name = 'Kevin (changed)';
  print(person.name.name);
  print(copy.name.name);
  print('');

  final person2 = Person2(Name('Kevin'), 48);
  final copy2 = person2.copyWith();

  copy2.name.name = 'Kevin (changed)';

  print(person2.name.name);
  print(copy2.name.name);
  print('');

  final person3 = Person2(Name('Kevin'), 48);
  final copy3 = person3.copyWith(age: 50);

  copy3.name.name = 'Older Kevin';

  print('${person3.name.name}, ${person3.age}');
  print('${copy3.name.name}, ${copy3.age}');
  print('');
}
