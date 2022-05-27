import 'dart:ui';

import 'package:conqur/helpers/utils/Constants.dart';
import 'package:conqur/helpers/utils/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:lottie/lottie.dart';
import 'package:rxdart/rxdart.dart';

extension BaseState<T extends StatefulWidget> on State<T> {
  void showError(
      {String msg = " ",
      int seconds = 2,
      required int statusCode,
      BuildContext? buildContext}) {
    ScaffoldMessenger.of(buildContext ?? context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 4,
                bottom: 4,
              ),
              child: Text(
                msg,
                style: kLThreeTextStyle(Colors.white, FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor:
            isSuccessful(statusCode) ? Color(0xFFA4D201) : Colors.red,
      ),
    );
  }

  bool isSuccessful(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  Widget getProgressWidget() {
    return AbsorbPointer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: 70,
            height: 70,
            child: Neumorphic(
              style: NeumorphicStyle(
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(4))),
              child: Center(
                child: SizedBox(
                  height: 35.0,
                  width: 35.0,
                  child: CircularProgressIndicator(
                    value: null,
                    color: NeumorphicTheme.accentColor(context),
                    strokeWidth: 4.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<T?> showDoubleOptionDialog<T>(
      {String? title,
      TextStyle? titleStyle,
      required String desc,
      String? positiveBtnText,
      String? negativeBtnText,
      VoidCallback? onClickPositiveBtn,
      VoidCallback? onClickNegativeBtn,
      bool isDismissable = true,
      bool useRootNavigator = true,
      RouteSettings? routeSettings,
      BuildContext? buildContext}) async {
    return showDialog<T?>(
      context: buildContext ?? context,
      barrierDismissible: isDismissable,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Dialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: Neumorphic(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              style: NeumorphicStyle(
                  lightSource: LightSource.bottomRight,
                  intensity: 1,
                  depth: 8,
                  shadowLightColor: Color(0xFF0F0F12),
                  color: NeumorphicTheme.baseColor(context),
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(8.0))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      title ?? "",
                      style: titleStyle ?? kLThreeTextStyle(Color(0xFFECEEF9)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: new Text(
                      desc,
                      textAlign: TextAlign.center,
                      style: kLThreeTextStyle(Color(0xFFECEEF9)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 28.0, bottom: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        if (onClickNegativeBtn != null)
                          NeumorphicButton(
                            style: NeumorphicStyle(
                                color: NeumorphicTheme.disabledColor(context),
                                intensity: 1,
                                depth: 10,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20))),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: new Text(negativeBtnText!,
                                  style: kLThreeTextStyle(
                                      NeumorphicTheme.baseColor(context))),
                            ),
                            onPressed: () {
                              onClickNegativeBtn();
                            },
                          ),
                        new NeumorphicButton(
                          style: NeumorphicStyle(
                              intensity: 1,
                              depth: 10,
                              color: NeumorphicTheme.accentColor(context),
                              boxShape: NeumorphicBoxShape.roundRect(
                                  BorderRadius.circular(20))),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              positiveBtnText!,
                              style: kLThreeTextStyle(
                                  NeumorphicTheme.baseColor(context)),
                            ),
                          ),
                          onPressed: () {
                            onClickPositiveBtn!();
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

mixin TBaseStateMixin<T extends StatefulWidget> on State<T> {}

class TLoader extends StatefulWidget {
  const TLoader({Key? key, required this.loading}) : super(key: key);

  // ignore: close_sinks
  final BehaviorSubject<bool> loading;

  @override
  _TLoaderState createState() => _TLoaderState();
}

class _TLoaderState extends State<TLoader> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: widget.loading,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data) {
            return Scaffold(
              backgroundColor: NeumorphicTheme.baseColor(context),
              body: Center(
                child: Lottie.asset(JsonNames.splash,
                    width: MediaQuery.of(context).size.width * 0.5),
              ),
            );
          }
          return Container();
        });
  }
}
