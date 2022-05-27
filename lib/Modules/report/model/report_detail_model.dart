import 'package:conqur/helpers/utils/Constants.dart';

class ReportDetailModel {
  String? activityName;
  String? activityIcon;
  String? startTime;
  String? endTime;
  List<InsightsRowModel> insights;
  String? duration;

  ReportDetailModel(
      {this.activityName,
      this.activityIcon,
      this.startTime,
      this.endTime,
      required this.insights,
      this.duration});
}

class InsightsRowModel {
  String? title;
  String? value;
  String? unit;
  String? image;

  InsightsRowModel({this.title, this.value, this.image, this.unit});
}

var reportDetails = ReportDetailModel(
    activityName: "Running",
    activityIcon: "",
    startTime: "7:55 AM",
    endTime: "9:30 PM",
    duration: "01h 30m",
    insights: reportInsights);

var reportInsights = [
  InsightsRowModel(
      title: "HEART RATE",
      image: ImageNames.heartRate,
      value: "138",
      unit: "bpm"),
  InsightsRowModel(
      title: "%HRMAX", image: ImageNames.heartRate, value: "72", unit: "%"),
  InsightsRowModel(
      title: "AVERAGE HR",
      image: ImageNames.heartRate,
      value: "76",
      unit: "bpm"),
  InsightsRowModel(
      title: "MINIMUM HR",
      image: ImageNames.heartRate,
      value: "59",
      unit: "bpm"),
  InsightsRowModel(
      title: "PEAK HR", image: ImageNames.heartRate, value: "138", unit: "bpm"),
  InsightsRowModel(
      title: "EPOC", image: ImageNames.epoc, value: "138", unit: "ml/kg"),
  InsightsRowModel(
      title: "HI INTENSITY",
      image: ImageNames.heartRate,
      value: "10:32",
      unit: "mm:ss"),
  InsightsRowModel(
      title: "MOV LOAD",
      image: ImageNames.eventWalking,
      value: "10",
      unit: "index"),
  InsightsRowModel(
      title: "CALORIES", image: ImageNames.calories, value: "567", unit: "cal"),
  InsightsRowModel(
      title: "TRIMP", image: ImageNames.heartRate, value: "10", unit: "index")
];
