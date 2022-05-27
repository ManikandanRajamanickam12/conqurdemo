import 'package:conqur/Modules/report/pages/report_page.dart';
import 'package:conqur/Modules/trt/trt_screen.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuPage extends StatelessWidget {
  const SideMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            intensity: 1,
                            depth: 5,
                            boxShape: NeumorphicBoxShape.circle()),
                        child: Container(
                          height: 45,
                          width: 45,
                          child: Icon(Icons.menu),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.87,
                child: Neumorphic(
                    style: NeumorphicStyle(
                        depth: 5,
                        intensity: 1,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(20))),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 20, bottom: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: Hero(
                                tag: "dp",
                                child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                          ImageNames.dp,
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                )),
                            title: Text(
                              "John Doe",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "Conqurer since Jan 5,2020",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                            onTap: () {},
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Divider(
                              color: const Color(0xff707070).withOpacity(0.2),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => ReportPage(),
                                ),
                              );
                            },
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: SvgPicture.asset(ImageNames.reportIcon)),
                            title: Text(
                              "Report",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "View session reports",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => TRTScreen(),
                                ),
                              );
                            },
                            leading: Container(
                                width: 40,
                                height: 40,
                                child:
                                    SvgPicture.asset(ImageNames.readinessIcon)),
                            title: Text(
                              "Training Readiness Test",
                              style: TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              "Take a test,view past reports",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: SvgPicture.asset(ImageNames.sensorIcon)),
                            title: Text(
                              "Sensor",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "Sensor details",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Container(
                                width: 40,
                                height: 40,
                                child:
                                    SvgPicture.asset(ImageNames.settingsIcon)),
                            title: Text(
                              "Setting",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "Device setting,theme",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Container(
                                width: 40,
                                height: 40,
                                child: SvgPicture.asset(ImageNames.helpIcon)),
                            title: Text(
                              "Help",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            subtitle: Text(
                              "FAQs, User guides, Tech support",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
