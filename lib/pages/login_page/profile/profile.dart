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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Utils.textHeader(state.userName, 14, FontWeight.w400,
                            MyColor.primaryTextColor),
                        Utils.getSizedBoxHeight(),
                        Utils.textHeader(state.email, 14, FontWeight.w400,
                            MyColor.primaryTextColor),
                        Utils.getSizedBoxHeight(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Utils.buttonRedSmaller(
                                "Sign Out",
                                14,
                                FontWeight.w400,
                                MyColor.primaryWhiteTextColor,
                                () => null),
                            Utils.buttonRedSmaller(
                                "Delete my account",
                                14,
                                FontWeight.w400,
                                MyColor.primaryWhiteTextColor,
                                () => null),
                          ],
                        ),
                        Utils.buttonRed("Uploads", 14, FontWeight.w600,
                            MyColor.primaryWhiteTextColor, () {
                          // navigate to uploads
                          context.read<ProfileBloc>().add(NavigateToUpload());
                        })
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
