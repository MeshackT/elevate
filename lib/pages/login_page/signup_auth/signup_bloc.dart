import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../models/user_model.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  SignupBloc(this._firebaseAuth, this._firestore) : super(SignupInitial()) {
    on<SignupEvent>((event, emit) async {
      // if event is the even on signup event
      if (event is NavigateToLogIn) {
        // call the method on state
        print("called NavigateToLogIn");
        emit(NavigateToLogInState());
      } else if (event is SignUpUser) {
        emit(SignupLoading()); //call the loading state before registering

        try {
          // register the user
          UserCredential userCredential =
              await _firebaseAuth.createUserWithEmailAndPassword(
            email: event.user.email,
            password: event.user.password,
          );

          // store the users details after registering
          await _firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'user_name': event.user.userName,
            'email': event.user.email,
            'admin': "no",
          });

          emit(SignupSuccess());
        } catch (e) {
          emit(SignupFailure(e.toString()));
        }
      }
    });
  }
}
