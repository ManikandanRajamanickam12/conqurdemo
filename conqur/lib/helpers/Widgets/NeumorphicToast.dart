import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicToast extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => NeumorphicToastState();
}

class NeumorphicToastState extends State<NeumorphicToast>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<Offset>? offset;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    offset = Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset.zero)
        .animate(controller!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: RaisedButton(
                child: Text('Show / Hide'),
                onPressed: () {
                  switch (controller?.status) {
                    case AnimationStatus.completed:
                      controller!.reverse();
                      break;
                    case AnimationStatus.dismissed:
                      controller!.forward();
                      break;
                    default:
                  }
                },
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SlideTransition(
                position: offset!,
                child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(depth: 5, intensity: 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 80,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Naveen Kumar",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Member since 29 Dec 2021 ",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                  color:
                                      NeumorphicTheme.disabledColor(context)),
                            ),
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
