import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer(
      {super.key, required this.onTap, required this.icon, required this.text});
  final void Function()? onTap;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: ColorPicker.primaryColor,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(text)
        ],
      ),
    );
  }
}
