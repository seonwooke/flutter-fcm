import 'package:get/get.dart';

import '../../views/views.dart';
import 'routes.dart';

class AppPages {
  AppPages._privateConstructor();
  static final AppPages _instance = AppPages._privateConstructor();
  static AppPages get instance => _instance;

  var pages = [
    GetPage(
      name: AppRoutes.instance.INIT,
      page: () => const InitPage(),
    ),
  ];
}
