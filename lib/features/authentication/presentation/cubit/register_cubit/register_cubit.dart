import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:ecommerce_flutter/features/authentication/data/data_source/remote_data_source.dart';
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.authRemoteDataSource
  }) : super(RegisterInitial());
  final AuthRemoteDataSource authRemoteDataSource;
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source);
    imageFile = File(image!.path);
    logger('image', imageFile);
  }

  registerUser(String username, String email, String password) async {
    UserModel user = UserModel(username: username, email: email, password: password, image: imageFile!);
    await authRemoteDataSource.registerUser(user);
  }
}
