// Dart uses both positional and named parameters or args. Named parameters are
// wrapped in {} and then it doesn't matter what order or position they are in.
// Another difference is that by default, positional args are required and can't
// be omitted, while named args are optional and can be omitted. If you want
// to make positional args optional you need to wrap said arg in [] you can also
// then assign it a default

// positional example:
void add(a, [b = 10]) {
  // a & b are positional parameters
  print(a + b);
}

//Named example:
void add2({a = 6, b = 11}) {
  // a & b are named parameters (because of the {})
  print(a + b);
}

void main() {
  add(5, 10);

  // with named args the order doesn't matter
  add2(b: 5, a: 10);

  // with named args they are also optional, as long as the function constructs
  // are null safe, or you have defaults set
  add2();
  add2(b: 5);

  // to do the same with positional args you need to use [arg] or [arg = something]
  // as I did above
  add(10);

  // Finally we can make named parameters required just as positionals are by
  // using the required keyword. ({required a, required b})...
}
