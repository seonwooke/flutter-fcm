// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String? uid;
  String? displayName;
  String? token;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.token,
  });

  UserModel copyWith({
    String? uid,
    String? displayName,
    String? token,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      displayName: displayName ?? this.displayName,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'displayName': displayName,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] != null ? map['uid'] as String : null,
      displayName:
          map['displayName'] != null ? map['displayName'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory UserModel.empty() {
    return UserModel(
      uid: '',
      displayName: '',
      token: '',
    );
  }

  factory UserModel.init() {
    return UserModel(
      uid: '',
      displayName: '',
      token: '',
    );
  }

  factory UserModel.signUp(User user, String displayName) {
    return UserModel(
      uid: user.uid,
      displayName: displayName,
      token: '',
    );
  }

  factory UserModel.snsSignUp(User user) {
    return UserModel.signUp(
      user,
      '${user.displayName}',
    );
  }
}
