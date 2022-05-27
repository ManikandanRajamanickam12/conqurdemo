class VerifyOtpRequest {
  VerifyOtpRequest({this.authToken, this.otpText});

  VerifyOtpRequest.fromJson(dynamic json) {
    authToken = json['auth_token'];
    otpText = json['otp_text'];
  }
  String? authToken;
  String? otpText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['auth_token'] = authToken;
    map['otp_text'] = otpText;
    map['is_web'] = false;
    return map;
  }
}
