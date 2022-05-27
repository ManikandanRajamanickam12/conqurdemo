import 'dart:async';

import 'package:conqur/Modules/report/pages/report_page.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/Widgets/neumorphic_popup_card.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SyncState { syncing, generatingReport, viewReport }

class SyncOngoingPage extends StatefulWidget {
  const SyncOngoingPage({Key? key}) : super(key: key);

  @override
  State<SyncOngoingPage> createState() => _SyncOngoingPageState();
}

class _SyncOngoingPageState extends State<SyncOngoingPage> {
  int percent = 1;
  var syncState = SyncState.syncing;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (percent == 100) {
        timer.cancel();
        setState(() {
          syncState = SyncState.generatingReport;
          Future.delayed(Duration(seconds: 2), () {
            setState(() {
              syncState = SyncState.viewReport;
            });
          });
        });
      } else {
        setState(() {
          percent += 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.35,
              margin: EdgeInsets.only(top: 30),
              child: SvgPicture.asset(
                ImageNames.readSession,
              ),
            ),
            Spacer(),
            if (syncState == SyncState.syncing)
              syncingCard()
            else if (syncState == SyncState.generatingReport)
              generatingReportCard()
            else
              viewReportCard()
          ],
        ),
      ),
    );
  }

  Widget syncingCard() {
    return NeumorphicPopupCard(
      height: 180,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Syncing in Progress....",
              style: kLOneTextStyle(Colors.black, FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            readProgress(context),
            Text(
              "$percent% completed",
              style: kLThreeTextStyle(Colors.black45),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget generatingReportCard() {
    return NeumorphicPopupCard(
      height: 180,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Generating Report....",
              style: kLOneTextStyle(Colors.black, FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.refresh,
              size: 35,
            )
          ],
        ),
      ),
    );
  }

  Widget viewReportCard() {
    return NeumorphicPopupCard(
      height: 180,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Recent session report available",
              style: kLOneTextStyle(Colors.black, FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            PrimaryButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   CupertinoPageRoute(
                //     builder: (context) => CalendarScreen(),
                //   ),
                // );
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => ReportPage(),
                  ),
                );
              },
              title: "VIEW REPORT",
            )
          ],
        ),
      ),
    );
  }

  Widget readProgress(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: NeumorphicProgress(
              style: ProgressStyle(
                  accent: NeumorphicTheme.accentColor(context),
                  variant: NeumorphicTheme.accentColor(context),
                  depth: 12),
              percent: (percent / 100),
            )),
      ],
    );

    // return StreamBuilder<ReadProgressModel?>(
    //     stream: BluetoothManager.instance.readProgressStream,
    //     builder: (context, snapshot) {
    //       if (snapshot.data != null) {
    //         return Column(
    //           children: [
    //             Container(
    //                 margin: EdgeInsets.symmetric(horizontal: 10),
    //                 child: NeumorphicProgress(
    //                   style: ProgressStyle(
    //                       accent: NeumorphicTheme.accentColor(context),
    //                       variant: NeumorphicTheme.accentColor(context),
    //                       depth: 12),
    //                   percent: (snapshot.data!.percent! / 100),
    //                 )),
    //             SizedBox(
    //               height: 5,
    //             ),
    //             Text(
    //                 "${snapshot.data!.readPackets}/${snapshot.data!.totalPackets}")
    //           ],
    //         );
    //       } else {
    //         return Container();
    //       }
    //     });
  }
}
