import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_event.dart';
part 'navbar_state.dart';

// Extend the even and state
class NavbarBloc extends Bloc<NavbarEvent, NavbarState> {
  // NavbarInitial from NavbarState
  NavbarBloc() : super(NavbarInitial()) {
    on<NavbarEvent>((event, emit) {
      if (event is NavigateToMen) {
        emit(NavigateToMenState());
      } else if (event is NavigateToWomen) {
        emit(NavigateToWomenState());
      } else if (event is NavigateToKids) {
        emit(NavigateToKidsState());
      } else if (event is NavigateToLogin) {
        emit(NavigateToLoginState());
      } else if (event is NavigateToCart) {
        emit(NavigateToCartState());
      }
    });
  }
}
