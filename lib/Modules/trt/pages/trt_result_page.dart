import 'package:conqur/Modules/profile/pages/edit_profile.dart';
import 'package:conqur/Modules/profile/pages/header.dart';
import 'package:conqur/Modules/trt/bloc/trt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TRTResultPage extends StatefulWidget {
  const TRTResultPage({Key? key}) : super(key: key);

  @override
  State<TRTResultPage> createState() => _TRTResultPageState();
}

class _TRTResultPageState extends State<TRTResultPage> {
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Neumorphic(
                style: const NeumorphicStyle(depth: -5, intensity: 1),
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(25),
                        child: SvgPicture.asset('assets/images/QRT-card.svg',
                            width: 180,
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Neumorphic(
                          style: NeumorphicStyle(
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(8)),
                              depth: -2),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "QRT SCORE",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                const Text(
                                  "73",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 40, bottom: 60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 80,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF4F4F4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text("0 - 30 Poor"),
                            ),
                            Container(
                              width: 120,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: const Color(0xffF4F4F4),
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Text("31 - 60 Average"),
                            ),
                            GestureDetector(
                              onTap: (() {
                                TRTBloc.instance.add(TRTEditProfileEvent());
                              }),
                              child: Container(
                                width: 120,
                                height: 35,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: const Color(0xffEC7070),
                                    borderRadius: BorderRadius.circular(20)),
                                child: const Text(
                                  "61 - 100 Good",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        "EXCELLENT!",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "YOUR RECOVERY SCORE",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "IS AVOBE AVERAGE",
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 40, left: 40, right: 40, bottom: 20),
                        width: 335,
                        alignment: Alignment.center,
                        child: Text(
                          "A Good recovery score means that your body has recuperated from the previous day's stress and fatigue.It is now ready to perform at its optimum best",
                          textAlign: TextAlign.justify,
                          maxLines: 5,
                          style: GoogleFonts.roboto(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      )),
    );
  }
}
