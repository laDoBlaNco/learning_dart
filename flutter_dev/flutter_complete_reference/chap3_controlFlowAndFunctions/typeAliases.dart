// ignore_for_file: unused_local_variable, unused_element

void main() {
  /*3.6 - TYPE ALIASES

    Also known as typedefs, type aliases give another name to an existing function or
    type. That doesn't sound exactly what I know as typedefs from the c world. There
    a typedef was more the creation of a new Type or Class, as C doesn't have classes.
    In Dart, for example, if I wanted to give a shorter name or a more meaningful name
    to a list of objects, I could use the typedef keyword to create a reusable alias:
  */
  final List<String> noAlias = ['a', 'b', 'c'];
  final StringList withAlias = ['a', 'b', 'c'];
  print(noAlias.runtimeType);
  print(withAlias.runtimeType);
  print('');

  /*The new StringList type is just "another name" (or an ALIAS) of list<String> and in
    fact, both runtimeType calls return the same thing. I can also alias an existing
    alias.

    Aliases are mainly handy in two cases:

      1.When the type name is too long. In chapter 6 - "Generics and collections" I'll see
        that I can combine generics to create containers for any type. In some cases, the
        syntax may become super verbose. For example:
  */
  void analyze(Map<int, List<Map<String, double>>> data) =>
      print('Data analysis');
  Map<int, List<Map<String, double>>> getData() => {
    66: [
      {'one': 1.0},
      {'two': 2.0},
    ],
  };
  final Map<int, List<Map<String, double>>> data = getData();
  analyze(data);
  print('');

  /*    I've repeated a lot of types here. In such cases, I can use a typedef to
        make the code more readable with a shorter name:
  */
  void analyze2(ServerData data) => print('Data analysis2');
  analyze2(data);

  /*    The ServerData alias is undoubtedly more meaningful and easier to work with
        as its less verbose than the complete definition fo the underlying types.

      2.When creating function callback aliases. The Flutter framework often uses
        aliases to define reusable types for callback functions. For example:
  */
  void processData({
    required SuccessCallback onSuccess,
    required ErrorCallback onError,
  }) {}
  /*    The aliases could be moved to a separate file and be re-used in other parts
        of the code where a success or failure callback is required.

    As a good practice, its recommended to ALWAYS capitalize the first letter of a 
    typedef name and to use camel case for composite words, as with most types/classes
  */
}

typedef StringList =
    List<String>; // another one that's not allowed to be nested in main

// aliasing an alias
typedef A = int;
typedef B = A;

// this is an alias of the Map<int, List<Map<String, double>>>
typedef ServerData = Map<int, List<Map<String, double>>>;

// typedefs for callback function types
typedef SuccessCallback = void Function();
typedef ErrorCallback = void Function(String);

// Best practice with typedefs
typedef IntegerList = List<int>; // Good
typedef integerList = List<int>; // Bad
