import 'package:elevate/pages/login_page/signup_auth/signup_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/utils.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.backgroundColor,
        iconTheme: IconThemeData(
          color: MyColor.primaryIconColor,
        ),
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is NavigateToLogInState) {
            // go to login
            Navigator.of(context).pushNamed("/login");
          }
        },
        child: Center(
          child: Container(
            color: MyColor.backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Utils.textHeader(
                    "Sign Up", 46, FontWeight.bold, MyColor.primaryTextColor),
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
                        Utils.getSizedBoxHeight(),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: MyColor.backgroundColor,
                            hintText: 'Confirm your password',
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
                        Utils.getSizedBoxHeight(),
                      ],
                    ),
                  ),
                ),
                Utils.buttonRed(
                    "Continue",
                    13,
                    FontWeight.w400,
                    MyColor.primaryWhiteTextColor,
                    () =>
                        // TODO Sign up
                        null),
                Utils.getSizedBoxHeight(),
                Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        text: 'Login here',
                        style: const TextStyle(
                          color: MyColor.primaryTextColor,
                          decoration: TextDecoration.underline,
                        ),
                        // Add your navigation logic here
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //   log In
                            // event method
                            context.read()<SignupBloc>().add(NavigateToLogIn());
                          },
                      ),
                    ],
                  ),
                ),
                Utils.getSizedBoxHeight(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Checkbox(
                //       value: false,
                //       onChanged: (bool? value) {
                //         // Todo Check box
                //       },
                //     ),
                //     const Expanded(
                //       child: Text(
                //         'By continuing, I agree to the terms of use and privacy policy',
                //         style: TextStyle(
                //             fontSize: 12.0, color: MyColor.primaryTextColor),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
