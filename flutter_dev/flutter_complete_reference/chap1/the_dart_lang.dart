/*1.2 THE DART PROGRAMMING LANGUAGE 

  Dart is a client-optimized, garbage collected, OOP programming language for
  creating fast apps that run on ANY platform. Its syntax and the various constructs
  are very similar to those found in the most popular languages, such as Java, C#, Go
  etc.

  The Dart language is particular suited for client development, especially regarding
  high-quality production quality across multiple web, desktop, and mobile platforms.
  Nevertheless, it's also very efficient and production-ready for server-side projects.
  The two most significant strengths of the langage are:

    ▪ TYPE SAFETY: Dart uses static type checking to ensure that the type of a
      variable always matches the variable's static type. The language supports
      type inference so the compiler can assign the type to a variable according
      to its value.

    ▪ SOUND NULL SAFETY: By default, a variable in Dart can't be null unless I explicitly
      say it can. A 'sound' type system ensures that I can never get into a state where
      an expression evaluates to something different from its static type. For example,
      a String can never be null because the type system is sound. A String? instead 
      (with a ? at the end of the name) could either be a String or null at runtime.

  A sound type system protects me from null-related exceptions, catches type errors
  at compile-time, and allows the compiler to generate smaller and faster code. Along
  with the strong typing approach, there is an impressive set of core libs in Dart:

    ▪ dart:core - core functionalities for any Dart program, such as built-in types
      and collections

    ▪ dart:convert - encoders and decoders for JSON, UTF-8, and much much more.

    ▪ dart:io - filesystem management, HTTP and I/O handling for Desktop, mobile, 
      and embedded platforms

    ▪ dart:html - for web-based apps that have to interact with the browser and
      the DOM

    ▪ dart:isolate - allows the execution of concurrent tasks and multi-threading

    ▪ dart:async - adds support to asynchronous and reactive programming

    ▪ dart:math - standard mathematical functions and constants

    ▪ dart:collection - provides implemenations of hash maps, linked lists, queues
      andmuch more generic containers
    
    ▪ dart:mirrors - essential reflection support for Dart

    ▪ dart_ffi - allos Dart code to load and use navtive C APIs

  I can find any other library not por tof the SDK on pub.dev, the official package
  manager for Dart. It contains libraries from the Dart team, the Flutter team, and
  a myriad of other developers around the world. In chapter 20 - 'Creating and 
  maintaining a package' I'll see a complete example of how to publish a package to
  pub.dev. 

  Now the most straightforward Dart program I can think of:
*/
void main() {
  print('Hello Dart World!');
}

