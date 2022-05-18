import 'dart:async';

import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/Modules/base/base_screen.dart';
import 'package:conqur/helpers/Widgets/PinEntryTextField.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/svg.dart';

class OtpValidationPage extends StatefulWidget {
  var title = "Login";
  var mobileNumber;
  OtpValidationPage({required this.title, required this.mobileNumber});

  @override
  _OtpValidationPageState createState() => _OtpValidationPageState();
}

class _OtpValidationPageState extends State<OtpValidationPage>
    with TBaseStateMixin {
  var timerText = "";
  var _otpText = "";
  Timer? _timer;
  var isResendEnabled = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    DateTime otpEndTime = DateTime.now().add(Duration(seconds: 15));
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (DateTime.now().millisecondsSinceEpoch >=
            otpEndTime.millisecondsSinceEpoch) {
          _timer?.cancel();
          isResendEnabled = true;
        } else {
          timerText = Common.instance.getTimeDifference(
              otpEndTime, DateTime.now(),
              timeDifference: TimeDifferenceType.minuteSecond);
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.title,
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                SvgPicture.asset(
                  ImageNames.login,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Text(
                  "Enter OTP sent to \n${widget.mobileNumber ?? "8248350384"}",
                  textAlign: TextAlign.center,
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Column(
                  children: [
                    PinEntryTextField(
                      showFieldAsBox: true,
                      onSubmit: (String value) {
                        setState(() {
                          _otpText = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    if (!isResendEnabled)
                      Column(
                        children: [
                          Text(
                            "OTP will expire in $timerText",
                            style: NeumorphicTheme.currentTheme(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    color:
                                        NeumorphicTheme.disabledColor(context)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    else
                      TextButton(
                        onPressed: () {
                          // authBloc
                          //     .resendOtp(widget.loginResponse.authToken!)
                          //     .then((value) {
                          //   startTimer();
                          // }).catchError((e) {
                          //   if (e is THttpException) {
                          //     THttpException exception = e;
                          //     showError(
                          //         msg: exception.detail,
                          //         statusCode: exception.code);
                          //   } else {
                          //     showError(msg: "Unknown Error", statusCode: 400);
                          //   }
                          // });
                        },
                        // style: TextButton.styleFrom(
                        //   primary: NeumorphicTheme.accentColor(context),
                        // ),
                        child: Text(
                          "Resend OTP",
                          style: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color:
                                      NeumorphicTheme.disabledColor(context)),
                        ),
                      ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Column(
                  children: [
                    PrimaryButton(
                      color: _otpText.length == 6
                          ? NeumorphicTheme.accentColor(context)
                          : Colors.black.withOpacity(0.12),
                      horizontalPadding: 20,
                      onPressed: () {
                        if (_otpText.length == 6) {
                          AuthBloc.instance.add(AuthValidateOtpEvent(msg: ""));
                        }
                      },
                      title: "VALIDATE OTP",
                    ),
                    TextButton.icon(
                      icon: Icon(Icons.chevron_left,
                          color: NeumorphicTheme.disabledColor(context)),
                      onPressed: () {
                        AuthBloc.instance.add(AuthInitialEvent(msg: ""));
                      },
                      style: ElevatedButton.styleFrom(
                        splashFactory: NoSplash.splashFactory,
                      ),
                      label: Text(
                        "GO BACK",
                        style: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: NeumorphicTheme.disabledColor(context)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // validateOtp() {
  //   if (_otpText != null && _otpText.length != 6) {
  //     showError(msg: "Entered pin is not valid", statusCode: 400);
  //     return;
  //   }
  //
  //   var requestModel = VerifyOtpRequest(
  //       authToken: widget.loginResponse.authToken, otpText: _otpText);
  //   authBloc.verifyOtp(requestModel).then((value) {
  //     StorageManager.setJwtToken(value.token ?? "");
  //     StorageManager.setUserDetails(jsonEncode(value));
  //     StorageManager.setDeviceId(value.device?.deviceId ?? 0);
  //     StorageManager.setUserLoggedIn(true);
  //     if (value.userEntryCode != null) {
  //       switch (value.userEntryCode!) {
  //         case UserEntryType.newUser:
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(
  //                 builder: (context) => AgreeTermsPage(),
  //               ),
  //               (route) => false);
  //           break;
  //         case UserEntryType.agreeTerms:
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(
  //                 builder: (context) => AgreeTermsPage(),
  //               ),
  //               (route) => false);
  //           break;
  //         case UserEntryType.userDetails:
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(
  //                 builder: (context) => UserDetailsPage(),
  //               ),
  //               (route) => false);
  //           break;
  //         case UserEntryType.bodyMetrics:
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(
  //                 builder: (context) => BodyMetricsPage(),
  //               ),
  //               (route) => false);
  //           break;
  //         case UserEntryType.dashboard:
  //           Navigator.of(context).pushAndRemoveUntil(
  //               CupertinoPageRoute(
  //                 builder: (context) => SensorDashboard(),
  //               ),
  //               (route) => false);
  //           break;
  //       }
  //     }
  //   }).catchError((e) {
  //     if (e is THttpException) {
  //       THttpException exception = e;
  //       showError(msg: exception.detail, statusCode: exception.code);
  //     } else {
  //       showError(msg: "Unknown Error", statusCode: 400);
  //     }
  //   });
  // }

}
