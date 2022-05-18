class LoginResponse {
  LoginResponse({
    String? authToken,
    String? message,
  }) {
    _authToken = authToken;
    _message = message;
  }

  LoginResponse.fromJson(dynamic json) {
    _authToken = json['auth_token'];
    _message = json['message'];
  }
  String? _authToken;
  String? _message;

  String? get authToken => _authToken;
  String? get message => _message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = _authToken;
    map['message'] = _message;
    return map;
  }
}
