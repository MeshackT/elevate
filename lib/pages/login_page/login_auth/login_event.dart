part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// create similar functions as events but replace state
// sign up state
class NavigateToSignUp extends LoginEvent {}
