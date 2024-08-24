// COMMENTS ar pretty much as expected, except for a surprising little trick
// that I love.

// SINGLE LINE COMMENTS
// Just as most c-like langs we use this //

// MULTI-LINE COMMENTS
// Norm. We start with /* and end with */. These are nestable as well.

/// DOCUMENTATION COMMENTS
/// These are new to me and I'm a little surprised and thrilled as I thought it
/// was an VSCode thing, but its a dart thing, which is very well thought out
/// So using /// or /**  will start a chain of /// or /** on consecutive lines
/// The effect is the same as multiline doc comments.
///
/// Inside a documentation comment, the analyzer ignors all text unless its enclosed
/// in brackets. Using brackets, you can refer to classes, methods, fields,
/// top-level vars, functions, and parameters. These are then resolved in the
/// lexical scope of the documented program element. When the class then generates
/// its documentation, those [] become links to the docs for that method or element.
/// To parse and generate we use 'dart doc'

void main() {
  // TODO: refactor into an AbstractLlamaGreetingFactory?
  print('Welcome to my Llama farm!');

  /*
   * This is a lot of work. Consider raising chickens.
  Llama larry = Llama();
  larry.feed();
  larry.exercise();
  larry.clean();
  */
}

/// A domesticated South American camelid (Lama glama).
///
/// Andean cultures have used llamas as meat and pack
/// animals since pre-Hispanic times.
///
/// Just like any other animal, llamas need to eat,
/// so don't forget to [feed] them some [Food].
class Llama {
  String? name;

  /// Feeds your llama [food].
  ///
  ///The typical llama eats one bale of hay per week.
  void feed(Feed food) {
    // ...
  }

  /// Exercises your llama with an [activity] for
  /// [timeLimit] minutes.
  void exercise(Activity activity, int timeLimit) {
    // ...
  }
}

class Feed {}

class Activity {}
