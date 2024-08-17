import 'package:flutter/material.dart';

class BannerView extends StatelessWidget {
  const BannerView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: 400,
      width: screenWidth,
      padding: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: Image.asset(
        'images/banner_women.jpg',
        fit: BoxFit.contain,
      ),
    );
  }
}
