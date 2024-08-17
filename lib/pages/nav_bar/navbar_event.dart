part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object> get props => [];
}

class CheckUserStatusUser extends NavbarEvent {}

class NavigateToMen extends NavbarEvent {}

class NavigateToWomen extends NavbarEvent {}

class NavigateToKids extends NavbarEvent {}

class NavigateToLogin extends NavbarEvent {}

class NavigateToTest extends NavbarEvent {}

class NavigateToMyProfile extends NavbarEvent {}

class NavigateToCart extends NavbarEvent {}
