/*
Module 3 - Routing in Flutter

Routing:
  ▪ Defines the best navigation between screens
  ▪ Guides users through the app's features intuitively

What are routes?
  ▪ Each screen is a route stop
  ▪ Typically instances of CupertinePageRoute (iOS) or MaterialPageRoute (android)
    classes

Navigator class:
  ▪ Manages routes and transitions
  ▪ Follows stack principles to manage routes
  ▪ To go to a new screen: Push a new route, like adding a book to a stack of books
  ▪ To go to previous screen: Remove (pop) a route

Two methods for defining routes:
  ▪ Named routes
    ▪ Provide a centralized and structured navigation approach
    ▪ Serve as unique identifiers
    ▪ Offer better code readability and simplified navigation
    ▪ Use strings to define routes
    ▪ Code example:

      void main(){
        runApp(MaterialApp(
          initialRoute: '/',  // seems like routing on a webpage
          routes: {
            '/' : (context)=>HomeScreen(),
            '/second' : (context) => SecondScreen(),
          },
        ));
      }

      Navigate to the second screen
      Navigator.pushNamed(context,'/second');

  ▪ Direct Routes
    ▪ Passes the route directly to the Navigator
    ▪ Code Example:
      // Navigate to the second screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SecondScreen());
      );

Passing data between screens
  ▪ Use Navigator.push and Navigator.pushNamed
    ▪ Allow passing of information between screens
    ▪ Enable real-time interactions in my app

Examples of routing
  ▪ screen navigation - adds a new route or screen to the stack
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewScreen()),
    );

  ▪ Data retrieval - returns data to a previous screen
    final result = await
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FormScreen()),
    );

  ▪ Named Routes - like web routes
    Navigator.pushNamed(context, '/second');

Routing facilitates 
  ▪ Deep Linking -  diretly users to specific screens in my app
  ▪ Removal of Screens and navigating back to the previous
    Navigator.pop(context);

  ▪ Screen replacement
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NewScreen()),
    );

  ▪ Nested navigation
    ▪ Facilitates independent navigation for different seconds 
    ▪ A bottom navigator for example allows users to navigate to specific tabs
      without impacting overall navigation

  ▪ Conditional Navigation - based on conditoins such as:
    ▪ User authentication status
    ▪ App status()
    ▪ Customer preferences
*/


/*
// Use in dartpad.dev
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondScreen()),
            );
          },
          child: Text('Go go Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text('Go back to First Screen'),
        ),
      ),
    );
  }
}
*/

/*
Data Pushing example in dartpad.dev

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstScreen());
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    SecondScreen(data: 'Hello from First Screen'),
              ),
            );
          },
          child: Text('Go to Second Screen'),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String data;

  SecondScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(child: Text(data)),
    );
  }
}



*/

/*

Recap:

  ▪ perform routing between screens
  ▪ create named routes for centralized navigation appraoch
  ▪ create direct routes with MaterialPageRoute or CupertinoPageRoute
  ▪ Perform basic navigation using the Navigator class
  ▪ Transfer data between screens
  ▪ Differentiate between different routing use cases

*/