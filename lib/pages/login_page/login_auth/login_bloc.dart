import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_event.dart';
part 'login_state.dart';

// Extend the even and state
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuth _firebaseAuth;

  LoginBloc(this._firebaseAuth) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is CheckUserStatus) {
        emit(LoginLoading());

        try {
          User? user = _firebaseAuth.currentUser;
          if (user != null) {
            emit(UserLoggedIn(user));
          } else {
            emit(UserLoggedOut());
          }
        } catch (e) {
          emit(LoginFailure(e.toString()));
        }
      } else if (event is NavigateToSignUp) {
        emit(NavigateToSignUpState());
      } else if (event is LogInUser) {
        emit(LoginLoading());

        try {
          await _firebaseAuth.signInWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(LoginSuccess());
        } catch (e) {
          emit(LoginFailure(e.toString()));
        }
      }
    });
    on<NavigateToStart>((event, emit) => emit(NavigateToStartState()));
  }
}
