import 'dart:io';

class UserModel {
  final String username;
  final String email;
  final String password;
  final File image;

  UserModel(
      {required this.username,
      required this.email,
      required this.password,
      required this.image});
}
