import 'package:flutter/material.dart';
import 'package:movieverse/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieVerse',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const Dashboard(),
    );
  }
}

