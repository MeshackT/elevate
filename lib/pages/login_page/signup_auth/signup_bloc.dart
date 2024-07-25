import 'package:bloc/bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // if event is the even on signup event
      if (event is NavigateToLogIn) {
        // call the method on state
        print("called NavigateToLogIn");
        emit(NavigateToLogInState());
      }
    });
  }
}
