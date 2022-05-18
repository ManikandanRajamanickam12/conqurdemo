import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class BodyMetricsPage extends StatefulWidget {
  @override
  _BodyMetricsPageState createState() => _BodyMetricsPageState();
}

class _BodyMetricsPageState extends State<BodyMetricsPage> {
  double _heightValue = 160;
  double _heightPercent = 1;
  var verticalScrollController = ScrollController();
  double _weightValue = 40.0;
  var horizontalScrollController = ScrollController();
  var _selectedHeightIndex = 0;
  var _selectedWeightIndex = 0;
  var authBloc = AuthBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      verticalScrollController
          .jumpTo(verticalScrollController.position.maxScrollExtent - 450);
      horizontalScrollController.jumpTo(20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "SIGNUP",
                    style: NeumorphicTheme.currentTheme(context)
                        .textTheme
                        .headline1,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("HEIGHT",
                        style: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .headline2),
                  ],
                ),
                getHeightWidget(context),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "WEIGHT",
                      style: NeumorphicTheme.currentTheme(context)
                          .textTheme
                          .headline2,
                    ),
                  ],
                ),
                getWeightWidget(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.keyboard,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {
                        AuthBloc.instance
                            .add(AuthBodyMetricsInputEvent(msg: "input"));
                      },
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: [
                        PrimaryButton(
                          horizontalPadding: 30,
                          onPressed: () {
                            AuthBloc.instance.add(AuthSurveyQuestionEvent(
                                msg: "", selectedIndex: 0));
                          },
                          title: "CONTINUE",
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getHeightWidget(BuildContext context) {
    var minValue = 100;
    var maxValue = 250;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      if (verticalScrollController.position.minScrollExtent <=
                          (verticalScrollController.position.pixels - 100)) {
                        verticalScrollController.jumpTo(
                            verticalScrollController.position.pixels - 100);
                      } else {
                        verticalScrollController.jumpTo(
                            verticalScrollController.position.minScrollExtent);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: Colors.blueGrey,
                    )),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: SingleChildScrollView(
                    controller: verticalScrollController,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 2,
                      width: 170,
                      child: SfSlider.vertical(
                        min: minValue,
                        max: maxValue,
                        inactiveColor: NeumorphicTheme.disabledColor(context),
                        activeColor: NeumorphicTheme.accentColor(context),
                        value: _heightValue,
                        interval: 10,
                        stepSize: 1,
                        showTicks: true,
                        showLabels: true,
                        enableTooltip: true,
                        minorTicksPerInterval: 1,
                        onChanged: (dynamic value) {
                          setState(() {
                            _heightValue = value;
                            // getHeightPercentage();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (verticalScrollController.position.maxScrollExtent >=
                          (verticalScrollController.position.pixels + 100)) {
                        verticalScrollController.jumpTo(
                            verticalScrollController.position.pixels + 100);
                      } else {
                        verticalScrollController.jumpTo(
                            verticalScrollController.position.maxScrollExtent);
                      }
                    },
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.blueGrey,
                    )),
              ],
            ),
            Expanded(
              child: SvgPicture.asset(
                ImageNames.height,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            )
          ],
        ),
      ],
    );
  }

  // void getHeightPercentage() {
  //   _heightPercent = ((_heightValue - 100) / 250) * 100;
  //   print(_heightPercent);
  // }

  Widget getWeightWidget(BuildContext context) {
    return Container(
      height: 140,
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: horizontalScrollController,
                        child: Container(
                          height: 140,
                          width: MediaQuery.of(context).size.width * 3,
                          child: SfSlider(
                            min: 30,
                            max: 200.0,
                            inactiveColor:
                                NeumorphicTheme.disabledColor(context),
                            activeColor: NeumorphicTheme.accentColor(context),
                            value: _weightValue,
                            interval: 10,
                            stepSize: 0.1,
                            showTicks: true,
                            showLabels: true,
                            enableTooltip: true,
                            minorTicksPerInterval: 1,
                            onChanged: (dynamic value) {
                              setState(() {
                                _weightValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (horizontalScrollController
                                  .position.minScrollExtent <=
                              (horizontalScrollController.position.pixels -
                                  100)) {
                            horizontalScrollController.jumpTo(
                                horizontalScrollController.position.pixels -
                                    100);
                          } else {
                            horizontalScrollController.jumpTo(
                                horizontalScrollController
                                    .position.minScrollExtent);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_left,
                          size: 30,
                          color: Colors.blueGrey,
                        )),
                    IconButton(
                        onPressed: () {
                          if (horizontalScrollController
                                  .position.maxScrollExtent >=
                              (horizontalScrollController.position.pixels +
                                  100)) {
                            horizontalScrollController.jumpTo(
                                horizontalScrollController.position.pixels +
                                    100);
                          } else {
                            horizontalScrollController.jumpTo(
                                horizontalScrollController
                                    .position.maxScrollExtent);
                          }
                        },
                        icon: Icon(
                          Icons.arrow_right,
                          size: 30,
                          color: Colors.blueGrey,
                        )),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
