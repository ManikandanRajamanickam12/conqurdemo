import 'package:conqur/helpers/utils/Theme.dart';
import 'package:conqur/helpers/utils/commander.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

const stressTestProgressWidth = 0.7;

class Constants {}

class DashboardNames {
  static var subTitle = "Member since";
  static var connectSensorTitle = "Connect to a sensor to start session";
  static var connectSensorButton1 = "CONNECT SENSOR";
  static var connectingSensorTitle = "Connecting to the sensor. . .";
  static var recentSessionTitle = "Your Recent Session";
  static var recentSessionSubtitle = "Taken on";
  static var recovery = "RECOVERY";
  static var sleep = "SLEEP";
  static var stress = "STRESS";
  static var activity = "ACTIVITY";
  static var recentSessionButton1 = "VIEW DETAIL REPORT";
  static var recentSessionButton2 = "VIEW ALL REPORTS";
  static var weightUpdateAlertTitle = "Weight Update";
  static var weightUpdateAlertDescription =
      "Updating your current body weight regularly helps in generating accurate reports. Do you wish to update?";
  static var weightUpdateAlertPositiveButton = "UPDATE";
  static var weightUpdateAlertNegativeButton = "SKIP";
  static var sessionAlertTitle = "Session Alert";
  static var sessionAlertDescription =
      "A session started will go on for 24 hours. It is highly recommended to not stop the session within this duration. Do you wish to proceed?";
  static var sessionAlertPositiveButton = "PROCEED";
  static var sessionAlertNegativeButton = "CANCEL";
  static var calibrationAlertTitle =
      "It is recommended to calibrate the accelerometer for accurate measurements.";
  static var calibrationAlertDescription = "Perform accelerometer calibration?";
  static var calibartionAlertPositiveButton = "CALIBRATE";
  static var calibrationAlertNegativeButton = "SKIP";
}

class AccountPageNames {
  static var title = "Member since";
  static var connectSensorTitle = "Connect to a sensor to start session";
  static var connectSensorButton1 = "CONNECT SENSOR";
  static var connectingSensorTitle = "Connecting to the sensor. . .";
  static var recentSessionTitle = "Your Recent Session";
  static var recentSessionSubtitle = "Taken on";
  static var recovery = "RECOVERY";
  static var sleep = "SLEEP";
  static var stress = "STRESS";
  static var activity = "ACTIVITY";
  static var recentSessionButton1 = "VIEW DETAIL REPORT";
  static var recentSessionButton2 = "VIEW ALL REPORTS";
  static var weightUpdateAlertTitle = "Weight Update";
  static var weightUpdateAlertDescription =
      "Updating your current body weight regularly helps in generating accurate reports. Do you wish to update?";
  static var weightUpdateAlertPositiveButton = "UPDATE";
  static var weightUpdateAlertNegativeButton = "SKIP";
  static var sessionAlertTitle = "Session Alert";
  static var sessionAlertDescription =
      "A session started will go on for 24 hours. It is highly recommended to not stop the session within this duration. Do you wish to proceed?";
  static var sessionAlertPositiveButton = "PROCEED";
  static var sessionAlertNegativeButton = "CANCEL";
  static var calibrationAlertTitle =
      "It is recommended to calibrate the accelerometer for accurate measurements.";
  static var calibrationAlertDescription = "Perform accelerometer calibration?";
  static var calibartionAlertPositiveButton = "CALIBRATE";
  static var calibrationAlertNegativeButton = "SKIP";
}

