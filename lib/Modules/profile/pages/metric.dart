import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Metrics extends StatelessWidget {
  Metrics({Key? key, required this.metricName, required this.trailing})
      : super(key: key);
  String metricName;
  String trailing;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            metricName,
            style:
                TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
          ),
        ),
        Neumorphic(
            style: NeumorphicStyle(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
                depth: -2,
                intensity: 1),
            child: Container(
              width: 120,
              height: 45,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                        left: 20, right: 20, top: 20, bottom: 18),
                    disabledBorder: InputBorder.none,
                    helperStyle: TextStyle(
                        fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    border: InputBorder.none,
                    suffixIcon: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Text(
                          trailing,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5)),
                        ))),
              ),
            )),
      ],
    );
  }
}
