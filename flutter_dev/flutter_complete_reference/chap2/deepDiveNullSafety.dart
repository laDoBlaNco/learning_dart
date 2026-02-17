// ignore_for_file: unused_local_variable

/*DEEP DIVE: NULL SAFETY IN DART
Null safety is a major change (introduced in Dart 2.12) that replaced the old
unsound optional type system with a sound static type system. Before diving into the 
details, its good that I understand the problem that was solved with some sample
legacy code:

  Dart 1.24 code:
  bool isEven(int value){
    return value % 2 == 0;
  }
  void main(){
    isEven(null);
  }

This program compiles successfully and throws a runtim error in old Dart when trying
to execute the modulo operation. The reason is that null is an instance of the Null
class, which doesn't define operator %. The main issue with this code is that 'value'
could either be int or null and there is NO way to determine it at compile-time. We are
forced to do null-checks at runtime:

  bool isEven(int value){
    if(value==null){
      return false;
    }else{
      return value % 2 == 0;
    }
  }

  As I could imagine and have seen, writing if statements everywhere (Go) to check for
  nullability of a varible is not reasonable and also adds a tone of boilerplate code.
  The Dart team didn't want to remove null either; instead, they tried to make its
  usage SAFE. Note that there is nothing wrong with null because it is sometimes
  required to represent the absence of value.

    NOTE: The problem is that without a sound null-safe system (like the one in Dart 1.x),
          null can go where I don't expect and cause problems. On the contrary, a SOUND
          null-safe system gives me the power to control where null can flow through my
          program and avoid unexpected scenarios.

  From Dart 2.12 on, the Dart language has a sound null safe system. In practical terms
  it means that variables can NEVER be null by default unless I manually say otherwise.
  For example, an int can never be null unless I append a question mark at the end. The
  int? type is nullable because it can either be int or null at runtime.

    NOTE: The biggest difference here is that I can precisely control where null can
          go. For example, if a variable is a String type, it wil NEVER be null. If a
          variable is a String? type, I am aware that it COULD be null and thus I act
          accordingly.

          This system dramatically reduces the chances of encountering unexpected null
          values because I decide where null can go.

  Digging in a little deeper to compare the old, unsafe system with the new null safe
  one. In both type systems, null is an instance of the particular Null class (which can't
  be extended, implemented, mixed, or instantiated).  According to Google this is because
  it is a 'final' class. More on that in a bit. Here below is a simplified diagram of
  how types ar structured along the hierarchy WITHOUT null safety (the old stuff):

             ======> FUTURE =================> NULL
                         ======> INT ========> NULL
      OBJECT ======> NUM
                         ======> DOUBLE =====> NULL
             ======> STRING =================> NULL

As can kinda be seen above, Null is a "bottom type" (meaning that it's a "subtype of
all types", kinda like Object is a supertype of all types). This is why (in legacy Dart)
I can replace any type with null and the compiler doesn't scream. Runtime errors come 
from the fact that the Null class only defines the toString() and comparison methods
(hashCode and ==). For example, I can call the round() method on a double but if it was
null, then I would get a runtime error since the Null object doesn't define round(). (I'll
get more into those details when I study Dart classes again). Null safety solves this
problem by changing the type hierarchy:

           ======> FUTURE 
                         ======> INT
      OBJECT ======> NUM
                         ======> DOUBLE
             ======> STRING 

      NULL

Since Null no longer is a subtype of all types, no type except Null is compatible with null.
In other words, Null still exists but it statys OUTSIDE of the "regular" Object hierarchy.
If I had a variable whose type is String, it would NEVER be null because Null is not a 
bottom type anymore and the compiler screams. This change fixes all null-reference errors.

Even if this changed moved Null outside of the Object hierarchy, its still there. The
difference is that null is treated differently. Null-saf Dart code handles nullable types
by appending a question mark (?) at the end of the type name
*/
bool isEven(int? value) {
  if (value == null) {
    return false;
  } else {
    return value % 2 == 0;
  }
}

