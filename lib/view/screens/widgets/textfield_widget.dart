import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintName;
  final String labelName;
  final TextEditingController controllerName;
  final bool obscureText;
  final TextInputType inputType;
  final Function(String)? onChangedFunc;

  const CustomTextField({
    required this.hintName,
    required this.labelName,
    required this.controllerName,
    required this.obscureText,
    required this.inputType,
    this.onChangedFunc,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerName,
      keyboardType: inputType,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
      ),
      cursorColor: AppColors.primaryColor,
      obscureText: obscureText,
      onChanged: onChangedFunc,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 5.w),
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        labelText: labelName,
        hintText: hintName,
      ),
    );
  }
}
