import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../controllers/controllers.dart';
import '../models/models.dart';

class UserRepository {
  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final _userCollection = FirebaseFirestore.instance.collection("user");

  /// 유저 정보 저장
  Future<void> addUserToFirebase(UserModel userModel) async {
    try {
      await _userCollection.doc(userModel.uid).set(userModel.toMap());
      if (kDebugMode) {
        print('[SUCCESS] ${userModel.displayName} is created');
      }
    } catch (error) {
      if (kDebugMode) {
        print("[user_repository.dart - addUserToFirebase] $error");
      }
    }
  }

  /// 유저 정보 가져오기
  Future<UserModel> getUser(String uid) async {
    UserModel userModel = UserModel.empty();
    try {
      await _userCollection.doc(uid).get().then((DocumentSnapshot ds) {
        if (ds.exists) {
          userModel = UserModel.fromMap(ds.data() as Map<String, dynamic>);
        }
      });
    } catch (error) {
      if (kDebugMode) {
        print("[user_repository.dart - getUser] $error");
      }
    }
    return userModel;
  }

  /// FCM 토큰 업데이트
  void updateFCMToken(String token) async {
    try {
      await _userCollection
          .doc(UserController.instance.currentUserUid)
          .update({'token': token});
      UserController.instance.currentUserModel.value.token = token;
    } catch (error) {
      if (kDebugMode) {
        print("[user_repository.dart - updateFCMToken] $error");
      }
    }
  }
}
