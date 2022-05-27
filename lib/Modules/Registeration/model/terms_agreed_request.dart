class TermsAgreedRequest {
  TermsAgreedRequest({
    this.termsAgreed,
    this.userId,
  });

  TermsAgreedRequest.fromJson(dynamic json) {
    termsAgreed = json['terms_agreed'];
    userId = json['user_id'];
  }
  bool? termsAgreed;
  int? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['terms_agreed'] = termsAgreed;
    map['user_id'] = userId;
    return map;
  }
}
