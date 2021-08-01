import 'package:flutter/material.dart';
import 'package:xvent/home.dart';
import 'package:xvent/services/auth.dart';
import 'package:xvent/theme/colors.dart';
import 'package:xvent/widgets/button.dart';

class AuthLogin extends StatefulWidget {
  @override
  _AuthLoginState createState() => _AuthLoginState();
}

class _AuthLoginState extends State<AuthLogin> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final Auth _auth = Auth();

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
      body: Center(
        child: Container(
          padding: EdgeInsets.only(right: 28, left: 28),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Button(
                //   text: 'Login',
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // SizedBox(height: 132),

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
                SizedBox(height: 120),
                _inputForm(Icon(Icons.email), 'Почта', _emailController, false),
                SizedBox(height: 20),
                _inputForm(
                    Icon(Icons.password), 'Пароль', _passwordController, true),
                SizedBox(height: 54),
                Button(
                  text: 'Войти',
                  height: 60,
                  width: double.infinity,
                  onPressed: () {
                    singInUser();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void singInUser() async {
    dynamic authResult =
        await _auth.loginUser(_emailController.text, _passwordController.text);
    if (authResult == null) {
      print('Sing in error');
    } else {
      // _emailController.clear();
      // _passwordController.clear();
      print('Sing in Successful');
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }
}
