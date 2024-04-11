import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Distance on double {
  Widget get height => SizedBox(height: h);
  Widget get weight => SizedBox(width: h);
}
