import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/extensions/assets_images.dart';
import 'package:gallery_app/core/extensions/distance_extention.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';

class HomeButton extends StatelessWidget {
  const HomeButton(
      {super.key,
      required this.iconUrl,
      required this.text,
      required this.onTap, required this.color});

  final String iconUrl;
  final String text;
  final Function() onTap;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
        width: 145.w,
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Container(
              width: 30.w ,
              height: 30.h ,
              decoration: BoxDecoration(
               color: color ,
               borderRadius: BorderRadius.circular(10.r) 
              ),
              child: UnconstrainedBox(child: iconUrl.image(width: 15.w, height: 15.h))),
            20.0.weight,
            Text(text, style: AppStyles.style20)
          ],
        ),
      ),
    );
  }
}
