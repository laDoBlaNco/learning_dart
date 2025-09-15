// ignore_for_file: unused_local_variable, dead_code

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

import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'dart:isolate';
import 'package:http/http.dart' as http;

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

  /* Commenting out so I don't have to deal with the delay
  final myFuture = Future<int>.delayed(Duration(seconds: 1), () => 42);
  print(myFuture);
  print('');
  */
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

  /* Commenting out for the delay
  print('Before the future');
  final myFuture2 = Future<int>.delayed(Duration(seconds: 1), () => 42)
      .then((value) => print('Value: $value'))
      .catchError((error) => print('Error: $error'))
      .whenComplete(() => print('Future  is complete'));
  print('After the future');
  print('');
  */

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

  /* Commenting out the delay here
  print('Before the future (using async and wait)');

  final value = await Future<int>.delayed(Duration(seconds: 1), () => 42);
  print('Value: $value');
  print('After the future');
  print(value.runtimeType);
  print('');
  */

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
  /*Commenting out the delay
  print('Before the future (using Try-Catch-Finally)');
  try {
    final value2 = await Future<int>.delayed(Duration(seconds: 1), () => 42);
    throw Exception('There was an error');
    print('Value: $value2');
  } catch (error) {
    print(error);
  } finally {
    print('Future is complete');
  }

  print('After this Future');
  print('');
  */

  /*The catch and finally blocks correspond  to the catchError and whenComplete 
    callbacks that I saw earlier, right. If the future completes with an error, then
    the try block will immediately be aborted and the catch block will be called.
    But no matter whether the future completes with a value or an error, the 
    finally block will always be called. 

    Catching the Error

    In order to see what happens when there's an error, I'll add the following
    to the try block above:
      thrown Exception('There was an error');

    the try block doesn't get a chance to print the value and the catch block picks
    up the error message from the exception

    Asynchronous Network Requests

    Above I use Future.delayed to simulate a task that takes a long time. This is
    useful while developing as I can implement an interface with a mock network 
    request class to see how my UI will react while the app is waiting for a
    response. But eventually, I'll need to implement the real deal. So, that example
    Making an HTTP request to access a REST API. I'll see many of the concepts from
    this book and comment on them respectively.

      NOTE: HTTP, or hypertext transfer protocol, is a standard way of communicating
            with a remove server. REST, or representational state transfer, is an
            architectural style that includes commands like get, post, put, and 
            delete. The API, or application programming interface, is similar in
            idea to the interfaces I made in Chapter 9. A remote server defines 
            a specific API using REST commands which allow clients to access and
            modify resources on the server. 🤔 So I think this means that while all
            this time I was thinking REST was a system or a framework of some sort,
            its actually the ACTUAL API. An API that is representational  of a 
            state transfer. I think 🤔
  */
  print('');
  print('===Making a GET Request===');
  try {
    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final parsedUrl = Uri.parse(url);
    final response = await http.get(parsedUrl);
    final statusCode = response.statusCode;
    if (statusCode == 200) {
      final rawJsonString = response.body;
      final jsonMap = jsonDecode(rawJsonString);
      final todo = Todo.fromJson(jsonMap);
      print(todo);
    } else {
      throw HttpException('$statusCode');
    }
  } on SocketException catch (error) {
    print(error);
  } on HttpException catch (error) {
    print(error);
  } on FormatException catch (error) {
    print(error);
  }

  print('');
  print('===Mini-Exercise 1, 2, and 3===');
  /*1. use the Future.delayed constructor to provide a string after two seconds
    that says 'I am from the future.'
  */
  /*2. Create a string variable named message that awaits the future to complete
    to complete with a value
  */
  /*3. Surround the code above with a try-catch block
  */
  /*Commenting out these delays
  try {
    final String message = await Future<String>.delayed(
      Duration(seconds: 2),
      () => 'I am from the future.',
    );
    print(message);
  } catch (error) {
    print(error);
  }
  print('');
  */

  print('===Subscribing to a Stream===');
  print('===Reading as a String===');

  // final file = File('assets/text.txt');
  // final contents = await file.readAsString();
  // print(contents);
  print('');

  print('===Reading from a Stream (listen callback)===');
  // final file2 = File('assets/text_long.txt');
  // final stream2 = file2.openRead();
  // stream2.listen((data) {
  //   print(data.length);
  // });
  print('');

  print('===Reading from a Stream (async for loop)===');
  // can I use the same stream twice??? 🤔🤔🤔 -- apparently not
  // final file3 = File('assets/text_long.txt');
  // final stream3 = file3.openRead();
  // await for (var data in stream3) {
  //   print(data.length);
  // }
  // Note the two examples above where merged since they were async and two different
  // streams. So I'm commenting out as I go so that the result is clear

  print('');

  print('===Error Handling===');
  print('===Using a Callback===');
  // final file = File('assets/text_long.txt');
  // final stream = file.openRead();
  // stream.listen(
  //   (data) {
  //     print(data.length);
  //   },
  //   onError: (error) {
  //     print(error);
  //   },
  //   onDone: () {
  //     print('All finished!');
  //   },
  // );
  print('');

  print('===Using Try-Catch===');
  // try {
  //   final file = File('assets/pink_elephants.txt');
  //   final stream = file.openRead();
  //   await for (var data in stream) {
  //     print(data.length);
  //   }
  // } on Exception catch (error) {
  //   print(error);
  // } finally {
  //   print('All finished!');
  // }
  print('');

  print('===Cancelling the Stream===');

  // final file = File('assets/text_long.txt');
  // final stream = file.openRead();
  // StreamSubscription<List<int>>?
  // subscription; // explicitly creating a named stream
  // // so I can address if its null instead of just 'final stream...'
  // subscription = stream.listen((data) {
  //   print(data.length);
  //   subscription?.cancel(); // cancelling after the first data event
  // },
  // cancelOnError:true,
  // onDone:(){
  //   print('All finished!');
  // });

  print('');

  print('=== Transforming a Stream ===');
  print('=== Viewing the bytes ===');

  // final file = File('assets/text.txt');
  // final stream = file.openRead();
  // stream.listen((data) {
  //   print(data);
  // });
  print('');

  print('=== Decoding the bytes ===');
  // final file = File('assets/text.txt');
  // final stream = file.openRead();
  // await for (var data in stream.transform(utf8.decoder)) {
  //   print(data);
  // }
  print('');

  print('=== Mini-Exercises 1 and 2 ===');
  /*This exercise produces a stream that outputs an integer every  second and then
    stops after the tenth time.

    1. Set the stream to a variable named myStream
    2. use await for to print the value of the integer on each data event coming
       from the stream.
  */

  // final myStream = Stream<int>.periodic(
  //   Duration(seconds: 1),
  //   (value) => value,
  // ).take(10);

  // await for (var data in myStream) {
  //   print(data);
  // }
  print('');

  print('=== App Stopping Synchronous Code ===');
  // print("Ok, I'm counting...");
  // print(playHideAndSeekTheVersion());
  print('');

  print('=== App Stopping Asynchronous Code ===');
  // print("OK, I'm counting...");
  // print(
  //   await playHideAndSeekTheLongVersion2(),
  // ); // note the use of 'await' before function

  print('');

  print('=== Spawning the isolate and listening for messages ===');
  // // 1
  // final receivePort = ReceivePort();

  // // 2
  // final isolate = await Isolate.spawn(
  //   playHideAndSeekTheLongVersion3,
  //   // 3
  //   receivePort.sendPort,
  // );

  // // 4
  // receivePort.listen((message) {
  //   print(message);
  //   // 5
  //   receivePort.close();
  //   isolate.kill();
  // });

  print('');
  print('=== Challenges ===');
  print('=== Challenge 1: Whose turn is it? ===');
  /*This is a fun oen and will test how well I understand how Dart handles async
    tasks. In what order will Dart print the text with teh following print statements?
    and Why?
    Being that sync code runs first and can't be interrupted I think I'll see
      1 Syncrhonous
      11 Synchronous -- not sure if this will run before all the Futures
    then
      3 synchronous
      2 event queue -- once this is returned to event queue, sync will run first
    then
      4 microtask queue
      5 microtask queue
    then
      7 event queue
      8 event queue
      10 microtask queue
      6 event queue
      9 event queue

  Now that being said, it might be in this other order if its more black and white
  meaning that
    ▪ first all sync code is processed
    ▪ second all future code is processed and items are placed in their respective
      queues waiting for sync to run
    
    1 synchronous
    11 synchronous
    4 microtask queue
    5 microtask queue
    10 microtask queue
    3 synchronous queue
    2 event queue
    7 event queue
    8 event queue
    6 event queue
    9 event queue

  Ok so I was off but closer on the second guess. My main points to remember are
    ▪ True that all sync code on main isolate runs first, so I saw 1,11 before any
      Futures
    ▪ With futures and microtask so close to each other, the microtasks ran first
    ▪ Even though the .then((value)=>print('3 synchronous')) was sync code, it
      was after a .then, meaning the Future had to run and return first, that's why
      I got 2 event before 3 sync
    ▪ 6 was delayed so it waited to the very end as 1 sec is a long time in computer time
    ▪ Since 8 was from another Future from then, it didn't hit until afer 9 and 
      the microtask connected to 9. 

    Makes sense! But yeah its pretty 🤯🤯🤯🤯🤯🤯
  */
  // print('1 syncrhonous');
  // Future(() => print('2 event queue')).then((value) => print('3 synchronous'));
  // Future.microtask(() => print('4 microtask queue'));
  // Future.microtask(() => print('5 microtask queue'));
  // Future.delayed(Duration(seconds: 1), () => print('6 event queue'));
  // Future(
  //   () => print('7 event queue'),
  // ).then((value) => Future(() => print('8 event queue')));
  // Future(
  //   () => print('9 event queue'),
  // ).then((value) => Future.microtask(() => print('10 microtask queue')));
  // print('11 synchronous');

  print('');

  print('=== Challenge 2: Care to take a make a comment? ===');
  /*The following link returns a JSON list of comments:

      https://jsonplaceholder.typicode.com/comments

    Create a Comment data class and convert the raw JSON to a Dart list
    of type List<Comment>
  */
  // try {
  //   // note in a try block I can re-use some of these vars 🤔🤓
  //   final url = 'https://jsonplaceholder.typicode.com/comments';
  //   final parsedUrl = Uri.parse(url);
  //   final response = await http.get(parsedUrl);
  //   final statusCode = response.statusCode;
  //   if (statusCode == 200) {
  //     final rawJsonString = response.body;
  //     List<dynamic> jsonList = jsonDecode(rawJsonString);
  //     List<Comment> myCommentList = [];
  //     for (var comment in jsonList) {
  //       myCommentList.add(Comment.fromJson(comment));
  //     }
  //     print('Original list from raw json: ${jsonList.runtimeType}');
  //     print('My list after conversion: ${myCommentList.runtimeType}');
  //     print('');
  //     print('The first 5 entries from my Dart List<Comment>:');
  //     print(myCommentList.take(5));
  //   } else {
  //     throw HttpException('$statusCode');
  //   }
  // } on SocketException catch (error) {
  //   print(error);
  // } on HttpException catch (error) {
  //   print(error);
  // } on FormatException catch (error) {
  //   print(error);
  // }
  print('');

  print('=== Challenge 3: Data Stream ===');
  /*Transform the stream from bytes to strings and see how many bytes each chunk
    is. Add error handling, and when the stream is finished, close the client. 
  */
  // try {
  //   final url = Uri.parse('https://raywenderlich.com');
  //   final client = http.Client();
  //   final request = http.Request('GET', url);
  //   final response = await client.send(request);
  //   final stream = response.stream;
  //   await for (var data in stream.transform(utf8.decoder)) {
  //     print('${data.length} bytes');
  //   }
  //   client.close();
  // } on Exception catch (error) {
  //   // very general, I should list out possible exceptions
  //   // for both streams as well as http request
  //   print(error);
  // } finally {
  //   print('All finished!');
  // }
  print('');

  print('=== Challenge 4: Fibonacci from afar ===');
  /*Repeat the challenge from Chapter 4 with nth Fibonacci, but run the code
    in a separate isolate. Pass the value of n to the new isolate as an argument
    and send the result back to the main isolate
  */
  final receivePort = ReceivePort();
  final isolate = await Isolate.spawn(fibonacciFromAfar, {'sendPort':receivePort.sendPort,'num':10});
  receivePort.listen((message) {
    print(message);
    receivePort.close();
    isolate.kill();
  });

  // // 1
  // final receivePort = ReceivePort();

  // // 2
  // final isolate = await Isolate.spawn(
  //   playHideAndSeekTheLongVersion3,
  //   // 3
  //   receivePort.sendPort,
  // );

  // // 4
  // receivePort.listen((message) {
  //   print(message);
  //   // 5
  //   receivePort.close();
  //   isolate.kill();
  // });

  print('');
}

