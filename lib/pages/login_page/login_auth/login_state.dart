part of 'login_bloc.dart';

abstract class LoginState {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

// create similar functions as events but replace state
// sign up state
class NavigateToSignUpState extends LoginState {}

class NavigateToStartState extends LoginState {}

//create a state for log in
// loading
class LoginLoading extends LoginState {}

// success
class LoginSuccess extends LoginState {}

// failure
class LoginFailure extends LoginState {
  final String error;

  const LoginFailure(this.error);

  @override
  List<Object> get props => [error];
}

class UserLoggedIn extends LoginState {
  final User user;

  UserLoggedIn(this.user);
}

class UserLoggedOut extends LoginState {}
