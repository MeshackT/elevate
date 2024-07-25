part of 'signup_bloc.dart';

abstract class SignupEvent {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

// create similar functions as events but replace state
// sign up state
class NavigateToLogIn extends SignupEvent {}
