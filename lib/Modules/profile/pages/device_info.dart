import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../Models/sensor_model.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({Key? key}) : super(key: key);

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  SensorModel data = SensorModel();
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Neumorphic(
          style: NeumorphicStyle(depth: -5, intensity: 1),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DeviceDetails(
                    listHeight: 50,
                    assetSvg: 'assets/images/id.svg',
                    deviceInfo: "Sensor Id",
                    assetWidth: 20,
                    assetHeight: 45,
                    assetPadding: 0,
                    trailing: data.deviceId.toString(),
                  ),
                  DeviceDetails(
                    listHeight: 50,
                    assetSvg: 'assets/images/Battery-status.svg',
                    deviceInfo: "Battery",
                    assetWidth: 20,
                    assetHeight: 25,
                    assetPadding: 18,
                    trailing: data.batteryStatus.toString(),
                  ),
                  DeviceDetails(
                    listHeight: 50,
                    assetSvg: 'assets/images/sensor.svg',
                    deviceInfo: "Firmware Version",
                    assetWidth: 25,
                    assetHeight: 50,
                    assetPadding: 60,
                    trailing: data.firmwareVersion.toString(),
                  ),
                  DeviceDetails(
                    listHeight: 50,
                    assetSvg: 'assets/images/data.svg',
                    deviceInfo: "Available Data",
                    assetWidth: 25,
                    assetHeight: 50,
                    assetPadding: 68,
                    trailing: data.availabledata.toString(),
                  ),
                  DeviceDetails(
                    listHeight: 50,
                    assetSvg: 'assets/images/status.svg',
                    deviceInfo: "Session Status",
                    assetWidth: 25,
                    assetHeight: 50,
                    assetPadding: 35,
                    trailing: data.sessionStatus.toString(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 35, right: 18, top: 18, bottom: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        FlutterSwitch(
                          activeColor: Colors.red,
                          inactiveColor: Color(0xffEDEDED).withOpacity(0.1),
                          toggleColor: Colors.grey,
                          activeToggleColor: Colors.white,
                          inactiveSwitchBorder: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          width: 45.0,
                          height: 24.0,
                          valueFontSize: 12.0,
                          toggleSize: 20.0,
                          value: status,
                          onToggle: (val) {
                            setState(() {
                              status = val;
                            });
                          },
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Unpair Device",
                            style: GoogleFonts.roboto(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }
}

class DeviceDetails extends StatelessWidget {
  DeviceDetails(
      {Key? key,
      required this.listHeight,
      required this.assetSvg,
      required this.deviceInfo,
      required this.assetWidth,
      required this.assetHeight,
      required this.assetPadding,
      required this.trailing})
      : super(key: key);
  double listHeight;
  String assetSvg;
  String deviceInfo;
  double assetWidth;
  double assetHeight;
  double assetPadding;
  String trailing;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: listHeight,
      child: ListTile(
        horizontalTitleGap: 0,
        leading: SvgPicture.asset(assetSvg,
            alignment: Alignment.center,
            width: assetWidth,
            height: assetHeight,
            fit: BoxFit.scaleDown),
        title: Text(
          deviceInfo,
          style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.black.withOpacity(
                0.5,
              ),
              fontWeight: FontWeight.w600),
        ),
        trailing: Padding(
          padding: EdgeInsets.only(right: assetPadding),
          child: Text(
            trailing,
            style: GoogleFonts.roboto(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
