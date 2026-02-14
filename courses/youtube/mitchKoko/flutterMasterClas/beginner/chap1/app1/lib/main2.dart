import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ['Kevin', 'Odalis', 'Kelen', 'Xavier'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My App Bar', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          leading: Icon(Icons.menu, color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.logout),
              color: Colors.white,
            ),
          ],
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              // do something when user taps the widget, so again
              // EVERYTHING IN FLUTTER IS A WIDGET THAT CAN BE WRAPPED IN ANOTHER
              // WIDGET. SO WE CAN EASILY MAKE ANY AND EVERYTHING TAPPABLE
              print('User tapped!');
            },
            child: Container(
              height: 200,
              width: 200,
              color: Colors.deepOrange[400],
              child: Center(child: Text('Tap Me!')),
            ),
          ),
        ),
        // STACK BODY
        // body: Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     // big box
        //     Container(height: 300, width: 300, color: Colors.deepOrange),
        //     // medium box
        //     Container(height: 200, width: 200, color: Colors.deepOrange[400]),
        //     // small box
        //     Container(height: 100, width: 100, color: Colors.deepPurple),
        //   ],
        // ),
        // // GRIDVIEW BODY
        // body: GridView.builder(
        //   itemCount: 64,
        //   // gridDelegate is just how many we want in each row of our grid
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 8,
        //   ),
        //   itemBuilder: (context, index) =>
        //       Container(color: Colors.deepPurple, margin: EdgeInsets.all(2)),
        // ),
        // LISTVIEW.BUILDER BODY
        // body: ListView.builder(
        //   itemCount: names.length,
        //   itemBuilder: (context, index) =>
        //       ListTile(title: Text(names[index])),
        // ),

        // COLUMNS AND ROWS BODY
        // body: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     // 1st box
        //     Expanded(child: Container(color: Colors.deepPurple)),
        //     // 2nd box
        //     Expanded(flex:3,child: Container(color: Colors.deepPurple[400])),
        //     // 3rd box
        //     Expanded(child: Container(color: Colors.deepPurple[200])),
        //   ],
        // ),

        // CENTER WITH ICONS BODY
        // body: Center(
        //   child: Container(
        //     height: 300,
        //     width: 300,
        //     decoration: BoxDecoration(
        //       color: Colors.deepPurple,
        //       // curve the cornes a bit
        //       borderRadius: BorderRadiusDirectional.circular(20),
        //     ),
        //     padding: EdgeInsets.all(25),
        //     child: Column(
        //       children: [
        //         Text(
        //           'Kevin Ladoblanco',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 28,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //         Icon(Icons.favorite, color: Colors.white, size: 64),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
