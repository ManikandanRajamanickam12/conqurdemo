import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class PinEntryTextField extends StatefulWidget {
  var onSubmit;
  double? fieldWidth;
  double? fontSize;
  bool? isTextObscure;
  bool? showFieldAsBox;

  PinEntryTextField(
      {this.onSubmit,
      this.fieldWidth: 40.0,
      this.fontSize: 20.0,
      this.isTextObscure: false,
      this.showFieldAsBox: false});

  @override
  State createState() {
    return PinEntryTextFieldState();
  }
}

class PinEntryTextFieldState extends State<PinEntryTextField> {
  List<String> _pin = [];
  var text1FocusNode = FocusNode();
  var text2FocusNode = FocusNode();
  var text3FocusNode = FocusNode();
  var text4FocusNode = FocusNode();
  var text5FocusNode = FocusNode();
  var text6FocusNode = FocusNode();

  var textField1Controller = TextEditingController();
  var textField2Controller = TextEditingController();
  var textField3Controller = TextEditingController();
  var textField4Controller = TextEditingController();
  var textField5Controller = TextEditingController();
  var textField6Controller = TextEditingController();

  var keyboard1FocusNode = FocusNode();
  var keyboard2FocusNode = FocusNode();
  var keyboard3FocusNode = FocusNode();
  var keyboard4FocusNode = FocusNode();
  var keyboard5FocusNode = FocusNode();
  var keyboard6FocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RawKeyboardListener(
            focusNode: keyboard1FocusNode,
            child: Container(
              width: widget.fieldWidth,
              margin: EdgeInsets.only(right: 10.0),
              child: Neumorphic(
                style: NeumorphicStyle(
                  depth: -3,
                  intensity: 0.9,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                ),
                child: TextField(
                  onChanged: (value) {
                    text2FocusNode.requestFocus();
                    var otp = textField1Controller.text +
                        textField2Controller.text +
                        textField3Controller.text +
                        textField4Controller.text +
                        textField5Controller.text +
                        textField6Controller.text;
                    widget.onSubmit(otp);
                  },
                  onTap: () => textField1Controller.clear(),
                  maxLines: 1,
                  maxLength: 1,
                  controller: textField1Controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  focusNode: text1FocusNode,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: widget.fontSize),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "",
                    counterText: "",
                  ),
                ),
              ),
            ),
          ),
          RawKeyboardListener(
              focusNode: keyboard2FocusNode,
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  textField2Controller.clear();
                  text1FocusNode.requestFocus();
                }
              },
              child: Container(
                  width: widget.fieldWidth,
                  margin: EdgeInsets.only(right: 10.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        text3FocusNode.requestFocus();
                        var otp = textField1Controller.text +
                            textField2Controller.text +
                            textField3Controller.text +
                            textField4Controller.text +
                            textField5Controller.text +
                            textField6Controller.text;
                        widget.onSubmit(otp);
                      },
                      onTap: () => textField2Controller.clear(),
                      maxLines: 1,
                      maxLength: 1,
                      controller: textField2Controller,
                      focusNode: text2FocusNode,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: widget.fontSize),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "",
                      ),
                    ),
                  ))),
          RawKeyboardListener(
            focusNode: keyboard3FocusNode,
            onKey: (event) {
              if (event.logicalKey == LogicalKeyboardKey.backspace) {
                textField3Controller.clear();
                text2FocusNode.requestFocus();
              }
            },
            child: Container(
                width: widget.fieldWidth,
                margin: EdgeInsets.only(right: 10.0),
                child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        text4FocusNode.requestFocus();
                        var otp = textField1Controller.text +
                            textField2Controller.text +
                            textField3Controller.text +
                            textField4Controller.text +
                            textField5Controller.text +
                            textField6Controller.text;
                        widget.onSubmit(otp);
                      },
                      onTap: () => textField3Controller.clear(),
                      maxLines: 1,
                      maxLength: 1,
                      controller: textField3Controller,
                      keyboardType: TextInputType.number,
                      focusNode: text3FocusNode,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: widget.fontSize),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "",
                      ),
                    ))),
          ),
          RawKeyboardListener(
              focusNode: keyboard4FocusNode,
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  textField4Controller.clear();
                  text3FocusNode.requestFocus();
                }
              },
              child: Container(
                  width: widget.fieldWidth,
                  margin: EdgeInsets.only(right: 10.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        text5FocusNode.requestFocus();
                        var otp = textField1Controller.text +
                            textField2Controller.text +
                            textField3Controller.text +
                            textField4Controller.text +
                            textField5Controller.text +
                            textField6Controller.text;
                        widget.onSubmit(otp);
                      },
                      onTap: () => textField4Controller.clear(),
                      maxLines: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      controller: textField4Controller,
                      focusNode: text4FocusNode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: widget.fontSize),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "",
                      ),
                    ),
                  ))),
          RawKeyboardListener(
              focusNode: keyboard5FocusNode,
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  textField5Controller.clear();
                  text4FocusNode.requestFocus();
                }
              },
              child: Container(
                  width: widget.fieldWidth,
                  margin: EdgeInsets.only(right: 10.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        text6FocusNode.requestFocus();
                        var otp = textField1Controller.text +
                            textField2Controller.text +
                            textField3Controller.text +
                            textField4Controller.text +
                            textField5Controller.text +
                            textField6Controller.text;
                        widget.onSubmit(otp);
                      },
                      onTap: () => textField5Controller.clear(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      controller: textField5Controller,
                      keyboardType: TextInputType.number,
                      focusNode: text5FocusNode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: widget.fontSize),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "",
                      ),
                    ),
                  ))),
          RawKeyboardListener(
              focusNode: keyboard6FocusNode,
              onKey: (event) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  textField6Controller.clear();
                  text5FocusNode.requestFocus();
                }
              },
              child: Container(
                  width: widget.fieldWidth,
                  margin: EdgeInsets.only(right: 10.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      depth: -3,
                      intensity: 0.9,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10)),
                    ),
                    child: TextField(
                      onTap: () => textField6Controller.clear(),
                      onChanged: (value) {
                        var otp = textField1Controller.text +
                            textField2Controller.text +
                            textField3Controller.text +
                            textField4Controller.text +
                            textField5Controller.text +
                            textField6Controller.text;
                        widget.onSubmit(otp);
                      },
                      maxLines: 1,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      controller: textField6Controller,
                      keyboardType: TextInputType.number,
                      focusNode: text6FocusNode,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: widget.fontSize),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "",
                        counterText: "",
                      ),
                    ),
                  ))),
        ],
      ),
    );
  }
}
