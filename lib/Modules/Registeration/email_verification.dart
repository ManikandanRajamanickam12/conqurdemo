// import 'dart:async';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:repose_plus/app/app_bloc.dart';
// import 'package:repose_plus/app/constants.dart';
// import 'package:repose_plus/model/general.dart';
// import 'package:repose_plus/views/auth/registration.dart';
// import 'package:repose_plus/views/manager_dashboard/manager_dashboard.dart';
// import 'package:repose_plus/views/supervisor_dashboard/supervisor_dashboard.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
//
// class EmailVerification extends StatefulWidget {
//   static const String routeName = "/otp";
//   final String? email;
//   const EmailVerification({Key? key, this.email = ""}) : super(key: key);
//
//   @override
//   _EmailVerificationState createState() => _EmailVerificationState();
// }
//
// class _EmailVerificationState extends State<EmailVerification> {
//   late ReposePlusAppBloc _appBloc;
//
//   TextEditingController dc1 = TextEditingController();
//   TextEditingController dc2 = TextEditingController();
//   TextEditingController dc3 = TextEditingController();
//   TextEditingController dc4 = TextEditingController();
//   TextEditingController dc5 = TextEditingController();
//   TextEditingController dc6 = TextEditingController();
//
//   FocusNode df1 = FocusNode();
//   FocusNode df2 = FocusNode();
//   FocusNode df3 = FocusNode();
//   FocusNode df4 = FocusNode();
//   FocusNode df5 = FocusNode();
//   FocusNode df6 = FocusNode();
//
//   FocusNode kfn1 = FocusNode();
//   FocusNode kfn2 = FocusNode();
//   FocusNode kfn3 = FocusNode();
//   FocusNode kfn4 = FocusNode();
//   FocusNode kfn5 = FocusNode();
//   FocusNode kfn6 = FocusNode();
//
//   bool validateButtonColor = false;
//
//   bool is_profile_completed = false;
//
//   @override
//   void didChangeDependencies() {
//     _appBloc = Provider.of<ReposePlusAppBloc>(context);
//     super.didChangeDependencies();
//   }
//
//   checkDoneState() {
//     if (dc1.value.text.isNotEmpty &&
//         dc2.value.text.isNotEmpty &&
//         dc3.value.text.isNotEmpty &&
//         dc4.value.text.isNotEmpty &&
//         dc5.value.text.isNotEmpty &&
//         dc6.value.text.isNotEmpty) {
//       setState(() {
//         validateButtonColor = true;
//       });
//     } else {
//       setState(() {
//         validateButtonColor = false;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     dc1.addListener(() {
//       checkDoneState();
//     });
//     dc2.addListener(() {
//       checkDoneState();
//     });
//     dc3.addListener(() {
//       checkDoneState();
//     });
//     dc4.addListener(() {
//       checkDoneState();
//     });
//     dc5.addListener(() {
//       checkDoneState();
//     });
//     dc6.addListener(() {
//       checkDoneState();
//     });
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(
//       children: [
//         Positioned(
//           bottom: 0,
//           child:
//               SvgPicture.asset("assets/bg/waves_bg.svg", fit: BoxFit.contain),
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 10.h),
//               child: Center(
//                 child: Neumorphic(
//                   padding: EdgeInsets.all(20.sp),
//                   style: NeumorphicStyle(
//                           depth: DEPTH_5,
//                           boxShape: NeumorphicBoxShape.roundRect(
//                               BorderRadius.circular(0.sp)))
//                       .copyWithThemeIfNull(_appBloc.theme),
//                   child: Container(
//                     width: 18.w,
//                     height: 50.h,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           "ENTER OTP",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w900, fontSize: 17.sp),
//                         ),
//                         Column(
//                           children: [
//                             Text(
//                               "Please enter the One Time Password sent to your email inbox",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 11.sp),
//                             ),
//                             SizedBox(height: 15.sp),
//                             Text(
//                               "An OTP has been sent to ${widget.email}",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 10.sp,
//                                   color: Colors.black.withOpacity(0.5)),
//                             ),
//                             SizedBox(height: 15.sp),
//                             Row(
//                               children: [
//                                 RawKeyboardListener(
//                                     focusNode: kfn1,
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onChanged: (value) {
//                                               df2.requestFocus();
//                                             },
//                                             onTap: () => dc1.clear(),
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc1,
//                                             focusNode: df1,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(width: 10.sp),
//                                 RawKeyboardListener(
//                                     focusNode: kfn2,
//                                     onKey: (event) {
//                                       if (event.logicalKey ==
//                                           LogicalKeyboardKey.backspace) {
//                                         dc2.clear();
//                                         df1.requestFocus();
//                                       }
//                                     },
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onChanged: (value) {
//                                               df3.requestFocus();
//                                             },
//                                             onTap: () => dc2.clear(),
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc2,
//                                             focusNode: df2,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(width: 10.sp),
//                                 RawKeyboardListener(
//                                     focusNode: kfn3,
//                                     onKey: (event) {
//                                       if (event.logicalKey ==
//                                           LogicalKeyboardKey.backspace) {
//                                         dc3.clear();
//                                         df2.requestFocus();
//                                       }
//                                     },
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onChanged: (value) {
//                                               df4.requestFocus();
//                                             },
//                                             onTap: () => dc3.clear(),
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc3,
//                                             focusNode: df3,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(width: 10.sp),
//                                 RawKeyboardListener(
//                                     focusNode: kfn4,
//                                     onKey: (event) {
//                                       if (event.logicalKey ==
//                                           LogicalKeyboardKey.backspace) {
//                                         dc4.clear();
//                                         df3.requestFocus();
//                                       }
//                                     },
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onChanged: (value) {
//                                               df5.requestFocus();
//                                             },
//                                             onTap: () => dc4.clear(),
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc4,
//                                             focusNode: df4,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(width: 10.sp),
//                                 RawKeyboardListener(
//                                     focusNode: kfn5,
//                                     onKey: (event) {
//                                       if (event.logicalKey ==
//                                           LogicalKeyboardKey.backspace) {
//                                         dc5.clear();
//                                         df4.requestFocus();
//                                       }
//                                     },
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onChanged: (value) {
//                                               df6.requestFocus();
//                                             },
//                                             onTap: () => dc5.clear(),
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc5,
//                                             focusNode: df5,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                                 SizedBox(width: 10.sp),
//                                 RawKeyboardListener(
//                                     focusNode: kfn6,
//                                     onKey: (event) {
//                                       if (event.logicalKey ==
//                                           LogicalKeyboardKey.backspace) {
//                                         dc6.clear();
//                                         df5.requestFocus();
//                                       }
//                                     },
//                                     child: Container(
//                                         width: 18.sp,
//                                         height: 18.sp,
//                                         child: Neumorphic(
//                                           padding: EdgeInsets.all(3.sp),
//                                           style: NeumorphicStyle(
//                                                   depth: NEGATIVE_DEPTH_1,
//                                                   boxShape: NeumorphicBoxShape
//                                                       .roundRect(
//                                                           BorderRadius.circular(
//                                                               8.sp)))
//                                               .copyWithThemeIfNull(
//                                                   _appBloc.theme),
//                                           child: TextField(
//                                             onTap: () => dc6.clear(),
//                                             onChanged: (value) {},
//                                             maxLines: 1,
//                                             maxLength: 1,
//                                             cursorColor: Colors.grey[600],
//                                             controller: dc6,
//                                             focusNode: df6,
//                                             style: TextStyle(fontSize: 11.sp),
//                                             decoration: InputDecoration(
//                                               counterText: "",
//                                               contentPadding:
//                                                   EdgeInsets.all(10.sp),
//                                               isDense: true,
//                                               enabledBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               focusedBorder:
//                                                   UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               border: UnderlineInputBorder(
//                                                 borderSide: BorderSide(
//                                                     color: Colors.transparent),
//                                               ),
//                                               hintText: "",
//                                             ),
//                                           ),
//                                         ))),
//                               ],
//                             ),
//                             SizedBox(height: 10.sp),
//                             CountdownTimer(),
//                           ],
//                         ),
//                         NeumorphicButton(
//                           style: NeumorphicStyle(
//                                   depth: DEPTH_3,
//                                   boxShape: NeumorphicBoxShape.roundRect(
//                                       BorderRadius.circular(20.sp)))
//                               .copyWithThemeIfNull(_appBloc.theme),
//                           child: Container(
//                             width: 10.w,
//                             child: Center(
//                               child: Text(
//                                 "VALIDATE OTP(unregistered)",
//                                 style: TextStyle(
//                                   color: validateButtonColor
//                                       ? Color(0xff6DD179)
//                                       : Colors.black.withOpacity(0.3),
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             _appBloc.loggedInState = true;
//                             _appBloc.setAccountType(AccountType.MANAGER);
//                             // is_profile_completed
//                             //     ? context.go("/")
//                             //     :
//                             context.go(RegistrationPage.routeName);
//                           },
//                         ),
//                         NeumorphicButton(
//                           style: NeumorphicStyle(
//                                   depth: DEPTH_3,
//                                   boxShape: NeumorphicBoxShape.roundRect(
//                                       BorderRadius.circular(20.sp)))
//                               .copyWithThemeIfNull(_appBloc.theme),
//                           child: Container(
//                             width: 10.w,
//                             child: Center(
//                               child: Text(
//                                 "VALIDATE OTP(manager)",
//                                 style: TextStyle(
//                                   color: validateButtonColor
//                                       ? Color(0xff6DD179)
//                                       : Colors.black.withOpacity(0.3),
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             _appBloc.loggedInState = true;
//                             _appBloc.setAccountType(AccountType.MANAGER);
//                             // is_profile_completed
//                             //     ? context.go("/")
//                             //     :
//                             context.go(ManagerDashboard.routeName);
//                           },
//                         ),
//                         NeumorphicButton(
//                           style: NeumorphicStyle(
//                                   depth: DEPTH_3,
//                                   boxShape: NeumorphicBoxShape.roundRect(
//                                       BorderRadius.circular(20.sp)))
//                               .copyWithThemeIfNull(_appBloc.theme),
//                           child: Container(
//                             width: 10.w,
//                             child: Center(
//                               child: Text(
//                                 "VALIDATE OTP(supervisor)",
//                                 style: TextStyle(
//                                   color: validateButtonColor
//                                       ? Color(0xff6DD179)
//                                       : Colors.black.withOpacity(0.3),
//                                   fontSize: 9.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           onPressed: () {
//                             _appBloc.loggedInState = true;
//                             _appBloc.setAccountType(AccountType.MANAGER);
//                             // is_profile_completed
//                             //     ? context.go("/")
//                             //     :
//                             context.go(SupervisorDashboard.routeName);
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }
//
// class CountdownTimer extends StatefulWidget {
//   const CountdownTimer({Key? key}) : super(key: key);
//
//   @override
//   _CountdownTimerState createState() => _CountdownTimerState();
// }
//
// class _CountdownTimerState extends State<CountdownTimer> {
//   late Duration timeDiff;
//
//   DateTime startTime = DateTime.now();
//
//   bool resendFlag = false;
//
//   String counter = "";
//
//   Duration limit = Duration(minutes: 1);
//
//   late Timer _timer;
//
//   @override
//   void initState() {
//     _timer = getPeriodicTimer();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return !resendFlag
//         ? Text(
//             "OTP expires in ${counter}",
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontSize: 10.sp, color: Colors.black.withOpacity(0.5)),
//           )
//         : RichText(
//             text: TextSpan(
//                 style: TextStyle(
//                     fontSize: 10.sp, color: Colors.black.withOpacity(0.5)),
//                 children: [
//                 TextSpan(text: "Didn't receive the OTP? "),
//                 TextSpan(
//                     text: "Resend OTP",
//                     style: TextStyle(fontSize: 10.sp, color: Color(0xff6DD179)),
//                     recognizer: TapGestureRecognizer()
//                       ..onTap = () {
//                         print("Resend OTP");
//                         _timer.cancel();
//                         startTime = DateTime.now();
//                         _timer = getPeriodicTimer();
//                         resendFlag = false;
//                       })
//               ]));
//   }
//
//   Timer getPeriodicTimer() {
//     return Timer.periodic(Duration(seconds: 1), (Timer timer) {
//       timeDiff = (DateTime.now()).difference(startTime);
//       if ((limit - timeDiff).inSeconds == 0) {
//         resendFlag = true;
//         _timer.cancel();
//       }
//       setState(() {
//         counter = getDurationinMinSec((limit - timeDiff));
//       });
//     });
//   }
//
//   String getDurationinMinSec(Duration duration) {
//     int min = duration.inMinutes;
//     int sec = duration.inSeconds % 60;
//     if (min == 0) {
//       return "$sec sec";
//     }
//     return "$min min $sec sec";
//   }
// }
