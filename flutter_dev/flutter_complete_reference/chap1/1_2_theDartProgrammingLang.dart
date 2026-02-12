/*
1.2 -  THE DART PROGRAMMING LANGUAGE

Dart is a client-optimized, garbage  collected, OOP programming language for creating fast
apps that run on ANY platform. Its syntax and various constructs are very similar to those
found in the most popular languags today, such as Java and C#

The Dart language is particularly suited to client development, especially regarding high-
quality production quality across multiple web, desktop, and mobile platforms. Nevertheless
its also very efficient and production-ready for server-side projects (which is something
that I need to dive deeper into as well). The two most significant strengths of the
language are:

  • Type Safety: Dart uses stactic type checking to ensure that the type of a variable always
    matches the variable's static type. The language supports type inference as well so the
    compiler can assign the type to a variable according to its value

  • Sound Null Safety: By default, a variable in Dart can't be null unless we explicitly say
    it can. A 'sound' type system ensures that we can never get into a state where an 
    expression evaluates to something different from its static type. For exaample, a String
    can never be null because the type system is 'sound'. A String? instead (with the ? at 
    the end of the name) could either be a String or null at runtime.

A sound type system protects us from null-related exceptions, catches type errors at compile-
time, and allows the compiler to generate smaller and faster code. Along with the strong
typing approach, there is an impressive set of core libraries in Dart as well:

  • dart:core - core functionalities for any Dart program, such as built-in types and 
    collections.
  • dart:convert - encoders and decoders for JSON, UTF-8, and much more.
  • dart:io - filesystem management, HTTP and I/O handling for desktop, mobile and embedded
    platforms
  • dart:html - for web-based applications that have to interact with the browser and the
    dom.
  
*/
