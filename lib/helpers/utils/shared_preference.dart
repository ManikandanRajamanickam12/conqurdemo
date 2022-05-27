import 'dart:async' show Future;

import 'package:shared_preferences/shared_preferences.dart';

class StorageManager {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<bool?> setLastSyncedDevice(String value) async {
    _prefsInstance?.setString(UserDefaultKeys.lastSyncedDevice, value) ??
        Future.value(false);
  }

  static String? getLastSyncedDevice() {
    return _prefsInstance?.getString(UserDefaultKeys.lastSyncedDevice);
  }

  static Future<bool?> setSessionStartTime(int value) async =>
      await _prefsInstance?.setInt(UserDefaultKeys.sessionStartTime, value);

  static int? getSessionStartTime() =>
      _prefsInstance?.getInt(UserDefaultKeys.sessionStartTime);

  static Future<bool?> setSessionCount(int value) async {
    _prefsInstance?.setInt(UserDefaultKeys.sessionCount, value) ??
        Future.value(false);
  }

  static int? getSessionCount() {
    return _prefsInstance?.getInt(UserDefaultKeys.sessionCount);
  }

  static Future<bool?> setRecentTableName(String value) async {
    _prefsInstance?.setString(UserDefaultKeys.recentTableName, value) ??
        Future.value(false);
  }

  static String? getRecentTableName() {
    return _prefsInstance?.getString(UserDefaultKeys.recentTableName);
  }

  static Future<bool?> setSessionToken(String value) async {
    _prefsInstance?.setString(UserDefaultKeys.sessionToken, value) ??
        Future.value(false);
  }

  static String? getSessionToken() {
    return _prefsInstance?.getString(UserDefaultKeys.sessionToken);
  }

  static Future<bool?> setUserLoggedIn(bool value) async {
    _prefsInstance?.setBool(UserDefaultKeys.isUserLoggedIn, value) ??
        Future.value(false);
  }

  static bool? getUserStatus() {
    return _prefsInstance?.getBool(UserDefaultKeys.isUserLoggedIn);
  }

  static Future<bool?> setEvent(String value, String token) async {
    _prefsInstance?.setString(UserDefaultKeys.event + token, value) ??
        Future.value(false);
  }

  static String? getAddedEvent(String token) {
    return _prefsInstance?.getString(UserDefaultKeys.event + token);
  }

  static Future<bool?> setSubscriptionStatus(bool value) async {
    _prefsInstance?.setBool(UserDefaultKeys.subscriptionStatus, value) ??
        Future.value(false);
  }

  static bool? getSubscriptionStatus() {
    return _prefsInstance?.getBool(UserDefaultKeys.subscriptionStatus);
  }

  static Future<bool?> setFirmwareStatus(bool value) async {
    _prefsInstance?.setBool(UserDefaultKeys.isLatestFirmware, value) ??
        Future.value(false);
  }

  static bool? getFirmwareStatus() {
    return _prefsInstance?.getBool(UserDefaultKeys.isLatestFirmware);
  }

  static Future<bool?> setEmailAddress(String value) async =>
      await _prefsInstance?.setString(UserDefaultKeys.email, value);

  static String? getEmailAddress() =>
      _prefsInstance?.getString(UserDefaultKeys.email);

  static Future<bool?> setProfileDetails(String value) async =>
      await _prefsInstance?.setString(UserDefaultKeys.profileDetails, value);

  static String? getProfileDetails() =>
      _prefsInstance?.getString(UserDefaultKeys.profileDetails);

  static Future<bool?> setDeviceModelDetails(String value) async =>
      await _prefsInstance?.setString(
          UserDefaultKeys.deviceModelDetails, value);

  static String? getDeviceModelDetails() =>
      _prefsInstance?.getString(UserDefaultKeys.deviceModelDetails);

  static Future<bool?> setDeviceDetails(String value) async =>
      await _prefsInstance?.setString(UserDefaultKeys.deviceDetails, value);

  static String? getDeviceDetails() =>
      _prefsInstance?.getString(UserDefaultKeys.deviceDetails);

  static List<String>? getAverageHrDetails(String? token) =>
      _prefsInstance?.getStringList(UserDefaultKeys.averageHr + "_${token}");

  static Future<bool?> setStepCount(String value) async =>
      await _prefsInstance?.setString(UserDefaultKeys.stepCount, value);

  static String? getStepCount() =>
      _prefsInstance?.getString(UserDefaultKeys.stepCount);

  static Future<bool?> setJwtToken(String value) async {
    _prefsInstance?.setString(UserDefaultKeys.jwtToken, value) ??
        Future.value(false);
  }

  static String? getJwtToken() {
    return _prefsInstance?.getString(UserDefaultKeys.jwtToken);
  }

  static Future<bool?> setUserDetails(String value) async =>
      await _prefsInstance?.setString(UserDefaultKeys.userDetails, value);

  static String? getUserDetails() =>
      _prefsInstance?.getString(UserDefaultKeys.userDetails);

  static Future<bool?> setDeviceId(int value) async =>
      await _prefsInstance?.setInt(UserDefaultKeys.deviceId, value);

  static int? getDeviceId() => _prefsInstance?.getInt(UserDefaultKeys.deviceId);

  static clearAllDatas() {
    _prefsInstance?.clear();
  }
}

class UserDefaultKeys {
  static var lastSyncedDevice = "lastSyncedDevice";
  static var sessionStartTime = "startTime";
  static var sessionCount = "sessionCount";
  static var recentTableName = "recentTableName";
  static var sessionToken = "sessionToken";
  static var isUserLoggedIn = "isUserLoggedIn";
  static var subscriptionStatus = "subscriptionStatus";
  static var event = "event";
  static var isEventRunning = "isEventRunning";
  static var isLatestFirmware = "isLatestFirmware";
  static var email = "email";
  static var profileDetails = "profileDetails";
  static var deviceDetails = "deviceDetails";
  static var deviceModelDetails = "deviceModelDetails";
  static var averageHr = "averageHr";
  static var stepCount = "stepCount";
  static var jwtToken = "jwtToken";
  static var userDetails = "userDetails";
  static var deviceId = "deviceId";
}
