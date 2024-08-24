import 'package:elevate/pages/login_page/login_auth/log_in.dart';
import 'package:elevate/pages/login_page/profile/profile.dart';
import 'package:elevate/pages/login_page/signup_auth/sign_up.dart';
import 'package:elevate/pages/men_page/men_page.dart';
import 'package:elevate/pages/upload_images/upload.dart';
import 'package:elevate/pages/view_banner/view_banner.dart';
import 'package:elevate/pages/view_collection/new_collection.dart';
import 'package:elevate/pages/view_products/view_products.dart';
import 'package:elevate/pages/women_page/women_page.dart';
import 'package:elevate/theme_utils/theme_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_providers/app_bloc_providers.dart';
import 'firebase_options.dart';
import 'main_start/main_start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        initialRoute: "/profile",
        routes: {
          '/': (context) => const Start(),
          '/login': (context) => const LogIn(),
          '/signUp': (context) => const SignUp(),
          '/profile': (context) => const MyProfile(),
          '/uploadImage': (context) => const UploadImages(),
          '/view_products': (context) => const ViewProducts(),
          '/view_new_collections': (context) => const NewCollection(),
          '/view_banners': (context) => const ViewBanner(),
          '/men': (context) => const MenPage(),
          '/women': (context) => const WomenPage(),
          '/kids': (context) => const WomenPage(),
        },
      ),
    );
  }
}
