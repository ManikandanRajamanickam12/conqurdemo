import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FieldList extends StatefulWidget {
  FieldList(
      {Key? key,
      required this.fieldname,
      required this.icon,
      required this.type})
      : super(key: key);
  String fieldname;
  IconData icon;
  TextInputType type;

  @override
  State<FieldList> createState() => _FieldListState();
}

class _FieldListState extends State<FieldList> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330,
          height: 85,
          margin: EdgeInsets.only(left: 45, right: 45),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      (status == true) ? widget.fieldname : "",
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: Neumorphic(
                  style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(8)),
                      depth: -2,
                      intensity: 1),
                  child: TextField(
                    onChanged: ((value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          status = true;
                          print("tapped");
                        }
                        if (value.isEmpty) {
                          status = false;
                          print("false");
                        }
                      });
                    }),
                    keyboardType: widget.type,
                    style: GoogleFonts.roboto(fontSize: 18),
                    decoration: InputDecoration(
                        disabledBorder: InputBorder.none,
                        hintText: (status == false) ? widget.fieldname : "",
                        hintStyle: TextStyle(
                            fontSize: 14, color: Colors.black.withOpacity(0.5)),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: 25,
                            height: 25,
                            alignment: Alignment.center,
                            child: FaIcon(
                              widget.icon,
                              size: 15,
                              color: Colors.red,
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
