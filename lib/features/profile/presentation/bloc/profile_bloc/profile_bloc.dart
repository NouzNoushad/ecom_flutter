import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/features/profile/data_source/profile_data_source.dart';

import '../../../models/product_response.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileDataSource profileDataSource;
  ProfileBloc({required this.profileDataSource}) : super(ProfileInitial()) {
    on<GetProfileEvent>(getUserProfile());
    on<UpdateProfileEvent>(updateProfile());
  }

  EventHandler<GetProfileEvent, ProfileState> getUserProfile() =>
      ((event, emit) async {
        emit(ProfileLoadingState());
        try {
          Data? profileData = await profileDataSource.getUserProfile();
          if (profileData != null) {
            emit(GetProfileState(profileData));
          }
        } catch (error) {
          emit(ProfileErrorState(error.toString()));
        }
      });

  EventHandler<UpdateProfileEvent, ProfileState> updateProfile() =>
      ((event, emit) async {
        try {
          String? message = await profileDataSource.updateProfile(
              event.username, event.email, event.id);
          add(GetProfileEvent());
          if (message != null) {
            emit(UpdateProfileState(message));
          }
        } catch (error) {
          emit(ProfileErrorState(error.toString()));
        }
      });
}
