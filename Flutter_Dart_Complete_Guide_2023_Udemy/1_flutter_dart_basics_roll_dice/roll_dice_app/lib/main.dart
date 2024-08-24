import 'package:flutter/material.dart';

import 'package:roll_dice_app/gradient_container.dart';

// This is our main function which is the entry point of every flutter or dart app
// We don't have to call main because in Dart it will be run automatically once
// compiled and executed as the entry point to our program.
void main() {
// This is the key functions  are in all flutter apps.
//The runApp function.
// this function is provided by flutter. Flutter uis are built with widgets or a widget
// tree. We combine widgets by nesting them into each othe which is what gives us
// our widget tree with is parents and children. Flutter comes with its own built-in
// widgets but we can also create our own custom widgets, which will do a lot in this
// course.
  runApp(
    const MaterialApp(
      home: Scaffold(body: GradientContainer()),
    ),
  );
}





// const is a keyword that means constants and helps dart optimize the runtime
// performance of the application. Marked as const it'll be stored internally
// on the device memory and will always be reused instead of recreation of 
// or duplication of values. This is why vscode says it'll improve performance
// and memory efficiency. There's no need to use it in front of every constructor
// if you have them nested in each other. 

// Another widget that will help us in the base structure of our apps and that's
// 'scaffold'.

// UNDERSTANDING TYPES
// Dart is a 'type-safe' language. All values are of certain types and typically
// more than one
//  - 'hello world' - String & Object (sub-classes and super-classes) 
//  - 29 - int & num & Object
//  - MaterialApp - MaterialApp & Widget & Object 
// Types can also be created by us (custom) which is done implicitly and we'll
// see a little bit later. 

// Widgets are just objects in the end and objects are the base value in
// dart. All values in dart are objects and objects are Data Structures in Memory

// Now we are seeing List<valueType>. This means that the argument or type should
// be a list of specifically typed elements. This is also our first example of
// generic type syntax. Generic types are flexible types that work together with
// other types. So here we can have lists of different things. so the type is
// List full of <Color> objects

// What is a Class? Objects are a key concept in Dart and classes are closely
// related. Dart is an OOP language. 
//  - Primitive Values - Text, Numbers, etc
//  - More complex Values - Widgets, Gradient Config, etc - these more complex
//    values are helped created with classes as they are blueprints for the
//    complexity. 
//  - Objects are just data structures and the data they hold are
//    - variables or properties
//    - methods/functions
//  - Objects really just help organizing data & separating logic. With classes
//    we decide what data is contained in said object or how its organized. 
//  - So we work with the classes and the blueprints to create our objects when
//    the application is loaded on our device. Most of the Functions() we use above
//    are class constructors. 

/// UNDERSTANDING VARIABLES
/// Variables are data containers. Especially helps when we have configurations
///  we want to change without having to go look through our code for them.
/// Example:
/// var greetingText = "Hello World!";
/// (var declaration) (= assignment operator) (Value (text/string) 
/// Also good to note that variables also have types. If you use the 'var' 
/// keyword as above then we rely on dart to infer the type by checking to 
/// see what we initialized it with. If we don't initialize it as in:
/// var greetingText;
/// Then the type will be 'dynamic' and that's dangerous and leads to bugs
/// so its better we don't do that. We can also assign the type without initializing
/// the var by putting the type instead of the 'var'
/// String greetingText;  -- This would also error though becasue of null safety.
/// String? greetingText; -- this would compile as we are saying that we will assign
/// a string here eventually, but for now it could be null.
/// 
/// We also at times have vars that never change. For this we use 'const' and 'final'
/// If we know we will never change the value its better to set it to 'final'. This
/// not only tells dart that we will never change this var, but it also protects 
/// against unwanted changes down the line, so its a protection. We can also
/// use 'const' which tells dart that the value is locked in and a compile-time
/// value. 