void main() {
  isEven(null); // no more error
  /*The compiler now understands that I'm using an if statement to  make sure I'm NOT
  referencing null. In fact, the body of the else branch is a safe place since within
  that scope 'value' can't be null. Since the system is "nullsafe", for "safety" I 
  can't do much with nullable types; I can only toString() andmake equality checks
  but I can't directly access its properties,e tc. 
  */
  double? pi() => 3.1415;
  final value = pi();
  print(value.toString());
  // print(value.round()); // Compiler Error: method 'round' can't be called on 'double?'...

  /*The compile-time error here is caused by the fact that I'm using 'value' as if it 
  could never be null, which is not the case. The Null object only defines operator==,
  hashCode, and toString so those are the only methods I can use. The compiler is very
  smart: it notices that I haven't checked whether 'value' is null ro not and thus
  blocks me immediately with an error. to fix the error I can do a few things:

    1. Use an if statement to protect the code from accessing null. The compiler is smart
       and understands when the scope is safe:

        if(value != null){
          print(value.round());
        }

       In this case, I (and the compiler) see that within the if scope 'value' can never
       be null because we have just elvaluated it. As such, I'm free to use the
       value.round() as if value was an int and not an int?

    2. Use the null aware operator (?.) that safely reads the right-hand side ONLY if it's
       not null. Consider the following where pi() was nullable but never returns null:
  */
  print(value?.round()); // prints 3

  /*
       If we used value.round(), we would have gotten a compiler error because we tried
       to read a nullable type without any checks. However, the value?.round() syntax
       automatically makes a nullability check and calls round() ONLY IF 'value' is not
       null. Here's another example:
*/
  double? pi2() => null;
  final value2 = pi2();
  print(value2?.round());

  /*This example is valid two since the ?. operator notices that 'value' is null and
      thus it doesn't call .round(), but instead just returns null. Using the null aware
      operator is the same as doing it in an if statement

        if (value != null){
          print(value.round());
        }else{
          print(null);
        }

      Instead of doing this kind of if statement, I should prefer using ?. which is an
      equivalent version but less verbose.

    3. Use the bang (!) operator to convert a nullable type into a non-nullable one at 
       runtime. Note that this operator throws a runtime exception if the conversion 
       fails, so i need to make sure to use it wisely. In my case above I would simply
       call it instead of the '?.'        
      */
  print(value!.round());
  print('');
  /*
       When the compiler sees !. it treats the variable as if it was non-nullable. If I
       used ! on a null value, a runtime-exception would be thrown

    4. Use the null-check operator to give a default value before the variable is used.
       This is a good strategy to give default values to variables in case they are null.
       For example:
    */
  print(value2);
  print((value2 ?? 3.14).round());

  /*
       The a ?? b syntax returns a if it's not null and b otherwise. In my case, since
       value2 is null, the ?? operator returns the "default" (or "fallback") value on
       the right-handed side.

  Its always safe to pass a non-nullable type to a nullable type. For example, int? can
  either hold int or null. The type system is designed sot aht every nullable type is a 
  supertype of Null and its underlying type. Soooo:
              :========> int
      int? ===:
              :========> null

  Since int? is a supertype, I can assign it either Null or int. Going int the other 
  direction, which is giving an int and int? value, is not possible because of the 
  relationship in the hierarchy:

  In a larger view of the Dart type system, I can identify two worlds then:
    • one with non-nullable variables (Object, int, bool, ...);
    • one with their nullable counterparts (Object?, int?, bool?, ...);

  Non-nullable values let me access all of their members without restrictions. On the
  other hand, for safety reasons, I can't do much with nullable themselves. I have to
  manually check their null status before safely accessing the underlying non-nullable type 
  without exceptions.

  TOP AND BOTTOM TYPES:
  I've previously seen that the Dart team moved Null outside the Object hierarchy to make
  the whole type system null safe. However, Null is still associated to the type hierarchy
  otherwise I wouldn't be able to use it 🤔. A TOP TYPE is the "highest" supertype in the
  hierarchy while a BOTTOM TYPE is the "lowest" subtype in the hierarchy.

  It is beneficial for a type system to have top and bottom types because they constrain the
  hierarchy to a closed set where all entities are somehow linked together. As a consequence, it is
  possible to implement an intelligent type inference system. Here is the  simplified diagram of
  the null safe type system hierarchy:


               
               :=======> NULL =========================================================:
      OBJECT?==:                    :======> FUTURE ===================================:==> NEVER
               :                    :                    :=====> INT ========:=========:
               :=======> OBJECT ====:======> NUMBER =====:                   :         :
                                    :                    :=====> DOUBLE =====:         :
                                    :                                                  :
                                    :======> STRING ===================================:


  With null safety, Object? is the TOP TYPE, meaning that everything in Dart is an Object?. The
  BOTTOM TYPE is called Never. Notice that Null isn't an Object subtype anymore so there is no 
  way BY DESIGN that, for example, a bool or an int could be null. A for more things for me to
  keep in mind on this road to Dart Mastery:

    • If I want to indicate that I want to allow a value of any type, I use Object? instead of
      Object. Here's why:
  */
  Object? obj1 = null; // ok
  Object? obj2 = 5; // ok

  // Object obj3 = null; // Compile-time error: A value of type 'null' can't be assigned to a var of
  // type 'object'
  Object obj4 = 5; // ok

  /*
      As seen here, object? can be an int or null, while Object can be anything EXCEPT for null. In
      other words, Object? means "anything" while Object means "anything that is non-nullable" 🤯🤯🤯

    • In the rare case that I need a bottom type, I can use Never. It is a particular type, like void
      or dynamic. The main reason why Never was created is to give a bottom type to the Dart type
      system. In chapter 3 - Section 4 "Functions" I'll see a possible use-case for Never (which I 
      kinda remember from past studies) but aside from that, there aren't many other relevant cases
      where I need it. It's handy in the type system, for static analysis tools and other compiler-
      related tasks. For the developer, it's not much use in practice.

  Here's a final diagram that summarizes the main difference between teh old (non-null safe) and
  new (null safe) types sytems in Dart:

  WITHOUT NULL SAFETY:

                    :======= ... =======:
      OBJECT =======:                   :=======> NULL
                    :======= ... =======:

---------------------------------------------------------------------------------------------------

  WITH NULL SAFETY:
                     :======= NULL ====================================:===> NEVER
      OBJECT? =======:                      :====== ... =======:       :
                     :======= OBJECT =======:                  :=======:
                                            :====== ... =======:    



  The difference is even more visible now. In the null safe type system, Null stays outside of
  the Object hierarchy so it's impossible BY DESIGN that null is assigned to an Object subtype.
  */
}
