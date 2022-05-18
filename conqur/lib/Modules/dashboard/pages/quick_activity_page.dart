import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/model/activity_model.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class QuickActivityPage extends StatelessWidget {
  List<ActivityModel> activities = [
    ActivityModel(icon: ImageNames.eventRunning, name: "Running"),
    ActivityModel(icon: ImageNames.eventCycling, name: "Cycling"),
    ActivityModel(icon: ImageNames.eventStreching, name: "Streching"),
    ActivityModel(icon: ImageNames.eventMeditation, name: "Meditation"),
    ActivityModel(icon: ImageNames.eventHiking, name: "Hiking"),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Neumorphic(
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
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "READY FOR",
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
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                      itemCount: activities.length + 1,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 15),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              if (index == activities.length)
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        DashboardBloc.instance.add(
                                            DashboardSearchActivityEvent(
                                                msg: ""));
                                      },
                                      child: Container(
                                        height: 55,
                                        margin: EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.add,
                                            size: 50,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "More",
                                      style: kLThreeTextStyle(Colors.black),
                                    )
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        DashboardBloc.instance.add(
                                            DashboardSelectedTrainingEvent(
                                                activity: activities[index]));
                                      },
                                      child: Neumorphic(
                                        style: NeumorphicStyle(
                                            depth: 5,
                                            intensity: 1,
                                            boxShape:
                                                NeumorphicBoxShape.circle()),
                                        child: Container(
                                          padding: EdgeInsets.all(15),
                                          child: SvgPicture.asset(
                                            activities[index].icon,
                                            height: 35,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      activities[index].name,
                                      style: kLThreeTextStyle(Colors.black),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    verticalPadding: 30,
                    horizontalPadding: 20,
                    onPressed: () {
                      DashboardBloc.instance
                          .add(DashboardTrainingEvent(msg: ""));
                    },
                    title: "SKIP AND START",
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "GO BACK",
                        style: kLThreeTextStyle(
                            Colors.black.withOpacity(0.8), FontWeight.bold),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
              SvgPicture.asset(
                ImageNames.menWearable,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
