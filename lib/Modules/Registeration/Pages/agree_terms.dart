import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AgreeTermsPage extends StatefulWidget {
  const AgreeTermsPage({Key? key}) : super(key: key);

  @override
  _AgreeTermsPageState createState() => _AgreeTermsPageState();
}

class _AgreeTermsPageState extends State<AgreeTermsPage> {
  bool agreedEula = false;
  bool agreedPersonalInfo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Text(
                  "SIGNUP",
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                SvgPicture.asset(
                  ImageNames.login,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "BY CONTINUING, I UNDERSTAND & AGREE TO THE FOLLOWING",
                    style: NeumorphicTheme.currentTheme(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                eulaAgreeWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                personalInfoAgreeWidget(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Column(
                  children: [
                    PrimaryButton(
                      color: agreedEula && agreedPersonalInfo
                          ? NeumorphicTheme.accentColor(context)
                          : Colors.black.withOpacity(0.12),
                      horizontalPadding: 30,
                      onPressed: () {
                        if (agreedEula) {
                          if (agreedPersonalInfo) {
                            AuthBloc.instance
                                .add(AuthTermsEvent(msg: 'agreed'));
                          } else {
                            Common.showInfo(
                                isInfo: false,
                                buildContext: context,
                                msg: "Please agree to End user terms");
                          }
                        } else {
                          Common.showInfo(
                              isInfo: false,
                              buildContext: context,
                              msg: "Please agree to the data sharing");
                        }
                      },
                      title: "CONTINUE",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "I Disagree.",
                          style: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText1,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        GestureDetector(
                            onTap: () {
                              AuthBloc.instance.add(AuthInitialEvent(msg: ""));
                            },
                            child: Text("Exit",
                                style: NeumorphicTheme.currentTheme(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(
                                        color: NeumorphicTheme.accentColor(
                                            context))))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget eulaAgreeWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Checkbox(
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: agreedEula,
              checkColor: !agreedEula ? Colors.black : Colors.white,
              activeColor: !agreedEula
                  ? Colors.transparent
                  : NeumorphicTheme.accentColor(context),
              onChanged: (value) {
                setState(() {
                  agreedEula = value!;
                });
              },
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      _launchTermsURL();
                    },
                    child: Text(
                      "Service End User Terms.",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.black.withOpacity(0.9),
                          height: 1.5,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
                TextSpan(
                    text: " and",
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(color: Colors.black))),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      _launchTermsURL();
                    },
                    child: Text(
                      " EULA.",
                      style: TextStyle(
                        height: 1.5,
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.9),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ], style: TextStyle(height: 1.5)),
            ),
          )
        ],
      ),
    );
  }

  Widget personalInfoAgreeWidget() {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Checkbox(
              value: agreedPersonalInfo,
              visualDensity: VisualDensity.compact,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              checkColor: !agreedPersonalInfo ? Colors.grey : Colors.white,
              activeColor: !agreedPersonalInfo
                  ? Colors.grey
                  : NeumorphicTheme.accentColor(context),
              onChanged: (value) {
                setState(() {
                  agreedPersonalInfo = value!;
                });
              },
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: RichText(
              softWrap: true,
              text: TextSpan(children: [
                TextSpan(
                    text:
                        "I consent to provide my personal and health related data which may be saved and utilised during the service. ",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    )),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      _launchPrivacyPolicyURL();
                    },
                    child: Text(
                      "Read More",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          height: 1.5,
                          color: NeumorphicTheme.accentColor(context),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ], style: GoogleFonts.roboto(textStyle: TextStyle(height: 1.5))),
            ),
          )
        ],
      ),
    );
  }

  _launchTermsURL() async {
    const url = 'https://www.netrin.tech/terms-of-use';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchPrivacyPolicyURL() async {
    const url = 'https://www.netrin.tech/privacy-policy';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
