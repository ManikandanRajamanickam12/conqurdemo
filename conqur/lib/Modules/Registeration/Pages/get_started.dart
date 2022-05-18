import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatefulWidget {
  @override
  _GetStartedPageState createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(
                ImageNames.getStarted,
                height: MediaQuery.of(context).size.height * 0.28,
              ),
              Column(
                children: [
                  Text(
                    "YOU'RE IN",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.normal,
                          color: NeumorphicTheme.accentColor(context)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "!",
                    style: GoogleFonts.roboto(
                      textStyle:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Improve your performance with our qualitative and quantitative analysis of your stress, recovery, activity and sleep.",
                  textAlign: TextAlign.center,
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline5,
                ),
              ),
              Column(
                children: [
                  PrimaryButton(
                    horizontalPadding: 20,
                    onPressed: () {
                      AuthBloc.instance.add(AuthGetStartedEvent(msg: ""));
                    },
                    title: "GET STARTED",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
