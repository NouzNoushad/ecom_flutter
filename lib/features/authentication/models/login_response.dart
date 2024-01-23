class LoginResponse {
  String? _message;
  String? _token;

  LoginResponse({String? message, String? token}) {
    if (message != null) {
      _message = message;
    }
    if (token != null) {
      _token = token;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  String? get token => _token;
  set token(String? token) => _token = token;

  LoginResponse.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = _message;
    data['token'] = _token;
    return data;
  }
}
