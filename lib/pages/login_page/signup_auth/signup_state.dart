part of 'signup_bloc.dart';

abstract class SignupState {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

// create similar functions as events but replace state
// sign up state
class NavigateToLogInState extends SignupState {}
