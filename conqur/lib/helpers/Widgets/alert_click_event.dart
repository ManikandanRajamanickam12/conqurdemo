import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../utils/Theme.dart';

class AlertClickEventWidget extends StatelessWidget {
  const AlertClickEventWidget(
      {required this.negativeText,
      this.positiveText,
      this.postiveButtonClicked,
      this.negativeColor,
      this.positiveColor,
      required this.negativeButtonClicked,
      this.height});

  final String? negativeText;
  final String? positiveText;
  final Color? negativeColor;
  final Color? positiveColor;
  final Function? postiveButtonClicked;
  final Function negativeButtonClicked;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50,
      child: Column(
        children: [
          Container(
            height: 1,
            color: Color.fromRGBO(230, 230, 234, 1),
          ),
          Row(
            mainAxisAlignment: positiveText != null
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => negativeButtonClicked(),
                  child: Text(
                    negativeText ?? "",
                    style: kLTwoTextStyle(negativeColor ?? Colors.black),
                    textAlign: TextAlign.center,
                  )),
              Visibility(
                visible: positiveText != null,
                child: Container(
                  width: 1,
                  color: Color.fromRGBO(230, 230, 234, 1),
                ),
              ),
              Visibility(
                visible: positiveText != null,
                child: TextButton(
                    onPressed: () {
                      if (postiveButtonClicked != null) {
                        postiveButtonClicked!();
                      }
                    },
                    child: Text(
                      positiveText ?? "",
                      style: kLTwoTextStyle(positiveColor ??
                          NeumorphicTheme.accentColor(context)),
                      textAlign: TextAlign.center,
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
