import 'package:conqur/Modules/profile/Models/sensor_model.dart';
import 'package:conqur/Modules/profile/pages/device_info.dart';
import 'package:conqur/Modules/profile/pages/header.dart';
import 'package:conqur/Modules/profile/pages/help_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SensorDetails extends StatefulWidget {
  const SensorDetails({Key? key}) : super(key: key);
  @override
  State<SensorDetails> createState() => _SensorDetailsState();
}

class _SensorDetailsState extends State<SensorDetails> {
  SensorModel deviceData = SensorModel();
  bool update = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Header(title: "SENSOR profile"),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 120,
              // padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconDetails(
                      assetSvg: "assets/images/bluetooth.svg",
                      status: "Disconnect"),
                  Container(
                    margin: EdgeInsets.only(right: 15),
                    child: const Image(
                      image: AssetImage('assets/images/device.png'),
                      width: 113,
                      height: 113,
                    ),
                  ),
                  IconDetails(
                      assetSvg: "assets/images/refresh.svg", status: "Refresh")
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(deviceData.deviceName.toString(),
                style: GoogleFonts.roboto(fontSize: 20)),
            const SizedBox(
              height: 15,
            ),
            if (deviceData.connectionStatus == true)
              GestureDetector(
                onTap: (() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HelpPage())));
                }),
                child: Text(
                  "Connected",
                  style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              )
            else
              const Text("Not Connected"),
            const SizedBox(
              height: 45,
            ),

            //Device Information Card
            const DeviceInfo(),

            const SizedBox(
              height: 50,
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: GestureDetector(
                onTap: (() {
                  setState(() {
                    update = !update;
                  });
                }),
                child: Neumorphic(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (update == true) ...[
                              Text(
                                "Your firmware is up to data",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SvgPicture.asset(
                                    'assets/images/tick.svg',
                                    alignment: Alignment.center,
                                    width: 25,
                                    height: 50,
                                    fit: BoxFit.scaleDown),
                              ),
                            ] else ...[
                              Text(
                                "New Updates Available!",
                                style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    color: Colors.black.withOpacity(0.3)),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 30),
                                child: NeumorphicButton(
                                  style: NeumorphicStyle(
                                      shape: NeumorphicShape.flat,
                                      boxShape: NeumorphicBoxShape.roundRect(
                                          BorderRadius.circular(18)),
                                      intensity: 1,
                                      depth: 3,
                                      color: const Color(0xffECECEF)),
                                  onPressed: () {
                                    setState(() {
                                      update = !update;
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 22,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      "UPDATE FIRMWARE",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.red,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ])),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class IconDetails extends StatelessWidget {
  IconDetails({Key? key, required this.assetSvg, required this.status})
      : super(key: key);
  String assetSvg;
  String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(assetSvg,
            color: Colors.black,
            alignment: Alignment.center,
            width: 13,
            height: 25,
            fit: BoxFit.scaleDown),
        Text(status)
      ],
    );
  }
}
