import 'package:conqur/Modules/base/CustomLoader.dart';
import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/pages/connecting_sensor_page.dart';
import 'package:conqur/Modules/dashboard/pages/custom_tag_page.dart';
import 'package:conqur/Modules/dashboard/pages/home_page.dart';
import 'package:conqur/Modules/dashboard/pages/quick_activity_page.dart';
import 'package:conqur/Modules/dashboard/pages/search_activity_page.dart';
import 'package:conqur/Modules/dashboard/pages/selected_activity_page.dart';
import 'package:conqur/Modules/dashboard/pages/sensor_unavailable_page.dart';
import 'package:conqur/Modules/dashboard/pages/serial_entry_page.dart';
import 'package:conqur/Modules/dashboard/pages/training_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        bloc: DashboardBloc.instance,
        builder: (context, state) {
          if (state is DashboardInitialState) {
            return HomePage(
              state: HomePageState.sensorDisconnected,
            );
          } else if (state is DashboardLoadingState) {
            return CustomLoader();
          } else if (state is DashboardSerialEntryState) {
            return SerialEntryPage();
          } else if (state is DashboardSensorConnectingState) {
            return ConnectingSensorPage();
          } else if (state is DashboardSensorUnavailableState) {
            return SensorUnavailablePage();
          } else if (state is DashboardSensorConnectedState) {
            return HomePage(
              state: HomePageState.sensorConnected,
            );
          } else if (state is DashboardQuickActivityState) {
            return QuickActivityPage();
          } else if (state is DashboardSelectedActivityState) {
            return SelectedActivityPage(
              activity: state.activity,
            );
          } else if (state is DashboardSearchActivityState) {
            return SearchActivityPage();
          } else if (state is DashboardTrainingState) {
            return TrainingPage();
          } else if (state is DashboardAddTagState) {
            return CustomTagPage();
          } else {
            return HomePage(
              state: HomePageState.sensorDisconnected,
            );
          }
        },
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index
            ? NeumorphicTheme.accentColor(context)
            : NeumorphicTheme.disabledColor(context),
      ),
    );
  }
}
