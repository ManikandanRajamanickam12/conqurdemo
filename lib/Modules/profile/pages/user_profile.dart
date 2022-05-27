import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        UserDetail(
            fieldname: "Name",
            icon: FontAwesomeIcons.userAlt,
            type: TextInputType.name,
            icondepth: -2,
            fielddepth: 2),
        const SizedBox(height: 20),
        UserDetail(
            fieldname: "Email",
            icon: FontAwesomeIcons.solidEnvelope,
            type: TextInputType.emailAddress,
            icondepth: -2,
            fielddepth: 2),
        const SizedBox(height: 20),
        UserDetail(
            fieldname: "Date of birth",
            icon: FontAwesomeIcons.solidCalendarDays,
            type: TextInputType.datetime,
            icondepth: -2,
            fielddepth: 2),
        const SizedBox(height: 20),
        UserDetail(
            fieldname: "Exercise frequency",
            icon: FontAwesomeIcons.solidCalendarDays,
            type: TextInputType.datetime,
            icondepth: -2,
            fielddepth: 2),
        const SizedBox(height: 20),
        UserDetail(
            fieldname: "Athletic proficiency",
            icon: FontAwesomeIcons.solidCalendarDays,
            type: TextInputType.datetime,
            icondepth: -2,
            fielddepth: 2),
        const SizedBox(height: 30),
      ],
    );
  }
}

class UserDetail extends StatelessWidget {
  UserDetail(
      {Key? key,
      required this.fieldname,
      required this.icon,
      required this.type,
      required this.fielddepth,
      required this.icondepth})
      : super(key: key);
  String fieldname;
  IconData icon;
  TextInputType type;
  double icondepth;
  double fielddepth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 85,
      margin: const EdgeInsets.only(left: 45, right: 45),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fieldname,
              style:
                  TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
            ),
          ),
          Neumorphic(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                  depth: fielddepth,
                  intensity: 1),
              child: Container(
                height: 45,
                child: ListTile(
                  minLeadingWidth: 45,
                  horizontalTitleGap: 0,
                  leading: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          depth: icondepth,
                          intensity: 1,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(5))),
                      child: Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        child: FaIcon(
                          icon,
                          size: 15,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(fieldname),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
