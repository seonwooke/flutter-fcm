import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/constants.dart';
import '../../controllers/controllers.dart';

class InitView extends StatelessWidget {
  InitView({super.key});

  final authController = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(microseconds: 100), () {
      if (authController.user == null) {
        Get.offNamed(AppRoutes.instance.signRoute);
      } else {
        Get.offNamed(AppRoutes.instance.homeRoute);
      }
    });

    return Scaffold(
      backgroundColor: Get.theme.colorScheme.secondary,
      body: Center(
        child: CircularProgressIndicator(
          color: Get.theme.colorScheme.primary,
        ),
      ),
    );
  }
}
