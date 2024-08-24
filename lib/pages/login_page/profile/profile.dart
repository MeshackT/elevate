import 'package:elevate/pages/login_page/profile/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../theme_utils/theme_utils.dart';
import '../../../utils/utils.dart';

class MyProfile extends StatelessWidget {
  const MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: MyColor.backgroundColor,
      ),
      extendBody: false,
      extendBodyBehindAppBar: false,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: MyColor.backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SizedBox(
          height: screenHeight * .9,
          width: screenWidth * .9,
          child: BlocProvider(
            create: (context) => ProfileBloc()..add(FetchUserProfile()),
            child: BlocListener<ProfileBloc, ProfileState>(
              listener: (context, state) {
                if (state is NavigateToUploadState) {
                  Navigator.of(context).pushNamed("/uploadImage");
                }
              },
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return Center(child: Utils.loadingIcon());
                  } else if (state is ProfileLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Utils.textHeader("My Profile", 16, FontWeight.w800,
                            MyColor.primaryTextColor),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: MyColor.backgroundColor,
                              child: Icon(
                                Icons.person,
                                color: MyColor.primaryIconColor,
                                size: 20,
                              ),
                            ),
                            Utils.getSizedBoxWidthFive(),
                            Utils.textHeader(state.userName, 14,
                                FontWeight.w400, MyColor.primaryTextColor),
                          ],
                        ),
                        Utils.getSizedBoxHeightFive(),
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: MyColor.backgroundColor,
                              child: Icon(
                                Icons.email,
                                color: MyColor.primaryIconColor,
                                size: 20,
                              ),
                            ),
                            Utils.getSizedBoxWidthFive(),
                            Utils.textHeader(state.email, 14, FontWeight.w400,
                                MyColor.primaryTextColor),
                          ],
                        ),
                        Utils.getSizedBoxHeightFive(),
                        // my orders
                        GestureDetector(
                          onTap: () {
                            Utils.logger.i("Pressed my history");
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => const MenPage()));
                          },
                          child: Container(
                            color: MyColor.backgroundBlackColor.withOpacity(.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Utils.textHeader("View my History", 10,
                                FontWeight.bold, MyColor.primaryWhiteTextColor),
                          ),
                        ),
                        Utils.getSizedBoxHeightFive(),

                        GestureDetector(
                          onTap: () {
                            Utils.logger.i("Navigate to Uploads");
                            context.read<ProfileBloc>().add(NavigateToUpload());
                          },
                          child: Container(
                            color: MyColor.backgroundBlackColor.withOpacity(.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Utils.textHeader("Upload products", 10,
                                FontWeight.bold, MyColor.primaryWhiteTextColor),
                          ),
                        ),

                        /////////////
                        Utils.getSizedBoxHeightFive(),

                        GestureDetector(
                          onTap: () {
                            Utils.logger.i("delete account");
                            context.read<ProfileBloc>().add(NavigateToUpload());
                          },
                          child: Container(
                            color: MyColor.primaryRedColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Utils.textHeader("Delete my account", 10,
                                FontWeight.bold, MyColor.primaryWhiteTextColor),
                          ),
                        ),
                        Utils.getSizedBoxHeight(),

                        GestureDetector(
                          onTap: () {
                            Utils.logger.i("Sign out");
                            context.read<ProfileBloc>().add(NavigateToUpload());
                          },
                          child: Container(
                            color: MyColor.backgroundBlackColor.withOpacity(.5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Utils.textHeader("Sign out", 10,
                                FontWeight.bold, MyColor.primaryWhiteTextColor),
                          ),
                        ),
                      ],
                    );
                  } else if (state is ProfileError) {
                    return Center(
                        child: Text(state.message,
                            style: TextStyle(color: Colors.red)));
                  } else {
                    return Center(child: Text('Unexpected state.'));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
