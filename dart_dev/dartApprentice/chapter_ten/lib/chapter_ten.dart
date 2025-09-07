// ignore_for_file: unused_local_variable

/*Chapter 10: Asynchronous Programming

  I've come a long way in this book and studying Dart. This chapter is an
  important one, as it fills in the remaining gaps needed to complete my 
  apprenticeship. In it, I'll not only learn how to deal with code that takes
  a long time to complete, but along the way, I'll also see how to handle errors,
  connect to a remote server and read data from a file.

  My computer does a lot of work, and it does the work so fast that I don't 
  usually realize how much its actually doing. But every now and then, especially
  on older machines or phones, I may notice an app slow down or even freeze. This
  may express itself as 'jank' during an animation: that annoying stutter that 
  happens when the device is doing so much work that some animation frames get
  dropped.

  Tasks that take too long a time generally fall into two categories:
    ▪ I/O tasks
    ▪ computationally intensive tasks

  I/O, or input-output, includes things like reading/writing files, accessing
  a database, or downloading content from the internet. These all happen outside the 
  CPU, so the CPU has to wait for them to complete. Computationally intensive tasks
  on the other hand, happen inside the CPU. These tasks may include things like 
  decrypting data, performing a mathematical calculation, or parsing JSON.

  As a developer, I have to think about how my app, and in particular my UI, will
  respond when it meets these time-consume tasks. Imagine if a user clicked a 
  download button in my app, and the app simply froze until 20MB downloaded 
  completely? I'd be getting one-star reviews all day long.

  Thankfully Dart has a powerful solution backed into the very core of the language
  that allows me to gracefully handle delays without blocking the responsiveness of
  my app.

  Concurrency in Dart

  A thread is a sequence of commands that a computer executes. Some programming 
  languages support multithreading, which is running multiple threads at the same
  time, while others do not. Dart in particular, is a single-threaded language.

  But why? Dart was created in 2011, well into the age of multi-core CPUS. This
  choice to be single-threaded was made very deliberately and has some great
  advantages and I'll soon see.

  Parallelism vs Concurrency

  To really understand Dart's model for handling long-running tasks, and also
  to see why the creators of Dart decided to make Dart single-threaded, it's 
  helpful to understand the difference between parallelism and concurrency. In
  common English, these words mean approximately the same thing, but in 
  computer science, there's a distinction.

  PARALLELISM is when multiple tasks run AT THE SAME TIME on multiple processors
  or CPU cores. CONCURRENCY on the other hand is when multiple tasks TAKE TURNS
  running on a single CPU core. When a restaurant has a single person alternately
  taking orders and clearning tables, that's concurrency. But a restaurant that
  has one person taking orders and a different person clearning tables, that's
  parallelism.

  Its true, parallelism can be better when there's a lot of work to do and that
  work is easy to split into independent tasks. However, there are some disadvantages
  as well.

  A Problem with Parallelism

  Little Susie has four pieces of chocolate left in the box next to her bed. She
  used to have ten, but she's already eaten six of them. She saved the best ones
  for last, because after school today, three of her friends are coming home with
  her. She can't wait to share her chocolates with them. Imagine her horror, though,
  when she gets home and finds only two pieces of chocolate left in the box. After
  a lengthy investigation, it turns out that Susie's brother had discovered her
  stash and help himself to two of the chocolates. From that day on, Susie always
  locked her box whenever she left home.

  The same thing can happen with parallel threads that have access to the same
  memory. One thread saves a value in memory and expects the value to be the same
  when the thread checks the value later. However, if a second thread modifies
  the value, the first thread gets confused. It can be a major headache to track 
  down those kinds of bugs because they come from a source completely separated
  from the code that reports th error. A language that supports multithreading
  needs to set up a system of locks so that values won't get changed at the wrong
  time. The cognitive load of designing, implementing, and debugging a system with
  multiple threads can be heavy, to say the least.

  So the problem isn't so much parallelism in itself, but rather with multiple
  threads having access to the same state in memory.

  Dart Isolates

  Dart's single thread runs in what it calls an ISOLATE. I've heard of these when
  watching videos on flutter.Each isolate has its own allocated memory area, which
  ensures that no isolate can access any other isolate's state. That means that
  there's no need for a complicated locking system. 🤔🤓 Interesting. Such a
  system greatly reduces the cognitive load on the programmer. So it sounds a little
  like the other system in other languages, but better?

  But isn't concurrency slow?

  If I'm running all of a program's tasks on a single thread, it would seem like it 
  would be really slow. Hoever, it turns out that that's not usually the case. When
  2 thread programs compare to a single thread program, the concurrent does take a
  little longer, but it isn't MUCH LONGER. The reason is that the parallel threads
  are idle for much of the time. A single thread is usually more than enough memory
  to accomplish what needs to be done. 

  Flutter needs to update the UI 60 times a second, where each update timeslice is
  called a frame. That leaves about 16 milliseconds to redraw the UI on each frame. 
  It doesn't take that long, normally, so that gives me additional time to perform
  other work while the thread is idle. As long as that work doesn't block Flutter
  from updating the UI on the next frame, the user won't notice any problems. The 
  trick is to schedule tasks during the thread's downtimes. But how do I do that? 🤔

  Synchronous vs asynchronous code

  The word SYNCHRONOUS is composed of syn, meaning 'together', and chron meaning 'time'.
  Synchonous code is where each instruction is executed in order, one line of code
  immediately following the previous one. 

  This is in contrast to ASYNCHRONOUS code, which means NOT TOGETHER IN TIME. That is
  with asynchronous code, certain tasks are rescheduled to be run in the future when
  the thread isn't busy. 

  All of the code I've written so far in this book has been synchronous

  For example:
*/
Future<void> main() async {
  print('===Synchronous vs Asynchronous===');
  print('first');
  print('second');
  print('third');
  print('');
  /*Since the code is executed synchronously, it'll never print in a different 
    order than 'first', 'second', 'third'

    for many tasks, order matters. Multiplying before adding is different than adding
    before multiplying. I have to open the bottle before I can take a drink. For other
    tasks, though, the order doesn't matter. It doesn't matter if I brush my teeth
    first or wash my face first. It doesn't matter if I put a sock on the right foot
    first or the left foot first. 

    As in life, so it is with Dart. While some code needs to be executed in order,
    other taskss can be temporarily postponed. The postponable tasks are where the 
    DART EVENT LOOP comes in.

    The event loop
    I've learned that Dart is based around concurrency on a single thread, but how
    exactly does Dart manage to schedule tasks asynchronously then? Dart uses what it
    calls an event loop to execute tasks that had previously been postponed. This sounds
    to me a little like node.js. 

    The event loop has two queues:
      ▪ microtask queue
        ▪ is mostly used internally by Dart
      ▪ event queue
        ▪ is for events like a user entering a keystroke or touching the screen or
          data coming from a database, file, or remote server. 

    ▪ Synchronous tasks in the main isolate thread are always run immediately. I can't
      interrupt them

    ▪ If Dart finds any long-running tasks that agree to be postponed, Dart puts them in
      the event queue

    ▪ When Dart is finished running the synchronous tasks, the event loop checks the 
      microtask queue. If the microtask queue has any tasks, the event loop puts them
      on the main thread to execute next. The event loop keeps checking the microtask
      queue until it's empty.

    ▪ If the synchronous task and microtask queue are both empty, then the event loop
      sends the next waiting task in the event queue to run in the main thread. Once
      it gets there, the code is executed synchronously. Just like any other synchronous
      code, nothing can interrupt it after it starts. 

    ▪ If any new microtasks enter the microtask queue, the event loopp always handles
      them before the next event in the event queue

    ▪ This process continues until all of the queues are empty. 

  Running code in parallel

  When people say Dart is single-threaded, they mean that Dart only runs on a single
  thread IN THE ISOLATE. However, that doesn't mean I can't have tasks running on another
  thread. One example of this is when the underlying platform performs some work at the
  request of Dart. For example, when I ask to read a file on the system, that work isn't
  happening on the Dart thread. The system is doing the work inside its own process. Once
  the system finishes the work, it passes the result back to Dart, and Dart schedules 
  some code to handle the result in the event queue. A lot of I/O work from dart:io lib
  happens in this way. 

  Another way to perform work on other threads is to create a new Dart isolate. The new
  isolate has its own memory and its own thread working in parallel with the main isolate.
  The two isolates are only able to communicate through messages, though. they have no
  access to each other's memory state. The idea is similar to messaging a friend. Sending
  Ray a text message doesn't me access to the internal memory of his mobile device. He 
  simply checks his messages and replies to me when he feels like it.

  I won't often need a new isolate though. However, if I have a task that's taking too
  long on my main isolate thread, which I'll notice as UNRESPONSIVENESS or JANK in the
  UI, then this work is likely a good candidate for handing it off to another isolate.
  The final section of this chapter will go over how to do that.

  Futures

  I've seen Dart Futures in some other tutorials. I now know that at a high level, Dart
  handles asynchronous code with its event loop and two queues (microtask, event). Not
  it's time to learn how to work with async code at a practical level.

  The Future Type

  Dart has a type/class called Future, which is basically a PROMISE to give me a 
  value that I really want later. The signature of a method that returns this
  promise is:

    Future<int> countTheAtoms();  
    -- From what I already know this the generic syntax. Returning a "future" int

    Future itself is generic 🤓 (I knew that), meaning it can provide any type. In 
    this case though, the future is promising to give me an integer. In my code,
    if I called countTheAtoms, Dart would quickly return an object of type Future<int>.
    In effect, this is saying, "Hey, I'll get back to you with that int sometime later
    Carry on!", in which case I'd proceed to run whatever async code is next.

    Behind the scenes, Dart has passed my request on to, presumably, an atom counting
    machine, which runs independently of my main Dart isolate. At this point, there 
    is nothing on the even queue, and my main thread is free to do other things. Dart
    knows about the uncompleted future, though. When the atom counting machine finishes
    its work, it tells Dart and Dart puts the result, along with any code I give it
    to handle the result, on the event queue. Dart says, "Sorry that took so long. Who
    knew that there were 9.2 quintillion atoms in that little grain of sand! I'll put
    your handling code at th end of the event queue. Give the event loop a few milliseconds
    and then it'll be your turn."

    IMPORTANT NOTE:
      Since the largest an int can be on a 64 bit system is 9,223,372,036,854,775,807
      which is 2^63-1, it would be better to use BigInt as the turn type of countTheAtoms
      (Future<BitInt> countTheAtoms();). Although slower, BigInt can handle arbitrarily
      large numbers. When 'int' values are too big at compile time, there's a compile-time
      error. However, at runtim, they'll just overflow. which means

        9223372036854775807 + 1 == -9223372036854775808
      
    States for a Future

    Now before a Future completes, there's not really anything I can do with it, but
    after it completes it will have two possible results:
      ▪ The value I was asking for
      ▪ an error

    This works out to three different states for a Future:
      ▪ Uncompleted
      ▪ Completed with a value
      ▪ Completed with an error
    
    Let me finally look at an example of a Future, after  only 250 lines of notes 🤯🤯🤯
    */

  final myFuture = Future<int>.delayed(Duration(seconds: 1), () => 42);
  print(myFuture);
  print('');
  /*What's happening here?
      ▪ myFuture is of type Future<int>
      ▪ The first argument is a Duration (I've used this type/class before). After
        a delay of 1 second, Dart will add the anony function in the second arg
        to the event queue.
      ▪ When the event loop gets to ()=42 it will run that function in the main 
        isolate, which results in the function returning 42

    But if I try to print it I get "Instance of 'Future<int>'". 
    There are two ways to get the actual value after a future completes:
      ▪ using callbacks
      ▪ using async-await syntax

    Getting the result with callbacks

    A callback is an anony function that will run after some event has completed. In
    the case of a future, there are three callback opportunities: 
      ▪ then
      ▪ catchError
      ▪ whenComplete
  */

  print('Before the future');
  final myFuture2 = Future<int>.delayed(Duration(seconds: 1), () => 42)
      .then((value) => print('Value: $value'))
      .catchError((error) => print('Error: $error'))
      .whenComplete(() => print('Future  is complete'));
  print('After the future');
  print('');

  /*Recall that a Future will either give me a value or an error. if it completes with
  a value, I can get the value by adding a callback to the 'then' method. The anony 
  function provides the value as an argument so that I have access to it. On the other
  hand, if the Future completes with an 'error', i can handle it in catchError. Either
  way, though, whether the future completes with a valur or an error, I have the 
  opportunity to run any final code I want to in 'whenComplete'

  Also note that these are all functions of Future

  Another NOTE:
  "After the future" was printed before the future results. That print statement is
  synchronous, so it ran immediately. Even if the future didn't have a one-second
  delay, it would still have to go to the event queue and wait for all the synchronous
  code to finish.

  Getting the result with async-await now

  Callbacks  are pretty easy to understand, but they can be hard to read, especially
  if I nest them in multiple layers. A more readable way to write the code above is
  using the 'async' and 'await' syntax. This syntax makes futures look much more like
  synchronous code.

  I first need to add Future<void> to the main() instead of just void and add 'async'
  right after main

    void main() {}

  is now

    Future<void> main() async {}
  */

  print('Before the future (using async and wait)');

  final value = await Future<int>.delayed(Duration(seconds: 1), () => 42);
  print('Value: $value');
  print('After the future');
  print(value.runtimeType);
  print('');

  // Note: Interesting side note here demonstrating how the event loop works. with the
  // two Futures above I get some overlap of when items are printed. Mainly the
  // first line of the second version is printed before the last lines of the first
  // version

  /*Few more important things here
      ▪ If a function uses the 'await' keyword, then it must return a 'Future' and
        add 'async' keyword before the function body. Using 'async' clearly tells Dart
        that this is an asynchronous function, and that the results will go to the
        event queue. Since main doesn't return a value, here I use Future<void>

      ▪ In the front of the Future, I added the await keyword. Once Dart sees 'await',
        the rest of the function won't run until the Future completes. If the Future
        completes with a value, there are no callbacks. I have direct access to that
        value. Thus the type of the value variable above is not Future, but int.

    If the Future returns an error, then I have to do the error-handling in Dart's
    try-catch block

    Handling errors with try-catch-finally blocks

    If I'm attempting an operation t hat might result in an error, I'll place it in
    the try block. if there is an error, Dart will give me a chance to handle it in 
    the catch block. And whether there is an error or not, I can run some last code
    in the finally block

      NOTE: Dart has both an Exception type and an Error type. The words exception and 
            error are often used interchangeably, but an Exception is something that 
            I should expect and handle in the catch block. However, an Error is the
            result of a programming mistake. I should let the error crash my app
            as a sign  that I need to fix whatever caused the error.

    Try-Catch-Finally blocks with async-await
  */
  print('Before the future (using Try-Catch-Finally)');
  try {
    final value2 = await Future<int>.delayed(Duration(seconds: 1), () => 42);
    print('Value: $value2');
  } catch (error) {
    print(error);
  } finally {
    print('Future is complete');
  }

  print('After this Future');
  print('');

  /*The catch and finally blocks correspond  to the catchError and whenComplete 
    callbacks that I saw earlier, right. If the future completes with an error, then
    the try block will immediately be aborted and the catch block will be called.
    But no matter whether the future completes with a value or an error, the 
    finally block will always be called. 

    Catching the Error

    
  */
}
