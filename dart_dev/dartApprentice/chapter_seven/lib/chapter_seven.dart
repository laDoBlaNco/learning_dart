// ignore_for_file: dead_code, unused_local_variable, duplicate_ignore, unused_field

/*Chapter 7: Nullability

  As out of place as null looks in a list of integers, many programming languages
  actually include it. In the past Dart did as well, but as of version 2.12, Dart
  decided to take null out of the list and only put it back if you allow Dart to 
  do so. This feature is called SOUND NULL SAFETY, but to fnd out what was so
  dangerous about null in the first place, let's keep reading.

  What null means

  Null means 'no value' or 'absence of value'. it's quite usefule to ahve such a
  concept. Imagine not having null at all. Say you ask a user for their postal
  code so that they can save it as an integer in your program. Everything is find 
  we get an input that's not a postal code. Choosing an arbitrary number to 
  tell everyone that no code was entered would work, but then we'd have to let
  everyone know. But having a dedicated value called null, which everyone already
  understands to mean 'no value', 

  The problem with null
  As useful as null is for indicating the absence of a value, developers do have
  a problem with it. The problem is that they tend to forget that it exists. 
  Adn when deverlopers forget about null, they don't handlit it in their code.
  Those nulls are like little ticking time bombs ready to explode the code.

  With the advent of Dart's sound null safety, I can't assign a null value of an
  int even if I wanted to. Eliminating the possiblity of being surprised by null
  prevetns a whole list of errors. 

  Nullable vs Non-nullable types

  Starting with version 2.12, Dart separated its types into nullable and non-nullable
  Nullable types end with a question mark(?) while non-nullable types don't

  Non-nullable types
  Dart types are non-nullable by default. That means they're guaranteed to never 
  contain the value null, which is the essence of the meaning of sound in the
  phrase, 'sound null safety'. These types are easy to recognize because, unlike
  nullable types, they don't have a question mark at the end.
    ▪ int: 3,1,7,4,5
    ▪ double: 3.14159265, 0.001, 100.5
    ▪ bool: true, false
    ▪ String: 'a', 'hello','Would you like fries with that?'
    ▪ User: ray, vicki, anonymous
  Since only types that end in a question mark can potentially have a null value,
  every time I see a type without a question mark, I can be absolutely positive
  that it won't ever be null
    NOTE: a type without a '?' could be null actually if I use the 'late' keyword,
    but technically if I do that i'm opting out of sound null safety

  Nullable types
  A nullable type can contain the null value in addition to its own data type. I can 
  also easily tell the type is nullable because it ends with a question (?), which is
  like saying, "Maybe you've got the data you want or maybe you've got null. That's
  the question".
    ▪ int?: 3, null, 1, 7, 4, 5
    ▪ double?: 3.14159, 0.001, 100.5, null
    ▪ bool?: true, false, null
    ▪ String?: 'a', 'hello','Would you like fries with that?',null
    ▪ User?: ray, vicki, anonymous, null
    NOTE: The question mark at the end of T isn't an operator acting on the
    T. Rather T? is a whole new type separate from T. T? means that the variable
    can either contain a T or i can be null. Every non-nullable type in Dart has
    a corresponding nullable type: 
      ▪ int and int?
      ▪ bool and bool?
      ▪ User and User?
      ▪ Object and Object?
      NOTE: The non-nullable type is a subtype of its nullable form. for example,
      String is a subtype of String? since String? can be a String
      For any nullable variable in Dart, if you don't initialize it with a value
      it'll be given the default value of null

 */
