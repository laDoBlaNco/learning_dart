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

  
*/
