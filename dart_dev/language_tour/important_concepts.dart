/**
 * IMPORTANT CONCEPTS:
 * 
 * As I continue to learn about dart and flutter, I need to keep some facts
 * and concepts in mind: 
 * ▪ Everything I can place in a variable IS AN OBJECT and every object is an
 *   instance of a class. Even numbers, functions, and null are objects. With
 *   the exception of 'null' (if I enable sound null safety), all objects 
 *   inherit  from the 'Object class' (null safety was intro' d in 2.12)
 * 
 * ▪ Although dart is strongly typed, type annotations are optional cuz
 *   dart can infer types. In 'var number = 101', number is inferred to be of
 *   type int.
 * 
 * ▪ If I enable null safety, variables can't contain null unless I say they
 *   can. I canmake a variable nullable by putting a question mark (?) at the
 *   end of the type. For example, a variable of type int? might be an integer
 *   or it might be null. If I know that an expression never evaluates to null
 *   but dart disagrees, I can add (!) to assert that it isn't null (and to
 *   throw an exception if it is). An example:
 *   'int x = nullableButNotNullInt!'
 * 
 * ▪ When I want to explicitly say that any type is allowed (generics maybe?)
 *   I can use the tyep Object? (if I'e enable null safety), Object, or -- if
 *   I must defer type checking until runtime -- the special type 'dynamic'
 * 
 * ▪ dart supports generic types, as I read, like List<int> (a list of integers)
 *   or List<Object> (a list of objets of any type). This explains why on the
 *   quick tutorial videal I was watching, when he put strings and ints in a list
 *   the type changed to List<Object> and NOT List<String,int> as I thought it 
 *   was going to 🤯🤯🤯
 * 
 * ▪ dart also supports top-level functions (such as main()), as well as a 
 *   function tied to a class or object (stack and instance methods). I can also
 *   create functions within functions (nested or local functions)
 * 
 * ▪ Similorly, dart supports top-level variables, as well as variables tied
 *   to a class or object (static and instance variables). Instance variables
 *   are sometimes known as fields or properties as they are in other langs
 * 
 * ▪ Unlike Java, dart doesn't have the keywords 'public', 'protected', and 
 *   'private'. If an identifier starts with an underscore (pythoniky), it's
 *   private to its  library. Whether or not that's enforced at the language
 *   language, I'll need to investigate later.
 * 
 * ▪ Identifiers can start with a letter or underscore (_), followed by any 
 *   combination of those characters plus digits
 * 
 * ▪ Dart has both expressions (which have runtime values) and statements (which
 *   don't). For example, the conditional expression condition ? expr1 : expr2
 *   has a value of expr1 or expr2. Compare that to an if-else statement, which
 *   has no value. A statement often contains one or more expressions, but an
 *   expression can't directly contain a statement 🤔🤔🤔
 * 
 * ▪ Dart tools can report two kinds of problems: warnings and errors. Warnings
 *   are just indications that the code might not work, but they don't prevent
 *   my program from executing. Errors can be either compile-time or run-time
 *   A compile-time error prevents code from executing at all; a run-time error
 *   results in an exception being raised while the code executes. 
 */
