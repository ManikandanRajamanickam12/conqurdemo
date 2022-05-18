import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/model/activity_model.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchActivityPage extends StatelessWidget {
  List<ActivityModel> activities = [
    ActivityModel(icon: ImageNames.eventRunning, name: "Running"),
    ActivityModel(icon: ImageNames.eventCycling, name: "Cycling"),
    ActivityModel(icon: ImageNames.eventStreching, name: "Streching"),
    ActivityModel(icon: ImageNames.eventMeditation, name: "Meditation"),
    ActivityModel(icon: ImageNames.eventHiking, name: "Hiking"),
    ActivityModel(icon: ImageNames.eventSwimming, name: "Swimming"),
    ActivityModel(icon: ImageNames.eventRunning, name: "Running"),
    ActivityModel(icon: ImageNames.eventCycling, name: "Cycling"),
    ActivityModel(icon: ImageNames.eventStreching, name: "Streching"),
    ActivityModel(icon: ImageNames.eventMeditation, name: "Meditation"),
    ActivityModel(icon: ImageNames.eventHiking, name: "Hiking"),
    ActivityModel(icon: ImageNames.eventSwimming, name: "Swimming"),
    ActivityModel(icon: ImageNames.eventRunning, name: "Running"),
    ActivityModel(icon: ImageNames.eventCycling, name: "Cycling"),
    ActivityModel(icon: ImageNames.eventStreching, name: "Streching"),
  ];

  var activityController = TextEditingController();
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
                          child: Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "SELECT ACTIVITY",
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
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: activities.length,
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
                                    Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: activityController,
                        maxLength: 12,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Search for an activity",
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
