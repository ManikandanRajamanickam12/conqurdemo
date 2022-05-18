import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

class CustomLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: Center(
        child: Lottie.asset(JsonNames.splash,
            width: MediaQuery.of(context).size.width * 0.5),
      ),
    );
  }
}
