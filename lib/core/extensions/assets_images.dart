import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension AssetsImagesEx on String {
  SvgPicture svg({double? width, double? height, BoxFit? fit}) {
    return SvgPicture.asset(
      this,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }

  Image image({double? width, double? height, BoxFit? fit}) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
