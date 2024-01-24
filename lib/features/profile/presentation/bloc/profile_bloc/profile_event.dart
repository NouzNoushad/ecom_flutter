part of 'profile_bloc.dart';

sealed class ProfileEvent {
  const ProfileEvent();
}

class GetProfileEvent extends ProfileEvent {
  GetProfileEvent();
}
