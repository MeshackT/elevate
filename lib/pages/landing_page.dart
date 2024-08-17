import 'package:carousel_slider/carousel_slider.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final List<String> images = [
      'assets/images/carousel/model.png',
      'assets/images/carousel/model.png',
    ];

    return LayoutBuilder(builder: (context, constraint) {
      if (constraint.maxWidth > Utils.mobileWidth) {
        return Container(
          height: screenHeight,
          width: screenWidth,
          color: MyColor.backgroundColor,
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utils.textHeader("New Arrivals Only", 56, FontWeight.bold,
                        MyColor.primaryWhiteTextColor),
                    Utils.getSizedBoxHeight(),
                    Utils.textHeader("New collection for everyone", 28,
                        FontWeight.normal, MyColor.primaryWhiteTextColor),
                    Utils.getSizedBoxHeight(),
                    Utils.getSizedBoxHeight(),
                    Utils.buttonRed("Explore", 13, FontWeight.w400,
                        MyColor.primaryWhiteTextColor, () {
                      // Get the data
                      // GetData.fetchName();
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          height: screenHeight,
          width: screenWidth,
          color: MyColor.backgroundColor,
          child: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight,
                  viewportFraction: 1.0,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7),
                              BlendMode.darken,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Utils.textHeader("New Arrivals Only", 28, FontWeight.bold,
                          MyColor.primaryWhiteTextColor),
                      Utils.getSizedBoxHeight(),
                      Utils.textHeader("New collection for everyone", 15,
                          FontWeight.normal, MyColor.primaryWhiteTextColor),
                      Utils.getSizedBoxHeight(),
                      Utils.getSizedBoxHeight(),
                      Utils.buttonRedSmaller("Explore", 13, FontWeight.w400,
                          MyColor.primaryWhiteTextColor, () {
                        // Get the data
                      }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
