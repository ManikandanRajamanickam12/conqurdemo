import 'dart:async';

import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LinearAxis {
  final int x;
  final int y;

  LinearAxis(this.x, this.y);
}

class EcgStreamModel {
  EcgStreamModel({required this.time, this.x, required this.value});

  final DateTime time;
  final int? x;
  num value;
}

class EcgStreamSFChart extends StatefulWidget {
  const EcgStreamSFChart({
    Key? key,
  }) : super(key: key);

  @override
  _EcgStreamSFChartState createState() => _EcgStreamSFChartState();
}

class _EcgStreamSFChartState extends State<EcgStreamSFChart> {
  late StreamSubscription<List<int>> subscription;
  ChartSeriesController? _chartSeriesController;
  List<EcgStreamModel> chartData = [];
  int x = 0;

  @override
  void initState() {
    // subscription = BluetoothManager.instance.ecgStream.listen((values) {
    //   if ((values.isNotEmpty)) {
    //     if (mounted) updateDataSource(values);
    //   }
    // });
    super.initState();
  }

  void updateDataSource(List<int> values) {
    if (x == 0) setState(() {});
    for (int valu in values) {
      var dateTime = DateTime.now();
      double mV = valu * 0.00072463768;
      var model = EcgStreamModel(time: dateTime, x: x++, value: mV);
      chartData.add(model);

      if (chartData.length == 512) {
        chartData.removeAt(0);
        _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0],
        );
      } else {
        _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NeumorphicTheme.baseColor(context),
      child: Column(
        children: <Widget>[
          // Container(
          //   padding: EdgeInsets.only(left: 20, right: 16, top: 4),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       StreamBuilder<int?>(
          //           stream: BluetoothManager.instance.ecgHrStream,
          //           initialData: null,
          //           builder: (context, snapshot) {
          //             if (snapshot.hasData) {
          //               var hr = snapshot.data;
          //               if (hr == -1) {
          //                 return Container(
          //                   padding: EdgeInsets.all(10),
          //                   child: Text(
          //                     "Obtaining Heart Rate...",
          //                     style: kLTwoTextStyle(),
          //                   ),
          //                 );
          //               } else {
          //                 return Container(
          //                   padding: EdgeInsets.all(10),
          //                   child: Text(
          //                     "HR: $hr bpm",
          //                     style:
          //                         kLTwoTextStyle(Colors.white, FontWeight.w600),
          //                   ),
          //                 );
          //               }
          //             }
          //             return Container();
          //           }),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: getLiveLineChart(),
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    "ECG",
                    style: kLThreeTextStyle(Colors.black.withOpacity(0.5)),
                  ),
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SfCartesianChart getLiveLineChart() {
    return SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: NumericAxis(isVisible: false),
        // intervalType: DateTimeIntervalType.minutes,
        // title: AxisTitle(
        //   text: 'Time(hh:mm)',
        //   textStyle:
        //       kLThreeTextStyle(NeumorphicTheme.disabledColor(context)),
        // ),
        // labelIntersectAction: AxisLabelIntersectAction.none,
        // dateFormat: DateFormat.Hm()),
        primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          rangePadding: ChartRangePadding.additional,
          minimum: -1,
          maximum: 1,
          interval: 1,
          majorGridLines: MajorGridLines(width: 0),
          // title: AxisTitle(text: "HR(bpm)", textStyle: TextStyle(fontSize: 12)),
          axisLine: AxisLine(width: 1, color: Colors.transparent),
        ),
        series: <LineSeries<EcgStreamModel, int?>>[
          LineSeries<EcgStreamModel, int?>(
            onRendererCreated: (ChartSeriesController controller) {
              _chartSeriesController = controller;
            },
            dataSource: chartData,
            width: 0.5,
            color: NeumorphicTheme.accentColor(context),
            xValueMapper: (EcgStreamModel sales, _) => sales.x,
            yValueMapper: (EcgStreamModel sales, _) => sales.value,
            animationDuration: 0,
            dataLabelSettings: DataLabelSettings(
                isVisible: false, labelAlignment: ChartDataLabelAlignment.top),
          )
        ]);
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}

// class HrRealtimeSFGraph extends StatefulWidget {
//   final HomeBloc? bloc;
//
//   const HrRealtimeSFGraph({Key? key, this.bloc}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() {
//     return HrRealtimeSFGraphState();
//   }
// }
//
// class HrRealtimeSFGraphState extends State<HrRealtimeSFGraph> {
//   late StreamSubscription<BleEcgLogStreamInfo> subscription;
//   List<EcgStreamModel> chartData = [];
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     subscription = BleRWController.instance.hrStream.listen((info) {
//       if (info.values != null && (info.values?.isNotEmpty ?? false)) {
//         // if (info.isFirstTime || info.isStreaming) {
//         if (mounted) {
//           if (info.clearGraph) {
//             chartData.clear();
//           }
//           _addEntry(info.values!);
//         }
//         // }
//       }
//     });
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: NeumorphicTheme.baseColor(context),
//       child: StreamBuilder<BleEcgLogStreamInfo>(
//           stream: BleRWController.instance.hrStream,
//           initialData: null,
//           builder: (context, snapshot) {
//             BleEcgLogStreamInfo? info = snapshot.data;
//             if (snapshot.hasData && (info?.values?.isNotEmpty ?? false)) {
//               return Column(
//                 children: <Widget>[
//                   SizedBox(height: 5),
//                   Expanded(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Expanded(
//                           child: Container(
//                             child: getLiveLineChart(),
//                           ),
//                         ),
//                         RotatedBox(
//                           quarterTurns: 1,
//                           child: Text(
//                             "HR(bpm)",
//                             style: kLThreeTextStyle(),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         )
//                       ],
//                     ),
//                   )
//                 ],
//               );
//             } else {
//               return ShowDeviceInfoWidget();
//             }
//           }),
//     );
//   }
//
//   void _addEntry(List<pb.RepDbBleEcgLog> values) {
//     for (pb.RepDbBleEcgLog valu in values) {
//       double y = valu.hr.toDouble();
//       var logTs =
//           DateTime.fromMillisecondsSinceEpoch(valu.ts.toInt(), isUtc: true);
//       var time = logTs.toLocal();
//       var model = EcgStreamModel(time: time, value: y);
//       chartData.add(model);
//       if (chartData.length == 512) {
//         chartData.removeAt(0);
//       }
//     }
//     // dev.log("${chartData.map((e) => e.value).toList()}");
//     if (chartData.isNotEmpty) {
//       List<num> hrData = chartData.map((e) => e.value).toList();
//       var stats = Stats.fromData(hrData);
//       num sd = stats.standardDeviation;
//       double prevPoint = 0;
//       for (int i = 0; i < chartData.length; i++) {
//         double hr = chartData[i].value as double;
//         var sdHr = hr.toDouble() < ((2 * sd) + stats.average)
//             ? hr.toDouble()
//             : prevPoint.toDouble();
//         chartData[i].value = sdHr;
//         prevPoint = sdHr;
//       }
//     }
//
//     chartData.removeAt(0);
//     setState(() {});
//   }
// }
//
// class BleEcgLogStreamInfo {
//   // bool isFirstTime = false;
//   // bool isStreaming = false;
//   bool clearGraph = false;
//   List<pb.RepDbBleEcgLog>? values;
//
//   BleEcgLogStreamInfo({
//     // required this.isFirstTime,
//     this.clearGraph = false,
//     this.values,
//     // required this.isStreaming,
//   });
// }
