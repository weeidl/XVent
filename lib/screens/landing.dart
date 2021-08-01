import 'package:flutter/material.dart';
import 'package:xvent/screens/login_screen.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoadingIn = false;
    return isLoadingIn ? LoginScreen() : LoginScreen();
  }
}
