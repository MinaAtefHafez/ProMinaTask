


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.onTap});
  
  final Function () onTap ;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 46.h ,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r) ,
          color: Colors.blue 
        ),
        child: Text('SUBMIT' , style: AppStyles.style18 ),
      ),
    );
  }
}