import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/extensions/assets_images.dart';
import 'package:gallery_app/core/gen/app_images.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, this.top, this.bottom, this.right, this.left});

  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top ,
      left: left ,
      bottom: bottom ,
      right: right ,
      child: Assets.imagesRectangle1.image(width: 145.w, height: 145.h),
    );
  }
}
