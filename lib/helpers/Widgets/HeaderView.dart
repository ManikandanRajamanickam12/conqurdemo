import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({this.title, required this.onPressed});

  final String? title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Neumorphic(
            style: NeumorphicStyle(
                intensity: 1, depth: 5, boxShape: NeumorphicBoxShape.circle()),
            child: Container(
              padding: EdgeInsets.all(10),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
                size: 18,
              )),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Text(
            title ?? "",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
