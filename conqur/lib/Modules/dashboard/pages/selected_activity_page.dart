import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/model/activity_model.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectedActivityPage extends StatelessWidget {
  ActivityModel activity;
  SelectedActivityPage({required this.activity});

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
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          activity.name,
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 56,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Neumorphic(
                          style: NeumorphicStyle(
                              depth: 5,
                              intensity: 1,
                              boxShape: NeumorphicBoxShape.circle()),
                          child: Container(
                            height: 140,
                            child: Center(
                              child: SvgPicture.asset(
                                activity.icon,
                                height: 70,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    verticalPadding: 30,
                    horizontalPadding: 20,
                    onPressed: () {},
                    title: "START RUNNING",
                  ),
                  TextButton(
                      onPressed: () {
                        DashboardBloc.instance
                            .add(DashboardStartTrainingEvent(msg: ""));
                      },
                      child: Text(
                        "CHANGE ACTIVITY",
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
