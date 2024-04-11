import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/dependency_injection/dependency_injection.dart';
import 'package:gallery_app/core/extensions/assets_images.dart';
import 'package:gallery_app/core/extensions/distance_extention.dart';
import 'package:gallery_app/core/gen/app_images.dart';
import 'package:gallery_app/core/helpers/validation/validation.dart';
import 'package:gallery_app/core/routes/navigation.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';
import 'package:gallery_app/core/theme/colors/colors.dart';
import 'package:gallery_app/core/widgets/snack_bar.dart';
import 'package:gallery_app/features/home/presentation/pages/home_screen.dart';
import 'package:gallery_app/features/login/presentation/cubit/login_cubit.dart';
import 'package:gallery_app/features/login/presentation/widgets/custom_container.dart';
import 'package:gallery_app/features/login/presentation/widgets/login_button.dart';
import 'package:gallery_app/features/login/presentation/widgets/login_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginCubit = di<LoginCubit>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: loginCubit,
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            CustomNavigator.instance.pushNamedReplacement(HomeScreen.name);
          }

          if (state is LoginFailure) {
            showSnackBar(context, message: state.errMessage);
          }
        },
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        AppColors.colorEA94D7,
                        AppColors.colorDDCDFF,
                        AppColors.white
                      ])),
                ),
                Positioned(
                  top: 58.8.h,
                  left: 75.w,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Assets.imagesLove.image(height: 131.h, width: 131.w),
                  ),
                ),
                CustomContainer(
                  top: 470.h,
                  left: 50.w,
                ),
                CustomContainer(
                  top: 470.h,
                  right: 50.w,
                ),
                CustomContainer(
                  bottom: 140.h,
                ),
                Positioned(
                  top: 200.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('My', style: AppStyles.style50),
                      Text('Gellary', style: AppStyles.style50),
                      30.0.height,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: EdgeInsets.only(
                                 top : 48.h, left: 30.w , right: 30.w),
                            width: 345.w,
                            height: 480.h,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            child: Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Text(
                                    'LOG IN',
                                    style: AppStyles.style30,
                                  ),
                                  30.0.height,
                                  LoginTextField(
                                    hint: 'Email',
                                    onChanged: loginCubit.onEmailChanged,
                                    validator: ValidationHelper.validationEmpty,
                                  ),
                                  30.0.height,
                                  LoginTextField(
                                    hint: 'Password',
                                    onChanged: loginCubit.onPasswordChanged,
                                    validator: ValidationHelper.validationEmpty,
                                  ),
                                  38.0.height,
                                  BlocBuilder<LoginCubit, LoginState>(
                                    builder: (context, state) {
                                      if (state is! LoginLoading) {
                                        return LoginButton(onTap: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            loginCubit.login();
                                          }
                                        });
                                      } else {
                                        return const CircularProgressIndicator(
                                          color: Colors.blue,
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
