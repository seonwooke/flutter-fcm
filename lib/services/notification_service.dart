// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest_all.dart' as timezone;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _instance =
      NotificationService._privateConstructor();

  NotificationService._privateConstructor();

  static NotificationService get instance => _instance;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final androidDetials = const AndroidNotificationDetails(
    "high_importance_channel",
    "Seonwook's channel",
    channelDescription: "this is seonwook's channel",
    importance: Importance.max,
    priority: Priority.high,
  );

  Future<void> initialize() async {
    timezone.initializeTimeZones();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
  }

  display(RemoteMessage message) async {
    final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

    final notificationDetails = NotificationDetails(
      android: androidDetials,
    );

    await flutterLocalNotificationsPlugin.show(
      id,
      message.notification!.title,
      message.notification!.body,
      notificationDetails,
    );
  }
}
