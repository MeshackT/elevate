part of 'navbar_bloc.dart';

abstract class NavbarState extends Equatable {
  const NavbarState();

  @override
  List<Object> get props => [];
}

class NavbarInitial extends NavbarState {}

// create similar functions as events but replace state
// Men state
class NavigateToMenState extends NavbarState {}

// Women State
class NavigateToWomenState extends NavbarState {}

// kids State
class NavigateToKidsState extends NavbarState {}

// login State
class NavigateToLoginState extends NavbarState {}

// cart State
class NavigateToCartState extends NavbarState {}
