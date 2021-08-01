import 'package:flutter/material.dart';
import 'package:xvent/widgets/button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
            child: Button(
          text: 'Home',
          onPressed: () {
            Navigator.pop(context);
          },
        )),
      ),
    );
  }
}
