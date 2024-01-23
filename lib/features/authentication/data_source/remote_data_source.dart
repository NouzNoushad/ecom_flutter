import 'dart:convert';

import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/core/utils/strings.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthRemoteDataSource {
  registerUser(UserModel user);
  loginUser(String email, String password);
  logoutUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  Future<String> loginUser(String email, String password) async {
    String url = "${Endpoints.baseUrl}/${Endpoints.login}";
    Map<String, dynamic> body = {
      "email": email,
      "password": password,
    };
    String response = await apiConsumer.postResponse(url, jsonEncode(body));
    return response;
  }

  @override
  logoutUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String token = sharedPreferences.getString(AppStrings.token) ?? "";
    Map<String, String> headers = {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };
    String url = '${Endpoints.baseUrl}/${Endpoints.logout}';
    String response = await apiConsumer.getResponse(url, headers);
    logger('logout response', response);
  }

  @override
  registerUser(UserModel user) async {
    var postUri = Uri.parse('${Endpoints.baseUrl}/${Endpoints.register}');

    http.MultipartRequest request = http.MultipartRequest("POST", postUri);

    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath('image', user.image.path);

    request.files.add(multipartFile);
    request.fields['username'] = user.username;
    request.fields['email'] = user.email;
    request.fields['password'] = user.password;

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    print(res.body);
  }
}
