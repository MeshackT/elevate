import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../utils/utils.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  NavbarBloc() : super(NavbarInitial()) {
    on<CheckUserStatusUser>((event, emit) async {
      emit(NavbarLoading());
      try {
        User? user = _auth.currentUser;
        if (user != null) {
          emit(UserLoggedInState(user));
        } else {
          emit(UserLoggedOutState());
        }
      } catch (e) {
        emit(NavbarError(e.toString()));
      }
    });
    // navigate to men page
    on<NavigateToMen>((event, emit) {
      Utils.logger.i("Men pressed emit to call the state");
      emit(NavigateToMenState());
    });
    on<NavigateToWomen>((event, emit) {
      Utils.logger.i("WOmen clicked emit to call the state 2");
      emit(NavigateToWomenState());
    });
    on<NavigateToKids>((event, emit) => emit(NavigateToKidsState()));
    on<NavigateToLogin>((event, emit) {
      Utils.logger.i("emit function 2");
      emit(NavigateToLoginState());
    });
    // Test
    on<NavigateToCart>((event, emit) => emit(NavigateToCartState()));
    on<NavigateToMyProfile>((event, emit) => emit(NavigateToMyProfileState()));
  }
}
