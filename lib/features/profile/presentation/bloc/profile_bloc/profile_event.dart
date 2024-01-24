part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  GetProfileEvent();
}

class UpdateProfileEvent extends ProfileEvent {
  UpdateProfileEvent(this.username, this.email, this.id);
  final String username;
  final String email;
  final String id;
}
