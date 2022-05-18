import 'package:conqur/helpers/utils/Constants.dart';

class VerifyOtpResponse {
  VerifyOtpResponse({
    int? userId,
    String? token,
    String? joinedOn,
    String? message,
    Device? device,
    UserEntryType? userEntryCode,
  }) {
    userId = userId;
    token = token;
    joinedOn = joinedOn;
    message = message;
    device = device;
    userEntryCode = userEntryCode;
  }

  VerifyOtpResponse.fromJson(dynamic json) {
    userId = json['user_id'];
    token = json['token'];
    joinedOn = json['joined_on'];
    message = json['message'];
    device = json['device'] != null ? Device.fromJson(json['device']) : null;
    userEntryCode = IUserEntryType.getType(json['user_entry_code']);
  }
  int? userId;
  String? token;
  String? joinedOn;
  String? message;
  Device? device;
  UserEntryType? userEntryCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['token'] = token;
    map['joined_on'] = joinedOn;
    map['message'] = message;
    if (device != null) {
      map['device'] = device?.toJson();
    }
    map['user_entry_code'] = userEntryCode?.name;
    return map;
  }
}

class Device {
  Device(
      {String? model,
      String? osVersion,
      String? firebaseId,
      int? deviceId,
      String? deviceUniqueId}) {
    _model = model;
    _osVersion = osVersion;
    _firebaseId = firebaseId;
    _deviceId = deviceId;
    _deviceUniqueId = deviceUniqueId;
  }

  Device.fromJson(dynamic json) {
    _model = json['model'];
    _osVersion = json['os_version'];
    _firebaseId = json['firebase_id'];
    _deviceId = json['device_id'];
    _deviceUniqueId = json['device_unique_id'];
  }
  String? _model;
  String? _osVersion;
  String? _firebaseId;
  int? _deviceId;
  String? _deviceUniqueId;

  String? get model => _model;
  String? get osVersion => _osVersion;
  String? get firebaseId => _firebaseId;
  int? get deviceId => _deviceId;
  String? get deviceUniqueId => _deviceUniqueId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['model'] = _model;
    map['os_version'] = _osVersion;
    map['firebase_id'] = _firebaseId;
    map['device_id'] = _deviceId;
    map['device_unique_id'] = _deviceUniqueId;
    return map;
  }
}
