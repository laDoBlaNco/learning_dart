/*
  DEFAULT VALUE

  Uninitialized variables that have a nullable type have an initial value
  of null. Even variables with numeric types are initially null, because
  numbers - like everything else in dart - are objects.
*/

void main() {
  int? lineCount;
  // assert(lineCount == null);
  print(lineCount);

  // NOTE: production code ignores assert() calls. During development, on the
  // other hand, assert(condition) throws an exception if condition is false

  // With null safety, you must initialize the values of non-nullable variables
  // before you use them
  int lineCount2 = 0;
  print(lineCount2);

  // We don't have to initialize a local variable where its declared, but you
  // do need to assign it a value before it's used. for example, the following
  // code is valid because dart can detect that lineCount is non-null by the
  // time its passed to print();
  int lineCount3;
  var weLikeToCount = true;

  if (weLikeToCount) {
    lineCount3 = 66;
  } else {
    lineCount3 = 0;
  }

  print(lineCount3);
}

// Top-level and class variables are lazily initialized; the initialization
// code runs the first time the variable is used. 
