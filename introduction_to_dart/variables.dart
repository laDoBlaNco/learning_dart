// LANGUAGE TOUR - VARIABLES

late String myDescription; // here I see the real use of 'late' 
// without it, i get an error for not initializing the var. 

void main(){

  // First and foremost we have a simple example of creating a string
  // and putting it in a var.
  var name = 'Bob'; // pretty simple. NOTE the 'var' kw and the ';'
  print(name);
  // in Dart, vars store pointers to values. So here, name stores a reference
  // that points to a String object with the value of 'Bob'. 

  // Dart is statically typed, but we can let the type inference do its work for us or
  // we can explicitly specify it before the var. Also, we can give the type 'Object' if
  // its not restricted to a single type, or we want it to be dynamic. That's interesting.
  // Also note how we don't use 'var' if we use the type.
  Object name2 = 'Kevin';
  String name3 = 'Odalis';
  print(name2);
  print(name3);
  

  // NULL SAFETY - Dart enforces sound null safety. This means that we can prevent an error 
  // resulting from unintentional access of variables set to null. This sounds just like the 'optional'
  // that I see in other langs. The following was said by Michele Volpato, "Sound null safety means that
  // if a var is not declared as nullable, then, whenever you access that var, you will never find null, for its 
  // entire lifetime. This should remind you of Swift Optional", Or Rust, or Odin, Ocaml, etc. They have a lot in
  // common but they are implemented in different ways. 

  // In Swift 'optional' is a generic type, which means that, when we write
  // var x: String?, we are saying that x:Optional<String> is a var that can contain a String or nil

  // In Dart, we took a different approach. When we write String? x, what we mean is the same that
  // x is a variable that can contain a String or null, but String? is a 'union type', it describes a value that can
  // be one of several types. (Kinda like Go's Interfaces) So in Dart String is called a non-nullable type, while String?
  // is a nullable type. So again very much the same as Optionals, but with a different implemeentation and terminology in 
  // the wild.

  // So back to Dart, a null dereference error (dereference cuz vars are just pointers) occurs when the var or prop evaluates
  // to null. With null safety, the compiler catches these at compile time. There are 3 key things to keep in mind here
    // 1. When we specify a type we control if that type allows null or not with '?'. (nullable or non-nullable).
    String? kevin;  // Nullable types Can be 'null' or 'string'
    print(kevin);
    String kevin2 = 'Kevin';  // Non-nullable type can't be null but can be a string NOTE and it must be initialized.
    print(kevin2);
  
    // 2. You must intialize vars before you use them. Nullable vars default to null, so they are intialized by default. 
    //    Dart doesn't set inital values (like Go's zero default) to non-nullable types. We must set them explicitly. Also Dart
    //    doesn't allow you to observed uninitialized vars, which prevents us from accessing  props or calling methods where the 
    //    receiver's type can be null but null doesnt support the method or prop.

    // 3. You can't access props or call methods on expressions with a nullable type. 

  // The benefits of 'sound null safety' is the same as the Optional Type in other langs as it prevents runt-time errors 
  // due to null access, turning run-time errors into edit-time errors which are always better. 


  // DEFAULT VALUES:
  // As mentioned above nullable vars get initialized with null automatically
  // Interestingly even numbers start out as null and not 0, like in Go. Because in Dart, everything is an object. 
  int? lineCount;
  print(lineCount);
  // but non-nullable vars need to be explicit
  int lineCount2 = 0;
  print(lineCount2);
  
  // NOTE: up above it made me initialize but now the docs say that I don't have to initialize a non-nullable on creation but 
  // of course before we use it. 
  int lineCount3;
  
  
  // There is also something called a 'late' var. This is used when we want to declare a non-nullable
  // var that initialized after its declaration.  Or for lazy initializing a var. Dart can't always tell 
  // though if a var is set before its used. This happens with top-level variables and isntance variables at times. If we know that
  // a variable is set before its used, but Dart disagrees, we can fix it by marking the var as 'late', telling Dart that it will
  // be assigned before its used. 
  late String description;
  
  // it also seems like the difference is what's inside main and what's outside in top-level. Dart gives me errors about uninitialized 
  // vars in top-level but here inside main I just get warnings for not using them yet. 
  myDescription = 'Feijoada'; // from late String at the file top
  print(myDescription);
  
  // lazy initialization happens when the var is used, this is handy since the var may not be used or needed, and initializing is costly
  // If we are initializing an instance var and its initializer needs access to 'this'
  
  // FINAL and CONST - I've been waiting for this one for a while now. 
  // as expected, if we never plan on changing a var we can use 'final' or 'const'.
  // This eitther instead of 'var' or in addition to the type. What's the difference?
    // Final vars can be set only once
    // Const vars are a compile-time constant (they are implicitly final).
  
  // for example: final
  final namez = 'Jack'; // without a type annotation
  final String nicknamez = 'Jackie'; 
  // they can't be changed
  // namez = 'someone else'; // this gives an error as it can only be set once.
  
  // We use 'const' for vars that we want to be compile-time constants. These should
  // set to compile-time constants such as numbers or string literals, a const var or the result
  // of some math on constant numbers. Just like other langs it needs to be sometihng the
  // compiler can see on compile-time.
//   const bar = 1000000; // unit of pressure (dynes/cm2)
//   const double atm = 1.01325 * bar; // Standard atmosphere
  
  // we can also use const to create const values and assign them to a var thus
  // creating a const var.
  var foo = const [];
  final bar = const [];
  const baz = []; // the same as const [] 
  
  // difference is that if the var is const 'const var' it can't be changed. But if the value
  // is const 'const []' and put into a var, then that var can be changed to something else later. 
  foo = [1,2,3]; // this had a const value, but we changed it.
  
  // Though the last part is talking about creating consts with type checks, casts, collection ifs, and spreads
  // I'm finding the syntax for these things super interesting.
  const Object i = 3; // where i is a const Object with an int value
  const list = [i as int]; // typecasting in a list. 
  const map = {if (i is int) i: 'int'}; // Type checking 'is' in 'Collection If' which seems like a comprehension of some sort. 
  const set = {if (list is List<int>) ...list}; // ... for the spread.
  
  // NOTE: A final object's fields can be modified, though the object itself can't be changed. 
  // A const object can't be changed or its fields modified. 
  


}
