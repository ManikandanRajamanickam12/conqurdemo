import 'dart:convert';
import 'dart:io';

import 'package:conqur/Modules/Registeration/Pages/login.dart';
import 'package:conqur/Modules/Registeration/model/login_request.dart';
import 'package:conqur/Modules/base/base_screen.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/shared_preference.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with TBaseStateMixin {
  var emailController = TextEditingController();

  ///AuthBloc is responsible for all the business logic functions in the Registration process

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceInformation();
  }

  void getDeviceInformation() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceInformation = {};
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceInformation = {
        "device_id": build.androidId,
        "os_version": "Android ${build.version.release}",
        "model": "${build.manufacturer} ${build.model}",
        "firebase_id": "ajuhdfjhabsdjfbsjdf"
      };
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceInformation = {
        "device_id": data.identifierForVendor,
        "os_version": data.systemVersion,
        "model": data.utsname.machine,
        "firebase_id": "ksdhfglksadhfsdkj"
      };
    }
    var deviceDetails = Device.fromJson(deviceInformation);
    StorageManager.setDeviceDetails(jsonEncode(deviceDetails));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "SIGNUP",
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
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Text("Enter your email address",
                    style: NeumorphicTheme.currentTheme(context)
                        .textTheme
                        .headline2),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.065,
                ),
                Column(
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: emailController,
                        onChanged: (value) {
                          setState(() {});
                        },
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 11, top: 11, right: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("An OTP will be sent to this email address",
                        style: NeumorphicTheme.currentTheme(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(
                                color: NeumorphicTheme.disabledColor(context)))
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Column(
                  children: [
                    Container(
                      child: PrimaryButton(
                        horizontalPadding: 30,
                        color: emailController.text.length > 0
                            ? NeumorphicTheme.accentColor(context)
                            : Colors.black.withOpacity(0.12),
                        onPressed: () {
                          validateSignIn();
                        },
                        title: "GET OTP",
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText1,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                CupertinoPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            // style: TextButton.styleFrom(
                            //   primary: NeumorphicTheme.accentColor(context),
                            // ),
                            child: Text("Login",
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

  void validateSignIn() async {
    String patttern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(patttern);
    if (emailController.text.length == 0) {
      Fluttertoast.showToast(
          msg: 'Please enter email Address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else if (!regExp.hasMatch(emailController.text)) {
      Fluttertoast.showToast(
          msg: 'Please enter valid email Address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.white,
          textColor: Colors.black);
    } else {
      ///TODO: remove this line when API changes are completed
      StorageManager.setEmailAddress(emailController.text);

      ///LoginRequest is a post parameter body sent for the signupAPI
      var deviceInfo =
          Device.fromJson(jsonDecode(StorageManager.getDeviceDetails() ?? ""));
      var model = LoginRequest(email: emailController.text, device: deviceInfo);

      // authBloc.login(model).then((value) {
      //   Navigator.of(context).push(
      //     CupertinoPageRoute(
      //         builder: (context) => OtpValidationPage(
      //               title: "SIGNUP",
      //               emailId: emailController.text,
      //               loginResponse: value,
      //             )),
      //   );
      // }).catchError((httpResponse) {
      //   if (httpResponse is THttpException) {
      //     if (httpResponse.codeStr == "INACTIVE") {
      //       // showReactivateDialog();
      //     } else {
      //       THttpException exception = httpResponse;
      //       showError(msg: exception.detail, statusCode: exception.code);
      //     }
      //   } else {
      //     showError(msg: "Unknown Error", statusCode: 400);
      //   }
      // });
    }
  }
}
