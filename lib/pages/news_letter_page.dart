import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class NewsLetter extends StatelessWidget {
  const NewsLetter({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.8,
      width: screenWidth,
      padding: const EdgeInsets.symmetric(horizontal: 60.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Utils.textHeader(
            'Get exclusive offers on your email',
            56,
            FontWeight.w600,
            MyColor.primaryTextColor,
          ),
          Utils.getSizedBoxHeight(),
          Utils.textHeader(
            'Subscribe to our newsletter and stay updated',
            16,
            FontWeight.w400,
            MyColor.primaryTextColor,
          ),
          Utils.getSizedBoxHeight(),
          Container(
            color: Colors.transparent,
            width: 400,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: MyColor.backgroundColor,
                      hintText: 'Enter your email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: MyColor.primaryTextColor,
                          width: 0.8,
                        ),
                      ),
                    ),
                    autocorrect: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Utils.getSizedBoxWidth(),
                Utils.buttonRed(
                  "Subscribe",
                  13,
                  FontWeight.w500,
                  MyColor.primaryWhiteTextColor,
                  () => null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
