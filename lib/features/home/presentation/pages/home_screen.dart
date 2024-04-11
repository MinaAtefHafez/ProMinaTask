import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gallery_app/core/dependency_injection/dependency_injection.dart';
import 'package:gallery_app/core/extensions/assets_images.dart';
import 'package:gallery_app/core/extensions/distance_extention.dart';
import 'package:gallery_app/core/gen/app_images.dart';
import 'package:gallery_app/core/theme/app_styles/app_styles.dart';
import 'package:gallery_app/core/theme/colors/colors.dart';
import 'package:gallery_app/features/home/presentation/cubit/home_cubit.dart';
import 'package:gallery_app/features/home/presentation/widgets/home_button.dart';
import 'package:gallery_app/features/home/presentation/widgets/home_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCubit = di<HomeCubit>();

  @override
  void initState() {
    super.initState();
    homeCubit.getImages();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: homeCubit,
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.colorDDCDFF, AppColors.white]),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 27.w, top: 35.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Welcome', style: AppStyles.style32),
                              Text(
                                'Mina',
                                style: AppStyles.style32,
                              ),
                            ]),
                      ),
                      ClipPath(
                        clipper: HomeClipper(),
                        child: Container(
                          padding: EdgeInsets.only(left: 40.w, bottom: 25.h),
                          height: 150.h,
                          width: 150.w,
                          decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.2)),
                          child: UnconstrainedBox(
                            child: Assets.imagesPerson
                                .image(width: 70.w, height: 70.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                45.0.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HomeButton(
                        color: Colors.red,
                        iconUrl: Assets.imagesLogOut,
                        text: 'log out',
                        onTap: () {}),
                    63.0.weight,
                    HomeButton(
                        color: Colors.amber,
                        iconUrl: Assets.imagesUpLoad,
                        text: 'upload',
                        onTap: () {
                          homeCubit.uploadImage();
                        })
                  ],
                ),
                43.0.height,
                Expanded(child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (homeCubit.imagesEntity != null) {
                      if (homeCubit.isImagesListNotEmpty()) {
                        return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                          ),
                          itemCount:
                              homeCubit.imagesEntity!.dataEntity!.images.length,
                          itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(homeCubit.imagesEntity!
                                      .dataEntity!.images[index])),
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
