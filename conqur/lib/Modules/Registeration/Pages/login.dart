import 'dart:convert';
import 'dart:io';

import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
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
import 'package:package_info_plus/package_info_plus.dart';

class LoginPage extends StatefulWidget {
  String? number;
  LoginPage({this.number});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TBaseStateMixin {
  var mobileController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.number != null) {
      mobileController.text = widget.number!;
    }
    getDeviceInformation();
  }

  void getDeviceInformation() async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final info = await PackageInfo.fromPlatform();
    Map<String, dynamic> deviceInformation = {};
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      deviceInformation = {
        "device_id": build.androidId,
        "os_version": "Android ${build.version.release}",
        "model": "${build.manufacturer} ${build.model}",
        "firebase_id": "ajuhdfjhabsdjfbsjdf",
        "app_version": info.version
      };
    } else if (Platform.isIOS) {
      var data = await deviceInfoPlugin.iosInfo;
      deviceInformation = {
        "device_id": data.identifierForVendor,
        "os_version": data.systemVersion,
        "model": data.utsname.machine,
        "firebase_id": "ksdhfglksadhfsdkj",
        "app_version": info.version
      };
    }
    var deviceDetails = Device.fromJson(deviceInformation);
    StorageManager.setDeviceDetails(jsonEncode(deviceDetails));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Container(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "LOGIN",
                      style: NeumorphicTheme.currentTheme(context)
                          .textTheme
                          .headline1,
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
                    Text(
                      "Enter your phone number",
                      style: NeumorphicTheme.currentTheme(context)
                          .textTheme
                          .headline2,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Neumorphic(
                                style: NeumorphicStyle(
                                  depth: -2,
                                  intensity: 0.9,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(10)),
                                ),
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      "+91",
                                      style: TextStyle(fontSize: 16),
                                    ))),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Neumorphic(
                                style: NeumorphicStyle(
                                  depth: -2,
                                  intensity: 0.9,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(10)),
                                ),
                                child: TextFormField(
                                  controller: mobileController,
                                  maxLength: 10,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    counterText: "",
                                    contentPadding: EdgeInsets.only(
                                        left: 15,
                                        bottom: 15,
                                        top: 15,
                                        right: 15),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "An OTP will be sent to this mobile number",
                          style: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color:
                                      NeumorphicTheme.disabledColor(context)),
                        )
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
                            color: mobileController.text.length == 10
                                ? NeumorphicTheme.accentColor(context)
                                : Colors.black.withOpacity(0.12),
                            onPressed: () {
                              if (mobileController.text.length == 10) {
                                AuthBloc.instance.add(
                                    AuthValidateMobileNumberEvent(
                                        number: mobileController.text));
                              }
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
                            Text("Don't have an account?",
                                style: NeumorphicTheme.currentTheme(context)
                                    .textTheme
                                    .bodyText1),
                            TextButton(
                                onPressed: () {
                                  AuthBloc.instance
                                    ..add(AuthSignUpEvent(msg: ""));
                                },
                                // style: TextButton.styleFrom(
                                //   primary: NeumorphicTheme.accentColor(context),
                                // ),
                                child: Text(
                                  "Signup",
                                  style: NeumorphicTheme.currentTheme(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(
                                          color: NeumorphicTheme.accentColor(
                                              context)),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  // void validateSignIn() async {
  //   String patttern =
  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  //   RegExp regExp = new RegExp(patttern);
  //   if (mobileController.text.length == 0) {
  //     Fluttertoast.showToast(
  //         msg: 'Please enter mobile number',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.white,
  //         textColor: Colors.black);
  //   } else if (!regExp.hasMatch(mobileController.text)) {
  //     Fluttertoast.showToast(
  //         msg: 'Please enter valid mobile number',
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.BOTTOM,
  //         backgroundColor: Colors.white,
  //         textColor: Colors.black);
  //   } else {
  //     ///TODO: remove this line when API changes are completed
  //     StorageManager.setEmailAddress(mobileController.text);
  //
  //     ///LoginRequest is a post parameter body sent for the signupAPI
  //
  //     var deviceInfo =
  //         Device.fromJson(jsonDecode(StorageManager.getDeviceDetails() ?? ""));
  //     var model = LoginRequest(
  //         email: mobileController.text,
  //         mobile: "8248350384",
  //         device: deviceInfo);
  //     authBloc.loading.add(true);
  //     authBloc.login(model).then((value) {
  //       authBloc.loading.add(false);
  //       Navigator.of(context).push(
  //         CupertinoPageRoute(
  //             builder: (context) => OtpValidationPage(
  //                   title: "SIGNUP",
  //                   emailId: mobileController.text,
  //                   loginResponse: value,
  //                 )),
  //       );
  //     }).catchError((httpResponse) {
  //       authBloc.loading.add(false);
  //       if (httpResponse is THttpException) {
  //         if (httpResponse.codeStr == "INACTIVE") {
  //           // showReactivateDialog();
  //         } else {
  //           THttpException exception = httpResponse;
  //           showError(msg: exception.detail, statusCode: exception.code);
  //           Log.e("${exception.detail} code-${exception.codeStr}");
  //         }
  //       } else {
  //         showError(msg: "Unknown Error", statusCode: 400);
  //         Log.e("Unknown Error code-400");
  //       }
  //     });
  //   }
  // }
}
