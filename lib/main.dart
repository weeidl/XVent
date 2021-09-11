import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xvent/models/user.dart';
import 'package:xvent/screens/landing.dart';
import 'package:xvent/services/auth.dart';
import 'package:xvent/theme/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: XVentColor.buttonBar, // navigation bar color
    statusBarColor: XVentColor.background, // status bar color
  ));
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserDayVent?>.value(
      value: AuthServer().userStream,
      initialData: null,
      child: MaterialApp(
        title: 'XVent',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: Landing(),
      ),
    );
  }
}
