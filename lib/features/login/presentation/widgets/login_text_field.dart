import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';

class LoginTextField extends StatelessWidget {
  const LoginTextField(
      {super.key,
      required this.hint,
      required this.validator,
      required this.onChanged});

  final String hint;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 25.w),
        hintText: hint,
        hintStyle: AppStyles.style16,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40.r),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40.r),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40.r),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
