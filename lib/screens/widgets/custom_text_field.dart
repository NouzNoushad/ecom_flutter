import 'package:flutter/material.dart';

class CustomTextFieldScreen extends StatelessWidget {
  const CustomTextFieldScreen(
      {super.key, required this.hintText, required this.controller});
  final String hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.purple)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.purple))),
    );
  }
}
