import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xvent/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XVentColor.background,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 132),
            SvgPicture.asset(
              'assets/logo_xvent.svg',
            ),
            Text(
              'Давайте исследуем, что происходит поблизости',
              style: TextStyle(color: XVentColor.white),
            ),
          ],
        ),
      ),
    );
  }
}
