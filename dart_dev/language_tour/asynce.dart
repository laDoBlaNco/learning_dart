/// ASYNC:
///
/// Avoid the js callback hell and make my code much readable by using
/// async and await
import 'dart:io';

const oneSecond = Duration(seconds: 1);

Future<void> printWithDelay(String message) async {
  // so its just a function with a return type 'Future<> and the 'async'
  // annotation before the body
  await Future.delayed(oneSecond);
  print(message);
}

// the above is the same as doing...
Future<void> printWithDelay2(String message) {
  // note we don't use async or await, but return a function, or callback
  return Future.delayed(oneSecond).then((_) {
    print(message);
  });
}

// as we can see below, they help us to create asynchronous code that's easy
// to read

Future<void> createDescriptions(Iterable<String> objects) async {
  for (final object in objects) {
    try {
      var file = File('$object.txt');
      if (await file.exists()) {
        var modified = await file.lastModified();
        print('File for $object already exists. It was modified on $modified.');
        continue;
      }
      await file.create();
      await file.writeAsString('Start describing $object in this file.');
    } on IOException catch (e) {
      print('Cannot create description for $object: $e');
    }
  }
}

// had an error but I see that the File class is in the dart:io library
// so importing that. Dart is pretty intuitive
