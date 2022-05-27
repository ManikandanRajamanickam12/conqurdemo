import 'package:conqur/helpers/Widgets/base_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';

class ServerErrorCard extends StatelessWidget {
  const ServerErrorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicCard(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/json/lottieError.json'),
            Text(
              "Server Error",
              style: NeumorphicTheme.currentTheme(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
