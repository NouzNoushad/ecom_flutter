import 'package:ecommerce_flutter/core/utils/colors.dart';
import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension SnackBarExt on BuildContext {
  snackBar(String message) => ScaffoldMessenger.of(this).showSnackBar(SnackBar(
      backgroundColor: ColorPicker.primaryDarkColor, content: Text(message)));
}
