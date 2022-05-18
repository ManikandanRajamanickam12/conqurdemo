import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatefulWidget {
  dynamic onPressed;
  String? title;
  Color? color;
  Color? backgroundColor;
  double? horizontalPadding;
  double? fontSize;
  double? verticalPadding;
  PrimaryButton(
      {required this.onPressed,
      this.verticalPadding,
      this.title,
      this.color,
      this.backgroundColor,
      this.horizontalPadding,
      this.fontSize});

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: widget.verticalPadding ?? 15),
        child: NeumorphicButton(
          style: NeumorphicStyle(
              intensity: 1,
              depth: 5,
              color:
                  widget.backgroundColor ?? NeumorphicTheme.baseColor(context),
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100))),
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: 1.5, horizontal: widget.horizontalPadding ?? 15),
            child: Text(
              widget.title ?? "",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  fontSize: widget.fontSize ?? 14.0,
                  fontWeight: FontWeight.bold,
                  color: widget.color ?? NeumorphicTheme.accentColor(context),
                ),
              ),
            ),
          ),
          onPressed: widget.onPressed,
        ));
  }
}
