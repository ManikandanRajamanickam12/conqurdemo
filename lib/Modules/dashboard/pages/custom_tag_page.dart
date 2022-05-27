import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class CustomTagPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
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
                      GestureDetector(
                        onTap: () {
                          DashboardBloc.instance
                              .add(DashboardStartTrainingEvent(msg: ""));
                        },
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              intensity: 1,
                              depth: 5,
                              boxShape: NeumorphicBoxShape.circle()),
                          child: Container(
                            height: 45,
                            width: 45,
                            child: Center(child: Icon(Icons.arrow_back_ios)),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "ADD CUSTOM TAG",
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  SelectedTag(),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "ADJUST TIME",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "You can choose any specific time",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(fontSize: 19, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SelectTimeWidget(),
                  // EditTag(),
                  SizedBox(
                    height: 30,
                  ),
                  PrimaryButton(
                    onPressed: () {},
                    title: "ADD TAG",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your tag will also be saved to recent tags",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({Key? key}) : super(key: key);

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  double _weightValue = 40.0;
  var horizontalScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
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

class SelectedTag extends StatelessWidget {
  const SelectedTag({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "ADD CUSTOM TAG",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 180,
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "EDIT NAME",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.edit)
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}

class EditTag extends StatelessWidget {
  final tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            depth: -2,
            intensity: 0.9,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
          ),
          child: TextFormField(
            controller: tagController,
            keyboardType: TextInputType.number,
            onChanged: (value) {},
            decoration: new InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.edit,
                color: NeumorphicTheme.accentColor(context),
                size: 18,
              ),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "Date of birth",
              hintStyle: TextStyle(fontSize: 13),
              contentPadding: EdgeInsets.all(15),
            ),
          ),
        ),
        PrimaryButton(
          verticalPadding: 30,
          onPressed: () {},
          title: "CONFIRM",
        )
      ],
    );
  }
}
