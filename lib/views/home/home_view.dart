import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth.dart';
import '../../controllers/controllers.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final userController = UserController.instance;
  final notificationController = NotificationController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }

  _appBarWidget() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () async {
            await Authentication.instance.signOutWithGoogle();
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }

  _bodyWidget() {
    return FutureBuilder(
      future: Future.wait([
        userController.init(),
        notificationController.init(),
      ]),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Center(
            child: Text(
              notificationController.message.values.toString(),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(
              color: Get.theme.colorScheme.primary,
            ),
          );
        }
      }),
    );
  }
}
