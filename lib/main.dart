import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallery_app/app.dart';
import 'package:gallery_app/core/dependency_injection/dependency_injection.dart';
import 'package:gallery_app/core/helpers/shared_preference/shared_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([setUpLocator(), SharedPref.init()]);
  
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}
