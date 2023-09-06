import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../auth/auth.dart';
import '../../widgets/widgets.dart';

class SignView extends StatelessWidget {
  const SignView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.onSecondary,
      body: _bodyWidget(),
    );
  }

  _bodyWidget() {
    return SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 250,
              child: StyledElevatedButton.googleLogin(
                '구글 로그인하기',
                () async {
                  await Authentication.instance.signInWithGoogle();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
