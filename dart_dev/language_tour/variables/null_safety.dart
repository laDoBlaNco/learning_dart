/**
 * Null Safety
 * 
 * The dart language enforces sound null safety.
 * 
 * Null safety prevents an error that results from unintentional access of
 * variables set to null. The error is called a null dereference error. A null
 * dereference error occurs when you access a property or call a method on an
 * expression that evaluates to null. An exception to this rule is when null
 * supports the property or method, like toString() or hashCode. With null
 * safety, the dart compiler detects these potential errors at compile time.
 * 
 * For example, say you want to find the absolute value of an int variable i,
 * if i is null, calling i.abs() causes a null dereference error. In other 
 * languages, trying this could lead to a runtime error, but dart's compiler
 * prohibits these actions. Therefore dart apps can't cause runtime errors. 🤯
 * 
 * Null safety introduces three key changes:
 * 
 * 1. When you specify a type for a varible, parameter, or another relevant
 *    component, you can control whether the type allows null. To enable 
 *    nullability, you add a '?' to the end of the type declaration.
 */

String? name; // nullable type. Can be 'null' or string.
String name2 = 'kevin'; // Non-nullable type. Cannot be 'null' 

/*
  2. You must initialize varibales before using them. Nullable variables
     default to null, so they are initialized by default. Dart doesn't set 
     initial value to non-nullable types. It forces you to set an initial
     value which is why I had to set it above with name2. This prevents you
     from accessing properties or calling methods where the receiver's type
     can be null but null doesn't support the method or property used. 

  3. You can't access properties or call methods on an expression with a
     nullable type. The same exception applies where its a property or method
     that null supports like hashCode or toString(). 
     NOTE: null supports toString() means that the null object has a toString()
     method implemented

Sound null safety changes potential runtime errors into 'edit-time' analysis
errors. Null safety flags a non-null variable when it has been either:
  ▪ Not initialized with a non-null value
  ▪ Assigned a null value
So basically this is why we see the errors before compile time and dart tells 
us that we need to set a value or it can't be nullable, etc. 

This check allows me to fix these errors before deploying the app.
*/
