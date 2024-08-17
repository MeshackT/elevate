import 'package:elevate/pages/login_page/signup_auth/signup_bloc.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/user_model.dart';
import '../../../utils/utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userName = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    bool load = false;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MyColor.backgroundColor,
        iconTheme: const IconThemeData(
          color: MyColor.primaryIconColor,
        ),
      ),
      body: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state is NavigateToLogInState) {
            // go to login
            Navigator.of(context).pushNamed("/login");
          } else if (state is SignupLoading) {
            setState(() {
              load = true;
            });
          } else if (state is SignupSuccess) {
            setState(() {
              load = false;
            });
            // Navigate to some success page or show a success message
          } else if (state is SignupFailure) {
            // Show error message
            setState(() {
              load = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                content: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: MyColor.backgroundBlackColor,
                    padding: const EdgeInsets.all(10),
                    child: Utils.textHeader(
                      "Passwords do not match",
                      13,
                      FontWeight.bold,
                      MyColor.primaryWhiteTextColor,
                    ),
                  ),
                ),
                behavior: SnackBarBehavior.floating,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            );
          }
        },
        child: BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
          if (state is SignupLoading) {
            return Center(child: Utils.loadingIcon());
          }
          return Center(
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
                            controller: userName,
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
                            keyboardType: TextInputType.text,
                          ),
                          Utils.getSizedBoxHeight(),
                          TextField(
                            controller: email,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: MyColor.backgroundColor,
                              hintText: 'Enter your email',
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
                            controller: password,
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
                            controller: confirmPassword,
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
                  load == true
                      ? Utils.loadingIcon()
                      : Utils.buttonRed("Continue", 13, FontWeight.w400,
                          MyColor.primaryWhiteTextColor, () {
                          // TODO Sign up
                          if (password.text == confirmPassword.text &&
                              email.text.isNotEmpty) {
                            // pass the data on the constructor
                            UserModel user = UserModel(
                              userName: userName.text.trim(),
                              email: email.text.trim(),
                              password: password.text.trim(),
                            );
                            setState(() {
                              load = true;
                            });

                            // register the user and store the data
                            context.read<SignupBloc>().add(SignUpUser(user));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: MyColor.backgroundBlackColor,
                                content: Utils.textHeader(
                                    "Passwords do not match",
                                    13,
                                    FontWeight.bold,
                                    MyColor.primaryTextColor),
                              ),
                            );
                          }
                        }),
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
                              context.read<SignupBloc>().add(NavigateToLogIn());
                            },
                        ),
                      ],
                    ),
                  ),
                  Utils.getSizedBoxHeight(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
