import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xvent/screens/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: Landing(),
    );
  }
}
