import 'package:ecommerce_flutter/core/api/api_consumer.dart';
import 'package:ecommerce_flutter/core/api/error_handler.dart';
import 'package:ecommerce_flutter/core/api/status_code.dart';
import 'package:ecommerce_flutter/core/utils/constants.dart';
import 'package:http/http.dart';

class BaseClient extends ApiConsumer {
  Client baseClient = Client();
  Map<String, String> headers = {"Content-Type": "application/json"};

  @override
  Future<String> deleteResponse(String url, Object? body) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";
    Response response =
        await baseClient.delete(uri, headers: headers, body: body);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }

  @override
  Future<String> getResponse(String url) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";
    Response response = await baseClient.get(uri, headers: headers);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }

  @override
  Future<String> postResponse(String url, Object? body) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";
    Response response =
        await baseClient.post(uri, headers: headers, body: body);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      logger('error response', response.body);
      // ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }

  @override
  Future<String> updateResponse(String url, Object? body) async {
    Uri uri = Uri.parse(url);
    String responseBody = "";
    Response response =
        await baseClient.patch(uri, headers: headers, body: body);
    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      responseBody = response.body;
    } else {
      ErrorHandler.handleResponse(response);
    }
    return responseBody;
  }
}
