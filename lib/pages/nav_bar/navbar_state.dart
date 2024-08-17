part of 'navbar_bloc.dart';

abstract class NavbarState extends Equatable {
  const NavbarState();

  @override
  List<Object> get props => [];
}

class NavbarInitial extends NavbarState {}

class NavbarLoading extends NavbarState {}

class NavbarError extends NavbarState {
  final String message;

  const NavbarError(this.message);

  @override
  List<Object> get props => [message];
}

class NavigateToMenState extends NavbarState {}

class NavigateToWomenState extends NavbarState {}

class NavigateToKidsState extends NavbarState {}

class NavigateToLoginState extends NavbarState {}

class NavigateToTestState extends NavbarState {}

class NavigateToCartState extends NavbarState {}

class NavigateToMyProfileState extends NavbarState {}

class UserLoggedInState extends NavbarState {
  final User user;

  const UserLoggedInState(this.user);

  @override
  List<Object> get props => [user];
}

class UserLoggedOutState extends NavbarState {}
