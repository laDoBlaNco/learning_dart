/**
 * Records are an anony immutable aggregate type. Like other collections
 * they let us bundle multiple objects into a single object. But they are
 * fixed-sized, heterogeneous, and typed. From the first look this seems like
 * some kind of struct type. 
 * 
 * Records are real values, they can be stored in vars, nested, passed to an
 * from functions, and store them in data structures such as lists, maps, 
 * and sets. 
 */
void main() {
// Just like structs, records are comma-delimited lists of named or positional
// fields, enclosed in ()s:
  var record = ('first', a: 2, b: true, 'last');
  print(record);
// record typed annotations are comma-delimited lists of types enclosed in
// ()s. We use these annotations to define return types and parameter types.
// For example: (int,int)
  (int, int) swap((int, int) anything) {
    var (a, b) = anything;
    return (b, a);
  }

  print(swap((6, 9)));
  print('');

// Fields in record expressions and type annotations mirror how parameters and
// args work in functions. Positional fields go directly inside the ()s.

// record type annotation in a var declaration
  (String, int) record2;

  // Initialize it with a record expression:
  record2 = ('A string', 123); // a record expression is like a record literal.
  print(record2);
  print('');

  // seems line when we talk records we are talking about 3 different things:
  //  - Record literals like above
  //  - Record types like (String,int) record2; or like the function above
  //    where we have the return types (int,int) and the types of the parameter
  //    which itself is a record named anything ((int,int) anything)
  //  - Destructoring the above with pattern matching.

  // As learned in another blog, its a way to group multiple values of different
  // types under one var name. Close to a struct type or tuple in other langs.

  // In the record type notation, named fields go inside {} as normal dart
  // named args and AFTER ALL POSITIONAL FIELDS. (I found that out testing the
  // others) In the expression (to the right of the var) name : value
  ({int a, bool b}) record3;
  record3 = (a: 123, b: true);
  print(record3);
  print('');

  // The names of named fields in a record type are part of this type definition
  // or its shape. Two records with named fields with different names are
  // different types. This reminds me of type names for certain items in Go
  // like fixed arrays.
  ({int a, int b}) recordAB = (a: 1, b: 2);
  ({int x, int y}) recordXY = (x: 3, y: 4);
  print(recordAB);
  print(recordXY);
  print('');
  // recordAB = recordXY; Compile error cuz they aren't the same shape.

  // We can also name positional fields, but these don't have anything to do
  // with the type, therefore they are considered the same shape
  (int a, int b) recordAB2 = (1, 2);
  (int x, int y) recordXY2 = (3, 4);
  print(recordAB2);
  print(recordXY2);
  recordAB2 =
      recordXY2; // this compiles file as they are the same type and shape
  print('');

  // RECORDS FIELDS -they are accessible through built-in getters. Records
  // are immutable, so fields do not have setters. Interesting.  Named fields
  // expose getters of the same name. Positional fields expose getters of the
  // name $<position>, skipping named fields:
  var record4 = ('first', a: 2, b: true, 'last');
  print(record4.$1);
  print(record4.a);
  print(record4.b);
  print(record4.$2); // note this is still index 2 even though 2 named args were
  // between it and the first. Streamlining record access is wherre the 'pattern'
  // from Recards & Patterns comes from.
  print('');

  // RECORD TYPES - There is no type declaration with individual record
  // types. Records are struturally typed based on the types of their fields.
  // A record's 'shape' (the set of its fields, the fields' types, and their
  // names, if any) uniquely determines the type of a record.  So each field in
  // a record has its own type. Field types can differe in the same record. The
  // type system is aware of each field's type wherever it is accessed from the
  // record.
  (num, Object) pair = (42, 'a');
  var first = pair.$1;
  var second = pair.$2;
  print(first);
  print(second);
  print('');

  // RECORD EQUALITY:
  // 2 records are equal if they have the same 'shape' (set of fields), and
  // their corresponding fields have the same values. Since named field 'order'
  // is not part of a record's shape, the order of named fields doesn't impact
  // equality
  (int x, int y, int z) point = (1, 2, 3);
  (int r, int g, int b) color = (1, 2, 3);
  // same set of fields and values
  print(point == color);

  ({int x, int y, int z}) point2 = (x: 1, y: 2, z: 3);
  ({int r, int g, int b}) color2 = (r: 1, g: 2, b: 3);
  // same shape and values, but different names (which are not kinda part of the
  // values)
  print(point2 == color2);
  print('');

  // MULTIPLE RETURNS:
  // Records also allow functions to return multiple values bundled together
  // To retrieve record values from a return, destructure the values into local
  // variables using PATTERN MATCHING. - multiple returns very similar to
  // using tuples like other langs like python. Not true multiple returns like
  // Go and Odin

  // Returns multiple values in a record. Its mainly a normal function, but just
  // like Go you put the  return values in a comma-delimited list in ()s. But
  // here it goes before the function name, while in Go it goes after the
  // arg list.
  (String, int) userInfo(Map<String, dynamic> json) {
    return (json['name'] as String, json['age'] as int);
  }

  final json = <String, dynamic>{
    'name': 'Dash',
    'age': 10,
    'color': 'blue',
  };

  // Destructures using a record pattern:
  var (name, age) = userInfo(json);
  /**
   * Equivalent to:
   * var info = userInfo(json);
   * var name = info.$1;
   * var age = info.$2;
   */
  print(name);
  print(age);
  print('');
}
