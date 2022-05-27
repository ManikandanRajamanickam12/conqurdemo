import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class TranquilTheme {
  const TranquilTheme._(this.name, this.data);

  final String name;

//  final ThemeData data;
  final NeumorphicThemeData data;
}

const Color TEXT_LIGHT = Color(0XFF9DADC9);
const Color TEXT_DARK = Color(0XFF425C8C);
const Color LIGHT_SHADOW = Color.fromRGBO(255, 254, 255, 1);
const Color DARK_SHADOW = Color.fromRGBO(214, 213, 216, 1);
const Color ORANGE = Color(0XFFff904a);
const Color BLUE = Color(0XFF68b5fb);

final TranquilTheme kLightTTheme =
    new TranquilTheme._('Light', _buildNeuLightTheme());

final TranquilTheme kDarkTheme =
    new TranquilTheme._('Dark', _buildNeuDarkTheme());

TextTheme _buildLightTextTheme() {
  return GoogleFonts.robotoTextTheme(ThemeData.light().textTheme.copyWith(
      headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 26),
      headline4: TextStyle(fontSize: 18),
      headline5: TextStyle(fontSize: 16),
      headline6: TextStyle(fontSize: 24),
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(fontSize: 12)));
}

TextTheme _buildDarkTextTheme() {
  return GoogleFonts.robotoTextTheme(ThemeData.dark().textTheme.copyWith(
      headline1: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      headline3: TextStyle(fontSize: 26),
      headline4: TextStyle(fontSize: 18),
      headline5: TextStyle(fontSize: 16),
      headline6: TextStyle(fontSize: 24),
      bodyText1: TextStyle(fontSize: 14),
      bodyText2: TextStyle(fontSize: 12)));
}

NeumorphicThemeData _buildNeuLightTheme() {
  return NeumorphicThemeData(
      accentColor: Color.fromRGBO(218, 57, 46, 1),
      variantColor: Colors.black38,
      disabledColor: Colors.black54,
      baseColor: Color.fromRGBO(235, 235, 239, 1),
      shadowLightColor: LIGHT_SHADOW,
      shadowDarkColor: DARK_SHADOW,
      shadowDarkColorEmboss: DARK_SHADOW,
      shadowLightColorEmboss: LIGHT_SHADOW,
      textTheme: _buildLightTextTheme(),
      defaultTextColor: Colors.black,
      depth: 8,
      intensity: 0.5,
      lightSource: LightSource.topLeft);
}

NeumorphicThemeData _buildNeuDarkTheme() {
  return NeumorphicThemeData(
      variantColor: Colors.white70,
      baseColor: Color(0xFF22272B),
      intensity: 1,
      shadowLightColor: Color(0xEE35383A),
      shadowDarkColor: Color(0xFF181B1D),
      textTheme: _buildDarkTextTheme(),
      accentColor: Color.fromRGBO(218, 57, 46, 1),
      disabledColor: Colors.black54,
      defaultTextColor: Colors.white,
      lightSource: LightSource.topLeft,
      buttonStyle: NeumorphicStyle(
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12.0)),
        depth: 2,
      ),
      iconTheme: IconThemeData(color: Color(0xFFECEEF9)),
      depth: 2);
}

TextStyle kLOneTextStyle([Color? color, FontWeight? weight]) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 18,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? Colors.white,
    ),
  );
}

TextStyle kLTwoTextStyle([Color? color, FontWeight? weight]) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 16,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? Colors.white,
    ),
  );
}

TextStyle kLThreeTextStyle([Color? color, FontWeight? weight]) {
  return GoogleFonts.roboto(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: weight ?? FontWeight.normal,
      color: color ?? Colors.white,
    ),
  );
}

// NeumorphicTheme.currentTheme(context)
// .textTheme
//     .bodyText1
//     ?.copyWith(
// fontWeight: FontWeight.bold,
// color: NeumorphicTheme.disabledColor(context))
//
// NeumorphicTheme.currentTheme(context)
// .textTheme
//     .bodyText2
//     ?.copyWith(
// fontWeight: FontWeight.bold,
// color: NeumorphicTheme.disabledColor(context))
//
// NeumorphicTheme.currentTheme(context)
// .textTheme
//     .headline1
//
//
// NeumorphicTheme.currentTheme(context)
// .textTheme
//     .headline2
