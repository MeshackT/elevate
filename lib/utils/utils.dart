import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/material.dart';

class Utils {
//   height SizedBox
  static SizedBox getSizedBoxHeight() {
    return const SizedBox(height: 20);
  }

  //   width SizedBox
  static SizedBox getSizedBoxWidth() {
    return const SizedBox(width: 20);
  }

  // Text
  static textOldPrice(
      String title, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      title,
      style: TextStyle(
        decoration: TextDecoration.lineThrough,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  static textHeader(
      String title, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }

  // nav text
  static ClipRRect text(
      String title, double fontSize, FontWeight fontWeight, Color color) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 60,
        width: 80,
        decoration: const BoxDecoration(
          color: MyColor.backgroundColor,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  static ClipRRect buttonNave(String title, double fontSize,
      FontWeight fontWeight, Color color, Function() function) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 60,
        width: 80,
        decoration: const BoxDecoration(
          color: MyColor.backgroundColor,
        ),
        child: TextButton(
          onPressed: function,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

//   button red color
  static ClipRRect buttonRed(String title, double fontSize,
      FontWeight fontWeight, Color color, Function() function) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 60,
        width: 120,
        decoration: const BoxDecoration(
          color: MyColor.primaryRedColor,
        ),
        child: TextButton(
          onPressed: function,
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

//   Footer icons
//   navigate to socials
  static GestureDetector footerIcon(String imageUrl, Function() function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          imageUrl,
          height: 30,
        ),
      ),
    );
  }

  static TextButton footerLinks(
      String title, Color color, FontWeight fontWeight, Function() function) {
    return TextButton(
      onPressed: function,
      child: Text(
        title,
        style: TextStyle(fontWeight: fontWeight, fontSize: 13, color: color),
      ),
    );
  }

  static Divider lineDivider() {
    return const Divider(
      height: 2,
      color: MyColor.primaryDividerColor,
    );
  }
}
