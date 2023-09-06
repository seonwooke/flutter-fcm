import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyle {
  static final AppTextStyle _instance = AppTextStyle._privateConstructor();
  AppTextStyle._privateConstructor();

  static AppTextStyle get instance => _instance;

  static const black = FontWeight.w900;
  static const bold = FontWeight.w700;
  static const medium = FontWeight.w500;

  final TextStyle title1 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: black,
    fontSize: 20.sp,
  );

  final TextStyle title2 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: bold,
    fontSize: 20.sp,
  );

  final TextStyle title3 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: bold,
    fontSize: 24.sp,
  );

  final TextStyle subtitle1 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: bold,
    fontSize: 18.sp,
  );

  final TextStyle subtitle2 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: bold,
    fontSize: 16.sp,
  );

  final TextStyle body1 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: medium,
    fontSize: 14.sp,
  );

  final TextStyle body2 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: bold,
    fontSize: 14.sp,
  );

  final TextStyle body3 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: medium,
    fontSize: 14.sp,
  );

  final TextStyle body4 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: medium,
    fontSize: 12.sp,
  );

  final TextStyle body5 = TextStyle(
    fontFamily: 'Pretendard',
    fontWeight: medium,
    fontSize: 10.sp,
  );
}
