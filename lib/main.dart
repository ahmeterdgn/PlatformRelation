import 'package:flutter/material.dart';
import 'package:platformrelation/views/facebook.dart';
import 'package:platformrelation/views/google.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Change here
      home: Google(),
    );
  }
}
