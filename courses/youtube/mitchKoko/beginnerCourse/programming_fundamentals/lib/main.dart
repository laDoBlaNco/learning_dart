// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Variables: I can store different types of info/data into variables
  // These are just the main variables that a beginner needs to know;
  String name = 'ladoblanco';
  int age = 48;
  double pi = 3.14159;
  bool isBeginner = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
