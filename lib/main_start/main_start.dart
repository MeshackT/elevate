import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/banner_view.dart';
import '../pages/contact_details.dart';
import '../pages/footer_page.dart';
import '../pages/landing_page.dart';
import '../pages/nav_bar/navbar.dart';
import '../pages/nav_bar/navbar_bloc.dart';
import '../pages/new_collection.dart';
import '../pages/news_letter_page.dart';
import '../utils/utils.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > Utils.mobileWidth) {
          return Scaffold(
            backgroundColor: MyColor.backgroundColor,
            extendBodyBehindAppBar: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // contacts
                  const ContactUsHere(),
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
        } else {
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.list,
                  size: 25,
                  color: MyColor.primaryIconColor,
                ),
              ),
            ),
            drawer:
                const MyDrawer(), // Updated to directly use the MyDrawer widget
            backgroundColor: MyColor.backgroundColor,
            extendBodyBehindAppBar: false,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  // Navbar
                  // const Navbar(),
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
      },
    );
  }
}

//   drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
      child: BlocProvider(
        create: (context) => NavbarBloc()..add(CheckUserStatusUser()),
        child: BlocListener<NavbarBloc, NavbarState>(
          listener: (context, state) {
            // if I trigger the menState then navigate to the screen
            if (state is NavigateToMenState) {
              Navigator.of(context).pushNamed("/men");
            } else if (state is NavigateToWomenState) {
              // Navigator.of(context).pushNamed("/women");
            } else if (state is NavigateToKidsState) {
              // Navigator.of(context).pushNamed("/kids");
            } else if (state is NavigateToLoginState) {
              Navigator.of(context).pushNamed("/signUp");
            } else if (state is NavigateToCartState) {
              // Navigator.of(context).pushNamed("/cart");
            } else if (state is NavigateToMyProfileState) {
              Navigator.of(context).pushNamed("/profile");
            }
          },
          child: Container(
            color: MyColor.backgroundColor,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'images/logo.jpg',
                        height: 30,
                        width: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Utils.getSizedBoxWidth(),
                    const Text(
                      "Elevate",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: MyColor.primaryTextColor,
                      ),
                    ),
                  ],
                ),
                Utils.getSizedBoxHeight(),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Container(
                        color: MyColor.backgroundColor,
                        height: 50,
                        width: screenWidth,
                        child: ListTile(
                          title: Utils.textHeader("Men", 13, FontWeight.w400,
                              MyColor.primaryTextColor),
                          onTap: () {
                            Utils.logger.i("Men click");
                            context.read<NavbarBloc>().add(NavigateToMen());
                          },
                        ),
                      ),
                      Container(
                        color: MyColor.backgroundColor,
                        height: 50,
                        width: screenWidth,
                        child: ListTile(
                          title: Utils.textHeader("Women", 13, FontWeight.w400,
                              MyColor.primaryTextColor),
                          onTap: () {
                            // TODO: Navigate to Women
                          },
                        ),
                      ),
                      Container(
                        color: MyColor.backgroundColor,
                        height: 50,
                        width: screenWidth,
                        child: ListTile(
                          title: Utils.textHeader("Kid's", 13, FontWeight.w400,
                              MyColor.primaryTextColor),
                          onTap: () {
                            // TODO: Navigate to Kids Clothes
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BlocBuilder<NavbarBloc, NavbarState>(
                      builder: (context, state) {
                        if (state is UserLoggedInState) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<NavbarBloc>()
                                  .add(NavigateToMyProfile());
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: const Icon(
                                Icons.person,
                                size: 40,
                                color: MyColor.primaryTextColor,
                              ),
                            ),
                          );
                        } else if (state is UserLoggedOutState) {
                          return Container(
                            decoration: BoxDecoration(
                              color: MyColor.primaryRedColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextButton(
                              onPressed: () {
                                context
                                    .read<NavbarBloc>()
                                    .add(NavigateToLogin());
                              },
                              child: Utils.textHeader(
                                  "Log in",
                                  13,
                                  FontWeight.w500,
                                  MyColor.primaryWhiteTextColor),
                            ),
                          );
                        } else {
                          return Utils.loadingIcon();
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // TODO: Navigate to cart
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'icons/shopping_cart.png',
                              height: 40,
                              width: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Utils.getSizedBoxWidth(),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            color: MyColor.primaryRedColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Center(
                            child: Text(
                              "0",
                              style: TextStyle(
                                color: MyColor.primaryWhiteTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
