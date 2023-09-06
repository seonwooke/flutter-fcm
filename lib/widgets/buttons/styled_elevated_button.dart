import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/themes.dart';

class StyledElevatedButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final ButtonStyle? buttonStyle;
  final TextStyle? textStyle;
  const StyledElevatedButton({
    required this.label,
    required this.onPressed,
    required this.buttonStyle,
    required this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: buttonStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: textStyle,
          ),
        ],
      ),
    );
  }

  factory StyledElevatedButton.googleLogin(
      String label, void Function()? onPressed) {
    return StyledElevatedButton(
      label: label,
      onPressed: onPressed,
      buttonStyle: AppButtonStyle.elevatedButtonStyle,
      textStyle: AppTextStyle.instance.subtitle1.copyWith(
        color: Get.theme.colorScheme.onSecondary,
      ),
    );
  }
}
