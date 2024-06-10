import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_view_2024/utils/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
