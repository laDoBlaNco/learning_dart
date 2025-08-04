/**
 * Dart Core - Loops
 */

void main() {
  /**
   * for loop: The for loop is used when I know the number of iterations I want to perform. It consists
   * of 3 parts (initialization, condition, and increment (or decrement)). The loop will continue
   * executing as long as the condition remains true
   */
  for (int i = 1; i <= 5; i++) {
    print('iteration $i');
  }
  print('');

  /**
   * while loop: The while loop is used when I want to repeat a block of code as long as a specific
   * condition is true. The loop will continue executing as long as the condition remains true
   */
  int count = 1;
  while (count <= 5) {
    print('Count: $count');
    count++;
  }
  print('');

  /**
   * do-while loop: The do-while loop is similar to the while loop, but it guarantees that the
   * loop body will be executed at least once before checking the condition
   */
  count = 1;
  do {
    print('Count: $count');
    count++;
  } while (count <= 5);
}
