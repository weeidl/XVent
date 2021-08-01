import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final String? text;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final VoidCallback onPressed;

  Button({
    this.width,
    this.height,
    this.child,
    this.text,
    this.buttonColor,
    required this.onPressed,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: width, height: height),
      child: ElevatedButton(
        onPressed: onPressed,
        child: child ??
            Text(
              text!,
              style: textStyle,
            ),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
