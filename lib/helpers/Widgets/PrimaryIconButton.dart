import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PrimaryIconButton extends StatefulWidget {
  dynamic onPressed;
  String? title;
  Widget? icon;
  EdgeInsets? margin;
  Color? color;
  double? verticalPadding;
  double? horizontalPadding;
  PrimaryIconButton(
      {required this.onPressed,
      this.title,
      this.icon,
      this.margin,
      this.verticalPadding,
      this.horizontalPadding,
      this.color});

  @override
  State<PrimaryIconButton> createState() => _PrimaryIconButtonState();
}

class _PrimaryIconButtonState extends State<PrimaryIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: NeumorphicButton(
          style: NeumorphicStyle(
              intensity: 1,
              depth: 7,
              color: NeumorphicTheme.baseColor(context),
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
          child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: widget.verticalPadding ?? 4,
                  horizontal: widget.horizontalPadding ?? 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title ?? "",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: widget.color ?? Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  widget.icon!,
                ],
              )),
          onPressed: widget.onPressed,
        ));
  }
}
