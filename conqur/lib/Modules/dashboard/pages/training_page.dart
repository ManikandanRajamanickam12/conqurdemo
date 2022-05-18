import 'package:conqur/Modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:conqur/Modules/dashboard/model/activity_model.dart';
import 'package:conqur/Modules/dashboard/model/bluetooth_characteristic_model.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TrainingPage extends StatelessWidget {
  List<BluetoothCharacteristicModel> service = [
    BluetoothCharacteristicModel(
        title: "Heart rate", value: "138", unit: "bpm"),
    BluetoothCharacteristicModel(title: "%HRmax", value: "68", unit: "%"),
    BluetoothCharacteristicModel(title: "TRIMP", value: "31", unit: "Index"),
    BluetoothCharacteristicModel(
        title: "Time in highest", value: "00:00", unit: "mm:ss"),
    BluetoothCharacteristicModel(title: "Calories", value: "123", unit: "Kcal"),
    BluetoothCharacteristicModel(
        title: "Movement load", value: "10", unit: "Index")
  ];

  var addedActivities = ["JOG", "HYDRATION", "PHONE CALL", "REST"];

  var activityController = TextEditingController();

  ActivityModel activity =
      ActivityModel(icon: ImageNames.eventRunning, name: "Running");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TrainingHeaderView(),
              SizedBox(
                height: 30,
              ),
              ActivityView(activity: activity),
              // AddActivityCardView(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 35,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: addedActivities.length,
                    itemBuilder: (context, index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: NeumorphicTheme.accentColor(context)),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            addedActivities[index],
                            style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 15)),
                          ));
                    }),
              ),
              GestureDetector(
                onTap: () {
                  DashboardBloc.instance.add(DashboardAddNewTagEvent(msg: ""));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  child: Text(
                    "ADD NEW TAG",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: service.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.5,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 160,
                    margin: EdgeInsets.only(
                        top: 10, left: 15, right: 15, bottom: 10),
                    child: Neumorphic(
                      style: NeumorphicStyle(depth: 5, intensity: 1),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                service[index].title,
                                style: GoogleFonts.roboto(
                                    textStyle: TextStyle(fontSize: 12)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              if (service[index].unit != "mm:ss")
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      service[index].value,
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Text(
                                        service[index].unit,
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black
                                                    .withOpacity(0.4))),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  children: [
                                    Text(
                                      service[index].value,
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Text(
                                      service[index].unit,
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black
                                                  .withOpacity(0.4))),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityView extends StatelessWidget {
  const ActivityView({
    Key? key,
    required this.activity,
  }) : super(key: key);

  final ActivityModel activity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
                depth: 5, intensity: 1, boxShape: NeumorphicBoxShape.circle()),
            child: Container(
              padding: EdgeInsets.all(20),
              child: SvgPicture.asset(
                activity.icon,
                height: 70,
              ),
            ),
          ),
          Column(
            children: [
              Text(
                activity.name,
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              Text(
                "STARTED AT 5:45 PM",
                style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: NeumorphicTheme.accentColor(context))),
              ),
              PrimaryButton(
                horizontalPadding: 20,
                title: "STOP ACTIVITY",
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AddActivityCardView extends StatelessWidget {
  const AddActivityCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Neumorphic(
            style: NeumorphicStyle(
                depth: 5, intensity: 1, boxShape: NeumorphicBoxShape.circle()),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.add,
                size: 50,
                color: NeumorphicTheme.accentColor(context),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          "ADD ACTIVITY",
          style: kLTwoTextStyle(Colors.black, FontWeight.bold),
        )
      ],
    );
  }
}

class TrainingHeaderView extends StatelessWidget {
  const TrainingHeaderView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.03,
        ),
        GestureDetector(
          onTap: () {},
          child: Neumorphic(
            style: NeumorphicStyle(
                intensity: 1, depth: 5, boxShape: NeumorphicBoxShape.circle()),
            child: Container(
              height: 45,
              width: 45,
              child: Icon(Icons.menu),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Neumorphic(
          style: NeumorphicStyle(depth: -2, intensity: 1),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "00:20:56",
                  style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        intensity: 1,
                        depth: 5,
                        boxShape: NeumorphicBoxShape.circle()),
                    child: Container(
                      height: 24,
                      width: 24,
                      child: Icon(
                        Icons.stop,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
