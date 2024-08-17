part of 'login_bloc.dart';

abstract class LoginEvent {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// create similar functions as events but replace state
// sign up state
class NavigateToSignUp extends LoginEvent {}

class NavigateToStart extends LoginEvent {}

class CheckUserStatus extends LoginEvent {}

// create a logIn function trigger
class LogInUser extends LoginEvent {
  final String email;
  final String password;

  const LogInUser(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