// Challenge 4 Function
void fibonacciFromAfar(Map<String,dynamic> args) {
  /*
    Challenge 4 from Chapter 4: Fibonacci
    Calculate the nth fibonacci number. The fib sequence starts with 1,
    then 1 again, and then all subsequent numbers in the sequence are simply
    the previous two values added together.
  */
  int nthFib = args['num'];
  int a = 0;
  int b = 1;
  int res = 0;
  for (var i = 1; i < nthFib; i++) {
    res = a + b;
    a = b;
    b = res;
  }
  args['sendPort'].send(res);
}

/*Creating a Comment Class for challenge 2*/
class Comment {
  // I looked at the actual JSON structure at that link and got the required keys
  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  // I need to use a factory constructor as working with json will always require some
  // preprocessing that I won't want the end-user to deal with when creating the instance
  factory Comment.fromJson(Map<String, Object?> jsonMap) {
    // this is where all the magic of the factory works so what's returned is a Dart map
    return Comment(
      postId: jsonMap['postId'] as int,
      id: jsonMap['id'] as int,
      name: jsonMap['name'] as String,
      email: jsonMap['email'] as String,
      body: jsonMap['body'] as String,
    );
  }

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  String toString() {
    return 'postId: $postId\n'
        'id: $id\n'
        'name: $name\n'
        'email: $email\n'
        'body: $body';
  }
}

