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
