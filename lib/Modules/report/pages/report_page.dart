import 'package:conqur/Modules/base/CustomLoader.dart';
import 'package:conqur/Modules/dashboard/pages/home_page.dart';
import 'package:conqur/Modules/report/bloc/report_bloc.dart';
import 'package:conqur/Modules/report/pages/report_detail_page.dart';
import 'package:conqur/Modules/report/pages/report_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ReportPage extends StatefulWidget {
  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  var currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: BlocBuilder<ReportBloc, ReportState>(
        bloc: ReportBloc.instance,
        builder: (context, state) {
          if (state is ReportInitialState) {
            return ReportDetailPage();
          } else if (state is ReportLoadingState) {
            return CustomLoader();
          } else if (state is ReportListState) {
            return ReportListPage();
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
