import 'package:get/get.dart';

import '../../bindings/bindings.dart';
import '../../views/views.dart';
import 'routes.dart';

class AppPages {
  AppPages._privateConstructor();
  static final AppPages _instance = AppPages._privateConstructor();
  static AppPages get instance => _instance;

  var pages = [
    GetPage(
      name: AppRoutes.instance.initRoute,
      page: () => InitView(),
      binding: InitBinding(),
    ),
    GetPage(
      name: AppRoutes.instance.signRoute,
      page: () => const SignView(),
    ),
    GetPage(
      name: AppRoutes.instance.homeRoute,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
