void add(int num1, int num2) {
  // by adding the types on the arguments we are tell dart not to accept any
  // other type or infer any other type
  num1 + num2;
}

void demo() {
  // add('5', '3'); // this didn't give me an error before but now that I tell
  // dart that I only except ints, it gives an error asking for ints
  add(5, 3);
}

// the 'void' is also a type, its telling us what type should be returned from
// our function. 