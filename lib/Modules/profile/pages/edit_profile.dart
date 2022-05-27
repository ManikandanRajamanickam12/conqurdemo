// ignore_for_file: prefer_const_constructors
import 'dart:io';

import 'package:conqur/Modules/profile/pages/field_list.dart';
import 'package:conqur/Modules/profile/pages/header.dart';
import 'package:conqur/Modules/profile/pages/metric.dart';
import 'package:conqur/Modules/profile/pages/sensor_details.dart';
import 'package:conqur/Modules/profile/pages/user_profile.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool edit = false;
  File? image;
  final ImagePicker _picker = ImagePicker();
  int? buttonvalue1;
  int? buttonvalue2;

  Row exerciseOption(String activetime, int getbuttonvalue) {
    return Row(
      children: [
        Radio(
            value: getbuttonvalue,
            activeColor: Colors.red,
            groupValue: buttonvalue1,
            onChanged: (value) {
              setState(() {
                buttonvalue1 = value as int;
              });
            }),
        Text(activetime, style: GoogleFonts.roboto(fontSize: 16)),
      ],
    );
  }

  Row athleticOption(String level, int getbuttonvalue) {
    return Row(
      children: [
        Radio(
            value: getbuttonvalue,
            activeColor: Colors.red,
            groupValue: buttonvalue2,
            onChanged: (value) {
              setState(() {
                buttonvalue2 = value as int;
              });
            }),
        Text(
          level,
          style: GoogleFonts.roboto(fontSize: 16),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      try {
        final curentimage =
            await _picker.pickImage(source: ImageSource.gallery);
        if (curentimage == null) return;
        final imagetemporary = File(curentimage.path);
        setState(() {
          this.image = imagetemporary;
        });
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(title: "PROFILE"),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.05))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: (image == null)
                                ? NetworkImage(
                                    "https://images.unsplash.com/photo-1625888593864-afef418841e7?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=60&raw_url=true&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVkZGhhJTIwc3RhdHVlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500")
                                : FileImage(image!) as ImageProvider)),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(width: 1, color: Color(0xffD5D5D5)),
                            color: Color(0xffD5D5D5)),
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_alt_rounded,
                            size: 22,
                          ),
                          onPressed: () {
                            getImage();
                          },
                        ),
                      ))
                ],
              ),
              if (edit == true) ...[
                SizedBox(height: 20),
                FieldList(
                  fieldname: "Name",
                  icon: FontAwesomeIcons.userAlt,
                  type: TextInputType.name,
                ),
                SizedBox(height: 20),
                FieldList(
                  fieldname: "Email",
                  icon: FontAwesomeIcons.solidEnvelope,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                FieldList(
                  fieldname: "Date of birth",
                  icon: FontAwesomeIcons.solidCalendarDays,
                  type: TextInputType.datetime,
                ),
                Container(
                  width: 330,
                  height: 90,
                  margin: EdgeInsets.only(left: 45, right: 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Metrics(metricName: "Height", trailing: "cm"),
                      Metrics(metricName: "Weight", trailing: "kg")
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: 200,
                          margin: EdgeInsets.only(right: 120),
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Exercise Frequency",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                              exerciseOption("Occasion", 1),
                              exerciseOption("Daily", 2),
                              exerciseOption("Weekly", 3),
                              exerciseOption("Monthly", 4),
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Athletic proficiency",
                                  style: GoogleFonts.roboto(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                              ),
                              athleticOption("Intermediate", 1),
                              athleticOption("Amateur", 2),
                              athleticOption("Professional", 3),
                            ],
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: NeumorphicButton(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(18)),
                        intensity: 1,
                        depth: 3,
                        color: const Color(0xffECECEF)),
                    onPressed: () {
                      setState(() {
                        // edit = !edit;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SensorDetails())));
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 22,
                      alignment: Alignment.center,
                      child: const Text(
                        "SAVE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                )
              ] else ...[
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: NeumorphicButton(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(18)),
                            intensity: 1,
                            depth: 3,
                            color: const Color(0xffECECEF)),
                        onPressed: () {
                          setState(() {
                            edit = !edit;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 15,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                "Edit Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              Icon(
                                Icons.edit_outlined,
                                size: 18,
                                color: Colors.black.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    //User Current detail Screen
                    UserProfile()
                  ],
                )
              ]
            ]),
      )),
    );
  }
}
