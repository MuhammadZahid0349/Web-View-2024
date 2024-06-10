import 'dart:async';

import 'package:get/get.dart';

import '../data/webview_demo.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Add your timer logic here
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => WebViewDemo());
    });
  }
}
