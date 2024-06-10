import 'package:flutter/material.dart';

import 'app_colors.dart';

////////// Text /////////////////////
Widget customizedText(
    {text,
    size,
    fontWeight,
    color,
    textalign,
    double? btwSpace,
    double? height}) {
  return Text(text,
      softWrap: true,
      textAlign: textalign ?? TextAlign.center,
      style: TextStyle(
          color: color ?? AppColors.primaryColor,
          fontWeight: fontWeight,
          fontSize: size,
          fontFamily: "AlegreyaSans",
          height: height ?? 1,
          letterSpacing: btwSpace ?? 1));
}

Widget customDrawerBtn({
  required String name,
  required VoidCallback onTapFunction,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onTapFunction,
          child: Text(
            name,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        const Divider(
          color: Colors.white60,
        ),
      ],
    ),
  );
}
