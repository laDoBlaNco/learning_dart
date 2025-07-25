/**
 * VARIABLES  INTRODUCTIONS:
 * 
 * Here's some examples of creating a var and initializing it in Dart
 */

var name = 'Kevin';

/**
 * Variables store references. The variable call name contains a REFERENCE to 
 * a string object with a value of 'Kevin'
 * 
 * The type of the name variable is inferred to be a String, but I can change 
 * that type by specifying it. If an object isn't restricted to a single type
 * specify the Object type (or dynamic if necessary)
 */

Object name2 = 'Kevin';

// another option is to explicitly declare th etype that would be inferred
String name3 = 'Kevin';

// Note: the style guide recommendation is to use var when possible rather than
// annotations