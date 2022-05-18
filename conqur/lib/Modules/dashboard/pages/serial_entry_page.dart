import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/helpers/Widgets/alert_click_event.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class SerialEntryPage extends StatelessWidget {
  var serialNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: SvgPicture.asset(
                    ImageNames.searching,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -2,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextFormField(
                      controller: serialNumberController,
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter Serial number",
                        counterText: "",
                        suffixIcon: Icon(
                          Icons.search,
                          size: 16,
                        ),
                        contentPadding: EdgeInsets.all(15),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                AlertClickEventWidget(
                  negativeText: "DISMISS",
                  positiveText: DashboardNames.sessionAlertPositiveButton,
                  negativeButtonClicked: () {
                    DashboardBloc.instance.add(DashboardInitialEvent(msg: ""));
                  },
                  postiveButtonClicked: () {
                    DashboardBloc.instance
                        .add(DashboardSensorSearchEvent(msg: ""));
                  },
                )
              ],
            ),
          )),
    );
  }
}
