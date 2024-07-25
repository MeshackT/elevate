import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

// Extend the even and state
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      if (event is NavigateToSignUp) {
        emit(NavigateToSignUpState());
      }
    });
  }
}
