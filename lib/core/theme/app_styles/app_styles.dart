import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theme/colors/colors.dart';

abstract class AppStyles {
  static final style50 = TextStyle(
      fontSize: 50.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.color4A4A4A);

  static final style32 = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.color4A4A4A);

  static final style20 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.w300, color: Colors.black);

  static final style30 = TextStyle(
      fontSize: 30.sp,
      fontWeight: FontWeight.bold,
      color: AppColors.color4A4A4A);

  static final style16 = TextStyle(
      fontSize: 16.sp, color: Colors.grey, fontWeight: FontWeight.w700);

  static final style18 = TextStyle(
      fontSize: 18.sp, color: Colors.white, fontWeight: FontWeight.bold);
}