class ImageNames {
  static var gender = "Male";
  static var device = "assets/images/device.svg";
  static var deviceIcon = "assets/images/deviceIcon.svg";
  static var searchDevice = "assets/images/searchDevice.svg";
  static var dp = "assets/images/dp1.png";
  static var warning = "assets/images/warning.svg";
  static var stopSession = "assets/images/stop.png";
  static var readSession = "assets/images/reading.svg";
  static var readCompleted = "assets/images/readCompleted.svg";
  static var login = "assets/images/FM-login.svg";
  static var height = "assets/images/height.svg";
  static var bodyMetricsInput = "assets/images/bodyMetricsInput.svg";
  static var sliders = "assets/images/sliders.svg";
  static var getStarted = "assets/images/FM-activity.svg";
  static var activityScore = "assets/images/ActivityScore.svg";
  static var recoveryScore = "assets/images/RecoveryScore.svg";
  static var sleepScore = "assets/images/sleepScore.svg";
  static var stressScore = "assets/images/stressScore.svg";
  static var heartbeat = "assets/images/heartbeat.svg";
  static var leaf = "assets/images/leaf.svg";
  static var rightArrow = "assets/images/rightArrow.svg";
  static var weightAlert = "assets/images/FM-alert.svg";
  static var steps = "assets/images/steps.svg";
  static var timer = "assets/images/timer.svg";
  static var runningIcon = "assets/images/man_running.svg";
  static var dinnerIcon = "assets/images/dinner2.svg";
  static var sleepIcon = "assets/images/sleep.svg";
  static var info = "assets/images/FM-info.svg";
  static var deleteEvent = "assets/images/M-Bin.svg";
  static var sessionStopped = "assets/images/FM-question.svg";
  static var running = "assets/images/running.svg";
  static var stress = "assets/images/stress.svg";
  static var sleepReportScore = "assets/images/sleepReportScore.svg";
  static var leftArrow = "assets/images/left-arrow.svg";
  static var rightArrow1 = "assets/images/right-arrow-1.svg";
  static var sun = "assets/images/Icon-sun.svg";
  static var weightIcon = "assets/images/icon-weight.svg";
  static var bodyMetricsIcon = "assets/images/bodyMetricsIcon.svg";
  static var helpIcon = "assets/images/helpIcon.svg";
  static var infoIcon = "assets/images/infoIcon.svg";
  static var logoutIcon = "assets/images/logoutIcon.svg";
  static var nutrionistCoachIcon = "assets/images/nutrionistCoachIcon.svg";
  static var perceivedStressIcon = "assets/images/perceivedStressIcon.svg";
  static var settingsIcon = "assets/images/settingsIcon.svg";
  static var statisticsIcon = "assets/images/statisticsIcon.svg";
  static var workoutCoachIcon = "assets/images/workoutCoachIcon.svg";
  static var reportIcon = "assets/images/reportIcon.svg";
  static var readinessIcon = "assets/images/readinessIcon.svg";
  static var sensorIcon = "assets/images/sensorIcon.svg";
  static var settingIcon = "assets/images/settingIcon.svg";
  static var logout = "assets/images/logoutImage.svg";
  static var refund = "assets/images/M-refund.svg";
  static var issueRaised = "assets/images/FM-complete.svg";
  static var firmwareUpdating = "assets/images/firmware_updating.svg";
  static var netrinIcon = "assets/images/netrinIcon.png";
  static var sessionSummaryIon = "assets/images/M-overall-health.svg";
  static var bmi = "assets/images/bmi.svg";
  static var splashLogo = "assets/images/splash_logo.png";
  static var firmwareUpdate = "assets/images/Firmware_update.svg";
  static var sessionList = "assets/images/completed_session_list.svg";
  static var sessionListView = "assets/images/session_list.svg";
  static var hrGraph = "assets/images/hr_graph.svg";
  static var sensorTileIcon1 = "assets/images/Battery_status.svg";
  static var sensorTileIcon2 = "assets/images/tile_sensor.svg";
  static var sensorTileIcon3 = "assets/images/data.svg";
  static var sensorTileIcon4 = "assets/images/session_status.svg";
  static var workout = gender == "Female"
      ? "assets/images/F_workout.svg"
      : "assets/images/F_workout.svg";
  static var nutrionist = gender == "Female"
      ? "assets/images/F_diet.svg"
      : "assets/images/F_diet.svg";
  static var breakfastIcon = "assets/images/breakfast_icon.svg";
  static var lunchIcon = "assets/images/lunch_icon.svg";
  static var snackIcon = "assets/images/snack_icon.svg";
  static var dinner2Icon = "assets/images/dinner_icon.svg";
  static var pst = "assets/images/pst.png";
  static var walkingIcon = "assets/images/walkingIcon.svg";
  static var workIcon = "assets/images/workIcon.svg";
  static var sadIcon = "assets/images/sadIcon.svg";
  static var brainIcon = "assets/images/brainIcon.svg";
  static var qrt = gender == "Female"
      ? "assets/images/F_lying.png"
      : "assets/images/F_lying.png";
  static var qrtCard = "assets/images/QRT_card.png";
  static var subscription = "assets/images/subscription.svg";
  static var infoGreenIcon = "assets/images/info_icon_green.svg";
  static var topWave = "assets/images/topWave.svg";
  static var bottomWave = "assets/images/bottomWave.svg";
  static var dashboardBg = "assets/images/dashboardBg.svg";
  static var menWearable = "assets/images/menWearable.svg";
  static var connectDevice = "assets/images/connect_device.svg";
  static var connectLoader = "assets/images/connecting_loader.svg";
  static var searching = "assets/images/F-searching.svg";
  static var eventCycling = "assets/images/event_cycling.svg";
  static var eventHiking = "assets/images/event_hiking.svg";
  static var eventMeditation = "assets/images/event_meditation.svg";
  static var eventRunning = "assets/images/event_running.svg";
  static var eventStreching = "assets/images/event_streching.svg";
  static var eventSwimming = "assets/images/event_swimming.svg";
  static var homeBg = "assets/images/homeBg.png";
  static var calories = "assets/images/calories.svg";
  static var epoc = "assets/images/epoc.svg";
  static var eventWalking = "assets/images/event_walking.svg";
  static var heartRate = "assets/images/heart_rate.svg";
}

