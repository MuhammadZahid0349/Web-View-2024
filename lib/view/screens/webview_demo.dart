// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:web_view_2024/utils/custom_drawer.dart';
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
          onWebResourceError: (WebResourceError error) {
            Get.dialog(
              AlertDialog(
                title: Text('Page Resource Error'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Code: ${error.errorCode}'),
                      Text('Description: ${error.description}'),
                      Text('Error Type: ${error.errorType}'),
                      Text('Is For Main Frame: ${error.isForMainFrame}'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back(); // Close the dialog
                    },
                    child: Text('Close'),
                  ),
                ],
              ),
            );
          },
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
      child: WillPopScope(
        onWillPop: () async {
          // Check if WebView can go back
          if (await webViewController.canGoBack()) {
            // If it can, navigate back in the WebView
            webViewController.goBack();
            return false; // Prevent default back action
          } else {
            return true; // Allow default back action (exit app or navigate out)
          }
        },
        child: Scaffold(
          drawer: const CustomDrawer(),
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
      ),
    );
  }
}
