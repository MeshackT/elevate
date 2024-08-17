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

//Sign up phases
// loading
class SignupLoading extends SignupState {}

//success
class SignupSuccess extends SignupState {}

//failure
class SignupFailure extends SignupState {
  final String error;

  const SignupFailure(this.error);

  @override
  List<Object> get props => [error];
}