class JsonNames {
  static var splash = "assets/json/splash.json";
  static var serverError = "assets/json/lottieError.svg";
}

class CustomColors {
  static var sliderColor = Color.fromRGBO(173, 222, 182, 1);
  static var grayColor1 = Color.fromRGBO(118, 118, 119, 0.8);
  static var grayColor2 = Color.fromRGBO(141, 141, 143, 1);
  static var lightAccentColor = Color.fromRGBO(206, 236, 209, 1);
  static var circularProgressColor = Color.fromRGBO(196, 196, 196, 1);
}

class Config {
  static init() async {
    getPackageInfo();
  }

  static initLog() {}

  static late PackageInfo packageInfo;
}

void getPackageInfo() {
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
    Config.packageInfo = packageInfo;
  });
}

class Common {
  static final _client = Common._internal();
  Common._internal();
  factory Common() {
    return _client;
  }
  static Common get instance => _client;

  String? getDateTimeFromTimeStamp({String? format, required int timeStamp}) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timeStamp);
    final DateFormat formatter = DateFormat(format ?? "dd-MM-yyyy");
    final String formatted = formatter.format(date);
    return formatted;
  }

  String? getDateTimeFromString({String? format, required String value}) {
    final DateTime date = DateTime.parse(value);
    final DateFormat formatter = DateFormat(format ?? "yyyy-MM-dd");
    final String formatted = formatter.format(date);
    return formatted.toString();
  }

  // String getProfileDetails({required ProfileDetailsType type}) {
  //   print(StorageManager.getProfileDetails());
  //   var profile = ProfileModel.fromJson(
  //       jsonDecode(StorageManager.getProfileDetails() ?? ""));
  //   switch (type) {
  //     case ProfileDetailsType.age:
  //       return profile.age ?? "";
  //     case ProfileDetailsType.name:
  //       return profile.name ?? "";
  //     case ProfileDetailsType.weight:
  //       return profile.weight ?? "";
  //     case ProfileDetailsType.height:
  //       return profile.height ?? "";
  //     case ProfileDetailsType.gender:
  //       return profile.gender ?? "";
  //     case ProfileDetailsType.email:
  //       return profile.email ?? "";
  //     case ProfileDetailsType.profession:
  //       return profile.profession ?? "";
  //     default:
  //       return "";
  //   }
  // }
  //
  // dynamic getUserDetails({required UserDetailsType type}) {
  //   var profile = VerifyOtpResponse.fromJson(
  //       jsonDecode(StorageManager.getUserDetails() ?? ""));
  //   switch (type) {
  //     case UserDetailsType.userId:
  //       return profile.userId ?? "";
  //     case UserDetailsType.device:
  //       return profile.device ?? "";
  //     case UserDetailsType.userEntryCode:
  //       return profile.userEntryCode ?? "";
  //     case UserDetailsType.token:
  //       return profile.token ?? "";
  //     case UserDetailsType.joinedOn:
  //       return profile.joinedOn ?? "";
  //
  //     default:
  //       return "";
  //   }
  // }
  //
  // void setUserEntry({required UserEntryType type}) {
  //   var profile = VerifyOtpResponse.fromJson(
  //       jsonDecode(StorageManager.getUserDetails() ?? ""));
  //   profile.userEntryCode = type;
  //   StorageManager.setUserDetails(jsonEncode(profile));
  // }

  String getTimeDifference(DateTime startTime, DateTime endTime,
      {bool? isReversed,
      TimeDifferenceType? timeDifference =
          TimeDifferenceType.hourMinuteSecond}) {
    var duration = startTime.difference(endTime);
    if (isReversed != null) {
      duration = endTime.difference(startTime);
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (timeDifference == TimeDifferenceType.hourMinuteSecond) {
      return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
    } else if (timeDifference == TimeDifferenceType.hourMinute) {
      return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m";
    } else if (timeDifference == TimeDifferenceType.minuteSecond) {
      return "${twoDigitMinutes} min ${twoDigitSeconds} sec";
    } else {
      return "${twoDigits(duration.inHours)}h ${twoDigitMinutes}m ${twoDigitSeconds}s";
    }
  }

  static void showInfo(
      {String msg = " ",
      int seconds = 2,
      required bool isInfo,
      required BuildContext buildContext}) {
    ScaffoldMessenger.of(buildContext).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
              child: Text(
                msg,
                style: kLThreeTextStyle(Colors.white, FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: isInfo ? Color(0xFFA4D201) : Colors.red,
      ),
    );
  }

  BleCommand? getCommandFromHex(String? hex) {
    switch (hex) {
      case "30":
        return BleCommand.initialize;
      case "31":
        return BleCommand.deviceStatus;
      case "32":
        return BleCommand.startSession;
      case "33":
        return BleCommand.stopSession;
      case "35":
        return BleCommand.readPacket;
      case "36":
        return BleCommand.stopReadPacket;
      case "37":
        return BleCommand.ecgStartStreaming;
      case "38":
        return BleCommand.ecgStopStreaming;
      case "69":
        return BleCommand.deviceInfo;
      case "62":
        return BleCommand.beatCheckEnable;
      case '42':
        return BleCommand.beatCheckDisable;
      case '43':
        return BleCommand.accStart;
      case '64':
        return BleCommand.dashInfo;
      default:
        break;
    }
  }

  ///TODO: remove me
  // Future<SessionListModel> getSessionDetails() async {
  //   var sessionDetails = await BluetoothManager.instance.dbManager.fetchSession(
  //       BluetoothManager.instance.characteristicsStream.value?.token ?? "");
  //   return Future.value(sessionDetails);
  // }

}

