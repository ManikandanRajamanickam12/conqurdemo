import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicCard extends StatelessWidget {
  Widget child;
  double? height;
  EdgeInsets? margin;

  NeumorphicCard({required this.child, this.height, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: Container(
        height: height ?? MediaQuery.of(context).size.height * 0.35,
        margin: margin ?? EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: -2,
            intensity: 1,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: Container(width: double.infinity, child: child),
        ),
      ),
    );
  }
}

class NeumorphicDynamicCard extends StatelessWidget {
  Widget child;
  EdgeInsets? margin;

  NeumorphicDynamicCard({required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      child: Container(
        margin: margin ?? EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: -2,
            intensity: 1,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
          ),
          child: Container(width: double.infinity, child: child),
        ),
      ),
    );
  }
}