/*Creating a Data Class

  The web API I'm going to use will return some data about a todo list item. The
  data will be in json formaqt, so in order to convert that into a more usable
  dart object, I'll need to create a special class to hold the data
*/
class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, Object?> jsonMap) {
    return Todo(
      // remember the reason for a factory constructor is to be able to return
      // an already processed instance without showing its complexities
      userId: jsonMap['userId'] as int,
      id: jsonMap['id'] as int,
      title: jsonMap['title'] as String,
      completed: jsonMap['completed'] as bool,
    );
  }

  final int userId;
  final int id;
  final String title;
  final bool completed;

  @override
  String toString() {
    // note as I learned today 9/12/25, although dart is normally 2 spaced tab, I should
    // use 4 when continuing a linea vertically
    return 'userId: $userId\n'
        'id: $id\n'
        'title: $title\n'
        'completed: $completed';
  }
}

/*Making a GET request

  Now with the necessary imports I can add some code to the main 
  function above. Few new things here to note:
    ▪ The URL address for a server that provides an API that returns simple JSON
      for developers. I need to learn to work with APIs expertly. It's very similar
      to the type of API I would make as a backend client app.Uri.parse converts the
      raw URL string to a format that http.get will recognize

    ▪ I use http.get to make a GET request to the URL. I can change 'http'
      to 'pinkElephants if that's what i want to call it, just have to make 
      sure its the same name as what I put in the import statement. GET requests
      are the same kinds of request that browsers make whenever I type a URL in the
      address bar.

    ▪ Since it takes time to contact a server that may exist in another continent,
      http.get returns a Future. Dart passes off the work of contacting the remote
      server to the underlying platform, so I won't need to worry about it blocking
      my app while I wait. Remembering that Dart/Flutter being cross-platform (WORE)
      it can easily pass off the work to the platform its working on top of. Since
      I am using the 'await' keyword, the rest of the main method will be added to
      the event queue when the Future completes. If the Future completes with a value,
      the value will be an object of type Response, which includes information from
      the server

    ▪ HTTP defines various 3-digit status codes. A status code of 200 means OK -- 
      the request was successful and the server did what I asked it to. The common
      status code of 404, on the other hand, means the server couldn't find what I
      was asking for. If that happens I'll throw an HttpException

    ▪ The response body from this URL address includes a string in JSON format. I use
      jsonDecode from the dart:convert lib to convert the raw JSON string into a 
      Dart map

    ▪ Once I have a Dart map, I can pass it into the fromJson factory constructor
      of my Todo class/type that I wrote earlier which will process it and return
      an instance of Todo as I stipulated.

  Handling Errors:

  There are a few thing that could go wrong with this code above, so I'll need to
  be ready to handle any errors that come up. First, surround all the code inside
  the body with a try block. I can user either 'on...catch' or 'catch' or both. Using
  'on...catch' when I need to specify th exception type and using 'catch' when my 
  exception handler needs the exception object. 

  I can specify one or two params to 'catch'. The first is the actual exception
  thrown and the second is the stack trace (which is a StackTrace object)

    ▪ SocketException: I'll get this exception if there's no internet connection. 
      They http.get method is the one to throw the exception

    ▪ HttpException: I'm throwing this exception myself if the status code is 
      not 200 OK

    ▪ FormatException: jsonDecode throws this exception if the JSON string from
      the server isn't in proper JSON format. It would be unwise to blindly trust
      whatever the server gives me

      NOTE: It's good to be specific in my error catching. That way if a different
            kind of error comes up that I wasn't expecting, my app will fail with a 
            crash. Taht might sound bad, but it means I can fix the error right 
            away isntead of silently ignoring it as a generic 'catch' block would do.
  
*/

