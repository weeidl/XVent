import 'package:flutter/material.dart';
import 'package:xvent/register/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XVent',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: LoginScreen(),
    );
  }
}
