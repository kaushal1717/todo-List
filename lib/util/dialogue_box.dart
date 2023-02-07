import 'package:flutter/material.dart';
import 'package:todoapp/consts/buttons.dart';
import 'package:todoapp/consts/colors.dart';

class DlgBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;
  DlgBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      content: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colors.primaryClr, colors.secondaryClr],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the task",
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 26,
                ),
                CustomButton(text: 'Save', onPressed: onSaved),
                SizedBox(
                  width: 40,
                ),
                CustomButton(text: 'Cancel', onPressed: onCancel)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
