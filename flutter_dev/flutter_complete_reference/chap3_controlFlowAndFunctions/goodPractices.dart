// ignore_for_file: unused_element

void main() {
  /*3.4.6 - GOOD PRACTICES

    With respect to the official Dart guidelines, its strong encouraged to follow
    the suggestions here to keep consistency with what the community recognizes as 
    good practices:

      ▪ Whenever possible, I should prefer to use tear-offs rather than anony functions.
        Remembering that a TEAR-OFF is a closure that takes the same parameters as the
        function and invokes the underlying function when I call it. 🤔 It just sounds
        like a named function rather than a closure, like a named callback, but I'm 
        still trying to understand if there's some sort of difference here.
  */
  // This is good, but again just a named function in place of an anony function
  [1, 2, 3].forEach(print);
  print('');

  // Bad, actually putting in the closure with the args
  [1, 2, 3].forEach((value) => print(value));
  print('');

  /*    I guess after seeing it closer, the idea is that if there's a named function (or
        even if I create one) that has the same signature, its better to plug it in than
        to manually put in the closure. The subtle difference is that Dart allows for me
        to just put in the function name and it takes care of pass the args to it. In most
        if not all other languages I have to do that manually as in that second example
        above, while in the first its just saying, "Hey that sounds like the print function,
        so take 'print' and do your thing."

      ▪ I shouldn't  explicitly initialize nullable variable with null since the compiler 
        already does this automatically.
  */
  // Good
  void test({int? a}) {}

  // Bad
  void test2({int? a = null}) {}

  /*  ▪ Always define the function return type. When the function does NOT return a 
        value, use void rather than leaving the  return type unassigned (which evaluates
        to dynamic)
  */
  // OK - does not return a value and uses 'void'
  void somethingGood() {}

  // Bad - does not return a value bu returns 'dynmaic'
  somethingBad() {}
  print(somethingGood.runtimeType);
  print(somethingBad.runtimeType);
  print('');

  /*Lastly, just a word on nested functions. From a purely technical point of view, 
    they're allowed by the language and don't have performance concerns. From a 
    qualitative point of view, there might be conflicting points of view. Grouping
    common logic into functions may make maintenance easier but I should watch out
    for the nesting depth. Too much nesting could lead to verbose hard-to-read code.
    Dart supports both functional AND OOP programming, so there should always be a
    good balance between the two styles
  */
}