void main() {
  // int postalCode = null; // error: A value of type 'Null' can't be assigned to a variable
  // of type 'int'
  int? age;
  double? height;
  String? message;

  print('===Nullable vs Non-nullable===');
  print(age);
  print(height);
  print(message);
  print('');

  print('===Mini-exercise===');
  /*1. Create a String? variable called profession, but don't give it a value */
  String? profession;
  print(profession);

  /*2. Give profession a value of 'basketball player'*/
  profession = 'basketball player';
  print(profession);

  /*3. Write the following line and then hover my cursor over the variable. What
       type does Dart infer iLove to be?  String (not String?)*/
  const iLove = 'Dart';
  print(iLove.runtimeType);
  print('');

  print('===Handling Nullable Types===');
  String? name;
  // print(name.length); // Dart tells me I can't just unconditionally access this value
  // cuz it could be null
  print('');

  print('===Type Promotion===');
  print(name.runtimeType);
  name = 'Kevin';
  print(name.length);
  print(name.runtimeType);
  print('');

  print('===Flow Analysis===');
  print(isPositive(10));
  print(isPositive(-10));
  print(isPositive(0));
  print('');

  print('===If-null operator (??) ===');
  String? message1;
  final text = message1 ?? 'error';
  print(text);
  print('');

  print('===Null-aware assignment operator (??=) ===');
  double? fontSize;
  fontSize ??= 20.0;
  print(fontSize);
  print('');

  print('=== Null-aware access operator (?.) ===');
  int? age2;
  print(age2?.isNegative);
  print('');

  print('=== Null-aware method invocation operator (?.) ===');
  print(age2?.toDouble());
  print('');

  print('=== Null assertion operator (!) ===');
  String? myNullableString;
  // ignore: unused_local_variable
  // String nonNullableString = myNullableString!;
  // accept cuz I told Dart to take it
  // print(nonNullableString); // this crashes cuz its actually null
  bool flowerIsBeautiful = isBeautiful(
    'flower',
  )!; // value of type bool? can't be assigned
  // to a variable of type bool. Since the function returns bool? it can't be assigned
  // to a variable bool. But I know its not null so I can force it with '!'
  // NOTE: we could also "cast it down" with 'as'  bool? as bool, but '!' is shorter
  print(flowerIsBeautiful);
  print('');

  print('=== Null-aware cascade operator (?..) ===');
  // if I know object isn't nullable I can use the normal cascade ..
  User user1 = User()
    ..name = 'Kevin'
    ..id = 75;

  // but if its nullable
  User? user2;
  user2
    ?..name = 'Odalis'
    ..id = 66;

  print(user1);
  print(user2);
  print(user2?.name?.length.toString());
  print('');

  print('=== Null-aware index operator (?[]) ===');
  // a nullable list
  List<int>? myList = [1, 2, 3];
  // even though we have a list of ints, the list itself could be set to null. However
  // the members of the list can't be null since there's no ? after int o sea
  // List<int>? vs List<int?>?
  // but let's set myList to null
  myList = null;
  int? myItem = myList?[2];
  print(
    myItem,
  ); // rather than crashing the app, it just passes over null. If our
  // list is set to null than you obviously can't index it or have any of its values
  print('');

  print('===The Dangers of Being Late===');
  final user = User3();
  print('...nothing to output here');
  // print(user.name); // this isn't caught at compile-time, but...
  // I get a LateInitializerError: Field 'name' has not been initialized
  print('');

  print('=== Challenge 1: Random Things===');

  print('');

  print('===Challenge 2: Naming Customs===');

  print('');
}

/*Handling nullable types
  So the big issue before and in most languages is that people forget to handle
  null values. But in Dart its made near impossible since you have to know you are
  with a nullable value to start with and you can't do  much at all with a nullable
  value until you've dealt with the possibility of it being null 
  
  Type Promotion
  Dart analyzer which is what works with vscode (in my setup) is smart enough to
  tell in a wide range of sitations if a nullable variable is guaranteed to contain
  a non-null value or not. Even though a values type is nullable, Dart can see that
  name can't possible be null since I assigned it a non-null value before using it. 
  Dart then unwraps or promotes the nullable and largely unusable String? typ to
  a non-nullable String
  
  Flow analysis
  Dart uses a sophisticated 'flow analysis' to check every possible route the code
  could take. As long as none of the routes come up with the possibility of null, 
  it's promotion time.  In the example below, Dart's flow analysis can tell that
  there's no possible way for us to end with a null value, since we check for it
  already. So Dart promotes anInteger to its non-nullable form, o sea int instead of int?
  Even in a much longer and nested if-else chain, dart's flow analysis can determine
  whether to promote a nullable type or not.*/
bool isPositive(int? anInteger) {
  if (anInteger == null) {
    return false;
  }
  return !anInteger.isNegative;
}

/*Null-aware operators
  In addition to flow analysis, Dart also gives me a whole set of tools called 
  null-aware operators. I remember seeing these somewhere else. Theyc an help me
  handle potntially null values. 
    ▪ if-null operator (??)
      if the value on the left isn't null then use it, otherwise use the value on the right
    ▪ null-aware assignment operator (??=)
      when you want to check if a value is null and give it a value if it is
    ▪ null-aware access operator (?.)
      For null safety when accessing object members. It returns null if the left-hand
      side is null. Otherwise it returns the property on the right-hand side
    ▪ null-aware method invocation operator (?.) 🤔🤔🤔 is it the same?
      Since internally a property is just a getter method 🤯, this works the same
      way to call methods as it does to access properties. So YES its the same thing
      with a different name in a different situation
    ▪ null assertion operator (!) I've definitely seen this before and not known what
      its doing. - Sometimes Dart isn't sure whether a nullable variable is null or not,
      but I if KNOWS its not, I can tell Dart its not by using (!). This is a risky operator
      best not used. With this I'm telling Dart to opt-out of null safety and chance it.
      though there are situations where it use is common - 'No promotion for non-local vars'
    ▪ null-aware cascade operator (?..)
      in chapter 6 I saw '..' cascade operator allowing me to set multiple methods or 
      set multiple properties on the same object. 
    ▪ null-aware index operator (?[])
      used for accessing the elements of a list when the list itself might be null. 
    ▪ null-aware spread operator (...?) 
      I'll get into the use of this one in the next chapter
 */
bool? isBeautiful(String? item) {
  if (item == 'flower') {
    return true;
  } else if (item == 'garbage') {
    return false;
  }
  return null;
}

class User {
  String? name;
  int? id;
}

