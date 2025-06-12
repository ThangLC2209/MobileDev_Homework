import 'package:bt1_week4/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTH SmartTasks',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
