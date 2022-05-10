import 'package:flutter/material.dart';
import 'package:project3/views/homeView/home_screen.dart';
import 'package:project3/views/loginView/login_screen.dart';
import '../views/resultView/result_screen.dart';

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
