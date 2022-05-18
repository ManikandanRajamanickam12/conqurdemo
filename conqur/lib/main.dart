import 'dart:io';

import 'package:conqur/app/splash_page.dart';
import 'package:conqur/helpers/utils/extensions.dart';
import 'package:conqur/helpers/utils/routes.dart';
import 'package:conqur/helpers/utils/shared_preference.dart';
import 'package:conqur/models/console.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:wakelock/wakelock.dart';

import 'helpers/utils/Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageManager.init();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Console()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  TNavObserver? cywNavObserver;
  CurrentRouteNavigatorObserver? currentNavObserver;
  GlobalKey<NavigatorState>? navigatorKey;
  Key? key;
  Key? flavorKey;
  AppLifecycleState? lastLifeCycleState;

  @override
  void initState() {
    cywNavObserver = TNavObserver();
    currentNavObserver = CurrentRouteNavigatorObserver();
    key = UniqueKey();
    flavorKey = GlobalKey();
    WidgetsBinding.instance!.addObserver(this);
    navigatorKey = GlobalKey<NavigatorState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      key: key,
      title: 'Conqur',
      navigatorKey: navigatorKey,
      themeMode: ThemeMode.light,
      theme: kLightTTheme.data,
      darkTheme: kDarkTheme.data,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      routes: constructRouteMap(),
      navigatorObservers: [cywNavObserver!, currentNavObserver!],
      onGenerateRoute: getRoute,
      onUnknownRoute: (RouteSettings settings) =>
          CupertinoPageRoute(builder: (builder) => SplashPage()),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    Wakelock.disable();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        Log.d("ApplicationLifecycle inactive");
        break;
      case AppLifecycleState.paused:
        Log.d("ApplicationLifecycle paused");
        break;
      case AppLifecycleState.resumed:
        Log.d("ApplicationLifecycle resumed");
        break;
      case AppLifecycleState.detached:
        Log.d("ApplicationLifecycle detached");
        break;
    }
    lastLifeCycleState = state;
  }

  // ios device will not emit inactive state if some dialog pops up.
  bool checkIfNotInactive() {
    if (Platform.isAndroid) {
      return lastLifeCycleState != null &&
          lastLifeCycleState != AppLifecycleState.inactive;
    } else if (Platform.isIOS) {
      return true;
    }
    return true;
  }
}
