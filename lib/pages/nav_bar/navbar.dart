import 'package:elevate/pages/women_page/women_page.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../kids_page/kids_page.dart';
import '../men_page/men_page.dart';
import 'navbar_bloc.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarBloc()..add(CheckUserStatusUser()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<NavbarBloc, NavbarState>(
            listener: (context, state) {
              if (state is NavigateToMenState) {
                Utils.logger.i("Navigating to Men page"); // Debug statement
                // Navigator.of(context).pushNamed("/men");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MenPage()));
              }
              if (state is NavigateToWomenState) {
                Utils.logger.i("we clicking the button 1");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const WomenPage()));
              }
              if (state is NavigateToKidsState) {
                // Navigator.of(context).pushNamed("/kids");
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const KidsPage()));
              }
              if (state is NavigateToLoginState) {
                Utils.logger.i("we are checking the state 3");
                Navigator.of(context).pushNamed("/signUp");
              }
              if (state is NavigateToCartState) {
                // Navigator.of(context).pushNamed("/cart");
              }
              if (state is NavigateToMyProfileState) {
                Navigator.of(context).pushNamed("/profile");
              }
              if (state is NavigateToTestState) {
                Utils.logger.i("State is NavigateToTestState");
                Navigator.of(context).pushNamed("/view_products");
              }
            },
          ),
        ],
        child: Container(
          color: MyColor.backgroundColor,
          padding:
              const EdgeInsets.only(right: 80, left: 80, top: 20, bottom: 20),
          height: 80,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'images/logo.jpg',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Utils.text(
                      "Elevate", 13, FontWeight.w500, MyColor.primaryTextColor),
                ],
              ),
              Utils.getSizedBoxWidth(),
              // navigation buttons
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Utils.buttonNave(
                      "Men", 13, FontWeight.w400, MyColor.primaryTextColor, () {
                    Utils.logger.i("navigation 2 button pressed");
                    // context.read<NavbarBloc>().add(NavigateToMen());
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MenPage()));
                  }),
                  Utils.getSizedBoxWidth(),
                  Utils.buttonNave(
                      "Women", 13, FontWeight.w400, MyColor.primaryTextColor,
                      () {
                    Utils.logger.i("we clicking the button 1");
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const WomenPage()));
                    // Navigate to Women
                    // context.read<NavbarBloc>().add(NavigateToWomen());
                  }),
                  Utils.getSizedBoxWidth(),
                  Utils.buttonNave(
                      "Kid's", 13, FontWeight.w400, MyColor.primaryTextColor,
                      () {
                    // Navigate to Kids
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const KidsPage()));
                  }),
                ],
              ),
              Utils.getSizedBoxWidth(),
              // login and counter
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                      }
                      // else if (state is UserLoggedOutState) {
                      else {
                        return Utils.buttonNave("Log In", 13, FontWeight.w400,
                            MyColor.primaryTextColor, () {
                          Utils.logger.i("we clicked the button 1");

                          context.read<NavbarBloc>().add(NavigateToLogin());
                        });
                      }
                    },
                  ),
                  Utils.getSizedBoxWidth(),
                  Utils.getSizedBoxWidth(),
                  GestureDetector(
                    onTap: () {
                      // Navigate to cart
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
                  Align(
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                        height: 20,
                        width: 20,
                        color: MyColor.primaryRedAccentColor,
                        child: const Text(
                          "0",
                          style: TextStyle(
                            color: MyColor.primaryWhiteTextColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