/*Streams:

  A Future represents a SINGLE value that will arrive int eh future. a Stream, 
  on the other hand, represents MULTIPLE values that will arrive in the future. 
  I can think of a stream like a LIST OF FUTURES. I can imagine a stream meandering
  through the woods as the autumn leaves fall onto the surface of the water. Each
  time a leaf floats by, it's like a value (Future) that a Dart stream provides. 

  Streaming music online as opposed to downloading the song before playing it is
  another good comparison. When I stream music, I get lots of little chunks of data, 
  but when I download the whole file, I only get a single value, which is the entire
  file -- a little like what a Future returns. In face, the http.get command I used 
  in the last section was actually implemented as a stream internally. However, Dart
  just waited until the stream finished and then returned all of the data at once
  in the form of a completed Future.

  Streams, which are of type/class Stream, are used extensively in Dart and Dart-based
  frameworks (Flutter). Here are some examples:
    ▪ Reading a large file stored locally where new data from the files comes in
      chunks

    ▪ Downloading a file from a remote server

    ▪ Listening for requests coming into a server

    ▪ Representing user events such as button clicks

    ▪ Relaying changes in app state to the UI

  While it's possible to build my own streams from scratch, most of the time I
  don't need to do that. I only need to be able to use the streams Dart or a Dart
  package provides, which is what this section is all about.

  Subscribing to a Stream

  The dart:io library contains a File class type which allows mw to read data from
  a file. First I'll read data the easy way using the readAsString method, which
  returns  the contents of the file as a Future (single value). Then I'll do it 
  again by reading the data as a Stream of bytes 

  Reading as a string

  After creating my text file, and adding some code in main above, here's what's new:
    ▪ File takes the relative path to my text file as an argument

    ▪ readAsString returns Future<String>, but by using await I'll receive the string
      itself when it's ready

  File also has a readAsStringSync method, which would run synchronously and avoid 
  awaiting a future. However, doing so would block my app if the reading takes a
  while. Many of the methods on File have synchronous versions, but in order to 
  prevent blocking my app, I should generally prefer the async versions

  Increasing the file size

  if the file is large, I can and probably should, read it as a stream. This will
  allow me to start processing the data  more quickly, since I don't have to wait
  to finish reading the entire file as I did in the last example.

  When I read a file as a stream, it reads the file in chunks. The size of the
  chunks depends on how Dart is implemented on the system I'm using, but it's
  probably 65,536 bytes per chunk as it was on local machines used when this book
  was written. The text.txt file I used previously isn't that big, so I'll create
  a new asset for this example. 

    NOTE: I used lipsum.com to generate some Lorem Ipsum totaling:
          1,500 paragraphs
          136,670 words
          919,620 bytes

  Reading from a Stream

  First I add some more code to main and then these additional points are noted:

    ▪ Instead of calling readAsString on file, this time I'm calling openRead,
      which returns an object of type Stream<list<int>>. That's a lot of angle 
      brackets, but Stream<List<int>> simply means that it's a stream that 
      periodically produces a list, and that list is a list of integers. 🤔

      The integers are the byte values (code points?), and the list is the
      chunk of data that's being passed in.

    ▪ To subscribe for notifications whenever there's new data coming in
      the stream, I call the listen method and pass it an anony function
      that takes a single parameter. The data parameter here is of type
      List<int>, so now I have access to the chunk of data coming in from
      the file.

    ▪ Since each integer in the list is one byte, calling data.length will
      tell me the number of bytes in the chunk.

        NOTE: By default, only a single object can listen to a stream. this is
              known as a single subscription stream. If I want more than one
              object to be notified of stream events, I need to create a 
              broadcast stream, which I would do like so:

                final broadcastStream = stream.asBroadcastStream();
  
  As thought, the data was all 65536-byte chunks until the final one, which was 
  smaller since it didn't quite fill up the 65,3356-byte buffer size.

  Using an asynchronous for loop

  Jus as I can use callbacks for async-await to get the value of a Future, there
  are also two way sto get the values of a Stream. In the example above, I used the
  listen callback method. But I can also use the asynchronous for loop

    await for(var data in stream){
      print(data.length);
    }
  
  The await for keywords cause the loop to pause until the next data event comes
  in. 

  Error Handling

  Like with Futures, stream events can also produce errors rather than returning
  a value. I can handle errors using a callback or a try-catch block

  Using a callback

  One way to handle errors is to use the onError callback. Couple points to note
  here
    ▪ When an error occurs, ti won't cancel the stream, and I'll continue to receive
      data events. If I actually did want to cancel the stream after an error, then
      listen also has a cancelOnError parameter which I would set to true

    ▪ When a stream finishes sending all of its data, it'll fire a done event. This
      gives me a chance to respond with an onDone callback. 

  Using Try-Catch

  The other way to handle errors on a stream with with a try-catch block in combo
  with async-await with same syntax as Futures
    ▪ I'm catching all exceptions. A more robust solution could check for specific
      errors like I did with the Future, such as FileSystemException, which would 
      be thrown if the file didn't exist, etc. 

  Cancelling a Stream

  As mentioned above, I may use the cancelOnError parameter to tell the stream to
  stop listening in the event of an error. However, even if there isn't an error,
  I should always cancel my subscription to a stream if I no longer need it. Its 
  like other languages that we need to close files after their use. This would mean
  that in other languages, files are just streams of data. Same concept
  sounds like. This allos Dart to clear up the memory the stream was using. Failing
  to do so can cause memory leaks. 
    ▪ Calling listen  returns a StreamSubscription, which is part of the dart:async
      library. Keeping a reference to that in the subscription variable allows me
      to cancel the subscription whenever I need to. In this case, I cancel it after
      the first data event

  Transforming a Stream

  Being able to transform a stream as the data is coming in is very powerful. In the
  examples above, I never did anything with the data except print the length of the 
  list of bytes. Those bytes represent text, though, so I'm going to want to transform
  the data from numbers to text. 

  I don't need as much data so I'll go back to the smaller lorem ipsum tile. 

  Decoding the bytes

  Next, I'll take the UTF-8 bytes and convert them to a string. 

  The difference here is that I added the transform method to the stream. This 
  method taks the input from the original stream, transforms it with a StreamTransformer
  and outputs a NEW stream, which I can listen to or loop over as before. In this case,
  the stream transformer was with dart:convert library's utf8.decoder, which takes 
  a list of bytes and converts them to a string
*/

