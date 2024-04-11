import 'package:flutter/material.dart';
import 'package:gallery_app/features/home/presentation/pages/home_screen.dart';
import 'package:gallery_app/features/login/presentation/pages/login_screen.dart';

class CustomRouter {
  Route onGenerateRoutes(RouteSettings settings) {
    final widget = switch (settings.name) { 
      HomeScreen.name => const HomeScreen(),
      _ => const LoginScreen() };
   
    return MaterialPageRoute(builder: (_) => widget);
  }
}
