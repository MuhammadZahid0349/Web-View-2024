// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_view_2024/utils/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatefulWidget {
  const WebViewDemo({super.key});

  @override
  State<WebViewDemo> createState() => _WebViewDemoState();
}

class _WebViewDemoState extends State<WebViewDemo> {
  WebViewController webViewController = WebViewController();

  @override
  void initState() {
    super.initState();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {},
          onPageStarted: (url) {},
          onPageFinished: (url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://craftirh.com/'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.black87,
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
            Container(
              height: 60.h,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Drawer Example',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ),
            customDrawerBtn(name: "Login", onTapFunction: () {}),
            customDrawerBtn(name: "Register", onTapFunction: () {}),
            customDrawerBtn(name: "Support", onTapFunction: () {}),
            customDrawerBtn(name: "Contact Us", onTapFunction: () {}),
          ]),
        ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: customizedText(
              text: "Dev Med", size: 25.sp, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          width: Get.width,
          child: WebViewWidget(
            controller: webViewController,
          ),
        ),
      ),
    );
  }
}
