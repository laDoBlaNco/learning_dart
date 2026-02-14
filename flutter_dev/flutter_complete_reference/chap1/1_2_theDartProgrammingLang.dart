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
    collections;
  • dart:convert - encoders and decoders for JSON, UTF-8, and much more;
  • dart:io - filesystem management, HTTP and I/O handling for desktop, mobile and embedded
    platforms;
  • dart:html - for web-based applications that have to interact with the browser and the
    dom;
  • dart:isolate - allows the execution of concurrent tasks;
  • dart:async - adds support   to asynchronous and reactive programming;
  • dart:math - standard mathematical functions and constants;
  • dart:collection - provides implementations of hash maps, linked lists, queues, and
    much much more generic containers;
  • dart:mirrors - essential for reflection support for Dart;
  • dart_ffi - allows Dart code to load and use native C apis

We can find any other library not part of the SDK at https://pub.dev, the official package
manager for Dart. it contains libraries from the Dart team, the Flutter team, and a myriad
of other developers around the world. When we get to chapter 20 - "Creating and maintaining
a package" we'll see a complete example of how to publish a package at pub.dev. Below is
the  most straightforward Dart program we can start with:
*/
void main() {
  print('Hello World!');
}

/*
Once we download the latest Dart SDK, we can save the code in a file with the extension
'.dart' and run the program with 'dart run' (or through vscode) from the console. While
quick and intuitive, this process is not the best for large projects. When we need to 
work on business projects and large applications, we'll choose one of the two most popular
IDEs from the Dart and Flutter world:

  • Android Studio, with the official Dart plugin
  • Visual Studio Code, with the official Dart extension

It's also worth mentioning that the Dart team also create DartPad, an online editor (which
I've used before) that we can use to run Dart code snippets on the browser. It has minimal
functionalities since it's not meant to be a fully-fledged IDE; it simply is a sort of
'playground' code editor for Dart and Flutter where we can quickly run small pieces of
code. DartPad also integrates with GitHub gists to publicly share our Dart code. On a side
note, if we check the DartPad source code we'll see that it is written in Dart itself.

A Dart program can be written on any general-purpose text editor and manually compiled 
with command line tools. However, this approach may be less productive than using a 
fully-fledged IDE, as recommended above.

1.2.1 - PLATFORMS SUPPORT

When our Dart source code needs to run on mobile or desktop platforms, the computer
bundles in the final executable a copy of the Dart VM runtim (with JIT compilation,
if required). In release mode, it also includes AOT-compiled native code. to be more
precise, here's what is being shipped when the application gets compiled:

  • While developing, we're in 'debug' mode. The compiler bundles together the Dart
    VM with a JIT compiler, the debugging services, and metrics collection tools.
    A JIT compiler is essential to enable the 'hot-reload' feature, which allows for 
    real-time code recompilation.

  • When deploying our application, we're working in 'release' mode. The JIT compiler
    and all the other debugging services/tools are removed. A stripped-down version 
    of the DART VM is included along with the AOT-compiled (ARM or x64) native 
    machine code.

The term "AOT compilation" is an abbreviation for "Ahead-Of-Time compilation", which
indicates the act of translating a high-level programming language , like Dart, into
native machine code. To summarize, the mobile or desktop binaries produced by Dart
have these contents:

  • Debug Mode:
    • Dart VM runtime (with JIT)
    • Debugging services
    • Metrics collection tools

  • Release Mode:
    • Dart VM runtime (with native machine code)

As we an note, the Dart runtim is ALWAYS required since it executes three essential
tasks:

  1.Managing Isolates - An isolate is the place where all Dart code is run. We'll cover
    isolates in detail in chapter 8 - "Futures, Streams and Isolates"
  2.Managing Memory - Dart has an efficient gc, automatically handled by the runtim, 
    that manages the program's memory.
  3.Managing Types - Albeit the majority of the type checks are static (meaning that
    they happen at compile-time), some are dynamic. For example, the runtime enforces
    dynamic checks and casts using special operators (is and as).

Dart applications can be translated by the compiler into a fast, compact, and deployable
JavaScript file as well. In other words, the Dart code is compiled into JS code which
can be run in a browser.

  NOTE: Dart is a general-purpose language used to create console applications as
        well as web servers that can run on any platform. If we want to make a 
        cross-platform application with a UI and fancy animations, we use Flutter
        instead (which is a framework written in Dart).

From the console, we can use 'dart run' to execute our program in debug mode or
'dart compile exe' to AOT-compile the code and create a standalone executable file.
We use 'dart compile js' to run applications on a browser. In chapter 22 - Section 4
"Low-level HTML manipulation with dart:html" we will see an example of how to connect
Dart and HTML on a web application.

1.2.2 - CREATING A "HELLO WORLD" PROJECT

For simple "hello world" application, a single Dart file is enough. For larger apps
that we can also use in a production environment instead, we need a proper project
structure with files and folders organized in the best way possible. Even if we're
free to set up the project as we wish, its encouraged that we follow Dart's guidelines.
There are two recommended ways to create a new Dart project:

  1.Use the console and choose among one of the following commands:

    1.'dart create': an alias of 'dart create -t console';
    2.'darte create -t console': creates the skeleton of a Dart command-line app (this
      is the default option);
    3.'dart create -t package': creates the stucture for the creation of a Dart
      package (more on that in chapter 20 - "Creating and maintaining a package");
    4.'dart create -t server-shelf': creates the skeleton of a server application that
      uses 'shelf' (more on that in chapter 22 - "HTTP servers and low-level HTML");
    5.'dart create -t web': creates a web application with an 'index.html' page that
      we can run in a web browser (more on that that as well in chapter 22 - Section 4
      "Low-level HTML manipulation with dart:html").

    In this section, we're going to create a hello world project with 'dart create -t 
    console-full hello_world'. This command generates a Dart project with the recommended
    files and folder structure

  2.Use an IDE. As we've already mentioned, the two leading IDEs are Androi Studio (
    with the Dart plugin) and Visual Studio Code (with the Dart extension).

Under the hood, the IDE just invokes the same console commands for us anyways, so the
final result in both cases is the same. In this book we use Android Studio, while
I'll be using VSCode. No matter the project, we'll always find the following 
content:

  1.  the 'pubspec.yaml' file is probably the most important of all. It defines
      the project name, the version, which SDK versions are supported, which
      packages the application depends on, and much more;
  2.  the 'CHANGELOG.md' file should constantly be updated to the latest project
      version with a brief summary of the changes or features introduced over time;
  3.  the 'README.md' file generally contains a description of our package, usage
      information, and minor code examples;
  4.  the 'analysis_options.yaml' file is used to define additional static analysis
      rules to improve the code quality;
  5.  the 'test/' folder, as the name suggests, contains Dart tests to ensure that
      the application works as expected;
  6.  the 'lib/' folder contains the public Dart code that can also be shared by
      other packages. All of our .dart files go here;
  7.  the 'bin/' folder contains public tools, scripts, and executables of a
      project. On command line applications, this folder (by convention) includes
      the 'main()' entry point.

  In chapter 20 - "Creating and maintaining packages" we'll cover all the above
  contents. For now though, let's just change the contents of 'lib/hello_world.dart
  with the actual "Hello world!" message we want to display. 

  Then in 'bin/hello_world.dart' we add the entry point code.

  Now we simply need to hit 'run' in the ide or call 'dart run' command in case we 
  are using the console. To create the executable, we use 'dart compile exe bin/hello_world.dart'
  Now let's move on to see a little about Flutter.
*/

