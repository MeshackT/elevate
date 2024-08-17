import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ProfileBloc() : super(ProfileInitial()) {
    on<FetchUserProfile>((event, emit) async {
      // load first
      emit(ProfileLoading());
      // try this next
      try {
        User? user = _auth.currentUser;
        if (user != null) {
          DocumentSnapshot userDoc =
              await _firestore.collection('users').doc(user.uid).get();
          if (userDoc.exists) {
            Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
            String userName = data['user_name'] ?? 'Unknown';
            String email = data['email'] ?? 'No email';
            String admin = data['admin'] ?? 'No admin';
            emit(ProfileLoaded(userName: userName, email: email, admin: admin));
          } else {
            emit(ProfileError(message: 'User document does not exist.'));
          }
        } else {
          emit(ProfileError(message: 'No user is currently logged in.'));
        }
      } catch (e) {
        emit(ProfileError(
            message: 'Failed to fetch user profile: ${e.toString()}'));
      }
    });
    on<NavigateToUpload>((event, emit) => emit(NavigateToUploadState()));
  }
}