class DateFormats {
  static var time = "hh:MM";
}

enum ProfileDetailsType {
  name,
  email,
  age,
  gender,
  dob,
  weight,
  height,
  profession
}

enum UserDetailsType {
  userId,
  token,
  joinedOn,
  device,
  userEntryCode,
}

enum TimeDifferenceType {
  hourMinuteSecond,
  hourMinute,
  minuteSecond,
}

enum UserEntryType { newUser, agreeTerms, userDetails, bodyMetrics, dashboard }

extension IUserEntryType on UserEntryType {
  static UserEntryType getType(String value) {
    switch (value) {
      case "NEWUSER":
        return UserEntryType.newUser;
      case "AGREETERMS":
        return UserEntryType.agreeTerms;
      case "USERDETAILS":
        return UserEntryType.userDetails;
      case "BODYMETRICS":
        return UserEntryType.bodyMetrics;
      case "DASHBOARD":
        return UserEntryType.dashboard;
      default:
        return UserEntryType.newUser;
    }
  }

  String get name {
    switch (this) {
      case UserEntryType.newUser:
        return "NEWUSER";
      case UserEntryType.agreeTerms:
        return "AGREETERMS";
      case UserEntryType.userDetails:
        return "USERDETAILS";
      case UserEntryType.bodyMetrics:
        return "BODYMETRICS";
      case UserEntryType.dashboard:
        return "DASHBOARD";
    }
  }
}