/*Isolates

  Most of the time it's fine to run my own code synchronously, and for long-running I/O 
  tasks, I can use Dart libraries that return futures or streams. However I may 
  sometimes discover that my code is too computationally expensive and degrades the
  performance of my app.

  App Stopping Synchronous Code

  Counting to ten billion takes a while -- even for a computer! If I'm running something
  like this in a Flutter app, my app's UI will freeze until the function ends. 
*/
String playHideAndSeekTheVersion() {
  var counting = 0;
  for (var i = 1; i <= 10000000000; i++) {
    counting = i;
  }
  return '$counting! Ready or not, here I come!';
}

/*App stopping asynchronous code

  Making the function asynchronous doesn't fix the issue as I thought it might
*/
Future<String> playHideAndSeekTheLongVersion2() async {
  var counting = 0;
  await Future(() {
    for (var i = 1; i <= 10000000000; i++) {
      counting = i;
    }
  });
  return '$counting! Ready or not, here I come!';
}

/*Adding computationally intensive loop as an anony function in a Future constructor
  does indeed make ti a future. However, think about what's going on here. Dart simply
  puts that anony function at the end of the event queue. True, all the events before
  it will get to go first, but once that 10-billion-counter-loop gets to the end of
  the queue, it'll start running synchronously and block the app until it finishes.
  Using a future only delays the inevitable eventual block. 

  Spawning an Isolate

  When I'm used to using futures from the Dart I/O libraries, it's easy to get lulled
  into thinking that futures always fun in the background, but that's not the case. 
  If I want to run some computationally intensive code on another thread, then I'll
  need to create a new isolate to do that. 

  The term for creating an isolate in Dart is called SPAWNING. Since isolates don't
  share any memory with each other, they can only communicate by sending messages. 
  When I spawn a new isolate, I give it a message communication object called a
  SEND PORT. The new isolate uses the send port to send messages back to a RECEIVE
  PORT, which is listening on the main isolate. 

    Reminds me of Go an its goroutines with channels concept

  In this example the communication is only one way, but it's also possible to set
  up two-way communication between isolates. Just like in in languages like Go

  Using a send port to return results

  I need to import dart:isolate for this one.
*/
void playHideAndSeekTheLongVersion3(SendPort sendPort) {
  var counting = 0;
  for (var i = 1; i <= 10000000000; i++) {
    counting = i;
  }
  sendPort.send('$counting! Ready or not, here I come!');
  // Note I'm not returning anything since this sends and doesn't return.
  // Also it looks like an isolate is just a function??? 🤔🤔🤔
}

