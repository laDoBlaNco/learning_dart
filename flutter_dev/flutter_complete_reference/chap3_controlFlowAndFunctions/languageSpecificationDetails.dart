void main() {
  /*DEEP DIVE: LANGUAGE SPECIFICATION DETAILS

    This section again contains some interesting language features covered in the Dart
    specification document. The contents of the document can be very rigorous and formal
    asi que here they've been extracted and rephrased regarding statements and functions:

      ▪ When a for loop doesn't define a terminating condition, it just loops indefinitely. 
        For example:
  */
  // valid code
  // for (var i = 0; ; i++) {
  //   print(i);
  // }

  // the above example produces an infinite loop cuz Dart converts it to the following:
  // for (var i = 0; true; i++) {
  //   print(i);
  // }

  /*    It is a compile-time error if the static type of the terminating condition can't be
        assigned to a boolean value

      ▪ The switch statement can use labels to 'jump' from a case to another, altering
        the regular program flow. A LABEL is an identifier followed by a color. For
        example:
  */
  const value = 1;
  switch (value) {
    world: // this is the label
    case 0:
      print('world!');
      break;
    case 1:
      print('Hello ');
      continue world; // continue jumps to the world label
    default:
      print('no message');
  }
  /*    The switch normally executes all cases, in order, from top to bottom. However
        when continue world; is evaluated, the program flow jumps back to case 0 (where
        the world label is). I could make the code even more complicated with this:
  */
  print('');
  switch (value) {
    world:
    case 0:
      print('world!');
      continue defaultLabel;
    case 1:
      print('hello ');
      continue world;
    defaultLabel:
    default:
      print('no message');
  }
  /*    This small example is hard to understand since the regular top-to-bottom flow
        is altered multiple times. In a switch statement, break cannot have labels

      ▪ Labels can be used to change the regular flow of a for or while loop as well
        and jump outside in an outer loop (if any). For example:
  */
  print('');

  outer:
  for (var i = 0; i < 5; i++) {
    print('outer $i');

    inner:
    for (var j = 0; j < 5; j++) {
      if (j == 3) break outer; // stops and moves to the outer loop
      if (j == 4) continue inner; // stops and moves to the outer loop
      print('inner: $j');
    }
  }
  /*    Both break and continue are allowed to jump to the same label. Not sure why the
        above behavior happens. Doesn't make sense to me why the 'break inner' goes to
        the outer loop. Ok GOT IT. I switched the outer and inner and now see that its 
        not directing where the loop should follow, its actually telling Dart which loop
        to break out of or continue. Now with 'break outer' it simply stops everything.

      ▪ The official language specification document recommends NEVER using labels in
        switch statements. Here is the quote:

          "Labels shoudl be avoided by programmers at all costs. The motiviation for
          including labels in the language is primarily to make Dart a better target
          for code generation"

        They alter the regular switch flow and make the code hard to understand and
        maintain. There always is a way to rewrite my code so it doesn't need labels.

      ▪ An EXTERNAL FUNCTION is a function whose body is provided separately from its
        declaration. It uses the external keyword and doesn't have a body. For example,
        the toString() method of the Object class is defined as follows:

          external String toString();

        This syntax indicates that the body of the toString function is located 
        somewhere in a C++ file of the Dart SDK. The external keyword can also be
        used for getters, setters, and non-redirecting constructors. Unless I'm 
        on the Dart SDK, I'll never use external.

      ▪ Other examples of external functions might be foreign functions (defined in
        javascript or C for example), primitives of the implementation (as defined by
        the Dart run-time system), or code that was dynamically generated but whose
        interface is statically known.

      ▪ legacy Dart programs running on standalone Dart VM could call C or C++ functions
        in a shared library using native exensions. For example:

          import 'dart-ext:my_library_name';
          int systemRandomValue() native "SystemRandom";

        I have to use import to reference a shared library (using the dart-ext prefix) 
        and then use the native keyword to specify the function name (in the C or C++
        code). Instead of native extensions, modern Dart code uses the FFI (Foreign
        Function Interface) which is covered in chapter 9 - Section 1.4 "Native 
        interoperability with FFI".
  */
}
