/*
 * So what is a record in the context of Dart?. It seems to be just
 * a collection of attributes without the need for a class. It reminded
 * me of a tuple in other langs and now on another blog, someone says
 * something similar. (Tuples in Swift) 
 * 
 * Here's an example of a record in Dart:
 */

 (String,int) motorcycle = ('Honda', 1992);
// so it looks like a combination of pattern matching and type checking. So one
// var 'motorcycle' can have two types and values. Its like giving motorcycle a 
// tuple, but with type safety/checking. But apparently it can be inferred or 
// we can use final or const as well. 

// So in essence both tuples and records are just a way to put multiple values 
// of different types together in one var without the need for a class or struct
// type as in Go. Similar to a record in a database.

main(){
  print(motorcycle.$1);
  print(motorcycle.$2);
  print('');
  
  print(motorbike.$1);
  print(motorbike.year2);
  print('');
  
  print(motocross.brand3);
  print(motocross.year3);
  print(motocross.displacement);
  print('');
  
  
  // Destructuring seems simple enough:
  final(brand,year) = motorcycle;
  print(brand);
  print(year);
  print('');
  
  // We can also do it with named attrs
  final(brand2,year2: year2) = motorbike;
  print(brand2);
  print(year2);
  print('');
  
  // And now some poweruser crap, when the local name is the same as
  // the attr names
  final(:brand3,:year3,:displacement)=motocross;
  print(brand3);
  print(year3);
  print(displacement);
  
}

// Above we access by index (1-based) cuz they are positional, but we can 
// also use  named attributes. By usinga colon before the data, we can declare
// a name for an attr and even mix with unamed ones. That's the example I
// see on the dart docs. 

const motorbike = ('Honda',year2:1992);

// There the type is inferred, but we could also be explicit
({String brand3,int year3,int displacement}) motocross=(brand3:'BMW',year3:2005, displacement:750);

// interestingly, the indexes continue, not including any named args
// so if we added another item it would then be $2, as if year wasn't 
// there. And the signature doesn't have to match the assignment. Strange
// but if I try to write the type signature  (unamed, named, unamed) I get
// an error. It seems the signature must always be unamed first then named. 

// Now let's get into the cool stuff:
// Destructuring seems simple enough:
// final (brand, year) = motorcycle; has to be in a function, moved up above

// I think I get it now, at least in part. As mentioned in the beginning,
// Dart's new records/patten matching is a away to bundle various values of
// different types into one var without using a class to do so. In other
// langs its like a struct type (Go) or tuples.

