import 'package:conqur/helpers/Widgets/base_card.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BluetoothConnectingWidget extends StatelessWidget {
  const BluetoothConnectingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NeumorphicCard(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Connecting to the sensor.."),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            child: SvgPicture.asset(
              ImageNames.device,
            ),
          ),
        ],
      ),
    );
  }
}