/*Initializing non-nullable fields
  Non-nullable class fields and vars must be initialized before use

  Using Initializers
    String name = 'anonymous';

  Using Initializing Formals in classes
    class User{
      User(this.name) // initializing here, as a require param ensures non-null value
      String name; // still necessary declare non-nullable type
    }

  Initializer List
    class User{
      User(String name) : _name = name; // _name guaranteed to get a value in constructor
      String _name; // again I must declare the non-nullable type
    }

  Using Default Parameter Values
  Optional params default to null, so if they are non-nullable than I MUST provide
  a default value.

    class User{
      User([this.name = 'anonymous']); // remember []s for optional
      String name; // declaring the non-nullable type
    }

    or

    class User{
      User({this.name = 'anonymous'}); // {} for named parameters
      String name;
    }

  Required Named Parameters
  As learned in chap 5, to make a named parameter required, I use 'required'

    class User{
      User({required this.name}); // since required, no need for default
      String name;
    }
  
  NOTE: main differences between optional and named params for me
    ▪ of course optional use [] and named use {}
    ▪ Named order doesn't matter but optionals are positional
    ▪ Named must use paraName:value when calling, while optional are positional
      and have a defined order
    ▪ both can be optional, but named parameters are optional by default and 
      can be made 'required', while optional positionals are inherently optional
      and often use a default

  Nullable Instance Variables
    With all of the examples above its Dart will not allow me to even delibrerately
    initialize with a null 

      final user = User(name: null); Error: The argument type 'NULL' can't be assigned
      to the parameter type 'String'

    But I can get around this if I explicitly tell Dart that the property is nullable

      class User{
        User({this.name}); // named parameter but not required
        String? name;  // declaring nullable type instance variable
      }

  No promotion for non-local variables
  One confusing topic is the LACK of promotion for nullable instance variables. 🤔
  Remembering that Dart promotes nullable variables in a method to their non-nullable
  counterpart if Dart's flow analysis can guarantee the var will never be null
*/
bool isLong(String? text) {
  if (text == null) return false;
  return text.length > 100;
}

// this above is guaranteed to be non-null so 'text' is promoted from String? to String
// But look at this...below it doesn't work in the class 🤔🤔🤔 but why if we already
// checked for null? Basically because Dart can't guarantee that OTHER methods or subclasses
// won't change the value of a non-local variable before it's used.
// One way around this is using '!' as I added below
class TextWidget {
  String? text;

  bool isLong() {
    if (text == null) return false;
    return text!.length > 100; // with null assertion
  }
}

// another option would be to shadow the non-local var with a local one
class TextWidget2 {
  String? text;

  bool isLong() {
    final text = this.text; // shadowing our non-local var
    if (text == null) return false;
    return text.length > 100; // and now it works
  }
}

/*The Late Keyword
  Now let's say I want to use a non-nullable type but can't initialize it. But since Dart
  doesn't allow me to access instance methods during initialization I get an error.

  To solve this I use the 'late' keyword. (it doesn't replace 'final'). It means that 
  Dart doesn't initialize the variable right away. It only initializes it when I 
  access it the first time. This is also known as LAZY INITIALIZATION. 

  Its common to use this while intializing field variables in the constructor
*/
class User2 {
  User2(this.name);

  final String name;
  late final int _secretNumber = _calculateSecret();

  int _calculateSecret() {
    return name.length + 42;
  }
}

/*The dangers of being late
  I can use late with final as seen above, but at times I might want to use late with
  non-final vars. But I need to be careful with this. 

  I'm promising Dart that I'll initialize the field before using it, so the check
  is no longer at compile-time but now runtime. So if I try to do the below? I 
  get an error
*/
class User3 {
  late String name;
}
// call above in main ... 
// We get an error LateInitializationError: Field 'name' has not been initialized
/*For this reason, ti's a bit dangerous to use 'late' when I'm not initializing
  it either in the constructor body or in the same line that its declared.  Like
  null assertion operator, using late sacrifices the assurances of sound null safety
  and puts the responsbility of handling null into my hands. If I mess it up, that's
  on me 
  
  Benefits of being lazy
  Dart knows that it pays to be lazy sometimes. there are times when it might take
  some heave calculations to initialize a variable. If I never use that variable, then
  it would be a waste of resources. With lazy initialization, there is no waste.

  Top level and static variables have always been lazy in Dart. The 'late' keyword
  makes others lazy too. So even if the var is nullable, I can still add 'late' to
  get the benefit of being lazy

    class SomeClass{
      late String? value = doHeavyCalculation();
      String? doHeavyCalculation(){
        // do heave calculation
      }
    }

  That method only runs after I ACCESS the value for the first time. If I never access
  it, then it never does the work. 

  */

  /*Challenge 1: Random things
    Write a function that randomly returns 42 or null. Assign the return value
    of the function to a variable named result that will never by null. Give
    result a default of 0 if the function returns null */


  /*Challenge 2: Naming customs
    People around the world have different customs for giving names to children
    It would be difficult to create a data class to accurately represent them
    all, but try it like this:
      ▪ create a class called Name with givenName and surname properties
      ▪ Some people write their surname last and some write it first. Add a bool
        property called surnameIsFirst to keep track of this
      ▪ Not everyone in the world has a surname
      ▪ Add a toString method that prints the full name 
   */
