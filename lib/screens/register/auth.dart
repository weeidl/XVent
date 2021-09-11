import 'package:flutter/material.dart';
import 'package:xvent/theme/colors.dart';
import 'package:xvent/widgets/button.dart';

class AuthRegister extends StatefulWidget {
  @override
  _AuthRegisterState createState() => _AuthRegisterState();
}

class _AuthRegisterState extends State<AuthRegister> {
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
    return Container(
      padding: EdgeInsets.only(left: 28, right: 28),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(fontSize: 20, color: XVentColor.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: XVentColor.white,
          ),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: XVentColor.white, width: 3),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: XVentColor.yellow, width: 1),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconTheme(
              data: IconThemeData(color: XVentColor.white),
              child: icon,
            ),
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
          child: Column(
            children: [
              SizedBox(height: 160),
              _inputForm(Icon(Icons.email), 'EMAIL', _emailController, false),
              SizedBox(height: 20),
              _inputForm(
                  Icon(Icons.password), 'PASSWORD', _passwordController, true),
              SizedBox(height: 20),
              Button(
                text: 'Login User',
                onPressed: () {
                  print(_emailController.text);
                  print(_passwordController.text);
                  createUser();
                },
              ),
              Button(
                text: 'Auth',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void createUser() async {
    // dynamic result = await _auth.createNewUser(
    //     _emailController.text, _passwordController.text);
    // if (result == null) {
    //   print('Email is not valid');
    // } else {
    //   print(result.toString());
    //   _emailController.clear();
    //   _passwordController.clear();
    // }
  }
}
