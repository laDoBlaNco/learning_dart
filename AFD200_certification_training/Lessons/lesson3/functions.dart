/**
 * Functions in dart are pretty normal. A collection of statements to that are
 * grouped together and run together in their own scope. We declare/define it
 * first and then we 'call' or 'invoke' it in any part of the main func, or 
 * inside of another function if we want. 
 * 
 * Each function should have a unique name which is used to call it (unless its
 * anony and we'll get into that later I'm sure). 
 */

main() {
  printSomething();

  print(courseName());

  var result = sumCalculator(3, 7);
  print('Sum Result = $result'); // or we could do the following as well:
  print('Sum Result = ${sumCalculator(3, 7)}');

  print(age(20));

  myFunction();

  print('The Sum Result is: ${sum(3, 5)}');
  print('The Product Result is: ${multiply2(3, 5)}');

  companyName(name);
  companyName2(name);
}

printSomething() {
  print('Hello Functions!!');
  print("Welcome to Canada...why?!");
}

// Now when we deal with return types, we need to start putting the type in
// front of the function name
String courseName() {
  return "Flutter Application Development"; // NOTE the 'return'
}

// Here's another one, but this time returning an integer value
int sumCalculator(x, y) {
  var z = x + y;
  return z;
}

// here's a bool return
bool age(x) {
  if (x > 18) {
    return true;
  } else {
    return false;
  }
}

// The void function doesn't return anything. We use this to modify one of the
// parameters or some other sideeffect. If we don't put anything, as we've been
// doing with 'main' this whole time, then the 'void' is implicit
// I think its better to be specific
void myFunction() {
  var firstName = 'Kevin';

  if (firstName.startsWith('K')) {
    print('The first name starts with K');
  } else {
    print('The first name does not start with K');
  }
}

// In dart we have a short version of this function declaration with the
// Function Returning Expression. => is for returning a value in a brief way.
sum(x, y) {
  // so apparently there is some type inferring going on at the  function level
  // as I didn't put int sum but it wasn't implicitly void either.
  var z = x + y;
  return z;
}

multiply(x, y) {
  return x * y;
}

// but we can also do this as a one-liner
int sum2(x, y) => x + y;
multiply2(x, y) => x * y;

// Functiosn and variable scope:
// pretty much like JS. Anything not in a function scope can be created by any
// function. But those in one function don't clash with anything outside of
// that function.
var name = 'Microsoft';
companyName(name) {
  print('My company name is: $name');
}

companyName2(name) {
  var name = 'Google';
  print('My company name is: $name');
}
