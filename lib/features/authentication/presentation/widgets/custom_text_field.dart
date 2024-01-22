import 'package:ecommerce_flutter/core/utils/constants.dart';
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
      style: const TextStyle(decorationThickness: 0),
      decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: AppConstants.textFieldInputBorder,
          focusedBorder: AppConstants.textFieldInputBorder),
    );
  }
}
