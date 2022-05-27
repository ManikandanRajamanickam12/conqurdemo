import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectingSensorPage extends StatelessWidget {
  var serialNumberController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: Center(
                    child: SvgPicture.asset(
                      ImageNames.connectDevice,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      ImageNames.connectLoader,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Connecting to sensor",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: NeumorphicTheme.disabledColor(context)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
