import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_view_2024/view/screens/splashscreen/splash_screen.dart';
import 'package:web_view_2024/view/screens/webview_demo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'WebView Project',
            builder: EasyLoading.init(),
            home: const SplashScreen(),
          );
        });
  }
}
