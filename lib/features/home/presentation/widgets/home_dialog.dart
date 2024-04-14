import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/extensions/assets_images.dart';
import 'package:gallery_app/core/extensions/distance_extention.dart';
import 'package:gallery_app/core/gen/app_images.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';
import 'package:gallery_app/core/theme/colors/colors.dart';

void showHomeDialog(
  BuildContext context, {
  required Function() cameraTap,
  required Function() gellaryTap,
}) {
  showDialog(
      context: context,
      builder: (context) => Dialog(
            elevation: 0,
            backgroundColor: Colors.white.withOpacity(0.2) ,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32.r),
              child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    alignment: Alignment.center,
                    width: 270.w,
                    height: 300.h,
                    color: Colors.white.withOpacity(0.2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: gellaryTap,
                          child: Container(
                            width: 160.w,
                            height: 70.h,
                            decoration: BoxDecoration(
                                color: AppColors.colorEFD8F9,
                                borderRadius: BorderRadius.circular(20.r)),
                            padding: EdgeInsets.only(
                                top: 4.h, bottom: 4.h),
                            child: Row(
                              children: [
                                Assets.imagesGallery
                                    .image(width: 38.w, height: 38.h),
                                7.0.weight,
                                Text(
                                  'Gellary',
                                  style: AppStyles.style27,
                                ),
                              ],
                            ),
                          ),
                        ),
                        44.0.height,
                        InkWell(
                          onTap: cameraTap,
                          child: Container(
                            width: 160.w,
                            height: 70.h,
                            padding: EdgeInsets.only(
                                top: 4.h, bottom: 4.h),
                            decoration: BoxDecoration(
                                color: AppColors.colorEBF6FF,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Row(
                              
                              mainAxisAlignment: MainAxisAlignment.start ,
                              children: [
                                Assets.imagesCamera
                                    .image(width: 45.w, height: 45.h , 
                                     fit: BoxFit.cover 
                                    ),
                                7.0.weight,
                                Text(
                                  'Camera',
                                  style: AppStyles.style27,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ));
}
