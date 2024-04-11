import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/helpers/shared_preference/local_storage_keys.dart';
import 'package:gallery_app/core/helpers/shared_preference/shared_preference.dart';
import 'package:gallery_app/core/routes/navigation.dart';
import 'package:gallery_app/core/routes/routes.dart';
import 'package:gallery_app/core/theme/app_theme.dart';
import 'package:gallery_app/features/home/presentation/pages/home_screen.dart';
import 'package:gallery_app/features/login/presentation/pages/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 928),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        navigatorKey: navigationKey,
        initialRoute: SharedPref.getValue(LocalStorageKeys.token) != null
            ? HomeScreen.name
            : LoginScreen.name,
        onGenerateRoute: CustomRouter().onGenerateRoutes,
        theme: AppTheme.theme(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
