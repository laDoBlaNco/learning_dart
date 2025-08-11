/*

Module 3 - Implementing Styles in Flutter

Introduction:
  ▪ Application of styles helps in
    ▪ Appealing designs
    ▪ Easy navigation
    ▪ User friendliness

Widgets in Flutter
  ▪ Widgets form the fundamental element of an app Remember, 
    EVERYTHING IN FLUTTER IS A WIDGET
  ▪ Each widget has:
    ▪ Built-in themes
    ▪ Custome themes
    ▪ Direct styling for customizing individual widgets
  ▪ What are styles in Flutter?
    ▪ Styles change the appearance of widgets
    ▪ Styles can be applied to:
      ▪ text
      ▪ buttons
      ▪ backgrounds
      ▪ ...and more

Text Widget Styling
  ▪ Built-in properties help apply styles
    import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Styling Example')),
        body: Center(
          child: Text(
            'Hello There, Flutter!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}

Using Themes for Consistent Styling
  • Themes help apply consistent style across multiple widgets
  • We use ThemeData class for to customize the theme
    • Helps to set:
      • primary colors
      • Text styles
  • All button and other widgets will inherit these styles unless overridden

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ),
      home: Scaffold(
        appBar:AppBar(
          title:Text('Flutter Theming Example:'),
        ),
        body:Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('Hello, Flutter/Dart World!'),
              ElevatedButton(
                onPressed:(){},
                child: Text('Press Me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Styling Buttons
  • Flutter buttons inclue:
    • ElevatedButton
    • TextButton
    • OutlinedButton
  • styleFrom: customizes button's appearance
  • backgroundColor: sets the background color
  • foregroundColor: sets the text color
  • padding: Adjusts button's padding

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title:Text('Flutter Button Styling'),
        ),
        body:Center(
          child:ElevatedButton(
            onPressed:(){},
            style:ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // the background color
              foregroundColor: Colors.white, // text color
              textStyle: TextStyle(
                fontSize:18,
                fontWeight:FontWeight.bold,
              ),
            ),
            child: Text('Press Me!'),
          ),
        ),
      ),
    );
  }
}

Using custom fonts
  • Custom fonts help add a unique touch to apps
  • Update pubspec.yaml
    flutter:
      fonts:
        - family: CustomFont
        fonts:
          - asset: assets/fonts/CustomFont-Regular.ttf
  
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontFamily: 'CustomFont', fontSize: 18),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Fonts in Flutter'),
      ),
      body: Center(
        child: Text('Hello with Custom Font'),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  }
}

Customizing container
  • Customized containers help in padding, margin, and decoration
  • BoxDecoration helps set:
    • Background color
    • Border radius
    • Box-shadow

import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar:AppBar(
          title:Text('Flutter Container Style'),
        ),
        body:Center(
          child:Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius:10,
                  offset:Offset(2,2),
                 ),
              ],
            ),
            child: Text('Styled Container'),
          ),
        ),
      ),
    );
  }
}

Recap:

• In Flutter, once again, all app components are widgets, forming the
  core elements of the app.
• Proper styling is essential for creating visually appealing and 
  consistent user interfaces
• Flutter offers style through built-in and custom themes and direct
  widget customization

*/