/*With the Dart SDK (or Flutter SDK) I can run this file (with a .dart) extension
  with dart run from the console. While quick and intuitive and really the way I
  typically do things as I learn a new language or platform, this process isn't
  the best for large projects. When I need to work on business projects and large
  apps, its recommended choosing one of the two most popular IDEs in the Dart and
  Flutter world:

    ▪ Android Studio, with the official Dart plugin

    ▪ Visual Studio Code, with the official Dart extension

  It's also worth mentioning that the Dart team created something called DartPad,
  an online editor I can use to run Dart code snippets on my browser. It has minimal
  set of functionalities because it's not meant to be a fully-fledged IDE solution;
  but more sort of a playground of sorts for Dart and Flutter, where I can quickly
  run small pieces of code. DartPad also integrates with github gists (which I have
  yet to try) for publicly sharing (or in my case sharing and saving with and for
  myself) NOTE: DartPad is actually written in Dart 🤓

  A Dart program can be written on any general purpose text editor and manually
  compiled with command line tools. However, this approach may be less productive
  than using a fully-fledged IDE. 

  PLATFORMS SUPPORT

  When my Dart source code needs to run on mobile or desktop platforms, the compiler
  bundles in the final executable a copy of the Dart VM runtim (with JIT compilation,
  if required). In release mode, it also includes AOT-compiled native code. To be more
  precise, here's what's being shipped when the application is compiled:

    ▪ While developing, I'm working in debug mode. The compiler bundles together the
      Dart VM with a JIT compiler, the debugging services, and metrics collection 
      tools. A JIT compiler is essential to enable the famous and loved hot-reload
      feature, which allows for real-time code recompilation

    ▪ When deploying my application, I'm working in release mode. The JIT compiler
      and all the other debugging services/tools are removed. A stripped-down version
      of the Dart VM is included along with the AOT-compiled (ARM or x64) native
      machine code

  The term 'AOT compilation' is an abbreviation for "Ahead-of-Time compilation", which
  indicates that act of translating a high-level programming language, like Dart, into
  native machine code. To summarize, the mobile or desktop binaries produced by Dart
  have the following contents:

    ▪ Debug Mode
      ▪ Dart VM runtim (with JIT compiler)
      ▪ Debugging services
      ▪ Metrics collection tools

    ▪ Release Mode
      ▪ Dart VM runtim (with native machine code)

  As I can see, the Dart runtime is always required because it is what executes
  the 3 essentials tasks:

    1.Managing isolates - An isolate is the place where all Dart code is run. The 
      main thread. I'll cover isolates in detail in chapter 8 -- "Futures, Streams and
      Isolates"

    2.Managing Memory - Dart has an efficient gargbage collector, automatically handled
      by the runtime, that manages the program's memory

    3.Managing Types - Albeit the majority of the type checks are static (meaning that
      they happen at compile-time), some are dynamic. For example, the runtime enforces
      dynamic checks and casts using special operators (is and as)

  Dart applications can be translated by the compiler into a fast, compact, and 
  deployable JS file. In other words, the Dart code is compiled into JS code which
  can be run in the browser.

    ▪ NOTE: Dart is a general-purpose languge used to create console applications
            or web servers that can run on any platform. If I want to make a cross-
            platform application with a UI and fancy animations, use flutter instead
            (which is a framework written in Dart)

  From the console, I can use dart run to execute my program in debug mode or dart
  compile exe to AOT-compile the code and create a standalone executable file. I 
  really don't understand why I didn't get on this train earlier. This is what I've
  been looking for and I think I said the same thing 2 years ago, but again, didn't
  stick with it. This time will be different.

  With dart compile js command I can run applications in the browser. In chapter 22
  Section 4 "Low HTML manipulation with dart:html" I'll see an example of how to 
  connect Dart and HTML on a web app.

  CREATING A "HELLO WORLD" PROJECT

  For a simple hello world application, a single Dart file is enough. for larget
  apps that I can also use in a production environment instead, I need a proper
  project structure with files and folders organized in the best way possible. Even
  if I'm free to set up the project as I wish, I should follow the Dart guidelines. 
  There are 2 recommended ways to set up a Dart project:

    1.Use the console and choose among one of the following commands:

      ▪ dart create: an alias of dart create -t console

      ▪ dart create -t console: creates the skeleton of a Dart command-line app
        (this is the default option)

      ▪ dart create -t package: creates the structure for the creation of a Dart
        package (more on this in chapter 20 - "Creating and maintaining a package")

      ▪ dart create -t server-shelf: creates the skeleton of a server application
        that uses 'shelf' (more on this in chapter 22 - "HTTP servers and low-level
        HTML")

      ▪ dart create -t web: creates a web application with an index.html page that I
        can run ina web browser (more on this in chapter 22 - section 4)

    In this section I'm going to create a hello world proeject with dart create -t console-
    full hello_world. This command will generate a Dart project with the recommended files
    and folder structure

    2.Use and IDE. As I've already seen, the two leading IDE's are Android Studio and
      VS Code, both with their respective Dart plugins/extensions

  Under the hood, the IDE invokes the console commands for me anyway, so the final
  result in both cases is the same. I'll be using VS Code. In either case I'll
  find the following content:

    ▪ the pubspec.yaml file is probably the most important of all. It defines the 
      project name, the version, which SDK version are supported, which packages the 
      application depends on, and much more.

    ▪ the changelog.md file should constantly be updated to the latest project version
      with a brief summary of the changs or features introduced over time

    ▪ the README.md file generally contains a description of my package, usage information
      and minor code examples

    ▪ the analysis_options.yaml file is used to define additional static analysis rules
      to improve the code quality

    ▪ the test/ folder, as the name suggests, contains Dart tests to ensure the application
      works as expected

    ▪ the lib/ folder contains the public Dart code that can also be shared by other
      packages. All of my .dart files go here

    ▪ the bin/ folder contians the public tools, scripts and executables of a project.
      One command line applications, this file (by convention) includes the main()
      entry point

  For now I'll create my hello_world project and update it accordingly
*/

