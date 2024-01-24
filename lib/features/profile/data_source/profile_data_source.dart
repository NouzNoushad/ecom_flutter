import 'dart:convert';

import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:ecommerce_flutter/core/utils/strings.dart';
import 'package:ecommerce_flutter/features/profile/models/product_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProfileDataSource {
  getUserProfile();
  updateProfile(String username, String email, String id);
}

class ProfileDataSourceImpl extends ProfileDataSource {
  ProfileDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;
  @override
  Future<Data?> getUserProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String url = '${Endpoints.baseUrl}/${Endpoints.profile}';
    String email = sharedPreferences.getString(AppStrings.email) ?? "";
    Map<String, dynamic> body = {'email': email};
    String response = await apiConsumer.postResponse(url, jsonEncode(body));
    if (response != "") {
      logger('profile', response);
      ProfileResponse profileResponse =
          ProfileResponse.fromJson(jsonDecode(response));
      return profileResponse.data;
    }
    return null;
  }

  @override
  updateProfile(String username, String email, String id) async {
    String url = "${Endpoints.baseUrl}/${Endpoints.profileUpdate}/$id";
    Map<String, dynamic> profile = {
      'username': username,
      'email': email,
    };
    String response =
        await apiConsumer.updateResponse(url, jsonEncode(profile));
    if (response != "") {
      logger('profile update', response);
      return jsonDecode(response)['message'];
    }
    return null;
  }
}
