// import 'package:app1/second_page.dart';
// dont' need the above when using routes
import 'package:app1/home_page.dart';
import 'package:app1/profile_page.dart';
import 'package:app1/settings_page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  // this keeps track of the current page to display
  int _selectedIndex = 0;

  // a method to update the new selected index so we need to change this to a stateful widget
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // The pages we have in our app
  final List _pages = [
    //homepage
    HomePage(),

    // profilepage
    ProfilePage(),

    // settingspage
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          // home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // profile
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          // settings
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      // Below is the Drawer navigation example. Another way is BottomNavigationBar
      // drawer: Drawer(
      //   backgroundColor: Colors.deepPurple[200],
      //   child: Column(
      //     children: [
      //       // common to place a drawer header here which usually is an icon or logo
      //       DrawerHeader(
      //         child: Icon(Icons.favorite, size: 48, color: Colors.white),
      //       ),
      //       // homepage list tile - we could build this ourselves with a container, columns, etc
      //       // but Flutter has its own as well as its such a common thing
      //       ListTile(
      //         leading: Icon(Icons.home),
      //         title: Text('HOME'),
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         onTap: () {
      //           // pop the drawer first then navigate to home page
      //           Navigator.pop(context);
      //           // go to home page
      //           Navigator.pushNamed(context, '/home');
      //         },
      //       ),
      //       // setting page list tile
      //       ListTile(
      //         leading: Icon(Icons.settings),
      //         title: Text('SETTINGS'),
      //         iconColor: Colors.white,
      //         textColor: Colors.white,
      //         onTap: () {
      //           Navigator.pop(context);
      //           Navigator.pushNamed(context, '/settings');
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      // Below is the body centered with button for navigation. Another way to do navigation
      // is with a Drawer
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       // navigate to second page using named routes (located on main MaterialApp)
      //       Navigator.pushNamed(context, '/secondpage');
      //       // navigate to second page with direct push
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => SecondPage()),
      //       // );
      //     },
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Colors.lightBlue,
      //       foregroundColor: Colors.white,
      //     ),
      //     child: Text('Go to Second Page'),
      //   ),
      // ),
    );
  }
}
