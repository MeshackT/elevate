part of 'profile_bloc.dart';

abstract class ProfileEvent {}

// create a function that fetches details on event
class FetchUserProfile extends ProfileEvent {}

// navigate to upload
class NavigateToUpload extends ProfileEvent {}
