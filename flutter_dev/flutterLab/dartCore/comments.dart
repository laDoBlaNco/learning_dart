/*
Dart Core - Comments

In Dart, I can write different types of comments to add explanatory notes, documentation
or temporary remarks in my code. Comments are ignored by the compiler and do ot affect
the execution of the program. They serve as useful aids for developers to understand the
code, provide context, and make the code more maintainable.
*/

/**
 * Single-line Comments: Single-line comments start with // and extend until the end of 
 * the line. They are used to add comments on a single line. 
 */
// This is a single-line comment in Dart
int x = 10; // I can also add comments after the code on the same line

/*
Multi-line comments: Multi-line comments are used to add comments that span multiple
lines. They start with /* and end with */  (and it looks like they are able to be nested)
*/
/* This is an example 
of a multi-line comment
in Dart */

/* I can also use it to
comment out 
multiple lines of code 
if needed:
int x = 5;
int y = 10;
*/

/**
 * Documentation Comments: Documentation comments, also known as doc comments or 
 * Dartdoc comments, are used to generate documentation for my code. They are
 * specially formated comments  that will allow me to document classes, functions, 
 * variables, and more. Documentation comments start with /// for single line and 
 * /** for multi-line */
 */

/// This is a single-line documentation comment in Dart
int z = 10;

/**
 * This is a multi-line documentation comment,
 * used to provide detailed documentation for
 * classes, functions, or other elements in
 * my code.
 */

void myFunction(){
  // Function implementation would go here
}

void main(){
  
}