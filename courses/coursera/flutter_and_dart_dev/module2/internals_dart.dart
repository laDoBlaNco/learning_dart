/*
Exploring Dart Language

Dart provides the language for building across platforms. In this module,
I'll gain insights into Dart, how it works, and how to use Dart libraries. 
Additionally, I'll also learn how to use Dart command line and utilities.
Finally, I'll edit and perform a simple debug using Dart.

Dart
  ▪ Primarily used with the flutter framework
  ▪ Powerful tool for developing cross-platform applications

Dart Virtual Machin (vm)
  ▪ Designed to run code quickly and efficiently
  ▪ Dart code involves two phases:
    ▪ Compile time
    ▪ Runtime
  ▪ Enables efficient development and high-performance execution

Just-In-Time (JIT) and Ahead-Of-Time (AOT) compilation
  ▪ JIT happens while the program is running
    ▪ JIT shows changes without restarting the app (enables hot-reload)
  ▪ AOT happens before running the program

Garbage Collection
  ▪ Manages memory with two strategies:
    ▪ Young generation
      ▪ Objects that are temporary and collected more frequently
      ▪ Example of chat app: Young generation objects might be read
        messages as they can be collected once read
    ▪ Old generation
      ▪ Objects that are used for longer periods of time and thus collected
        less frequently.
      ▪ Example of chat app: Old generation objects might be contacts in a 
        contact list since they will be around for much longer.

Concurrency using Isolates and Async programming
  ▪ Isolates run at the same time without sharing memory (kinda like workers
    or maybe goroutines 🤔🤔)
    ▪ They communicate by sending messages to each other (like channels in 
      goroutines)
  ▪ Async programming uses 'async' and 'await' to keep code running
    ▪ Code doesn't stop running while something else is waiting to finish
    ▪ Example: Loading data from the internet in the background or reading
      large files

Core Libraries
  ▪ dart:core
    ▪ included automatically
    ▪ provides built-in functions and classes such as numbers, strings and lists
  ▪ dart:async
    ▪ helps with asynchronous programming
    ▪ includes classes such as Future and Stream
  ▪ dart:io
    ▪ handles input and output
    ▪ such as reading and writing files or connecting to the internet
  ▪ dart:convert
    ▪ helps with converting data
    ▪ such as converting json into dart objects and vice versa
  ▪ dart:math
    ▪ provides mathematical functions and constants for complex calculations 

Recap:
  ▪ Dart VM runs code using compile time and runtime
  ▪ Just-in-time (JIT) compilation translates code while the machine is 
    running enabling things like hot-reload
  ▪ Ahead-of-time (AOT) compilation translates code before the program is
    running which helps with start-up times
  ▪ Garbage collection manages memory and young and old generation objects
  ▪ dart achieves concurrency with Isolates and Async programming
  ▪ dart's core libraries offer many useful functions and libraries such as
    dart:core, dart:io, dart:async, dart:math, and dart:convert

*/
