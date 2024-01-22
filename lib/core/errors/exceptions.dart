class ServerExceptions implements Exception {
  final String? message;
  final String? url;
  final String? prefix;

  ServerExceptions({required this.message, required this.url, this.prefix});
}

class NoContentException extends ServerExceptions {
  NoContentException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'No Content');
}

class PartialContentException extends ServerExceptions {
  PartialContentException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Partial Content');
}

class BadRequestException extends ServerExceptions {
  BadRequestException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Request');
}

class UnauthorizedException extends ServerExceptions {
  UnauthorizedException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Unauthorized');
}

class ForbiddenException extends ServerExceptions {
  ForbiddenException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Forbidden');
}

class InvalidDataException extends ServerExceptions {
  InvalidDataException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Invalid Data');
}

class NotFoundException extends ServerExceptions {
  NotFoundException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Not Found');
}

class InvalidRequestException extends ServerExceptions {
  InvalidRequestException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Invalid Request');
}

class InternalServerErrorException extends ServerExceptions {
  InternalServerErrorException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Internal Server Error');
}

class BadGatewayException extends ServerExceptions {
  BadGatewayException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Bad Gateway');
}

class FetchDataException extends ServerExceptions {
  FetchDataException({String? message, String? url, String? prefix})
      : super(message: message, url: url, prefix: 'Unable to Fetch Data');
}
