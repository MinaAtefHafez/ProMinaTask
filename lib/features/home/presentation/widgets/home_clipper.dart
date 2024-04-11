




import 'package:flutter/material.dart';

class HomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo( size.width * 0.35 , size.height * 0.1 , size.width * 0.3 , 
     size.height * 0.4 );

     path.quadraticBezierTo( size.width * 0.3 , size.height * 0.8 , size.width * 0.7 , 
     size.height * 0.8);

     path.quadraticBezierTo( size.width * 0.9 , size.height * 0.8 , size.width  , 
     size.height  );
     path.lineTo( size.width ,  0 );
     path.lineTo( 0 , 0);
     return path ;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true ;
  }
}