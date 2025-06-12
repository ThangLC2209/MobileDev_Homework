import 'package:flutter/material.dart';

import 'forget_password_screen.dart';
import 'verify_code_screen.dart';
import 'reset_password_screen.dart';
import 'confirm_screen.dart';

void main() {
  runApp(const SmartTasksApp());
}

class SmartTasksApp extends StatelessWidget {
  const SmartTasksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ForgetPasswordScreen(),
        '/verify': (context) => const VerifyCodeScreen(),
        '/reset': (context) => const ResetPasswordScreen(),
        '/confirm': (context) => const ConfirmScreen(),
      },
    );
  }
}
