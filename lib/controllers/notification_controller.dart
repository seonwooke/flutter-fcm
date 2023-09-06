import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'user_controller.dart';
import '../repositories/repositories.dart';
import '../services/services.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final message = <String, dynamic>{}.obs;

  Future<void> init() async {
    String? token = await _messaging.getToken();
    if (kDebugMode) {
      print("[GET] FCM token: $token");
    }

    if (token != null &&
        token != UserController.instance.currentUserModel.value.token) {
      UserRepository.instance.updateFCMToken(token);
    }

    await NotificationService.instance.initialize();
    await _initNotification();
  }

  _initNotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _initForegroundMessage();
    _initOnMessageOpenedApp();
  }

  void _initForegroundMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationService.instance.display(message);
    });
  }

  void _initOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
  }
}
