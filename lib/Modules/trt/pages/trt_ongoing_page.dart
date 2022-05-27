import 'package:conqur/Modules/profile/pages/header.dart';
import 'package:conqur/Modules/trt/bloc/trt_bloc.dart';
import 'package:conqur/Modules/trt/pages/trt_result_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TRTOngoingPage extends StatefulWidget {
  const TRTOngoingPage({Key? key}) : super(key: key);

  @override
  State<TRTOngoingPage> createState() => _TRTOngoingPageState();
}

class _TRTOngoingPageState extends State<TRTOngoingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(title: "TRANING READINESS"),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Neumorphic(
                style: const NeumorphicStyle(depth: -5, intensity: 1),
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 25),
                        child: Container(
                            width: 380,
                            height: 90,
                            padding:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: RichText(
                              text: TextSpan(
                                text:
                                    "Take a Quick Recovery Test (QRT) to get a glimpse of how well your body recovered.",
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  color: Colors.black,
                                  height: 1.3,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "Learn More",
                                    style: const TextStyle(
                                        height: 1.5,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        TRTBloc.instance.add(TRTResultEvent());
                                      },
                                  ),
                                ],
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: SvgPicture.asset('assets/images/clock.svg',
                            width: 180,
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              depth: -5,
                              shadowDarkColorEmboss: Colors.grey,
                              shadowLightColorEmboss: Colors.white),
                          child: Container(
                            width: 265,
                            height: 60,
                            alignment: Alignment.center,
                            child: const Text(
                              "05m : 10s",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 35, right: 15, top: 25, bottom: 25),
                        child: Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.grey,
                              size: 20,
                            ),
                            Container(
                              width: 270,
                              height: 85,
                              padding: EdgeInsets.only(top: 35, left: 5),
                              child: Text(
                                "Please lie down comfortably and try to keep yourself relaxed throughout the test",
                                style: GoogleFonts.roboto(
                                    color: Colors.black.withOpacity(0.5),
                                    height: 1.2),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            )
          ],
        ),
      )),
    );
  }
}
