import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Header extends StatefulWidget {
  Header({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Neumorphic(
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              intensity: 1,
              depth: 2,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(100)),
              lightSource: LightSource.topLeft,
              color: const Color(0xffF2F2F2),
              shadowLightColorEmboss: Colors.white,
            ),
            child: Container(
              width: 45,
              height: 45,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 20,
                ),
                color: Colors.black.withOpacity(0.4),
                onPressed: () {},
              ),
            ),
          ),
          Spacer(
            flex: 3,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }
}
