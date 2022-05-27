class LoginRequest {
  LoginRequest({
    this.email,
    this.mobile,
    this.device,
  });

  LoginRequest.fromJson(dynamic json) {
    email = json['email'];
    mobile = json['mobile'];
    device = json['device'] != null ? Device.fromJson(json['device']) : null;
  }
  String? email;
  String? mobile;
  Device? device;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['mobile'] = mobile;
    if (device != null) {
      map['device'] = device?.toJson();
    }
    return map;
  }
}

class Device {
  Device(
      {this.model,
      this.osVersion,
      this.firebaseId,
      this.deviceId,
      this.appVersion});

  Device.fromJson(dynamic json) {
    model = json['model'];
    osVersion = json['os_version'];
    firebaseId = json['firebase_id'];
    deviceId = json['device_id'];
    appVersion = json['app_version'];
  }
  String? model;
  String? osVersion;
  String? firebaseId;
  String? deviceId;
  String? appVersion;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model'] = model;
    map['os_version'] = osVersion;
    map['firebase_id'] = firebaseId;
    map['device_id'] = deviceId;
    map['app_version'] = appVersion;
    return map;
  }
}
