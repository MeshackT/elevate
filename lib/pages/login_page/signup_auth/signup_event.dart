part of 'signup_bloc.dart';

abstract class SignupEvent {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

//create a sign up event to be triggered
class SignUpUser extends SignupEvent {
  final UserModel user;

  const SignUpUser(this.user);

  @override
  List<Object> get props => [user];
}

// create similar functions as events but replace state
// sign up state
class NavigateToLogIn extends SignupEvent {}
