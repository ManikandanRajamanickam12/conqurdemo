import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/cards/recents_card.dart';
import 'package:conqur/Modules/profile/profile_screen.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

enum HomePageState { sensorDisconnected, sensorConnected }

class HomePage extends StatelessWidget {
  HomePageState state;
  HomePage({required this.state});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => ProfileScreen()));
                      },
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            intensity: 1,
                            depth: 5,
                            boxShape: NeumorphicBoxShape.circle()),
                        child: Container(
                          height: 45,
                          width: 45,
                          child: Icon(Icons.menu),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        "HI CONQURER!",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RecentsCard(),
              ),
              SizedBox(
                height: 30,
              ),
              PrimaryButton(
                horizontalPadding: 20,
                onPressed: () {
                  if (state == HomePageState.sensorDisconnected) {
                    DashboardBloc.instance
                        .add(DashboardConnectSensorEvent(msg: ""));
                  } else {
                    DashboardBloc.instance
                        .add(DashboardStartTrainingEvent(msg: ""));
                  }
                },
                title: state == HomePageState.sensorDisconnected
                    ? "CONNECT SENSOR"
                    : "START TRAINING",
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 1,
                  child: Image.asset(
                    ImageNames.homeBg,
                    fit: BoxFit.cover,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
