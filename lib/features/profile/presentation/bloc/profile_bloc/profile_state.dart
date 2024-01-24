part of 'profile_bloc.dart';

sealed class ProfileState {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

class GetProfileState extends ProfileState {
  GetProfileState(this.profileData);
  final Data? profileData;
}

class UpdateProfileState extends ProfileState {
  UpdateProfileState(this.message);
  final String message;
}

class ProfileErrorState extends ProfileState {
  ProfileErrorState(this.error);
  final String error;
}
