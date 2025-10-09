/*4.2.5 - GOOD PRACTICES

  There are a lot of kinds of constructors available in Dart. Below is a list
  with some good practices that its recommended to follow when creating constructors:

    1. If all instance variables are final AND the constructor doesn't need a body
       always define a const constructor. In other words, try to create IMMUTABLE 
       CLASSES whenever possible. for example (Fraction)

       Constant classes are stored at compile-time in special lookup tables to be 
       re-used later. Which is used for Singletons. This is a performance improvement
       that is particularly relevant in Flutter (more details in Chapter 10 - Section 
       3.2 "Performance considerations")

    2. If my class can't have a constant constructor, that is ABSOLUTELY FINE. I shouldn't
       think that classes without a constant constructor are wrong: some objects must
       mutate, which is fine. A const constructor is a "plus" that should be used 
       WHEN POSSIBLE, but not always. What is not recommended is the create of public
       variables. For example: (Example)

       This is bad because anyone can change 'value' at any time in any place, and
       Example is NEVER aware of that. Prefer using getters and setters (covered in 
       the next section) to control the variable state.

    3. Factory constructors are very helpful to initialize immutable classes whose
       members need to be initialized after some special configurations or computations.
       For example: (EventInfo)

       (I had to add some code which I think makes sense, but just to get rid of the 
       vscode errors) The constant library-private constructor ensures that an immutable
       class can be built. Since the factory has the same name as the default constructor,
       this would like a regular constructor call to the users. The Dart documentation
       also recommends this. Without a factory, I would have had to do something else,
       such as using 'late' (Event2)

       The recommendation is to avoid public late final fields without initializer.
       I could have also made the variable nullable, but then I would have lost type-
       safety and added more complexity.

    4. I should use the initializing formal syntax to initialize variables of a
       constructor. Alternatively, I should use the initializer list syntax to give
       different names in the parameters list.

    5. I should use redirecting constructors to reuse the logic in the parameters
       list.
  
  In Chapter 5 - Section 1.8 "Good practices" I'll see how factory constructors can also
  be useful to return default implementations of abstract classes.
*/

class Fraction {
  final double num;
  final double den;

  const Fraction(this.num, this.den);
}

class Example {
  double value;
  Example(this.value);
}

class EventInfo {
  final DateTime date;
  final String event;
  EventInfo(this.date, this.event);
}

EventInfo getEventInfo(DateTime date) {
  return EventInfo(date, 'Event');
}

class Event {
  final DateTime date;
  final EventInfo info;
  const Event._(this.date, this.info);

  factory Event(DateTime date) {
    final info = getEventInfo(date);
    return Event._(date, info);
  }
}

class Event2 {
  final DateTime date;
  late final EventInfo info;
  Event2(this.date):this.info = getEventInfo(date);
}

void main() {
  final example = Example(2);

  example.value = 5;
}
