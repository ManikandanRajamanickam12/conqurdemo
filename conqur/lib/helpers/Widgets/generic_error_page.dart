import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/helpers/Widgets/alert_click_event.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class GenericErrorPage extends StatelessWidget {
  String? errCode;
  String? errMsg;
  GenericErrorPage({this.errCode, this.errMsg});

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: SvgPicture.asset(
                    ImageNames.weightAlert,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Enter sensor device serial",
                    style: kLOneTextStyle(Colors.black, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Enter sensor device serial",
                    style: kLOneTextStyle(Colors.black, FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AlertClickEventWidget(
                  negativeText: "DISMISS",
                  negativeButtonClicked: () {
                    DashboardBloc.instance.add(DashboardInitialEvent(msg: ""));
                  },
                )
              ],
            ),
          )),
    );
  }
}
