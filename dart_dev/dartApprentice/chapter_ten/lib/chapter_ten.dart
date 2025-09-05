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
void main() {
  print('===Synchronous vs Asynchronous===');
  print('first');
  print('second');
  print('third');
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
  


  */
}
