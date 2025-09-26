// ignore_for_file: dead_code, unused_local_variable

void main() {
  /*DEEP DIVE: NULL SAFETY IN DART

    So null safety is a major change (introduced in Dart 2.12) that replaced the 
    old unsound optional type system with a sound static type system. Before diving
    into the details, I'll understand the problem better by looking at some old
    code (Dart 1.24) with no null safety:

      bool isEven(int value){
        return value%2==0;
      }

      void main(){
        isEven(null);
      }

    This program would compile successfully and throw a runtime exception when trying to
    execute the modulo operation. The reason is that null is an instance of the Null class,
    which doesn't define the operator %. The main issue with this code is that value could
    either be int or null and there is no way to determine it at compile-time. I'm forced
    to make a runtime check. 

      bool isEven(int value){
        if(value == null){
          return false;
        }else{
          return value%2==0;
        }
      }

    As can be imagined, writing if statements everywhere to check for nullability of
    a variable (like in Go? 🤔) isn't reasonable and also adds a ton of boilerplate
    code. The Dart team didn't want to remove null; instead, they tried to make its 
    usage SAFE. Note that there is nothing wrong with null because its sometimes 
    required to rep the absence of value

      NOTE: The problem is that without a sound null-safe system (like the one in 
            Dart 1.x), null can go WHERE YOU DON'T EXPECT and cause problems. On 
            the contrary, a SOUND null-safe system gives me the power to control
            where null can flow through my program and avoid unexpected scenarios.

    From Dart 2.12 onwards, the Dart language has a SOUND NULL SAFE system. In practical
    terms, it means that variables can NEVER be null by default unless I manually say
    otherwise. For example, an int can never be null unless I append a ? at the end.
    The int? type is nullable because it can either be int or null at runtime. 

      NOTE: The biggest difference here is that I can precisely control where null 
            can go. For example, if a variable is of String type, it will NEVER be 
            null. If a variable is of String? type, I am aware that it COULD be null
            and thus I act/code accordingly.

            This system dramatically reduces the chances of encountering unexpected
            null values because I decide where null can go

    Now, I'll dig deeper to compare the old, unsafe system with the new null safe one.
    In both type systems. null is an instance of the particular Null class/type (which
    cannot be extended, implemented, mixed, or instantiated).The following is a
    simplified diagram that describes how types are strutured along the hierarchy
    WITHOUT null safety

        Object ==> String ==> Null
              ==> num ==> double ==> Null
                      ==> int ==> Null
              ==> Future ==> Null

        My linear version of the diagram from the book. Object type and some subtypes

    As I can notice here, Null is a "bottom type" (meaning that its a "subtype of all
    types"). This is why i can replace any type with null and the compiler doesn't 
    give errors. Runtim errors come from the fact that the Null class only defines
    the toString() and comparison methods (hashCode and operator==). For example,
    I can call the round() method on a double but if it was null, I'd get a 
    runtime error because Null object doesn't define round(). Null safety solves
    this problem by changing the type hierarchy to this:

        Object ==> String
              ==> num ==> int
                      ==> double
              ==> Future
        Null

    Since Null no longer is a subtype of all types, no type except Null is compatible
    with null. In other words, Null still exists but it stays outside of the regular
    Object hierarchy. If I had a variable whose type is String, it would NEVER be
    null since Null is not a bottom type anymore. This change fixes all null-reference
    errors.

    Even if this change moved Null outside the Object hierarchy, it's still there. The
    difference is that null is treated differently now. Null-safe Dart code handles 
    nullable types by appending a ? at the end of the type name:

      bool isEven(int? value){
        if(value==null){
          return false;
        }else{
          return value%2==0;
        }
      }

      void main(){
        isEven(null);
      }

    The example is correct since the compiler understands that we're using an if statement
    to make sure that we're not referencing null. In fact, the body of the else
    branch is a safe place since within the scope value can't be null. Since the system
    is 'nullsafe', for 'safe-ty' I can't do much with nullable types: I can only call
    toString() and make equality checks but I can't directly access its properties
  */
  double? pi() => 3.1415;

  final value = pi(); // inferred as 'double?' so...
  print(value.toString()); // this works
  // print(value.round()); // this errors: can't be unconditionally invoked cuz the receiver can be null

  /*The compile-time error here is caused by the fact that I'm using value as if it 
    could never be null, which is not the case. The Null object only defines 
    operator==, hashCode, and toString so those are the only methods I can use. The 
    compiler is very smart: it notices that I haven't checked whether value is null
    or not and thus blocks me immediately with an error. To fix the error of the 
    exmaple, there are a few possiblities:

      1.Use an if statement to protect the code from accessing null (as above). The
        compiler is smart and will understand when the scop is safe

          if(value!=null){
            print(value.round());
          }

        In this case, I (and the compiler) see that within the if scope 'value'
        can never be null because I have just evaluated it. As such, I'm free
        to use value.round() as if value was a double and not a double?

      2.Use the null aware operator (?.) that safely reads the right-hand side
        ONLY if its not null. Consider for example where pi() has a nullable 
        return type but actually never returns null
  */
  print(value?.round()); // now its allowed

  /*  If I used value.round(), I would have got a compiler error because I tried
      to read a nullable type without any check. However, the value?.round syntax
      automatically makes a nullability check and calls round() ONLY if value is
      not null. If it is null, it'll just print null as it'll ignore the .round()
      completely
  */
  double? pi2() => null;
  final value2 = pi2();
  print(value2?.round());

  /*  This example is valid too since the ?. operator notices that value is null and
      thus it does not call round() at all. Instead, it just returns null, o sea
      uses toString() to print 'value'. using the null aware operator is the same as 
      saying

        if(value!=null){   // very Go like
          print(value.round());
        }else{
          print(null);
        }

      Instead of doing this kind of if statement, prefer using ?. which is an 
      equivalent version but less verbose.

    3.Use the bang (!) operator to convert a nullable type into a non-nullable one
      at runtime. Note that this operator throws a runtime exception if the conversion
      failed so make sure to use it judiciously. In this case it would work as follows:
  */
  print(value!.round()); // we are telling Dart not to worry, its not null

  /*  When the compiler sees !. It treats the variable as if it was non-nullable (casts)
      If I used ! on a null value, a runtime exception is thrown since I'm basically
      disabling the null safety checks

    4.Use the null-check operator to give a default value before the variable is used.
      This is a good strategy to give default values to variables in case they were
      null. For example:
  */
  print((value ?? 3.14).round());
  print((value2 ?? 3.14).round()); // both work

  /*  The a ?? b syntax will return a if it's not null and b otherwise. In my case, since
      value2 is null, the ?? operator returns the 'default' (or fallback) value on the
      right side.
      
    It's always safe to pass a non-nullable type to a nullable type. For example, int?
    can either hold int or null. The type system is designed so that every nullable type 
    is a supertype of Null and ITS underlying type. For example:

          int? ==> int
               ==> Null

    Since int? is a supertype, I can assign it either Null or int. Going in the other 
    direction, which is giving an int an int? value, is not possible due to the
    relationship in the hierarchy.

    In a larger view of the Dart type system, I can identify two worlds:

      ▪ one with non-nullable variables (Object,int,bool,...);

      ▪ one with their nullable counterparts (Object?,int?,bool?,...);

    Non-nullable values let me access all of their members without restrictions. On
    the other side, for safety reasons, I can't do much with nullable themselves.
    I have to manually check their null status before safely accessing the underlying
    non-nullable type without exceptions.
  */

  /*TOP AND BOTTOM TYPES
    
    I have previously see that the Dart team moved Null outside of the Object
    hierarchy to make the whole type system 'null-safe'. However, Null is still associated
    to the type hierarchy otherwise I woudln't be able to use it. A TOP TYPE is the 
    highest supertype in the hierarchy while a BOTTOM TYPE is the "lowest" subtype in
    the hierarchy.

    It is beneficial for a type system to have top and bottom types because they
    constrain the hierarchy to a closed set where all entities are somehow linked
    together. As a consequence, it is possible to implement an intelligent type
    inference system. Here is a simplified diagram of the null safe type system
    hierarchy: (of course its my linear version)

        Object? ==> Null ==> Never
                ==> Object ==> String ==> Never
                           ==> num ==> double ==> Never
                                   ==> int ==> Never
                           ==> Future ==> Never

    With null safety, Object? is the top type, meaning that anything and everything 
    in Dart is an Object?. The bottom type is called Never. I note that Null isn't
    an Object subtype anymore so there is no way BY DESIGN that, for example, a bool
    or an int could be null. A few more things:

      ▪ If I want to indicate that I want to allow a value of any type, use Object?
        instead of Object
  */
  Object? value1 = null; // ok
  Object? value3 = 5; // ok
  // Object value4 = null; // Error: value of type null can't be assigned to a var of type Object
  Object value5 = 5; // ok

  /*    As can been seen, Object? could be  int or null, but Object can be anything except
        null. In other words, Object? means "anything" while Object means "anything that 
        is non-nullable"

      ▪ In the rare case that I need a bottom type, use Never. It is a particular type,
        like void or dynamic. The main reason why Never was created is to give a bottom
        type to the Dart type system. In chapter 3 -- Section 4 "Functions" I'll see
        a possible use-case for Never but aside from that, there aren't many if any
        other relevant cases where I really need it. It's handy in the type system,
        for static analysis tools and other compiler-related tasks. For the dev, it's 
        not very useful in practice

    Here's a final diagram that summarizes the main difference between the old (non-
    null safe) and the new (null-safe) type system in Dart.

      ▪ Without null-safety

        Object ==> ... ==> Null
               ==> ... ==> Null

      ▪ With null safety

        Object? ==> Null ==> Never
                ==> Object ==> ... ==> Never
                           ==> ... ==> Never

    The difference is even more visible here. In the null safe type system, Null stays
    outside of the Object hierarchy complete, so its impossible BY DESIGN that null
    is assigned to an Object subtype
  */
}
