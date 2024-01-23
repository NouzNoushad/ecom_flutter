import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/core/utils/strings.dart';
import 'package:ecommerce_flutter/features/authentication/models/login_response.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<bool> loginUser(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String response = await authRemoteDataSource.loginUser(email, password);
    logger('login response', response);
    var loginResponse = LoginResponse.fromJson(jsonDecode(response));
    sharedPreferences.setString(AppStrings.token, loginResponse.token ?? '');
    return true;
  }

  logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await authRemoteDataSource.logoutUser();
    sharedPreferences.remove(AppStrings.token);
  }
}
