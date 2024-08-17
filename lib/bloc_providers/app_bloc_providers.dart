import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elevate/pages/login_page/login_auth/login_bloc.dart';
import 'package:elevate/pages/login_page/profile/profile_bloc.dart';
import 'package:elevate/pages/login_page/signup_auth/signup_bloc.dart';
import 'package:elevate/pages/men_page/men_bloc.dart';
import 'package:elevate/pages/upload_banner/uploadbanner_bloc.dart';
import 'package:elevate/pages/upload_images/upload_bloc.dart';
import 'package:elevate/pages/upload_new_collection/uploadnewcollection_bloc.dart';
import 'package:elevate/pages/view_products/view_products_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/nav_bar/navbar_bloc.dart';
import '../pages/view_banner/viewbanner_bloc.dart';
import '../pages/view_collection/newcollection_bloc.dart';

class AppBlocProviders {
  // add blocs as the app grows
  static get allBlocProviders => [
        // navbar
        BlocProvider(create: (context) => NavbarBloc()),
        // men, women, kids filters
        BlocProvider(create: (context) => MenBloc()),
        // authentication
        BlocProvider(
          create: (context) =>
              SignupBloc(FirebaseAuth.instance, FirebaseFirestore.instance),
        ),
        BlocProvider(
          create: (context) => LoginBloc(FirebaseAuth.instance),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => UploadBloc(),
        ),
        BlocProvider(
          create: (context) => UploadbannerBloc(),
        ),

        BlocProvider(
          create: (context) => UploadnewcollectionBloc(),
        ),
        BlocProvider(
          create: (context) => ViewProductsBloc(),
        ),
        BlocProvider(
          create: (context) => NewcollectionBloc(),
        ),
        BlocProvider(
          create: (context) => ViewbannerBloc(),
        ),
      ];
}
