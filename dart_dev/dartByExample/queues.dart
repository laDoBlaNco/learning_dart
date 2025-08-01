/**
 * Dart by Example: Queue
 */

import 'dart:collection';

void main() {
  // Queues are optimized for adding to the head or tail
  // Items cannot be accessed by their index.
  var q = new Queue.from([300, 200, 100, 500]);

  // Queues implement iterable:
  print(q.takeWhile((i) => i > 100));
  print(q);
  // consuming a queue
  while (q.first > 100) {
    q.removeFirst();
  }
  print(q);
}
