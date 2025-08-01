/**
 * Dart by Example: Optional Parameters
 */

// an ordered optional parameter
String yell(String str, [bool exclaim = false]) {
  var result = str.toUpperCase();
  if (exclaim) result = result + '!!!';
  return result;
}

// named optional parameters
String whisper(String str, {bool mysterioiusly = false}) {
  var result = str.toLowerCase();
  if (mysterioiusly) result = result + '...';
  return result;
}

void main() {
  print(yell('Hello, Dash'));
  print(yell('Hello, Flutter', true));
  print(whisper('Hello, Dart', mysterioiusly: true));
}
