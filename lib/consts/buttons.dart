import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:todoapp/consts/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  ui.VoidCallback onPressed;
  CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: colors.secondaryClr),
      ),
      color: colors.checkBoxClr,
    );
  }
}
