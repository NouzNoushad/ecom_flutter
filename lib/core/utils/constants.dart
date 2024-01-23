import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static OutlineInputBorder textFieldInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: ColorPicker.primaryColor));
}

void logger(String message, dynamic log) =>
    print('///////////=>>>> $message: $log');

void printWrapped(String text) =>
    RegExp('.{1,800}').allMatches(text).map((m) => m.group(0)).forEach(print);
