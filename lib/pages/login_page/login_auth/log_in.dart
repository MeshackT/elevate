import 'package:elevate/pages/login_page/login_auth/login_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.backgroundColor,
        iconTheme: const IconThemeData(
          color: MyColor.primaryIconColor,
        ),
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is NavigateToSignUpState) {
            Navigator.of(context).pushNamed("/signUp");
          }
        },
        child: Container(
          child: Center(
            child: Container(
              color: MyColor.backgroundColor,
              padding: const EdgeInsets.only(
                  left: 60, right: 60, top: 20, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Utils.textHeader(
                      "Log In", 46, FontWeight.bold, MyColor.primaryTextColor),
                  Utils.getSizedBoxHeight(),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2.3,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: MyColor.backgroundColor,
                              hintText: 'Enter your name',
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
                          Utils.getSizedBoxHeight(),
                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: MyColor.backgroundColor,
                              hintText: 'Enter your password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: const BorderSide(
                                  color: MyColor.primaryTextColor,
                                  width: 0.8,
                                ),
                              ),
                            ),
                            obscureText: true,
                            keyboardType: TextInputType.text,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Utils.buttonRed("Log In", 13, FontWeight.w400,
                      MyColor.primaryWhiteTextColor, () => null),
                  Utils.getSizedBoxHeight(),
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign up here',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            decoration: TextDecoration.underline,
                          ),
                          // Add your navigation logic here
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // go to sign up page Event method
                              context.read<LoginBloc>().add(NavigateToSignUp());
                            },
                        ),
                      ],
                    ),
                  ),
                  Utils.getSizedBoxHeight(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
