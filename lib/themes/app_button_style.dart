import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppButtonStyle {
  static final ButtonStyle elevatedButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.disabled)) {
        return Get.theme.colorScheme.tertiary;
      }
      return Get.theme.colorScheme.secondary;
    }),
    shape: MaterialStateProperty.resolveWith((states) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      );
    }),
    minimumSize: MaterialStateProperty.resolveWith((states) {
      return Size(375.w, 40.h);
    }),
    side: MaterialStateProperty.resolveWith((states) {
      return BorderSide(
        width: 1,
        color: Get.theme.colorScheme.onSecondary,
      );
    }),
    elevation: MaterialStateProperty.resolveWith((states) {
      return 0;
    }),
  );
}
