class UserDetailsRequest {
  UserDetailsRequest({
    this.firstName,
    this.userId,
    this.dateOfBirth,
    this.gender,
  });

  UserDetailsRequest.fromJson(dynamic json) {
    firstName = json['first_name'];
    userId = json['user_id'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
  }
  String? firstName;
  int? userId;
  String? dateOfBirth;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['user_id'] = userId;
    map['date_of_birth'] = dateOfBirth;
    map['gender'] = gender;
    return map;
  }
}
