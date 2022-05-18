import 'package:conqur/Modules/Registeration/bloc/auth_bloc.dart';
import 'package:conqur/helpers/Widgets/PrimaryButton.dart';
import 'package:conqur/helpers/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Gender { MALE, FEMALE, TRANSGENDER }

extension IGender on Gender {
  String get name {
    switch (this) {
      case Gender.MALE:
        return "Male";
      case Gender.FEMALE:
        return "Female";
      case Gender.TRANSGENDER:
        return "other";
    }
  }

  String get type {
    switch (this) {
      case Gender.MALE:
        return "MALE";
      case Gender.FEMALE:
        return "FEMALE";
      case Gender.TRANSGENDER:
        return "TRANSGENDER";
    }
  }
}

class UserDetailsPage extends StatefulWidget {
  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  var nameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  bool _value = false;
  int? val;
  List<Gender> gender = [Gender.MALE, Gender.FEMALE, Gender.TRANSGENDER];
  var authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeumorphicTheme.baseColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "SIGNUP",
                  style:
                      NeumorphicTheme.currentTheme(context).textTheme.headline1,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                SvgPicture.asset(
                  ImageNames.login,
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.11,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: nameController,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: NeumorphicTheme.accentColor(context),
                            size: 18,
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: 13),
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 15, bottom: 15, top: 15, right: 15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        depth: -2,
                        intensity: 0.9,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(10)),
                      ),
                      child: TextFormField(
                        controller: dateOfBirthController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          new LengthLimitingTextInputFormatter(8),
                          DateTextFormatter()
                        ],
                        onChanged: (value) {},
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.calendar_today_rounded,
                            color: NeumorphicTheme.accentColor(context),
                            size: 18,
                          ),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Date of birth",
                          hintStyle: TextStyle(fontSize: 13),
                          contentPadding: EdgeInsets.all(15),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Gender",
                          style: NeumorphicTheme.currentTheme(context)
                              .textTheme
                              .bodyText2
                              ?.copyWith(
                                  color:
                                      NeumorphicTheme.disabledColor(context))),
                    ),
                    GenderInfoWidget(context),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Column(
                  children: [
                    PrimaryButton(
                      color: val != null &&
                              dateOfBirthController.text.length > 0 &&
                              nameController.text.length > 0
                          ? NeumorphicTheme.accentColor(context)
                          : Colors.black.withOpacity(0.12),
                      horizontalPadding: 20,
                      onPressed: () {
                        if (nameController.text.length > 0) {
                          if (dateOfBirthController.text.length > 0) {
                            if (val != null) {
                              AuthBloc.instance
                                  .add(AuthValidateUserDetailsEvent(msg: ""));
                            } else {
                              Common.showInfo(
                                  isInfo: false,
                                  buildContext: context,
                                  msg: "Please select your gender");
                            }
                          } else {
                            Common.showInfo(
                                isInfo: false,
                                buildContext: context,
                                msg: "Please Enter your date of birth");
                          }
                        } else {
                          Common.showInfo(
                              isInfo: false,
                              buildContext: context,
                              msg: "Please Enter your name");
                        }
                      },
                      title: "CONTINUE",
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget GenderInfoWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            horizontalTitleGap: 0,
            contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
            title: Text(
              gender[0].name,
              style: TextStyle(fontSize: 13),
            ),
            leading: Radio(
              value: 0,
              groupValue: val,
              onChanged: (int? value) {
                setState(() {
                  val = value ?? 0;
                });
              },
              activeColor: NeumorphicTheme.accentColor(context),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
            horizontalTitleGap: 0,
            title: Text(
              gender[1].name,
              style: TextStyle(fontSize: 13),
            ),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (int? value) {
                setState(() {
                  val = value ?? 0;
                });
              },
              activeColor: NeumorphicTheme.accentColor(context),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 1.0),
            horizontalTitleGap: 0,
            title: Text(
              gender[2].name,
              style: TextStyle(fontSize: 13),
            ),
            leading: Radio(
              value: 2,
              groupValue: val,
              onChanged: (int? value) {
                setState(() {
                  val = value ?? 0;
                });
              },
              activeColor: NeumorphicTheme.accentColor(context),
            ),
          ),
        ),
      ],
    );
  }
}

class DateTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //this fixes backspace bug
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var dateText = _addSeperators(newValue.text, '-');
    return newValue.copyWith(
        text: dateText, selection: updateCursorPosition(dateText));
  }

  String _addSeperators(String value, String seperator) {
    value = value.replaceAll('-', '');
    var newString = '';
    for (int i = 0; i < value.length; i++) {
      newString += value[i];
      if (i == 1) {
        newString += seperator;
      }
      if (i == 3) {
        newString += seperator;
      }
    }
    return newString;
  }

  TextSelection updateCursorPosition(String text) {
    return TextSelection.fromPosition(TextPosition(offset: text.length));
  }
}
