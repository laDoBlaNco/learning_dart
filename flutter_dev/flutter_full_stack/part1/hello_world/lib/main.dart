// pulls in Flutter's Material Design library providing the widgets like AppBar and Text
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// the main function is the entrypoint
void main() {
  // we call runApp to launch the app (which is just a class constructor)
  runApp(MyApp2());
}

// MyApp is a subclass extending a stateless widget ( a widget with no state 🤯) which
// is defining the app's structure
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // the MaterialApp widget sets up the app's theme and navigation
    return MaterialApp(
      // the Scaffold widget provides the basic layout
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World App')),
        // The Center widget centers its children, a Text widget which displays some text
        // in a specific style
        body: Center(
          child: Text(
            'Hello World',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}

// let's add a button that changes the text when pressed. So we need to change
// MyApp to us a stateful widget
class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

// introducing a stateul widget with maintains state in a separate State class/widget
class _MyApp2State extends State<MyApp2> {
  // here we have the message text
  String message = 'Hello world';

  // this method (library_private) updates it using 'setState()', which triggers a UI build
  void _updateMessage() {
    setState(() {
      message = 'Welcome to Flutter!';
    });
  }

  // added in this other button to reset text and understand a bit better
  // state management in flutter, which is just telling Flutter what show
  // on-screen at any given time in app run. 
  void _resetText() {
    setState(() {
      message = 'Hello again, world!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hello World App')),
        body: Center(
          // the column widget/class arranges the text and button vertically with a SizedBox widget for
          // spacing.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                message,
                // I also imported GoogleFonts on my on to get some more options to play with
                style: GoogleFonts.comingSoon(color: Colors.blue, fontSize: 24),
              ),
              ElevatedButton(
                onPressed: _updateMessage,
                child: Text('Change Message'),
              ),
              ElevatedButton(onPressed: _resetText, child: Text('Reset Text!')),
            ],
          ),
        ),
      ),
    );
  }
}
