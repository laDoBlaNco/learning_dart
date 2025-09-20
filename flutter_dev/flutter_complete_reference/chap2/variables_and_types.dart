/*CHAPTER 2 - VARIABLES AND TYPES

  2.1 VARIABLES
*/

void main() {
  /*All variables in Dart have a type. I can either decide to explicitly declare the type
  or just let the compiler determine it for me. The syntax is very similar to other
  high-level programming languages
*/
  print('===Variables===');
  var name = 'Alberto';
  var age = 25;
  print('$name $age');
  print('');

  /*In the above example, the name var stores a reference to a String object whose value
    is Alberto. In this case, the type is INFERRED because the compiler is able to 
    automatically determine the type by looking at the value. any variable declared with
    'var' can later be re-assigned with a different value of the SAME type
  */

  String name2 = 'Alberto';
  int age2 = 25;
  print('$name2 $age2');
  print('');

  /*This is equivalent to the previous example, with the only difference being that I've
    explicitly declared the types rather than letting the compiler figure them out. All
    types in Dart descend from the OBJECT supertype so I could have also declared the 
    variables in this way:
  */

  Object name3 = 'Alberto';
  Object age3 = 18;
  print('$name3 $age3');
  print('');

  /*so there is also a 4th way to initialize a variable, but it's the LEAST RECOMMENDED
    way since it has no type safety:
  */

  dynamic name4 = 'Alberto';
  dynamic age4 = 18;
  print('$name4 $age4');
  print('');

  /*The dynamic keyword is a sort of 'wild card' for all types: Its evaluation happens
    at runtime when the var is created, so static analysis tools can't do any checks. 
    This also means that the compiler and the IDE can't detect type errors because they
    will only be discovered at runtime. According to the official Dart guidelines and
    experience, its recommended the following:

      ▪ prefer initializing variables using var or final (or const, which will be covered
        in the next section)

      ▪ whenever I see that the type of a variable might not be trivial to guess, avoid
        type inference and write down the type itself;

      ▪ avoid using Object and dynamic whenever possible

    There are few cases where the Object type/class is worth using, and I will see an
    example in chapter 9 - Section 1.1 "The Conversion Library". Regardless, I will hardly
    ever work with it directly and the same also goes for dynamic
  */


}
