// ignore_for_file: unused_local_variable

/**
 * CONSTANTS; CONST & FINAL KEYWORDS
 */

void main() {
  // once I give a value to a const I can't change it
  // using 'const' or 'final'

  const name = 'Ladoblanco';
  final int age = 49;
  // age = 26; // can't assign to the 'final' variable 'age'

  // I can use const and final with or without a type
  // What's the difference? I use const when I know the value at compile-time, but
  // if I don't know it then I can use 'final'

  // const date = DateTime.now(); // can't invoke a non-'const' constructor where a const epxected
  final date = DateTime.now(); // but this works as its assigned at runtime
  print(date);
  // but its still constant as it won't let us change it
  // date = DateTime.now(); // Error: Can't assign to the final variable 'date'.

  // why use const and final? If I have something that I don't want to change as it'll impact
  // my app. For example a serverUrl
  print('');
  var serverUrl = 'https://google.com'; // where I upload assets or data
  // then someone comes along and changes its
  serverUrl = ''; // now my app is broken

  
}
