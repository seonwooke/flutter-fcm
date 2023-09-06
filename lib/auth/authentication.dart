import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../constants/constants.dart';
import '../models/models.dart';
import '../repositories/repositories.dart';

class Authentication {
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();

  static Authentication get instance => _instance;

  /// Sign Out
  Future<void> signOut() async {
    await FirebaseAuth.instance
        .signOut()
        .then((value) => Get.offAllNamed(AppRoutes.instance.signRoute));
  }

  /// Google Sign In
  Future<User?> signInWithGoogle() async {
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithPopup(authProvider);

        user = userCredential.user;

        if (user != null && userCredential.additionalUserInfo!.isNewUser) {
          await UserRepository.instance.addUserToFirebase(
            UserModel.snsSignUp(user),
          );
        }

        Get.offNamed(AppRoutes.instance.homeRoute);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      try {
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;

          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          try {
            final UserCredential userCredential =
                await FirebaseAuth.instance.signInWithCredential(credential);

            user = userCredential.user;

            if (user != null && userCredential.additionalUserInfo!.isNewUser) {
              await UserRepository.instance.addUserToFirebase(
                UserModel.snsSignUp(user),
              );
            }

            Get.offNamed(AppRoutes.instance.homeRoute);
          } on FirebaseAuthException catch (e) {
            if (kDebugMode) {
              print(e.code);
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
        }
        return user;
      } on PlatformException catch (e) {
        if (kDebugMode) {
          print(e);
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return null;
  }

  /// Google Sign Out
  Future<void> signOutWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await signOut();
    } catch (error) {
      if (kDebugMode) {
        print('[authentication.dart - signInWithGoogle] google out failed');
        print(error);
      }
    }
  }

  /// Error SnackBar
  void errorSnackBar(FirebaseAuthException error) {
    switch (error.code) {
      case 'invalid-email':
        Get.snackbar(
          '유효하지 않는 이메일',
          '유효하지 않는 이메일 형식입니다.',
        );
        break;
      case 'user-not-found':
        Get.snackbar(
          '로그인 실패',
          '존재하지 않는 이메일 입니다.',
        );
        break;
      case 'wrong-password':
        Get.snackbar(
          '로그인 실패',
          '패스워드를 확인 해주세요.\n구글 혹은 애플 계정으로 회원 가입한 경우일 수 있습니다.',
        );
        break;
      case 'network-request-failed':
        Get.snackbar(
          '네트워크 오류',
          '모바일 네트워크 혹은 와이파이를 확인해 주세요.',
        );
        break;
      case 'email-already-in-use':
        Get.snackbar(
          '회원가입 실패',
          '해당 이메일은 이미 존재합니다.',
        );
        break;
      case 'weak-password':
        Get.snackbar(
          '회원가입 실패',
          '비밀번호를 6자 이상으로 입력해주세요.',
        );
        break;
      case 'operation-not-allowed':
        Get.snackbar(
          '로그인 실패',
          '허용되지 않은 로그인 방법입니다.',
        );
        break;
      default:
        Get.snackbar(
          error.code,
          '${error.message}',
          duration: const Duration(seconds: 5),
        );
    }
  }
}
