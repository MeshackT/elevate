part of 'navbar_bloc.dart';

abstract class NavbarEvent extends Equatable {
  const NavbarEvent();

  @override
  List<Object> get props => [];
}

// navigate to these screens on event click
// Men
class NavigateToMen extends NavbarEvent {}

// Women
class NavigateToWomen extends NavbarEvent {}

// kids
class NavigateToKids extends NavbarEvent {}

// LoginSign up
class NavigateToLogin extends NavbarEvent {}

// Cart
class NavigateToCart extends NavbarEvent {}
