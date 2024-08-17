import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class ContactUsHere extends StatelessWidget {
  const ContactUsHere({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 40,
      width: screenWidth,
      color: MyColor.primaryTextColor,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Utils.textHeader("elevate@gmail.com - www.elevate.co.za", 13,
              FontWeight.w600, MyColor.primaryWhiteTextColor),
          Utils.textHeader("+258 84 237 5933", 13, FontWeight.w600,
              MyColor.primaryWhiteTextColor),
        ],
      ),
    );
  }
}
