import 'package:elevate/nav_bar/navbar_bloc.dart';
import 'package:elevate/pages/login_page/login_auth/login_bloc.dart';
import 'package:elevate/pages/login_page/signup_auth/signup_bloc.dart';
import 'package:elevate/pages/men_page/men_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  // add blocs as the app grows
  static get allBlocProviders => [
        // navbar
        BlocProvider(create: (context) => NavbarBloc()),
        // men, women, kids filters
        BlocProvider(create: (context) => MenBloc()),
        // authentication
        BlocProvider(create: (context) => SignupBloc()),
        BlocProvider(create: (context) => LoginBloc()),
      ];
}
