import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data_source/remote_data_source.dart';
import '../../../models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRemoteDataSource})
      : super(const AuthState(null));
  final AuthRemoteDataSource authRemoteDataSource;
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    if (image != null) {
      imageFile = File(image.path);
      logger('image', imageFile);
      emit(state.copyWith(imageFile: imageFile));
    }
  }

  registerUser(
      String username, String email, String password, File image) async {
    UserModel user = UserModel(
        username: username, email: email, password: password, image: image);
    await authRemoteDataSource.registerUser(user);
    imageFile = null;
    emit(state.copyWith(imageFile: imageFile));
  }

  loginUser(String email, String password) async {
    String response = await authRemoteDataSource.loginUser(email, password);
    logger('login response', response);
  }
}
