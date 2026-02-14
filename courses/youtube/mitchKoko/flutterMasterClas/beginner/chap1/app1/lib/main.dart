import 'package:app1/first_page.dart';
import 'package:app1/home_page.dart';
import 'package:app1/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/settings': (context) => SettingsPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
