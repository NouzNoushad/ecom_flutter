import 'package:http/http.dart';

import '../errors/exceptions.dart';
import 'status_code.dart';

class ErrorHandler {
  static handleResponse(response) => _handleResponse(response);
  static _handleResponse(Response response) {
    switch (response.statusCode) {
      case StatusCode.noContent:
        throw NoContentException(
            message: "No Content Found!",
            url: response.request?.url.toString());
      case StatusCode.partialContent:
        throw PartialContentException(
            message: "Partial Content Found",
            url: response.request?.url.toString());
      case StatusCode.badRequest:
        throw BadRequestException(
            message: "Bad Request!", url: response.request?.url.toString());
      case StatusCode.unauthorized:
        throw UnauthorizedException(
            message: "Unauthorized", url: response.request?.url.toString());
      case StatusCode.forbidden:
        throw ForbiddenException(
            message: "Forbidden Content",
            url: response.request?.url.toString());
      case StatusCode.notFound:
        throw NotFoundException(
            message: "Not Found", url: response.request?.url.toString());
      case StatusCode.invalidRequest:
        throw InvalidRequestException(
            message: "Invalid Request", url: response.request?.url.toString());
      case StatusCode.invalidData:
        throw NoContentException(
            message: "Invalid Data", url: response.request?.url.toString());
      case StatusCode.internalServerError:
        throw InternalServerErrorException(
            message: "Internal Server Error",
            url: response.request?.url.toString());
      case StatusCode.badGateway:
        throw BadGatewayException(
            message: "Bad Gateway", url: response.request?.url.toString());
      default:
        throw FetchDataException(
            message: "Unable to Fetch Data",
            url: response.request?.url.toString());
    }
  }
}
