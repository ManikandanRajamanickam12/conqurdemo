import 'package:conqur/Modules/Registeration/Pages/auth_page.dart';
import 'package:conqur/Modules/trt/pages/training.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    var dateTime =
        DateFormat('dd-MM-yyyy').parse("16-07-1997").toIso8601String();
    //var birthDate = DateFormat('yyyy-MM-dd').format(dateTime);
    print(dateTime);
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushAndRemoveUntil(
          CupertinoPageRoute(
            builder: (context) => Training(),
          ),
          (route) => false);
    });

    // Future.delayed(Duration(seconds: 2), () {
    //   if (StorageManager.getJwtToken() != null) {
    //     var userEntryType =
    //         Common.instance.getUserDetails(type: UserDetailsType.userEntryCode);
    //     switch (userEntryType) {
    //       case UserEntryType.newUser:
    //         Navigator.of(context).pushAndRemoveUntil(
    //             CupertinoPageRoute(
    //               builder: (context) => AgreeTermsPage(),
    //             ),
    //             (route) => false);
    //         break;
    //       case UserEntryType.agreeTerms:
    //         Navigator.of(context).pushAndRemoveUntil(
    //             CupertinoPageRoute(
    //               builder: (context) => AgreeTermsPage(),
    //             ),
    //             (route) => false);
    //         break;
    //       case UserEntryType.userDetails:
    //         var profileDetails = ProfileModel(
    //             email: StorageManager.getEmailAddress(), isUserAgreed: true);
    //         Navigator.of(context).pushAndRemoveUntil(
    //             CupertinoPageRoute(
    //               builder: (context) => UserDetailsPage(
    //                 profileDetails: profileDetails,
    //               ),
    //             ),
    //             (route) => false);
    //         break;
    //       case UserEntryType.bodyMetrics:
    //         Navigator.of(context).pushAndRemoveUntil(
    //             CupertinoPageRoute(
    //               builder: (context) => BodyMetricsPage(),
    //             ),
    //             (route) => false);
    //         break;
    //       case UserEntryType.dashboard:
    //         Navigator.of(context).pushAndRemoveUntil(
    //             CupertinoPageRoute(
    //               builder: (context) => SensorDashboard(),
    //             ),
    //             (route) => false);
    //         break;
    //     }
    //   } else {
    //
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Center(
        child: Lottie.asset(JsonNames.splash,
            width: MediaQuery.of(context).size.width * 0.5),
      )),
    );
  }
}