/*NOTE: It's a void function that takes a SendPort object as a parameter. SendPort
        is like one of those emergency mobile phones for kids where the phone can
        only call home. Home in this case is the main isolate. Instead of returning
        a string from function like I was doing before, this time I'm sending it as
        a message over the send port. Back to the main isolate, there will be a
        receive port listening for the message. 

  Spawning the isolate and listening for messages

  In the new code in my main method:

    1.I created a receive port to listen for messages from the new isolate

    2.Next, I spawned a new isolate and give it two arguments. The first 
      argument is the function that I want the isolate to execute. That function
      must be a top-level or static function. That function must also take a single parameter.
      The second argument of spawn will be passed as the argument to playHideAndSeekTheLongVersion3.

    3.The receivePort has a sendPort that belongs to it. This is the part where Mommy 
      gives Timmy the phone and says to call home if anything happens. The second 
      parameter of spawn isn't actually required to be a SendPort object, but how
      is Timmy going to call home without a phone? If I want to pass additional parameters
      to the function, I can make the second parameter a list or a map in which one of the
      elements is a SendPort and the other elements are additional arguments.

    4.Finally,receivePort.listen gets a callback whenever sendPort sends a message.
      This is where Mommy carries her phone with her wherever she goes, always waiting
      for a call from Timmy.

    5.In this example, the isolate is no longer needed after the work is done, so I can
      close the receive port and kill the isolate to free up the memory. This is where
      the Mommy-Timmy analogy fails. Mommy goes and saves Timmy before anythinhg bad
      happens

      NOTE: The Flutter framework has a highly simplified way to start a new isolate,
            perform some work, and then return the result using a function called 
            'compute'. I've seen that before, but didn't know what it was. Rather 
            than passing the function a send port, I jsut pass it any values that are
            needed. In this case, I could just pass it the number to count to:
              await compute(playHideAndSeekTheLongVersion,10000000000);

      NOTE: One other personal note. It would make sense that I'm finding so many
            like concepts between Dart isolates and Go goroutines as these are 
            both Google languages. Surely there is some overlap with just different
            nomenclature

  That's enough to get me started on working with isolates. As a word of advice,
  to myself, though, I shouldn't feel like I need to preoptimize everything I think 
  might be a computationally intensive task. Write my code as if it will all run
  on the main isolate. Only after I encounter performance problems, will I need
  to start thinking about moving some code to a separate isolate. 
*/

