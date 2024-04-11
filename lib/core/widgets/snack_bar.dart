import 'package:flutter/material.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';

void showSnackBar(BuildContext context,
    {required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: color ?? Colors.red,
      duration: const Duration(seconds: 5),
      content: Container(
        padding: const EdgeInsets.all(10),
        child: Text(message,
            style: AppStyles.style16.copyWith(color: Colors.black)),
      )));
}
