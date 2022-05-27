import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BodyMetricsInputPage extends StatefulWidget {
  @override
  _BodyMetricsInputPageState createState() => _BodyMetricsInputPageState();
}

class _BodyMetricsInputPageState extends State<BodyMetricsInputPage> {
  var heightController = TextEditingController();
  var weightController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SvgPicture.asset(
                  ImageNames.bodyMetricsInput,
                  height: MediaQuery.of(context).size.height * 0.22,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Height",
                        style: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                color: NeumorphicTheme.disabledColor(context))),
                    SizedBox(
                      height: 5,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: heightController,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffix: Text("cm"),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Weight",
                        style: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                color: NeumorphicTheme.disabledColor(context))),
                    SizedBox(
                      height: 5,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: weightController,
                        inputFormatters: [LengthLimitingTextInputFormatter(3)],
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffix: Text("kg"),
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          AuthBloc.instance
                              .add(AuthValidateUserDetailsEvent(msg: ""));
                        },
                        child: SvgPicture.asset(ImageNames.sliders)),
                    SizedBox(
                      width: 20,
                    ),
                    PrimaryButton(
                      color: weightController.text.length > 0 &&
                              heightController.text.length > 0
                          ? NeumorphicTheme.accentColor(context)
                          : Colors.black.withOpacity(0.12),
                      horizontalPadding: 30,
                      onPressed: () {
                        if (weightController.text.length > 0 &&
                            heightController.text.length > 0) {
                          AuthBloc.instance.add(AuthSurveyQuestionEvent(
                              msg: "", selectedIndex: 0));
                        } else {
                          Fluttertoast.showToast(
                              msg: "Please enter your Body metrics",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.white,
                              textColor: Colors.black);
                        }
                      },
                      title: "CONTINUE",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
