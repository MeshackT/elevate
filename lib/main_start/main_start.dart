import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/material.dart';

import '../nav_bar/navbar.dart';
import '../pages/banner_view.dart';
import '../pages/footer_page.dart';
import '../pages/landing_page.dart';
import '../pages/new_collection.dart';
import '../pages/news_letter_page.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.backgroundColor,
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Navbar
            const Navbar(),
            // Landing page
            const LandingPage(),
            // banner
            const BannerView(),
            // New collections
            const NewCollections(),
            // Exclusive product
            const NewsLetter(),
            // Subscribe
            const BannerView(),
            // Footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
