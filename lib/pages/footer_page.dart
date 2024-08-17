import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2.3,
      width: screenWidth,
      color: MyColor.backgroundColor,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Footer logo
            Container(
              padding: const EdgeInsets.only(bottom: 20.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(100)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  'images/logo.jpg',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Footer links
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Utils.footerLinks("Company", MyColor.primaryTextColor,
                    FontWeight.w400, () => null),
                Utils.getSizedBoxWidth(),
                Utils.footerLinks("About", MyColor.primaryTextColor,
                    FontWeight.w400, () => null),
                Utils.getSizedBoxWidth(),
                Utils.footerLinks("Contact Us", MyColor.primaryTextColor,
                    FontWeight.w400, () => null),
                Utils.getSizedBoxWidth(),
              ],
            ),
            // Footer social icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.footerIcon('assets/images/instagram_icon.png', () => {}),
                Utils.footerIcon('assets/images/facebook_icon.png', () => {}),
                Utils.footerIcon('assets/images/whatsapp_icon.png', () => {}),
              ],
            ),

            // Footer copyright
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Divider(color: MyColor.primaryTextColor),
                  Text(
                    "Copyright @ 2024 - All rights reserved by FSH.",
                    style: TextStyle(color: MyColor.secondaryTextColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
