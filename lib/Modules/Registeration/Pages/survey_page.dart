import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/Modules/Registeration/model/SurveyModel.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class SurveyPage extends StatelessWidget {
  List<SurveyModel> survey = [
    SurveyModel(
        question: "How often do you exercise?",
        answers: ["OCCASIONAL", "WEEKLY", "DAILY"]),
    SurveyModel(
        question: "Describe your Athletic Proficiency?",
        answers: ["BEGINNER", "INTERMEDIATE", "PROFESSIONAL"])
  ];
  var selectedIndex = 0;
  SurveyPage({required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "SIGNUP",
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Text(
                  survey[selectedIndex].question,
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 29,
                          color: NeumorphicTheme.accentColor(context))),
                ),
                SizedBox(
                  height: 50,
                ),
                ListView.builder(
                    itemCount: survey[selectedIndex].answers.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (selectedIndex >= survey.length - 1) {
                            AuthBloc.instance.add(AuthSurveyEvent(msg: ""));
                          } else {
                            selectedIndex += 1;
                            AuthBloc.instance.add(AuthSurveyQuestionEvent(
                                msg: "", selectedIndex: selectedIndex));
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Neumorphic(
                              style: NeumorphicStyle(
                                  depth: 5,
                                  intensity: 1,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(40))),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                      survey[selectedIndex].answers[index]),
                                ),
                              )),
                        ),
                      );
                    }),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: PrimaryButton(
                    horizontalPadding: 30,
                    color: NeumorphicTheme.accentColor(context),
                    onPressed: () {
                      if (selectedIndex >= survey.length - 1) {
                        AuthBloc.instance.add(AuthSurveyEvent(msg: ""));
                      } else {
                        selectedIndex += 1;
                        AuthBloc.instance.add(AuthSurveyQuestionEvent(
                            msg: "", selectedIndex: selectedIndex));
                      }
                    },
                    title: "CONTINUE",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
