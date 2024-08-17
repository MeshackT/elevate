part of 'profile_bloc.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class NavigateToUploadState extends ProfileState {}

// on loading
class ProfileLoading extends ProfileState {}

// on load fetch
class ProfileLoaded extends ProfileState {
  final String userName;
  final String email;
  final String admin;

  ProfileLoaded(
      {required this.userName, required this.email, required this.admin});
}

// on error
class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
