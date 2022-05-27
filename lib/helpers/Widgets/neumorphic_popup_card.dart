import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicPopupCard extends StatelessWidget {
  Widget child;
  double? height;

  NeumorphicPopupCard({required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.33,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Neumorphic(
        style: NeumorphicStyle(
            depth: 5,
            intensity: 2,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20))),
        child: Container(width: double.infinity, child: child),
      ),
    );
  }
}
