import 'package:flutter/material.dart';
import 'package:xvent/theme/colors.dart';
import 'package:xvent/widgets/button.dart';

class AuthLogin extends StatefulWidget {
  @override
  _AuthLoginState createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // final Auth _auth = Auth();

  String? _email;
  String? _password;
  bool showLogin = true;

  void loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;

    _emailController.clear();
    _passwordController.clear();
  }

  Widget _inputForm(Icon icon, String hint, TextEditingController controller,
      bool obscureText) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: TextStyle(fontSize: 18, color: XVentColor.textColor),
      decoration: InputDecoration(
        // fillColor: XVentColor.gray,
        // filled: true,
        hintStyle: TextStyle(
          fontSize: 18,
          color: XVentColor.textColorHint,
        ),
        hintText: hint,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: XVentColor.white, width: 3),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: XVentColor.white, width: 1),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: IconTheme(
            data: IconThemeData(color: XVentColor.textColor),
            child: icon,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XVentColor.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80),
            Text(
              'ВОЙТИ',
              style: TextStyle(
                  fontSize: 48,
                  color: XVentColor.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Введите свой логин и пароль',
              style: TextStyle(color: XVentColor.white),
            ),
            SizedBox(height: 60),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: XVentColor.white,
                ),
                margin: EdgeInsets.only(left: 16, right: 16),
                width: double.infinity,
                height: 442,
                child: Column(
                  children: [
                    // Button(
                    //   text: 'Login',
                    //   onPressed: () {
                    //     Navigator.pop(context);
                    //   },
                    // ),
                    // SizedBox(height: 132),
                    SizedBox(height: 120),
                    _inputForm(
                        Icon(Icons.email), 'Почта', _emailController, false),
                    SizedBox(height: 20),
                    _inputForm(Icon(Icons.password), 'Пароль',
                        _passwordController, true),
                    SizedBox(height: 54),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Button(
                        text: 'Войти',
                        height: 60,
                        width: double.infinity,
                        onPressed: () {
                          print(_emailController.text);
                          print(_passwordController.text);
                          // print(_passwordController);
                          // singInUser();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void singInUser() async {
  //   dynamic authResult =
  //       await _auth.loginUser(_emailController.text, _passwordController.text);
  //   if (authResult == null) {
  //     print('Sing in error');
  //   } else {
  //     // _emailController.clear();
  //     // _passwordController.clear();
  //     print('Sing in Successful');
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   }
  // }
}
