import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFieldScreen extends StatelessWidget {
  const CustomTextFieldScreen(
      {super.key, this.hintText, this.label, required this.controller});
  final String? hintText;
  final String? label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(decorationThickness: 0),
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: label ?? hintText!,
          labelStyle: const TextStyle(color: Colors.black),
          hintText: hintText,
          enabledBorder: AppConstants.textFieldInputBorder,
          focusedBorder: AppConstants.textFieldInputBorder),
    );
  }
}