/*KEY POINTS

  ▪ Dart is single-threaded and handles asynchronous programming through
    concurrency, rather than through parallelism

  ▪ Concurrency refers to rescheduling tasks to run later on the same thread
    while parallelism refers to running tasks at the same time on different
    threads

  ▪ The way Dart implements the scheduling of asynchronous tasks is by using an
    event loop, which has an event queue and a microtask queue

  ▪ Synchronous code always runs first and cannot be interrupted. This is followed
    by anything in the microtask queue, and when tehse are completed, by any tasks
    in the event queue

  ▪ I may run Dart code on another thread only by spawning a new isolate

  ▪ Dart isolates do not share memory state and may only communicate through
    messages

  ▪ Using a future, which is of type/class Future, tells Dart that the requested
    task may be rescheduled on the event loop

  ▪ When a future completes, it will contain either the requested value or an error
    As I saw on the Flutter channel, its like a little box with either a value or
    an error inside. So the 3 states are

      ▪ Incompolete
      ▪ compolete with error
      ▪ complete with value

  ▪ A method that returns a future doesn't necessarily run on a different process
    or thread. That depends entirely on the implementation

  ▪ A stream, which is of type/class Stream, is a series of futures. Like a 
    List<Future> so-to-speak

  ▪ Using a stream enables me to handle data events as they happen rather than 
    waiting for them all to finish

  ▪ I can handle errors on futures and streams with callbacks or try-catch blocks.
    As I learned again on the flutter channel, the difference is mainly preference
    and readability. One (.listen) is more detailed and though not as readable, 
    its easier to pinpoint specifically what is going on at any part of the code
    and understand while the other (async/await) makes the code look more like
    synchronous code which can be easier to read with its use of try-catch blocks. 

*/
