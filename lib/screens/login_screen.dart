import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvent/screens/register/auth.dart';
import 'package:xvent/screens/register/login.dart';
import 'package:xvent/services/auth.dart';
import 'package:xvent/theme/colors.dart';
import 'package:xvent/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthServer _auth = AuthServer();

    return Scaffold(
      backgroundColor: XVentColor.background,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 132),
            SvgPicture.asset(
              'assets/logo_xvent.svg',
            ),
            SizedBox(height: 16),
            Text(
              'Давайте исследуем, что происходит поблизости',
              style: TextStyle(color: XVentColor.white),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28, top: 110),
              child: Button(
                width: double.infinity,
                height: 60,
                text: 'Войти',
                buttonColor: XVentColor.yellow,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthLogin()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28, top: 16),
              child: Button(
                width: double.infinity,
                height: 60,
                text: 'Регистрация',
                buttonColor: XVentColor.yellow,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthRegister()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28, left: 28, top: 54),
              child: Button(
                width: double.infinity,
                height: 60,
                text: 'Войти как гость',
                buttonColor: XVentColor.yellow,
                onPressed: () async {
                  dynamic result = await _auth.signInAnon();
                  if (result == null) {
                    print('error signing in');
                  } else {
                    print('signed in + ${result.uid}');
                  }
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
            Spacer(),
            Text(
              '©weeidl',
              style: TextStyle(color: XVentColor.white),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
