void main() {
  /*3.3 - FOR AND WHILE LOOPS

    The syntax of the for and while loops is so traditional that if one didn't know
    that this book was about Dart, one couldn't guess the language. {}s are optional
    but again, its recommended to always use them for readability
  */
  // Good and readable
  for (var i = 0; i < 10; ++i) {
    print('Index: $i');
  }
  print('');
  // Good but potentially not very readable
  for (var i = 0; i < 10; ++i) print('Index: $i');
  print('');
  /*I can get the same result using a while loop, which can be used in two flavors.
    The do-while variant always executes AT LEAST one iteration because the condition
    is evaluated at the end:
  */
  var i = 0;
  // Traditional 'while' loop
  while (i <= 10) {
    print('Index: $i');
    ++i;
  }
  print('');

  i = 0;
  // do-while loop
  do {
    print('Index: $i');
    i++;
  } while (i <= 10);

  /*A while loop immediately evaluates the condition so it COULD never execute its body.
    A do-while loop instead evaluates the condition at the end so at least one iteration
    is ALWAYS happening. 
    
    I can control the loop flow by breaking or skipping some cycles
    with break and continue:

      ▪ break: It immediately stops and exits the loop. In the case of nested loops,
        only the one whose scope contains the break is stopped:
  */
  for (var i = 0; i <= 3; ++i) {
    for (var j = 0; j <= 3; ++j) {
      if (j == 2) break;
      // here I thougth I saw a conflict, with the recommendation to use ternary for
      // one-liners. But in a ternary you have two options. Here its only one so the
      // ternary doesn't make sense, and would complicated getting it to work
      print('$i:$j');
    }
  }
  /*    In this case, only loop 2 is terminated when j==2 but the 'outer' one executes
        normally. In other words, break only 'breaks' a single loop

      ▪ continue: It skips to the next iteration and, in case of nested loops, it 
        behaves in the same way as break: NOTE I don't feel like it should. Cuz continue
        should mean its moves to the next iteration and if that next iteration is still 
        on the inner loop, then it shouldn't jump out. Not sure about this behavior
  */
  for (var i = 0; i <= 3; ++i) {
    for (var j = 0; j <= 3; ++j) {
      if (j == 2) continue;
      print('$i:$j');
    }
  }
  print('');
  /*    Again, only loop 2 skips one iteration but the 'outer' loop is regularly executed
        but for me there is something off here 🤔🤔🤔. CORRECTION, I WASN'T PRINTING THE
        RESULT. IT DOES BEHAVE AS I THOUGHT IT SHOULD AND THE BOOK I A BIT WRONG ABOUT THE
        RESULT.

    Of course, break and continue can also be used with while and do-while loops. In 
    general, for loops are used when I need to increment an index and while loops are
    used when a boolean condition has to be evaluated CONSTANTLY (game loop)

    In some cases, I may want to completely traverse a container without updating an
    index. For example:
  */
  const friends = ['A', 'B', 'C'];
  for (var i = 0; i < friends.length; ++i) {
    print(friends[i]);
  }
  print('');

  /*The i variable is only used to access the i-th element of the list. In these cases,
    where I only need to iterate over a container without needing an index, I should
    prefer using for-in loops
  */
  for (final friend in friends) {
    print(friend);
  }
  print('');

  /*This version is just less verbose and probably easier to read. For each iteration,
    friend contains the next value in teh friends list. In chapter 6 -- Section 3.2 
    "Iterable<T> and iterators" I'll understand how the for-in loop works under the
    hood and how it can be used in custom classes 🤓🤓🤓
  */
}
