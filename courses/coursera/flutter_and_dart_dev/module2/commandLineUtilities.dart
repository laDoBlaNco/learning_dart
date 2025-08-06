/*
Module 2: Command Line and Utilities

Introduction:

Situation - Need to automate tasks, run tests, and manage dependencies
Solution - leveraging command line and various utilities in dart
  ▪ Essential for effective dart development
  ▪ helps streamline workflow for:
    ▪ scripting
    ▪ testing
    ▪ dependency management

Dart command line tools:
  ▪ Dart SDK
  ▪ Dart command
  ▪ Pub tool
  ▪ Dart devtool

Dart SDK
  ▪ Development toolchain
    ▪ fast incremental compilation
    ▪ stateful hot reload
  ▪ Production toolchain
    ▪ fastest native output
    ▪ smallest runtime
  ▪ Collection of tools and libraries
  ▪ Includes
    ▪ Dart VM
    ▪ Dart core libraries
    ▪ Dart command line tools

Dart Command
  ▪ running dart programs
  ▪ managing packages
  ▪ performing development tasks
  ▪ Common dart commands:
    ▪ dart run - run dart scripts/programs
    ▪ dart analyze - check my code for errors, warnings, and potential issues
    ▪ dart test - ensure code works as expected
    ▪ dart format  - automatically formats the code based on the standard dart style guide
    ▪ dart create - generate new dart projects with standard structure
    ▪ dart compile - compile dart to various formats
    ▪ dart devtools - open devtools (optionally connecting to an existing app)
    ▪ dart doc - generate API documentation for dart projects
    ▪ dart fix - apply automated fixes to dart source code
    ▪ dart info - show diagnostic information about the installed tooling
    ▪ dart pub - work with packages

Pub Tool - Dart's package manager
  ▪ manage dependencies
  ▪ publish packages
  ▪ Command Commands:
    ▪ dart pub add - add new dependiencies to the project 🤯 now you tell me?
    ▪ dart pub get - installs all dependencies listed in the pubspec.yaml file
    ▪ dart pub upgrade - update dependencies to the latest compatible versions
    ▪ dart pub publish - publish your packages to the dart package repository

Dart DevTools - suite of performance and debugging tools
  ▪ relevant for dart and flutter applications
  ▪ provides a web-based interface
  ▪ helps analyze and optimize code
    ▪ performance profiling
      ▪ monitor application performance real-time
      ▪ identify bottlenecks
      ▪ optimize code
      ▪ provides detailed insights into CPU and memory usage
      ▪ help identify areas that need improvement
    ▪ memory analysis
      ▪ inspect memory usage
      ▪ help detect memory leaks
      ▪ optimize memory consumption
      ▪ track allocations
      ▪ analyze memory graphs
      ▪ take snapshots to compare memory states
    ▪ widget inspector
      ▪ offers a visual representation of the widget tree
      ▪ simplifies the process of understanding and debugging UI

Third-party tools
  ▪ Shell-scripting
    ▪ enhance productivity
    ▪ automates repetive tasks by writing shell scripts
  ▪ makefiles
    ▪ automate tasks
    ▪ allows defining rules to build and manage project
  ▪ continuous integration (CI)
    ▪ incorporated in development workflow
    ▪ ensures code is always in a deployable state
*/

/*

Recap:
  ▪ dart provides several essential command line tools
  ▪ dart sdk is a collection of tools and libraries for developing dart apps
  ▪ dart command is a versatile tool for running dart programs, managing
    packages, and performing various development tasks
  ▪ pub tool is dart's package manager, which helps to manage dependencies and
    publish packages
  ▪ dart devtools is a suite of performance and debugging tools for dart and flutter
    applications
  ▪ Other third-party tools that work well with Dart include shell-scripting, makefiles,
    and CI

 */