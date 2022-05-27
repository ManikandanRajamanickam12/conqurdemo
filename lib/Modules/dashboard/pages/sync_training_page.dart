import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/helpers/Widgets/alert_click_event.dart';
import 'package:conqur/helpers/Widgets/neumorphic_popup_card.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SyncTrainingPage extends StatelessWidget {
  const SyncTrainingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: SvgPicture.asset(
                ImageNames.sessionStopped,
              ),
            ),
            NeumorphicPopupCard(
              height: 170,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Sync training data",
                      style: kLOneTextStyle(Colors.black, FontWeight.normal),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "Do you want to start the sync?",
                      style: kLThreeTextStyle(Colors.black45),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Spacer(),
                  AlertClickEventWidget(
                    negativeText: "LATER",
                    positiveText: "SYNC NOW",
                    negativeButtonClicked: () {
                      DashboardBloc.instance
                          .add(DashboardSensorConnectedEvent(msg: ""));
                    },
                    postiveButtonClicked: () {
                      DashboardBloc.instance
                          .add(DashboardSyncTrainingEvent(msg: ""));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
