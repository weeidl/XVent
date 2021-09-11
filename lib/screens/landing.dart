import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xvent/models/user.dart';
import 'package:xvent/screens/home_screen.dart';

import 'login_screen.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserDayVent?>(context);
    // print('${user!.uid}');
    // final bool isLoadingIn = false;
    // return isLoadingIn ? LoginScreen() : LoginScreen();
    if (user == null) {
      return LoginScreen();
    } else {
      return HomeScreen();
    }
  }
}
