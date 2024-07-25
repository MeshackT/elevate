import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:elevate/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navbar_bloc.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    // call the state and navbar bloc
    return BlocListener<NavbarBloc, NavbarState>(
      listener: (context, state) {
        // if I trigger the menState then navigate to the screen
        if (state is NavigateToMenState) {
          Navigator.of(context).pushNamed("/men");
        } else if (state is NavigateToWomenState) {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => WomenPage()));
        } else if (state is NavigateToKidsState) {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => KidsPage()));
        } else if (state is NavigateToLoginState) {
          // go to login
          Navigator.of(context).pushNamed("/signUp");
        } else if (state is NavigateToCartState) {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => CartPage()));
        }
      },
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
                // logo
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'images/logo.jpg',
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),

                // Name
                Utils.text(
                  "Elevate",
                  13,
                  FontWeight.w500,
                  MyColor.primaryTextColor,
                ),
              ],
            ),
            Utils.getSizedBoxWidth(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // list
                Utils.buttonNave(
                    "Men", 13, FontWeight.w400, MyColor.primaryTextColor, () {
                  context.read<NavbarBloc>().add(NavigateToMen()); //from event
                }),
                Utils.getSizedBoxWidth(),
                Utils.getSizedBoxWidth(),
                Utils.buttonNave(
                    "Women", 13, FontWeight.w400, MyColor.primaryTextColor, () {
                  //   Todo go to Women
                }),
                Utils.getSizedBoxWidth(),
                Utils.getSizedBoxWidth(),
                Utils.buttonNave(
                    "Kid's", 13, FontWeight.w400, MyColor.primaryTextColor, () {
                  //   Todo go to kids cloths
                }),
              ],
            ),
            Utils.getSizedBoxWidth(),
            Utils.getSizedBoxWidth(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // sign in
                Utils.buttonNave(
                    "Log In", 13, FontWeight.w400, MyColor.primaryTextColor,
                    () {
                  context.read<NavbarBloc>().add(NavigateToLogin());
                }),

                Utils.getSizedBoxWidth(),
                Utils.getSizedBoxWidth(),

                // cart
                GestureDetector(
                  onTap: () {
                    //   Todo go to cart
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