/*THE FLUTTER FRAMEWORK

  Flutter is an open-source framework made by Google for building natively compiled 
  applications for mobile, desktop, web, and embedded systems with a single Dart 
  codebase. using widgets, I can take control over each pixel on a screen to
  build beautiful and performant user interfaces.

  To get an overview of how Flutter works and why it is different from ALL the 
  other cross-platform frameworks, I'm going to see some comparisons between
  Android and iOS. Since I want to keep this introduction simple, I'll only be
  looking at mobile platforms but for other platforms (such as Windows, macOS 
  or linux) the logic is the same. I'll start by looking at how native applications
  generally work:

    Native code ==> Android/iOS (OEM widgets, Canvas, Bluetooth, camera, sensors, etc)

    ▪ Native UI components, also known as OEM widgets, are standard system components
      used by apps to  paint contents on the screen
    ▪ Each platform defines its own OEM widgets and expects them to be called by 
      specific languages, such as Kotlin for Android or Swift for iOS.
    ▪ There is no way to use Kotlin for iOS, for example, because the os doesn't
      support that language or its libs

  Albeit very productive and efficient, it is impossible with this mechanism
  to use a single language for multiple platforms. Some popular frameworks solve
  this problem by adding a 'translator' between the framework and the application

    JavaScript ==> BRIDGE ==> Android/iOS (OEM widgets,Canvas,Bluetooth,camera,sensors,etc)

  A bridge is an abstraction layer between the application and the underlying operating
  system.

    ▪ The JS code only interfaces with the bridge and knows nothing about the operating
      system. The bridge exposes APIs to communicate with the native platform and acts
      as an intermediary

    ▪ The os only interfaces with the bridge to send and receive calls. As such, the
      bridge must be implemented in various programming languages. For example, there
      must be an Android-specific and iOS specific bridge to run on different platforms.
      These implementation details are hidden by the framework, and I don't care about
      them because I'll always just write JS code

    ▪ Since the bridge is built ad-hoc for a specific platform, it will also use platform
      specific OEM widgets. In practice, even if the JS code is the same for both iOS
      and Android, I won't get an identical, pixel-perfect UI on both platforms because
      the bridge calls different (specific) OEM widgets
  
  I can see how a BRIDGE is a sort of "real-time translator" between JS and the underlying
  platform. A high volume of method calls and serialization/deserialization processes
  could put a lot of 'pressure' on the bridge and cause a bottleneck, which negatively
  impacts the overall application performance as well. 

  There indeed are strategies to avoid too much "traffic" on the bridge and keep the
  application responsive, but that's still something the developer has to deal with. 
  The good news is that Flutter adopts an entirely different approach where NO bridges
  or intermediary layers are needed. Flutter is compiled into native code, meaning
  that the app "speaks" the exact same language of the host platform.

    Native code ==> Android/iOS (Canvas, Bluetooth, camera, sensors, ...) 

  Since the Dart compiler can produce native ARM code there is no need for transaltion.
  The flutter application directly communicates with the platform's native APIs. In 
  addition, Flutter uses it own very efficient rendering engine called IMPELLER, which
  controls each pixel on the screen. This leads to a few significant consequences:

    ▪ As can be seen above, OEM widgets are NOT required because Flutter uses impellerr
      to paint pixels on the screen. Thanks to this architecture choice, Flutter is 
      able to render anything it wants in a consistent say on any platform. For example,
      the same application made with Flutter looks identical (pixel-perfect) on Android
      and iOS (and all the other platforms).

    ▪ No bridge is required becasue the Dart code is compiled into native machine code
      The platform can directly "understand" Dart instructions without interpreters.
      Flutter ships with a copy of its small and efficient c++ engine (which includes
      impeller). without the need for a bridge, the runtime performance of the applications
      is incredibly hight (up to 120 fps on high-end devices)

    ▪ Flutter can still perform native API calls to the camera, sensors, Bluetooth, and
      much more. The engine provides hooks to the framework to make native calls in
      the underlying platform. That'll be covered more in chapter 23 - "Platform 
      interactions".

  flutter has a layered architecture that glues together the Dart source code, the c++
  engine, and the platform-specific implementation. Layers are independent, have no
  access to the level below, and are replaceable. from the os point of view, a Flutter
  application is packaged in the same way as any other native application 🤯🤓

  For mobile, desktop, and embedded operating systems, there are two levels between
  Dart  and the host platform:

    ▪ Layer 1 == Framework (Dart) == Widgets, Rendering, Animations, Painting, etc

    ▪ Layer 2 == Engine (c/c++) == Platform channels, Composition, Frame Handler,
      System events, etc

    ▪ Layer 3 == Embedder (Native Code) == Native Plugins, App Packaging, Thread Setup,
      Event Loop Interop, etc

    ▪ Operator System

  The operating system treats a Flutter application as if it was a native application 
  thanks to the embedder, which is written in platform specific language. Its the glue
  that connects Flutter engine to the underlying operating system. This means knowing
  c++, and in some cases Objective C++, and Java would allow me to hack on the embedders
  as well if needed.

    ▪ Android: writen in C++ and Java

    ▪ IOS and macOS: written in Objective C++

    ▪ Windows and Linux: written in C++

  If I wanted a Flutter application to run in any other platform not listed above
  (like playstation or nintendo switch), I would need to create a new embedder for
  the target platform. Thsi may seem to be the same idea as a bridge, but here 
  everything is AOT compiled into native machine code so nothing is "translated" or
  "serialized" at runtime. That =s performance.

    ▪ NOTE: I can imagine that a Flutter application is a plug, and I want to insert
            it into different kinds of wall sockets. In this case, the embedder 
            would be the adapter with the same shape for the plug but different 
            configurations for the wall socket. 

  The Flutter c++ engine can be accessed in Dart using the dart:ui library, which 
  basically contains c++ code wrapped in dart classes/types. This isn't often the 
  case since Flutter libraries provide a more dev-friendly API to create UIs.

  So now I wonder why I haven't seen anything about web support yet. The is that 
  there are some special considerations to make with web. There are different layers
  for a Flutter web application

    ▪ Layer 1 == Framwork (Dart) == Widgets,Rendering,Animations,Painting,etc

    ▪ Layer 2 == Browser (JS & C++) == HTML/CSS,WASM,Canvas,etc

    ▪ Operating System

  The Flutter engine, writen in c++, is designed to interact with an operating system
  rather than a web browser. A different approach is therefore required to run Flutter
  applications on the web

  Thanks to Dart's own compiler capabilities, Flutter applications are compiled directly
  to JS code so the c++ engine is not required anymore. This means that Flutter generates
  a reimplementation of the engine on top of browser APIs with two different ways of 
  rendering the content:

    ▪ HTML mode: The flutter web application is rendered using HTML, CSS, a canvas, and
      SVG (vectorial images)

    ▪ CanvasKit mode: The flutter web application is rendered using CanvasKit, which is
      built using the Web Assembly (WASM) instruction format

  The HTML build mode produces smaller code sizes, the CanvasKit mode is faster and the
  graphics are more consistent with native applications

  When building a Flutter web application for production, the Dart compiler bundles 
  together the Dart code and the Flutter framework into a minified .js file. It also
  performs various optimzation steps, such as tree shaking, which is a dead-code
  elimination technique.
*/


/*WHY FLUTTER USES DART

  
*/
