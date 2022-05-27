import 'package:conqur/Modules/trt/bloc/trt_bloc.dart';
import 'package:conqur/helpers/Widgets/HeaderView.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TRTStartTestPage extends StatefulWidget {
  const TRTStartTestPage({Key? key}) : super(key: key);

  @override
  State<TRTStartTestPage> createState() => _TRTStartTestPageState();
}

class _TRTStartTestPageState extends State<TRTStartTestPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: HeaderView(
              onPressed: () {},
              title: "TRAINING READINESS",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Neumorphic(
              style: const NeumorphicStyle(depth: -5, intensity: 1),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0, top: 25),
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
                                    ..onTap = () => print('Tap Here onTap'),
                                ),
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 50, right: 50, top: 100, bottom: 50),
                      child: SvgPicture.asset('assets/images/lying.svg',
                          width: 180,
                          height: 80,
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35, right: 15, top: 25, bottom: 5),
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
                            padding: EdgeInsets.only(top: 33, left: 5),
                            child: Text(
                              "Please lie down comfortably and try to keep yourself relaxed throughout the test",
                              style: GoogleFonts.roboto(
                                  color: Colors.black.withOpacity(0.5),
                                  height: 1.2),
                            ),
                          )
                        ],
                      ),
                    ),
                    PrimaryButton(
                      onPressed: () {
                        TRTBloc.instance.add(TRTOngoingEvent());
                      },
                      title: "START TEST",
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            child: TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Text(
                      "VIEW ALL QRT REPORTS",
                      style: GoogleFonts.roboto(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.black.withOpacity(0.5),
                      size: 18,
                    )
                  ],
                )),
          )
        ],
      ),
    ));
  }
}
