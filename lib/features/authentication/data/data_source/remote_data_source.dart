import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/utils/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_flutter/features/authentication/models/user_model.dart';

abstract class AuthRemoteDataSource {
  registerUser(UserModel user);
  loginUser();
  logoutUser();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.apiConsumer});
  final ApiConsumer apiConsumer;

  @override
  loginUser() {
    // TODO: implement loginUser
    throw UnimplementedError();
  }

  @override
  logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
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

    print(response.statusCode);
  }
}
