/*
1.3 - THE FLUTTER FRAMEWORK

Flutter is the open-source framework made by Google for building natively compiled
applications for mobile, desktop, web and embedded systems with a single Dart codebase.
Using widgets, I can take control over EACH pixel on the screen to build beautiful and
performant user interfaces.

To get an overview of how flutter works and why its different from all the other cross-
platform frameworks, I'm going to make some comparisons between Android and iOS. Since
I want to keep this introduction simple, I'm only looking at mobile platforms BUT for
other platforms (such as Windows, macOS, or Linux) the logic is the same. let's start by
looking at how native applications generally work:

    NATIVE MACHINE CODE <==========> OEM WIDGETS <=====> CANVAS
    NATIVE MACHINE CODE <==========> BLUETOOTH, CAMERA, SENSORS

Native UI components, also known as OEM widgets, are standard system components used by
applications to paint content on the screen. Each platform defines its OWN OEM widgets
and expects them to be called  by specific languages, such as Kotlin for Android or 
Swift for iOS. There is no way to use Kotlin on iOS, for example, since the OS doesn't
support that language and its libraries.

Albeit very productive and efficient, it is impossible with this mechanism to use a single
language for multiple platforms. Some popular frameworks solve this problem by adding a
'translator' between the framework and the application.

    JAVASCRIPT  <==========> BRIDGE <============> OEM WIDGETS <======> CANVAS
    JAVASCRIPT  <==========> BRIDGE <============> BLUETOOTH, CAMERA, SENSORS
  
A 'bridge' is an abstraction layer between the application and the underlying operating
system:

  • The JavaScript code (for example) only interfaces with the bridge and knows nothing
    about the operating system. The bridge exposes APIs to communicate with the native
    platform and act as an intermediary.

  • The OS only interfaces with the bridge to send and receive calls. As such, the
    bridge must be implemented in various parogramming languages. There must be an
    Android specific and an iOS specific bridge to run on different platforms. These
    implementation details are hidden by the framework, and I don't care about them
    since I'll always write JS code only.

  • Since the bridge is built ad-hoc for a specific platform, it will also use platform
    specific OEM widgets. In practice, even if the JS code is the same for both Android
    and iOS, I won't get an identical, pixel-perfect UI on both platforms since the 
    bridge calls different (specific) OEM widgets.

We can see how a bridge is a sort of "real-time translator" betweeen JS and the underlying
platform. A high volume of method calls and serialization/deserializatino processes could
put a lot of "pressure" on the bridge and cause a bottleneck, which negatively impacts the
overall application performance.

Now, there are indeed strategies to avoid too much "traffic" on the bridge and keep our 
application responsive, but that's still something the developer has to deal with. The 
good news is that Flutter is COMPILED into native code, meaning that the application
"speaks" the exact language of the host platform, as I can see below:

    NATIVE MACHINE CODE <==========> CANVAS (note  there is no OEM Widget needed)
    NATIVE MACHINE CODE <==========> BLUETOOTH, CAMERA, SENSORS

Since the Dart compiler can produce native ARM code, there is no need for code translation.
The Flutter application directly communicates with the platform's native API. In addition, 
Flutter uses its own efficient rendering engine called 'Impeller' (or legacy Skia), which
controls each pixel of the screen. This leads to a few significant consequences:

  • As I see in above, OEM widgets are NOT required  since Flutter uses Impeller to paint
    pixels on the screen. Thanks to this architectural choice, Flutter is able to render
    ANYTHING it wants in a consistent way on ANY platform. For example, the same application
    made with Flutter looks identical (pixel-perfect) on Android and iOS (and all other 
    platforms as well).

  • No bridge is required since the Dart code is compiled into native machine code. The
    platform can directly "understand" Dart instructions without interpreters. Flutter
    ships with a copy of its small and efficient C++ engine (which includes Impeller).
    Without the need for a bridge, the runtime performance of the application is
    incredibly high (up to 120 FPS on high-end devices)

  • Flutter can still perform native API calls to the camera, sensors, Bluetooth, and much
    more. The engine provides hooks to the framework to make native calls in the underlying
    platform. We'll cover all of this in chapter 23 - "Platform interactions"

Flutter has a layered architecture that glues together the Dart source code, the C++ engine,
and the platform-specific implementation. Layers are independent, have no access to the 
level below, and are replaceable. From the OS point of view, a Flutter application is 
packaged in the same way as any other native application.

For mobile, desktop, and embedded operating systems, there ar two levels between Dart and
the host platform:

    FRAMEWORK     <=>  WIDGETS                 <=> LAYER 1
    (DART)        <=>  RENDERING               <=>
                  <=>  ANIMATIONS              <=> 
                  <=>  PAINTING ...            <=>
    
    ENGINE        <=>  PLATFORM CHANNELS       <=> LAYER 2
    (C/C++)       <=>  COMPOSITION             <=>
                  <=>  FRAME HANDLING          <=>
                  <=>  SYSTEM EVNETS ...       <=>
    
    EMBEDDER      <=>  NATIVE PLUGINES         <=> LAYER 3
    (NATIVE CODE) <=>  APP PACKAGING           <=>
                  <=>  THREAD SETUP            <=>
                  <=>  EVENT LOOP INTEROP ...  <=>

    ====================> OPERATING SYSTEM <=====================

The operating system treats a Flutter application as if it was a native application thanks to
the embedder, which is written in a platform-specific language. It's the glue that connects
the Flutter engine to the underlying OS. The currently available embedders are:

  • Android: written in C++ and Java;
  • iOS and macOS: written in Objective C++;
  • Windows and Linux: written in C++.

If I want a Flutter application to run in any other platform not listed above (like a 
PlayStation or a Nintendo Switch), I would need to create a new embedder for the target
platform. This may seem the same idea as a bridge, but here everything is AOT compiled
into native machine code so NOTHING is "translated" or "serialized" at runtime

  NOTE: Imagine that a Flutter  application was a plug, and I wanted to insert it
  in different kinds of sockets. In this case, the embedder would be an adapter with
  the same shape  for the plug but different configurations for the wall socket.

The Flutter C++ engine can be accessed in Dart using the dart:ui library 🤯 (I wasn't
aware of that), which basically contains the C++ code wrapped in Dart classes. This
isn't often a use-case since Flutter libraries provide more developer-friendly APIs
to create UIs.

We may also wonder at times why I haven't spoken about the web support yet. The reason
is that there are some special considerations to make. There are different layers for
a Flutter Web application:

    FRAMEWORK    <=>  WIDGETS       <=>  LAYER1
    (DART)       <=>  RENDERING     <=>  
                 <=>  ANIMATIONS    <=>
                 <=>  PAINTING ...  <=>

    BROWSER      <=>  HTML / CSS    <=>  LAYER2
    (JS / C++)   <=>  WASM          <=>
                 <=>  CANVAS        <=>
    ============> OPERATING SYSTEM <=============

The Flutter engine, written in C++, is designed to interact with an operating system
rather than a web browser. A different approach is therefore required to run Flutter
applications on the web.

Thanks to the Dart compilers capabilities, Flutter applications are compiled into
JavaScript code so the C++ engine is not required anymore. This means that Flutter
generates a reimplementation of the engine on top of browser APIs with two different
ways of rendering the contents:

  • HTML mode: The Flutter web application is rendered using HTML, CSS, and SVG
    (vectoral images)
  • CanvasKit mode: The Flutter web application is rendered using CanvasKit, which
    is built using web assembly (WASM) instruction format.

The HTML build mode produces smaller code sizes, while the CanvasKit mode is faster
and the graphic is more consistent with the native platforms.

When building a Flutter Web application for production, the Dart compiler bundles
together the Dart code and the Flutter framework into minified .js. It also performs
various optimization steps, such as tree shaking, which is a dead-code elimination
technique.

1.3.1 WHY FLUTTER USES DART

Prior to the massive wave of success that Flutter was (and currently is) surfing,
Dart was not a very popular language (its still only 30 in the Tiobe Index). Google
still decided to choose it, although it dien't have much attention, and it's been
the perfect guess for a few reasons:

  1. The OOP style. The vast majority of developers are familiar with OOP languages,
     so the learning curve of Dart will not be steep. Its syntax is also very similar
     to popular programming languages (it's nothing revolutionary or estoric)

  2. Dart is a very predictable and high-performant language that can guarantee the
     best runtime quality and the lowest chance of frame dropping. The compiler
     produces native code for both ARM and x64 platforms which is a HUGE advantage.

  3. Both Dart and Flutter are maintained by Google so the two teams can best 
     cooperate to fulfill each other's needs, evaluate solutions together and 
     better solve issues. The two can also evolve at their own pace and set (if
     needed) common goals.

As I already knew, Dart is a strongly typed language so the compiler is very severe
about types. This is an important layer of safety that enhances the developer's 
experience and reduces the risk of runtime errors. The language also has much more
to offer:

  • Tree shaking optimization, which basically is a dead code elimination strategy
    performed at compile-time;

  • Thanks to Dart's JIT compiler, Flutter has a blazing-fast hot reload feature
    for applications;

  • A package manager and the possibility to either play with Dart or Flutter code
    snippets using an online playground tool (DartPad);

  • DevTools is a rich suite of performance profiling tools with a powerful debugger.
    It is covered in Appendix - Section 1 "Working with DevTools".

Both Dart and Flutter are open-source projects, so anyone with a GitHub account can
contribute for free. Throughout the book, I'll cover as many Dart and Flutter 
features as possible to turn me into a guru.AND I WILL BECOME A GURU MASTER OF
DART AND FLUTTER

1.3.2 CREATING A "HELLO WORLD" PROJECT

To properly create a new Flutter application, we can either:

  • Use the console and choose amoung one of the follow commands:
    1. 'flutter create': creates a new Flutter project with a simple counter application;
    2. 'flutter create --template=skeleton': creates a new Flutter project with a more
       complex starter application having a theme changer and navigation 🤯🤯 (didn't know that either)

    This is the same advice I saw for new Dart projects. Even if I could use my own 
    project structure, its preferable to follow the recommended structure and adhere
    to the well-established standards for Flutter project creation by Google.

  • Use an IDE. The leading IDEs recommended are Android Studio (with the Flutter plugin)
    and Visual Studio Code (with the Flutter extension).

A Flutter project is nothing more than a traditional Dart project (as I saw earlier) with
some additional files and folders. the lib/ folder contains the source code, the test/ 
folder is for unit and widget testing, and the pubspec.yaml file is for the SDK constraints,
dependencies, and project-wide settings. Some Flutter-exclusive content that I won't find
in a Dart project are:

  1. the l10n.yaml file, which is used by the framework to internationalize my application;

  2. the assets/ folder, conventionally named this way, which contains static files to be
     be bundled in the application such as images, audio, or video files;

  3. the android/, ios/, web/, macos/, windows/ and linux/ folders contain platform-specific
     configuration required by Flutter when building for the desired platform.

In chapter 21 - "Creating and maintaining a Flutter app" I'll work with these files and 
folders. The 'main()' entry point is located in the main.dart file, along with some other
Flutter-specific initialization calls:

  import 'package:flutter/material.dart';
  void main(){
    runApp(const MyApp());
  }

The 'runApp()' function prepares the execution environment and ensures that it can be 
rendered on the screen. In chapter 10 - "Flutter, widgets and trees" I'll learn that
widgets are the basic building block of any and all Flutter applications and they can
be composed to build beautiful UIs. For example, when I run the application on Windows,
the MyApp widget produces our counter app result.

Running the application on Android, iOS, web or any other platform will produce the same
pixel perfect result. There is no way to cross-compile for any platform (for example, I 
can't build a macOS executible from Windows. From what I understand I can build Windows,
Android and web from Windows, or I can do mac, Android, iPhone and web from a mac)

So I've now made it to the end of the intro. Now it's time to deep dive into Dart.
*/
