import 'package:conqur/Modules/base/CustomLoader.dart';
import 'package:conqur/Modules/calendar/bloc/calendar_bloc.dart';
import 'package:conqur/Modules/calendar/pages/calendar_list_page.dart';
import 'package:conqur/Modules/dashboard/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CalendarScreen extends StatefulWidget {
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<CalendarBloc, CalendarState>(
        bloc: CalendarBloc.instance,
        builder: (context, state) {
          if (state is CalendarListState) {
            return ReportListPage(
              type: state.type,
            );
          } else if (state is CalendarLoadingState) {
            return CustomLoader();
          } else if (state is CalendarDateSelectedState) {
            return ReportListPage(
              type: state.type,
            );
          } else {
            return HomePage(
              state: HomePageState.sensorDisconnected,
            );
          }
        },
      ),
    );
  }
}
