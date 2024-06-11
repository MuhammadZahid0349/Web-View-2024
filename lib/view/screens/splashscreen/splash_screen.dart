// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/images_path.dart';
import '../../../controllers/splash_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SplashScreenController splashController = Get.put(SplashScreenController());

    return Scaffold(
      backgroundColor: AppColors.appBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImagesPath.logo,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child:
            customizedText(text: "Power by Dev", fontWeight: FontWeight.w600),
      ),
    );
  }
}
