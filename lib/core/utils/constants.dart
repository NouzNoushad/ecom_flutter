import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static OutlineInputBorder textFieldInputBorder = const OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: ColorPicker.primaryColor));
}

void logger(String message, dynamic log) =>
    print('///////////=>>>> $message: $log');
