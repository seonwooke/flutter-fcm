import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'themes.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: false,
    colorScheme: lightColorScheme,
    canvasColor: Colors.transparent,
    scaffoldBackgroundColor: Get.theme.colorScheme.onSecondary,
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    canvasColor: Colors.transparent,
  );
}
