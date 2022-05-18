import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicSegmentControl extends StatefulWidget {
  var name1;
  var name2;
  Function(int? index, String? name) onPressed;

  NeumorphicSegmentControl({this.name1, this.name2, required this.onPressed});

  @override
  State<NeumorphicSegmentControl> createState() =>
      _NeumorphicSegmentControlState();
}

class _NeumorphicSegmentControlState extends State<NeumorphicSegmentControl> {
  var isIndex1Pressed = true;

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 3,
        intensity: 1,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(7)),
      ),
      child: Container(
        width: 120,
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isIndex1Pressed = true;
                    widget.onPressed(1, widget.name1);
                  });
                },
                child: Container(
                  color: !isIndex1Pressed
                      ? Colors.transparent
                      : Color.fromRGBO(159, 219, 167, 1),
                  padding: EdgeInsets.all(9),
                  child: Center(
                      child: Text(
                    widget.name1,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: !isIndex1Pressed
                            ? FontWeight.normal
                            : FontWeight.bold),
                  )),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isIndex1Pressed = false;
                    widget.onPressed(2, widget.name2);
                  });
                },
                child: Container(
                  color: isIndex1Pressed
                      ? Colors.transparent
                      : Color.fromRGBO(159, 219, 167, 1),
                  padding: EdgeInsets.all(9),
                  child: Center(
                    child: Text(
                      widget.name2,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: isIndex1Pressed
                              ? FontWeight.normal
                              : FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
