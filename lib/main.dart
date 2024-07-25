import 'package:elevate/pages/login_page/login_auth/log_in.dart';
import 'package:elevate/pages/login_page/signup_auth/sign_up.dart';
import 'package:elevate/pages/men_page/men_page.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_providers/app_bloc_providers.dart';
import 'main_start/main_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: MaterialApp(
        title: 'Elevate',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: MyColor.backgroundColor,
          colorScheme: ColorScheme.fromSeed(seedColor: MyColor.backgroundColor),
          useMaterial3: true,
        ),
        // home: const Start(),
        initialRoute: "/",
        routes: {
          '/': (context) => const Start(),
          '/login': (context) => const LogIn(),
          '/signUp': (context) => const SignUp(),
          '/men': (context) => const MenPage(),
        },
      ),
    );
  }
}
