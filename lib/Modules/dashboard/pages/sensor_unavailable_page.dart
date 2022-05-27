import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/helpers/Widgets/alert_click_event.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class SensorUnavailablePage extends StatelessWidget {
  var serialNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Center(
                    child: SvgPicture.asset(
                      ImageNames.searching,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                sessionAlertWidget(),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget sessionAlertWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Neumorphic(
          style: NeumorphicStyle(
              depth: 5,
              intensity: 2,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: Text(
                    "Your sensor device is not available",
                    style: kLOneTextStyle(Colors.black, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                  child: Text(
                    "Make sure the device is worn properly and try connecting again",
                    style: kLThreeTextStyle(
                        Colors.black.withOpacity(0.5), FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                AlertClickEventWidget(
                  negativeText: "DISMISS",
                  positiveText: "CONNECT AGAIN",
                  negativeButtonClicked: () {
                    DashboardBloc.instance.add(DashboardInitialEvent(msg: ""));
                  },
                  postiveButtonClicked: () {
                    DashboardBloc.instance
                        .add(DashboardConnectSensorEvent(msg: ""));
                  },
                )
              ],
            ),
          )),
    );
  }
}
