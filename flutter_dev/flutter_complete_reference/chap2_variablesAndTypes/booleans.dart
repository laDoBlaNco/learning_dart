// ignore_for_file: unused_local_variable

/*2.2.3 BOOLEANS

  The bool type/class reps boolean values, which can only hold the true or false
  literals. Both are compile-time constants:
*/
void main() {
  const test = 5 == 0;
  const notTest = !test;

  const isDartNice = true;
  const isDartBad = false;

  /*Unlike c++, in Dart I can't assign 0 and 1 to a bool type; for example, bool test=0
  is not valid in Dart because only bool test = false is. The literal 0 doesn't convert
  to false.
  */
}
